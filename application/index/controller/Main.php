<?php

namespace app\index\controller;

use app\common\controller\Frontend;
use think\Session;
use think\Url;

class Main extends Frontend
{

    protected $noNeedLogin = '*';
    protected $noNeedRight = '*';
    protected $layout = '';
    protected $user=null;

    public function _initialize()
    {
        $this->user=Session::get('user');
        if(empty($this->user)){
            return $this->error('请先登陆!','login/login');
        }
    }


    //首页
    public function index()
    {
        dump(json_decode($this->user,true));
        return $this->view->fetch();
    }



}
