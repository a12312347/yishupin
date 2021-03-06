<?php

namespace app\admin\controller;

use app\common\controller\Backend;
use think\Db;
use think\Session;

/**
 * 提现记录管理
 *
 * @icon fa fa-circle-o
 */
class ArtistTx extends Backend
{
    
    /**
     * ArtistTx模型对象
     * @var \app\common\model\ArtistTx
     */
    protected $model = null;
    protected $admin=null;
    protected $noNeedRight=['*'];

    public function _initialize()
    {
        parent::_initialize();
        $this->admin=Session::get('admin');
        $this->model = new \app\common\model\ArtistTx;
        $this->view->assign("statusList", $this->model->getStatusList());
        $this->view->assign("typeList", $this->model->getTypeList());
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
                    ->limit($offset, $limit)
                    ->select();

            foreach ($list as $row) {
                $row->visible(['tx_id','artist_id','tx_price','sj_price','status','account','type','createtime']);
                
            }
            $list = collection($list)->toArray();
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
        $artist=model('Artist')->get(['artist_id'=>$this->admin['artist_id']]);
        if(empty($artist)){
            return $this->error('该账户不存在!请重新登录!');
        }

        if ($this->request->isPost()) {
            $params = $this->request->post("row/a");
            if ($params) {
                if($params['tx_price']>$artist['wallet']){
                    return $this->error('钱包余额不足!');
                }
                if($params['tx_price']<100){
                    return $this->error('最低提现为100元');
                }
                $params = $this->preExcludeFields($params);
                $params['artist_id']=$this->admin['artist_id'];
                $params['createtime']=datetime(time());
                $params['sj_price']=$params['tx_price'];
                $params['status']=10;

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

                    /*扣除用户余额*/
                    Db::table('fa_artist')->where(['artist_id'=>$this->admin['artist_id']])->setDec('wallet',$params['tx_price']);

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
        $this->view->assign('artist',$artist);
        return $this->view->fetch();
    }
}
