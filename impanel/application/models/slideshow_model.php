<?php

class Slideshow_model extends CI_Model {

    public function __construct() {
        //parent::__construct();
        $this->load->database();

    }

    public function get_slide($id=''){
		if($id != ''){
			$this->db->where("id", $id);	
		}
		$this->db->from("im_slideshow");
		$get = $this->db->get();
		return $get->result();
		
	}
	
	public function insert(){
		
		if($this->input->post("link") != ''){
			$link = prep_url($this->input->post("link"));	
		}else{
			$link = '';
		}
		
		$datos = array("titulo" => $this->input->post("titulo"),
						"descripcion" => $this->input->post("descripcion"),
						"titulo_espanol" => $this->input->post("titulo_espanol"),
						"descripcion_espanol" => $this->input->post("descripcion_espanol"),
						"link" => $link,
						"posicion" => $this->input->post("posicion"),
						"archivo" => $this->input->post("file_name"));
						
		$this->db->insert("im_slideshow", $datos);
		return "exito";
	}
	
	public function update(){
		
		if($this->input->post("link") != ''){
			$link = prep_url($this->input->post("link"));	
		}else{
			$link = '';
		}
		
		$datos = array("titulo" => $this->input->post("titulo"),
						"descripcion" => $this->input->post("descripcion"),
						"titulo_espanol" => $this->input->post("titulo_espanol"),
						"descripcion_espanol" => $this->input->post("descripcion_espanol"),
						"link" => $link,
						"posicion" => $this->input->post("posicion"));
		
		
		
		$this->db->where("id", $this->input->post("id"));
		$this->db->update("im_slideshow",$datos);
		
		return "exito";
		
	}
	
	
	public function delete(){
		$con = $this->db->from("im_slideshow")->where("id", $this->input->post("id"))->get();
		$con = $con->result();
		
		unlink("./files/slideshow/".$con[0]->archivo);
		
		$this->db->where("id", $this->input->post("id"));
		$this->db->delete("im_slideshow");
		return "exito";	
	}
	
	
	
	public function block(){
		if($this->input->post("tipo") == "Bloquear"){
			$datos = array("status" => "1")	;
		}else{
			$datos = array("status" => "0")	;
		}
		$this->db->where("id", $this->input->post("id"));
		$res = $this->db->update("im_slideshow", $datos);	
		return "exito";
	}
	
	
	


}

?>