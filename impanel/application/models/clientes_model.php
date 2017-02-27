<?php

class Clientes_model extends CI_Model {

    public function __construct() {
        //parent::__construct();
        $this->load->database();

    }

    public function get_cliente($id = ''){
		if($id != ''){
			$where = $this->db->where("id",$id);	
		}
		
		$this->db->from("im_clientes");
		$res = $this->db->get();
		$r = $res->result();
		return $r;
	}
	
	public function insert(){
		
		$this->db->where("(email='".$this->input->post("email")."')", NULL, FALSE);
		$this->db->from("im_clientes");
		$res = $this->db->get();
		$con = $res->result();
		
		if(count($con) > 0){
			return "existe";	
		}else{
			
			$con = $this->db->from("im_clientes")->get();
			$con = $con->result();
			
			$datos = array("nombre" => $this->input->post("nombre"),
							"tags"	=> url_friend($this->input->post("nombre"), $con),
							"pais" => $this->input->post("pais"),
							"estado" => $this->input->post("estado"),
							"telefono" => $this->input->post("telefono"),
							"email" => $this->input->post("email"),
							"direccion" => $this->input->post("direccion"),
							"clave" => md5($this->input->post("clave")));
		
			$insert = $this->db->insert("im_clientes", $datos);
			return "exito";
		}	
	}
	
	
	
	
	public function update(){
		
		$this->db->where("email", $this->input->post("email"));
		$this->db->where("id !=", $this->input->post("id"));
		$this->db->from("im_clientes");
		$res = $this->db->get();
		$con = $res->result();
				
		if(count($con) > 0){
			return "existe";	
		}else{
			$con = $this->db->from("im_clientes")->get();
			$con = $con->result();
			
			$datos = array("nombre" => $this->input->post("nombre"),
							"pais" => $this->input->post("pais"),
							"estado" => $this->input->post("estado"),
							"telefono" => $this->input->post("telefono"),
							"email" => $this->input->post("email"),
							"direccion" => $this->input->post("direccion"));
			
			if($con[0]->nombre == $this->input->post("nombre")){
				$datos["tags"] = $con[0]->tags;
			}else{
				$datos["tags"] = url_friend($this->input->post("nombre"), $con);
			}
			
							
			if($this->input->post("clave") != ''){
				$datos["clave"] = md5($this->input->post("clave"));
			}
			
			$this->db->where("id", $this->input->post("id"));
			$update = $this->db->update("im_clientes", $datos);
			
			return "exito";
		}	
	}
	
	
	public function delete(){
		$where = array("id" => $this->input->post("id"));
		$this->db->where($where);
		$res = $this->db->delete("im_clientes");
		if($res){
			return "exito";	
		}else{
			return "error";	
		}
	}
	
	
	public function block(){
		if($this->input->post("tipo") == "Bloquear"){
			$datos = array("status" => "1")	;
		}else{
			$datos = array("status" => "0")	;
		}
		$this->db->where("id", $this->input->post("id"));
		$res = $this->db->update("im_clientes", $datos);	
		if($res){
			return "exito";	
		}else{
			return "false";	
		}
	}
	
	
	

}

?>