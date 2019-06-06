<?php

namespace app\admin\controller;

use app\common\controller\Backend;
use think\Db;
use think\Session;

/**
 * 需求管理
 *
 * @icon fa fa-circle-o
 */
class ArtistDemand extends Backend
{
    
    /**
     * ArtistDemand模型对象
     * @var \app\common\model\ArtistDemand
     */
    protected $model = null;
    protected $admin=null;
    protected $noNeedRight=['*'];

    public function _initialize()
    {
        parent::_initialize();
        $this->admin=Session::get('admin');
        $this->model = new \app\common\model\ArtistDemand;

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
                    ->where(['artist_id'=>0])
                    ->where($where)
                    ->order($sort, $order)
                    ->count();

            $list = $this->model
                ->where(['artist_id'=>0])
                    ->where($where)
                    ->order($sort, $order)
                    ->limit($offset, $limit)
                    ->select();

            foreach ($list as $row) {
                $row->visible(['demand_id','user_id','details','mobile','createtime','type','category','style','technique']);
                
            }
            $list = collection($list)->toArray();
            $result = array("total" => $total, "rows" => $list);

            return json($result);
        }
        return $this->view->fetch();
    }

    /*
     * 查看需求
     *
     * */
    public function show_introduce(){
//        if($this->request->request()){
//            $params=$this->request->request();
//            $row=$this->model->get(['demand_id'=>$params['demand_id']]);
//            if($row){
//                dump($row);
//                $this->view->assign('row',$row);
//            }
//        }
        $params=$this->request->request();
        //$row=$this->model->get(['demand_id'=>$params['demand_id']]);
        $row=Db::table('fa_demand')->where(['demand_id'=>$params['demand_id']])->find();
        $this->view->assign('row',$row);
        return $this->view->fetch();
    }

    /*
     * 确认接单
     *
     * */
    public function access(){
        if($this->request->isAjax()){
            $params=$this->request->request();
            if(empty($this->admin['artist_id'])){
                Session::clear();
                return $this->error('该账号没有艺术家分后台管理权限!请重新登录!');
            }
            $demand=$this->model->get(['demand_id'=>$params['demand_id']]);
            if(!empty($demand['artist_id'])){
                return $this->error('该需求已被接受!');
            }
            $res=$this->model->where(['demand_id'=>$params['demand_id']])->update(['artist_id'=>$this->admin['artist_id']]);
            if($res){
                return $this->success('接单成功!');
            }else{
                return $this->error('接单失败!');
            }
        }
    }
}
