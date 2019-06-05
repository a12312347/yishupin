<?php

namespace app\admin\controller;

use app\common\controller\Backend;
use think\Db;

/**
 * 提现记录管理
 *
 * @icon fa fa-circle-o
 */
class Tx extends Backend
{
    
    /**
     * Tx模型对象
     * @var \app\common\model\Tx
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\common\model\Tx;
        $this->view->assign("statusList", $this->model->getStatusList());
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
        $this->relationSearch = true;
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
                    ->with(['artist'])
                    ->where($where)
                    ->order($sort, $order)
                    ->count();

            $list = $this->model
                    ->with(['artist'])
                    ->where($where)
                    ->order($sort, $order)
                    ->limit($offset, $limit)
                    ->select();

            foreach ($list as $row) {
                
                $row->getRelation('artist')->visible(['name','avatar']);
            }
            $list = collection($list)->toArray();
            $result = array("total" => $total, "rows" => $list);

            return json($result);
        }
        return $this->view->fetch();
    }


    /*
     * 通过
     *
     * */
    public function pass(){
        $params=$this->request->request();
        $info=$this->model->get(['tx_id'=>$params['tx_id']]);
        if(empty($info)){
            return $this->error('操作失败!');
        }
        Db::startTrans();
        try{
            Db::table('fa_tx')->where(['tx_id'=>$params['tx_id']])->update(['status'=>20]);
//            Db::table('fa_artist')->where(['artist_id'=>$info['artist_id']])->setDec('wallet',$info['sj_price']);

            //企业付款到用户

            Db::commit();
            $res=1;
        }catch(\Exception $e){
            Db::rollback();
            $errcode=$e->getMessage();
            $res=0;
        }
        if($res=1){
            return $this->success('操作成功!');
        }else{
            return $this->error('操作失败!error:'.$errcode);
        }

    }


    /*
     * 拒绝
     *
     * */
    public function refuse(){
        $params=$this->request->request();

        $info=$this->model->get(['tx_id'=>$params['tx_id']]);
        if(empty($info)){
            return $this->error('操作失败!');
        }
        Db::startTrans();
        try{
            Db::table('fa_tx')->where(['tx_id'=>$params['tx_id']])->update(['status'=>30]);
            Db::table('fa_artist')->where(['artist_id'=>$info['artist_id']])->setInc('wallet',$info['tx_price']);
            Db::commit();
            $res=1;
        }catch(\Exception $e){
            Db::rollback();
            $errcode=$e->getMessage();
            $res=0;
        }
        if($res==1){
            return $this->success('操作成功!');
        }else{
            return $this->error('操作失败!error:'.$errcode);
        }
    }





}
