<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

//用户控制器
class User extends Home_Controller{

	public function __construct(){
		parent::__construct();
		$this->load->library('form_validation');
		$this->load->model('user_model');
	}
	#显示注册页面
	public function register(){
		$this->load->view('register.html');	
	}

	#显示登录页面
	public function login(){
		$this->load->view('login.html');
	}

	public function do_register(){
$this -> output -> enable_profiler(TRUE);
		#设置验证规则
		$this->form_validation->set_rules('username','用户名','required');
		$this->form_validation->set_rules('password','密码','required|min_length[6]|max_length[16]|md5');
		$this->form_validation->set_rules('repassword','重复密码','required|matches[password]');


		if ($this->form_validation->run() == false) {
			# 未通过
			echo validation_errors();
		} else {
			# 通过,注册
			$data['user_name'] = $this->input->post('username',true);
			$data['password'] = $this->input->post('password',true);

			$data['reg_time'] = time();
			if ($this->user_model->add_user($data)) {
				# 注册成功
				echo 'ok';
			} else {
				# 注册失败
				echo 'error';
			}
			
		}
    }
	#登录动作
	public function signin(){
		#验证 省略
		$username = $this->input->post('username');
		$password = $this->input->post('password');

		if ($user = $this->user_model->get_user($username,$password)) {
			#成功，将用户信息保存至session
			$this->session->set_userdata('user',$user);
			redirect('home/index');
		} else {
			# error
            $data['message']='erro';
//			var_dump($data);
			echo json_encode($data);
		}
		
	}

	#注销动作
	public function logout(){
		$this->session->unset_userdata('user');
		redirect('home/index');
	}
}
