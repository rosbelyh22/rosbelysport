<?php

class Menu_model extends CI_Model {

    public function __construct() {
        //parent::__construct();
        $this->load->database();

    }

    public function get_menu($id=''){
		$this->db->select("m.*,
							m2.nombre as nombre_padre,
							mt.nombre as nombre_tipo,
							mt.tabla,
							mt.campo");
		if($id != ''){
			$this->db->where("m.id", $id);	
		}
		$this->db->from("im_menus as m");
		$this->db->join("im_menus as m2", "m2.id = m.idpadre", "left", FALSE);
		$this->db->join("im_menu_tipo mt", "mt.id = m.tipo", "inner", FALSE);
		$get = $this->db->get();
		return $get->result();
		
	}
	
	public function insert(){
		$con = $this->db->from("im_menus")->get();
		$con = $con->result();
		
		$datos = array("nombre" => $this->input->post("nombre"),
		"nombre_espanol" => $this->input->post("nombre_espanol"),
						"idpadre" => $this->input->post("idpadre"),
						"tipo" => $this->input->post("tipo"),
						"posicion"	=> $this->input->post("posicion"),
						"tags" => url_friend($this->input->post("nombre"), $con));
		
		if($this->input->post("tipo") == "11"){
			$datos["url"] = $this->input->post("idrelacion");
		}else{
			$datos["idrelacion"] = $this->input->post("idrelacion");
		}
		
						
		$this->db->insert("im_menus", $datos);
		return "exito";
	}
	
	public function update(){
		$con = $this->db->from("im_menus")->where("id", $this->input->post("id"))->get();
		$con = $con->result();
		
		$datos = array("nombre" => $this->input->post("nombre"),
		"nombre_espanol" => $this->input->post("nombre_espanol"),
						"idpadre" => $this->input->post("idpadre"),
						"tipo" => $this->input->post("tipo"),
						"posicion"	=> $this->input->post("posicion"));
		if($con[0]->nombre == $this->input->post("nombre")){
			$datos["tags"] = $con[0]->tags;
		}else{
			$datos["tags"] = url_friend($this->input->post("nombre"), $con);	
		}
		
		if($this->input->post("tipo") == "11"){
			$datos["url"] = $this->input->post("idrelacion");
		}else{
			$datos["idrelacion"] = $this->input->post("idrelacion");
		}
		
		
		$this->db->where("id", $this->input->post("id"));
		$this->db->update("im_menus",$datos);
		
		return "exito";
		
	}
	
	
	public function delete(){
		$this->db->where("id", $this->input->post("id"));
		$this->db->delete("im_menus");
		return "exito";	
	}
	
	
	public function get_relacion($tipo){
		if($tipo["tabla"] == "im_contenidos"){
			$this->db->select("titulo as nombre,
								id");
			$get = $this->db->from($tipo["tabla"])->get();	
			return $get->result();
		}else{
			if($tipo["tabla"] != ''){
				$get = $this->db->from($tipo["tabla"])->get();	
				return $get->result();
			}else{
				return array();	
			}
		}
		
	}
	
	
	public function get_menu_tipo(){
		$get = $this->db->from("im_menu_tipo")->get();
		return $get->result();	
	}
	
	
	
	public function block(){
		if($this->input->post("tipo") == "Bloquear"){
			$datos = array("status" => "1")	;
		}else{
			$datos = array("status" => "0")	;
		}
		$this->db->where("id", $this->input->post("id"));
		$res = $this->db->update("im_menus", $datos);	
		return "exito";
	}


}

?>