<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Wxserver extends Home_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->helper('url');
        
    }
    public function show(){
        var_dump(strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger'));
//    	if ( strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') !== false ) {
            if(!$this->session->userdata('openid')){
                $appid = APP_ID; //我把微信的appid 写成了全局变量,一般放在application/config/constant.php 中
                $secret = APP_SECRET;//同上
                if(empty($_GET['code'])){
                    $url = 'http://'.$_SERVER['SERVER_NAME'].$_SERVER["REQUEST_URI"]; //这是要回调地址可以有别的写法
//                    var_dump($url);
                    redirect("https://open.weixin.qq.com/connect/oauth2/authorize?appid={$appid}&redirect_uri={$url}&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect");
                    //重定向到以上网址,这是微信给的固定地址.必须格式一致
                }else{
                    //回调成功,获取code,再做请求,获取openid
                    $j_access_token=file_get_contents("https://api.weixin.qq.com/sns/oauth2/access_token?appid={$appid}&secret={$secret}&code={$_GET['code']}&grant_type=authorization_code");
                    $a_access_token=json_decode($j_access_token,true);
                    $access_token=$a_access_token["access_token"];//虽然这里 也获取了一个access_token,但是和获取用户详情,还有发送模板信息所使用的access_token不同
                    $openid=$a_access_token["openid"];
                    $this->session->set_userdata('openid', $openid);
                }
           }
//        }
		
	}
}