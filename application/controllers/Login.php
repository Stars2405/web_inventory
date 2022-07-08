<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {

	public function index()
	{
		error_reporting(0);
        $this->load->library('session');
        $this->load->helper('url');
		if ($this->session->userdata('id_user') != null && $this->session->userdata('id_user') != '') {
		redirect('home');
		} else {
		$this->load->view('login');
		}
	}

	public function setSession()
	{
		error_reporting(0);
        $this->load->library('session');
        $this->load->helper('url');

		$id_user = $this->input->post('id_user');
		$email = $this->input->post('email');
		$level = $this->input->post('level');
		$nama = $this->input->post('nama');
		
		$this->session->set_userdata('id_user', $id_user);
		$this->session->set_userdata('email', $email);
		$this->session->set_userdata('level', $level);
		$this->session->set_userdata('nama', $nama);
	}
	public function logout()
	{
		error_reporting(0);
        $this->load->library('session');
        $this->load->helper('url');
		$this->session->sess_destroy();
		redirect('login');
	}
}


