<?php

class Contenido_model extends CI_Model {

    public function __construct() {
        //parent::__construct();

    }

	public function get_contenido($tags){
		
		$get = $this->db->from("im_contenidos")->where(array("tags"=> $tags, "status" => "0"))->get();
		return $get->result();
	}
	
	

}

?>