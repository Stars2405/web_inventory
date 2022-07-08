<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller{


	public function index()
	{
		error_reporting(0);
        $this->load->library("session");
        $this->load->helper('url');

		if ($this->session->userdata('id_user') != null && $this->session->userdata('id_user') != '')
		{
			$this->load->view('template');
		} else {
			redirect('login');
		}
	}

}

