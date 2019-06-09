<?php

namespace app\index\controller;

use app\common\controller\Frontend;
use think\Session;
use think\Url;

class Login extends Frontend
{

    protected $noNeedLogin = '*';
    protected $noNeedRight = '*';
    protected $layout = '';


    //注册
    public function register(){
        if($this->request->post()){
            $params=$this->request->request();
            $user=model('User')->get(['mobile'=>$params['mobile']]);
            if(!empty($user)){
                return $this->error('该账户已存在!');
            }

            $params['salt']=getNonceStr(4);
            $params['password']=md5($params['password'].$params['salt']);
            $params['createtime']=datetime(time());
            $params['avatar']='/assets/img/avatar.png';
            $res=model('User')->allowField(true)->save($params);

            if($res){
                $user=model('User')->get(['mobile'=>$params['mobile']]);
                Session::set('user',$user);
                return $this->success('注册成功!','main/index');
            }else{
                return $this->error('注册失败!');
            }
        }
        return $this->view->fetch();
    }


    //登陆--手机号验证码登陆
    public function login(){
        if($this->request->post()){
            $params=$this->request->post();
            $user=model('User')->get(['mobile'=>$params['mobile']]);
            if(empty($user)){
                return $this->error('此手机号用户不存在!');
            }

            if($params['type']==1)
            {
                //密码登陆
                if($user['password']==md5($params['password'].$user['salt'])){
                    Session::set('user',$user);
                    return $this->success('登陆成功!','main/index');
                }else{
                    return $this->error('密码错误!');
                }

            }
            else if($params['type']=2)
            {
                //验证码登陆
                Session::set('user',$user);
                return $this->success('登陆成功!','main/index');

            }
            else
            {
                return $this->error('请选择登陆方式!');
            }
        }

        return $this->view->fetch();
    }




    //找回密码
    public function 




    //退出登录
    public function logout(){
        Session::clear();
        return $this->success('退出成功!','login/login');
    }




}
