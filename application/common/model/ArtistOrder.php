<?php

namespace app\common\model;

use think\Model;


class ArtistOrder extends Model
{

    

    //数据库
    protected $connection = 'database';
    // 表名
    protected $name = 'order';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = false;
    protected $deleteTime = false;

    // 追加属性
    protected $append = [
        'pay_type_text',
        'status_text'
    ];
    

    
    public function getPayTypeList()
    {
        return ['10' => __('Pay_type 10'), '20' => __('Pay_type 20')];
    }

    public function getStatusList()
    {
        return ['10' => __('Status 10'), '20' => __('Status 20'), '30' => __('Status 30')];
    }


    public function getPayTypeTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['pay_type']) ? $data['pay_type'] : '');
        $list = $this->getPayTypeList();
        return isset($list[$value]) ? $list[$value] : '';
    }


    public function getStatusTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['status']) ? $data['status'] : '');
        $list = $this->getStatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }




    public function goods()
    {
        return $this->belongsTo('Goods', 'goods_id', 'goods_id', [], 'LEFT')->setEagerlyType(0);
    }


    public function user()
    {
        return $this->belongsTo('User', 'user_id', 'user_id', [], 'LEFT')->setEagerlyType(0);
    }
}
