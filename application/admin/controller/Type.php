<?php

namespace app\admin\controller;

use app\common\controller\Backend;
use fast\Tree;
use think\Db;
/**
 * 作品分类管理
 *
 * @icon fa fa-circle-o
 */
class Type extends Backend
{
    
    /**
     * Type模型对象
     * @var \app\common\model\Type
     */
    protected $model = null;
    protected $noNeedRight=['*'];

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\common\model\Type;

    }
    
    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */






    /**
     * 查看
     */
    public function index()
    {
        //当前是否为关联查询
        $this->relationSearch = false;
        //设置过滤方法
        $this->request->filter(['strip_tags']);
        if ($this->request->isAjax())
        {
            //如果发送的来源是Selectpage，则转发到Selectpage
            if ($this->request->request('keyField'))
            {
                return $this->selectpage();
            }
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();
            $total = $this->model
                    
                    ->where($where)

                    ->order($sort, $order)
                    ->count();

            $list = $this->model
                    
                    ->where($where)

                    ->order($sort, $order)
                    ->limit(0, 0)
                    ->select();

            foreach ($list as $row) {
                $row->visible(['id','name','image','pid','createtime','level']);
                
            }
            $list = collection($list)->toArray();

            $tree=Tree::instance();
            $tree->init($list,'pid');
            $list=$tree->getTreeList($tree->getTreeArray('0'),'name');

            $result = array("total" => $total, "rows" => $list);

            return json($result);
        }
        return $this->view->fetch();
    }



    /**
     * 排除前台提交过来的字段
     * @param $params
     * @return array
     */
    protected function preExcludeFields($params)
    {
        if (is_array($this->excludeFields)) {
            foreach ($this->excludeFields as $field) {
                if (key_exists($field, $params)) {
                    unset($params[$field]);
                }
            }
        } else {
            if (key_exists($this->excludeFields, $params)) {
                unset($params[$this->excludeFields]);
            }
        }
        return $params;
    }


    /**
     * 添加
     */
    public function add()
    {
        if ($this->request->isPost()) {
            $params = $this->request->post("row/a");
            if ($params) {
                $params = $this->preExcludeFields($params);
                $params['createtime']=datetime(time());
                if(empty($params['pid']) || $params['pid']==0){
                    $params['level']=1;
                }

                if ($this->dataLimit && $this->dataLimitFieldAutoFill) {
                    $params[$this->dataLimitField] = $this->auth->id;
                }
                $result = false;
                Db::startTrans();
                try {
                    //是否采用模型验证
                    if ($this->modelValidate) {
                        $name = str_replace("\\model\\", "\\validate\\", get_class($this->model));
                        $validate = is_bool($this->modelValidate) ? ($this->modelSceneValidate ? $name . '.add' : $name) : $this->modelValidate;
                        $this->model->validateFailException(true)->validate($validate);
                    }
                    $result = $this->model->allowField(true)->save($params);
                    Db::commit();
                } catch (ValidateException $e) {
                    Db::rollback();
                    $this->error($e->getMessage());
                } catch (PDOException $e) {
                    Db::rollback();
                    $this->error($e->getMessage());
                } catch (Exception $e) {
                    Db::rollback();
                    $this->error($e->getMessage());
                }
                if ($result !== false) {
                    $this->success();
                } else {
                    $this->error(__('No rows were inserted'));
                }
            }
            $this->error(__('Parameter %s can not be empty', ''));
        }
        return $this->view->fetch();
    }



    /*
     * 添加下级分类
     *
     * */
    public function add_down(){

        if($this->request->post()){
            $row=$this->request->get();
            $params=$this->request->post('row/a');

            $info=$this->model->get(['id'=>$row['pid']]);

            if(empty($info)){
                return $this->error('该分类不存在!');
            }

            $params['level']=$info['level']+1;

            $params['createtime']=datetime(time());
            $params['pid']=$row['pid'];

            $res=$this->model->allowField(true)->save($params);

            if($res){
                return $this->success('操作成功!');
            }else{
                return $this->error('操作失败!');
            }
        }
        return $this->view->fetch();
    }


    /*
     * 添加细分类
     *
     * */
    public function add_tiny(){
        if($this->request->post()){
            $row=$this->request->get();
            $params=$this->request->post('row/a');



            if(empty($info)){
                return $this->error('该分类不存在!');
            }
            $params['pid']=$row['pid'];
            $params['createtime']=datetime(time());
            $params['level']=2;
            $params['is_tiny']=10;

            $res=$this->model->allowField(true)->save($params);

            if($res){
                return $this->success('操作成功!');
            }else{
                return $this->error('操作失败!');
            }
        }
        return $this->view->fetch();
    }


}
