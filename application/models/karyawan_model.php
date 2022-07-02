<?php


class karyawan_model extends CI_Model
{
    public function getAlldatakaryawan() {


        return $this->db->get('karyawan')->result_array();
        
    }
}



?>