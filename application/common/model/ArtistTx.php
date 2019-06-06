<?php

namespace app\common\model;

use think\Model;


class ArtistTx extends Model
{

    

    //数据库
    protected $connection = 'database';
    // 表名
    protected $name = 'tx';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    protected $deleteTime = false;

    // 追加属性
    protected $append = [
        'status_text',
        'type_text'
    ];


    public function getTypeList(){
        return ['10' => __('Type 10'), '20' => __('Type 20')];
    }

    public function getTypeTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['type']) ? $data['type'] : '');
        $list = $this->getTypeList();
        return isset($list[$value]) ? $list[$value] : '';
    }

    
    public function getStatusList()
    {
        return ['10' => __('Status 10'), '20' => __('Status 20'), '30' => __('Status 30')];
    }


    public function getStatusTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['status']) ? $data['status'] : '');
        $list = $this->getStatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }




}
