<?php

class Contenido_model extends CI_Model {

    public function __construct() {
        //parent::__construct();
        $this->load->database();

    }

    public function get_contenidos($id=''){
		if($id != ''){
			$this->db->where("id", $id);	
		}
		$this->db->from("im_contenidos");
		$get = $this->db->get();
		return $get->result();
		
	}
	
	public function insert(){
		$con = $this->db->from("im_contenidos")->get();
		$con = $con->result();
		
		$datos = array("titulo" => $this->input->post("titulo"),
						"titulo_espanol" => $this->input->post("titulo_espanol"),
						"contenido" => $this->input->post("contenido"),
						"contenido_espanol" => $this->input->post("contenido_espanol"),
						"tags" => url_friend($this->input->post("titulo"), $con));
						
		$this->db->insert("im_contenidos", $datos);
		return "exito";
	}
	
	public function update(){
		$con = $this->db->from("im_contenidos")->where("id", $this->input->post("id"))->get();
		$con = $con->result();
		
		$datos = array("titulo" => $this->input->post("titulo"),
						"titulo_espanol" => $this->input->post("titulo_espanol"),
						"contenido_espanol" => $this->input->post("contenido_espanol"),
						"contenido" => $this->input->post("contenido"));
		//if($con[0]->titulo == $this->input->post("titulo")){
			//$datos["tags"] = $con[0]->tags;
		//}else{
			//$datos["tags"] = url_friend($this->input->post("titulo"), $con);	
		//}
		
		$this->db->where("id", $this->input->post("id"));
		$update = $this->db->update("im_contenidos",$datos);
		if($update){
			return "exito";
		}else{
			return "error";	
		}
		
		
	}
	
	
	public function delete(){
		$this->db->where("id", $this->input->post("id"));
		$this->db->delete("im_contenidos");
		return "exito";	
	}
	
	
	
	
	


}

?>