<?php

namespace app\common\model;

use think\Model;


class Goods extends Model
{

    

    //数据库
    protected $connection = 'database';
    // 表名
    protected $name = 'goods';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = false;
    protected $deleteTime = false;

    // 追加属性
    protected $append = [
        'type_text'
    ];
    

    
    public function getTypeList()
    {
        return ['10' => __('Type 10'), '20' => __('Type 20'), '30' => __('Type 30')];
    }


    public function getTypeTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['type']) ? $data['type'] : '');
        $list = $this->getTypeList();
        return isset($list[$value]) ? $list[$value] : '';
    }




    public function artist()
    {
        return $this->belongsTo('Artist', 'artist_id', 'artist_id', [], 'LEFT')->setEagerlyType(0);
    }
}
