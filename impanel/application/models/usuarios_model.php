<?php

class Usuarios_model extends CI_Model {

    public function __construct() {
        //parent::__construct();
        $this->load->database();

    }

    public function get_usuarios($id = ''){
		if($id != ''){
			$where = array("id =" => $id);	
		}else{
			$where = array("id !=" => $this->session->userdata("idusuario"));	
		}
		
		$res = $this->db->from("im_usuarios")->where($where)->get();
		$r = $res->result();
		return $r;
	}
	
	public function insert(){
		
		$this->db->where("(email='".$this->input->post("email")."' OR usuario='".$this->input->post("usuario")."')", NULL, FALSE);
		$this->db->from("im_usuarios");
		$res = $this->db->get();
		$con = $res->result();
		
		if(count($con) > 0){
			return "existe";	
		}else{
			
			$con = $this->db->from("im_usuarios")->get();
			$con = $con->result();
			
			$datos = array("nombre" => $this->input->post("nombre"),
							"tags"	=> url_friend($this->input->post("nombre"), $con),
							"cargo" => $this->input->post("cargo"),
							"email" => $this->input->post("email"),
							"telefono" => $this->input->post("telefono"),
							"direccion" => $this->input->post("direccion"),
							"imagen" => $this->input->post("file_name"),
							"usuario" => $this->input->post("usuario"),
							"clave" => md5($this->input->post("clave")));
		
			$insert = $this->db->insert("im_usuarios", $datos);
			$iduser = $this->db->insert_id();
			
			$priv = array();
			$i = 0;
			foreach($this->input->post("privilegios") as $p){
				$priv[$i] = array("idmodulo" => $p,
								"idusuario" => $iduser);
				$i++;
			}
			$this->db->insert_batch("im_modulos_privilegios", $priv);
			
			
			return "exito";
		}	
	}
	
	
	
	
	public function update(){
		
		$this->db->where("(email='".$this->input->post("email")."' OR usuario='".$this->input->post("usuario")."') AND id != '".$this->input->post("id")."'", NULL, FALSE);
		$this->db->from("im_usuarios");
		$res = $this->db->get();
		$con = $res->result();
				
		if(count($con) > 0){
			return "existe";	
		}else{
			
			$this->db->where("idusuario", $this->input->post("id"));
			$this->db->delete("im_modulos_privilegios");
			
			$priv = array();
			$i = 0;
			foreach($this->input->post("privilegios") as $p){
				$priv[$i] = array("idmodulo" => $p,
								"idusuario" => $this->input->post("id"));
				$i++;
			}
			$this->db->insert_batch("im_modulos_privilegios", $priv);
			
			$con = $this->db->from("im_usuarios")->get();
			$con = $con->result();
			
			
			
			$datos = array("nombre" => $this->input->post("nombre"),
							"cargo" => $this->input->post("cargo"),
							"email" => $this->input->post("email"),
							"telefono" => $this->input->post("telefono"),
							"direccion" => $this->input->post("direccion"),
							"imagen" => $this->input->post("file_name"),
							"usuario" => $this->input->post("usuario"));
			
			if($con[0]->nombre == $this->input->post("nombre")){
				$datos["tags"] = $con[0]->tags;
			}else{
				$datos["tags"] = url_friend($this->input->post("nombre"), $con);
			}
			
							
			if($this->input->post("clave") != ''){
				$datos["clave"] = md5($this->input->post("clave"));
			}
			
			$this->db->where("id", $this->input->post("id"));
			$update = $this->db->update("im_usuarios", $datos);
			
			if($update){
				return "exito";	
			}else{
				return "error";	
			}
		}	
	}
	
	
	public function delete(){
		$where = array("id" => $this->input->post("id"));
		$this->db->where($where);
		$res = $this->db->delete("im_usuarios");
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
		$res = $this->db->update("im_usuarios", $datos);	
		if($res){
			return "exito";	
		}else{
			return "false";	
		}
	}
	
	
	public function get_privilegios_modulos($id){
		$priv = $this->db->select("idmodulo")->from("im_modulos_privilegios")->where("idusuario", $id)->get();	
		return $priv->result();
	}
	
	
	public function get_modulos(){
		$where = array("status" => "0");
		$res = $this->db->from("im_modulos")->where($where)->get();
		return $res->result();
	}

}

?>