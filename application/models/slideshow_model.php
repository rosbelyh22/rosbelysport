<?php

class Slideshow_model extends CI_Model {

    public function __construct() {
        //parent::__construct();

    }

	public function get_slide(){
		
		$this->db->from("im_slideshow");
		$this->db->where("status", "0");
		$this->db->order_by("posicion", "ASC");
		$get = $this->db->get();
		
		return $get->result();
	}
	
	

}

?>