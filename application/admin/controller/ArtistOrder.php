<?php

namespace app\admin\controller;

use app\common\controller\Backend;

/**
 * 订单管理
 *
 * @icon fa fa-circle-o
 */
class ArtistOrder extends Backend
{
    
    /**
     * ArtistOrder模型对象
     * @var \app\common\model\ArtistOrder
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\common\model\ArtistOrder;
        $this->view->assign("payTypeList", $this->model->getPayTypeList());
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
                    ->with(['goods','user'])
                    ->where($where)
                    ->order($sort, $order)
                    ->count();

            $list = $this->model
                    ->with(['goods','user'])
                    ->where($where)
                    ->order($sort, $order)
                    ->limit($offset, $limit)
                    ->select();

            foreach ($list as $row) {
                $row->visible(['order_id','order_num','user_id','goods_id','price','receive_name','receive_mobile','receive_address','pay_type','out_trade_no','createtime','status','complete_time']);
                $row->visible(['goods']);
				$row->getRelation('goods')->visible(['title']);
				$row->visible(['user']);
				$row->getRelation('user')->visible(['avatar']);
            }
            $list = collection($list)->toArray();
            $result = array("total" => $total, "rows" => $list);

            return json($result);
        }
        return $this->view->fetch();
    }
}
