<?php

defined('BASEPATH') or exit('No direct script access allowed');

class karyawan extends CI_Controller
{
    public function __construct()
    {
        parent:: __construct();
        $this->load->model('karyawan_model', 'karyawan');
    }

    public function index()
    {
        $data['karyawan']= $this->karyawan->getAlldatakaryawan();
        $this->load->view('karyawan/index', $data);
    }
}

?>