<?php

namespace app\common\model;

use think\Model;


class ArtistGoodsComments extends Model
{

    

    //数据库
    protected $connection = 'database';
    // 表名
    protected $name = 'goods_comments';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = false;
    protected $deleteTime = false;

    // 追加属性
    protected $append = [

    ];
    

    public function user(){
        return $this->belongsTo('User','user_id','user_id',[],'LEFT')->setEagerlyType(0);
    }

    public function goods(){
        return $this->belongsTo('Goods','goods_id','goods_id',[],'LEFT')->setEagerlyType(0);
    }







}
