<?php

namespace app\admin\controller;

use app\common\controller\Backend;
use app\common\model\Ad;
use think\Session;
use Monolog\Formatter\ScalarFormatter;
use think\Db;
use fast\Random;
use app\admin\model\AuthGroup;
use app\admin\model\AuthGroupAccess;
use app\admin\model\Admin;

/**
 * 艺术家管理
 *
 * @icon fa fa-circle-o
 */
class Artist extends Backend
{
    
    /**
     * Artist模型对象
     * @var \app\common\model\Artist
     */
    protected $model = null;


    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\common\model\Artist;

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
                $row->visible(['artist_id','name','avatar','wallet','createtime']);
                
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
        if ($this->request->isPost()) {
            $params = $this->request->post("row/a");
            if ($params) {
                $params = $this->preExcludeFields($params);

                $params['createtime']=datetime(time());

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



    /**
     * 删除
     */
    public function del($ids = "")
    {
        if ($ids) {
            $pk = $this->model->getPk();
            $adminIds = $this->getDataLimitAdminIds();
            if (is_array($adminIds)) {
                $this->model->where($this->dataLimitField, 'in', $adminIds);
            }
            $list = $this->model->where($pk, 'in', $ids)->select();

            $admin=model('Admin')->get(['artist_id'=>$ids]);
            if(!empty($admin)){
                model('Admin')->where(['id'=>$admin['id']])->delete();
                model('AuthGroupAccess')->where(['uid'=>$admin['id']])->delete();
            }

            $count = 0;
            Db::startTrans();
            try {
                foreach ($list as $k => $v) {
                    $count += $v->delete();
                }

                Db::commit();
            } catch (PDOException $e) {
                Db::rollback();
                $this->error($e->getMessage());
            } catch (Exception $e) {
                Db::rollback();
                $this->error($e->getMessage());
            }
            if ($count) {
                $this->success();
            } else {
                $this->error(__('No rows were deleted'));
            }
        }
        $this->error(__('Parameter %s can not be empty', 'ids'));
    }



    /*
     * 添加管理员账号
     *
     * */
    public function add_account(){
        $row=$this->request->get();

        if(empty($row['artist_id'])){
            return $this->error('艺术家不存在!请刷新后重试!');
        }

        $admin=new Admin();
        if($this->request->post()){
            $params=$this->request->post('row/a');
            $adminaccount=$admin->get(['artist_id'=>$row['artist_id']]);
            if(empty($adminaccount)){
                //添加
                $params['salt'] = Random::alnum();
                $params['password'] = md5(md5($params['password']) . $params['salt']);
                $params['avatar'] = '/assets/img/avatar.png'; //设置新管理员默认头像。
                $params['email']=$params['username'].'@qq.com';
                $params['nickname']=$params['username'];
                $params['artist_id']=$row['artist_id'];
                $result = $admin->validate('Admin.add')->save($params);
                if ($result === false)
                {
                    $this->error($admin->getError());
                }
                $group_id=7;//分后台权限组id
                model('AuthGroupAccess')->save(['uid'=>$admin->id,'group_id'=>$group_id]);
                $this->success('添加成功!');

            }else{
                //修改
                if ($params['password'])
                {
                    $params['salt'] = Random::alnum();
                    $params['password'] = md5(md5($params['password']) . $params['salt']);
                }
                else
                {
                    unset($params['password'], $params['salt']);
                }

                $params['artist_id']=$row['artist_id'];
                $params['nickname']=$params['username'];
                $params['email']=$params['username']."@qq.com";

                //这里需要针对username和email做唯一验证
                $adminValidate = \think\Loader::validate('Admin');
                $adminValidate->rule([
                    'username' => 'require|max:50|unique:admin,username,' . $adminaccount['id'],
                    'email'    => 'require|email|unique:admin,email,' . $adminaccount['id']
                ]);

                $result = $admin->validate('Admin.edit')->where(['id'=>$adminaccount['id']])->update($params);
                if ($result === false)
                {
                    $this->error($admin->getError());
                }
                return $this->success('修改成功!');
            }

        }

        $this->view->assign('row',$admin->get(['artist_id'=>$row['artist_id']]));
        return $this->view->fetch();
    }


    /*
     * --我的信息
     *
     * */
    public function artist_info(){
        $admin=Session::get('admin');
        if(empty($admin['artist_id'])){
            Session::clear();
            return $this->error('该账户不属于艺术家后台账户!请重新登录!');
        }
        $row=$this->model->get(['artist_id'=>$admin['artist_id']]);
        if($this->request->post()){
            $params=$this->request->post('row/a');

            $res=model('Artist')->where(['artist_id'=>$admin['artist_id']])
                ->update(['name'=>$params['name'],'avatar'=>$params['avatar'],'introduce'=>$params['introduce']]);
            if($res){
                return $this->success('修改成功!');
            }else{
                return $this->error('修改失败!');
            }
        }
        $this->view->assign('row',$row);
        return $this->view->fetch();
    }





}
