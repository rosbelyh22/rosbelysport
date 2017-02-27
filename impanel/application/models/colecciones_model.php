<?php

class Colecciones_model extends CI_Model {

    public function __construct() {
        //parent::__construct();
        $this->load->database();

    }

    public function get_colecciones($id=''){
		if($id != ''){
			$this->db->where("c.id", $id);	
		}
		$this->db->select("c.*");
		$this->db->from("im_productos_colecciones as c");
		$get = $this->db->get();
		return $get->result();
		
	}
	
	public function insert(){
		$con = $this->db->from("im_productos_colecciones")->get();
		$con = $con->result();
		
		$datos = array("nombre" => $this->input->post("nombre"),
						"nombre_espanol" => $this->input->post("nombre_espanol"),
						"descripcion" => $this->input->post("descripcion"),
						"descripcion_espanol" => $this->input->post("descripcion_espanol"),
						"tags" => url_friend($this->input->post("nombre"), $con),
						"imagen" => $this->input->post("file_name"));
						
		$this->db->insert("im_productos_colecciones", $datos);
		return "exito";
	}
	
	public function update(){
		$con = $this->db->from("im_productos_colecciones")->where("id", $this->input->post("id"))->get();
		$con = $con->result();
		
		$datos = array("nombre" => $this->input->post("nombre"),
						"nombre_espanol" => $this->input->post("nombre_espanol"),
						"descripcion" => $this->input->post("descripcion"),
						"descripcion_espanol" => $this->input->post("descripcion_espanol"),
						"imagen" => $this->input->post("file_name"));
						
		if($con[0]->nombre == $this->input->post("nombre")){
			$datos["tags"] = $con[0]->tags;
		}else{
			$con = $this->db->from("im_productos_colecciones")->get();
			$con = $con->result();
			$datos["tags"] = url_friend($this->input->post("nombre"), $con);	
		}
				
		$this->db->where("id", $this->input->post("id"));
		$this->db->update("im_productos_colecciones",$datos);
		
		return "exito";
		
	}
	
	
	public function delete(){
		if($this->input->post("cambio") != '0'){
			$datos = array("idcoleccion" => $this->input->post("cambio"));
			$this->db->where("idcoleccion", $this->input->post("id"));
			$this->db->update("im_productos", $datos);
		}else{
			$this->db->where("idcategoria", $this->input->post("id"));
			$get = $this->db->from("im_productos")->get();	
			$res = $get->result();
			foreach($res as $r){
				self::delete_producto($r->id);	
			}
		}
		
		$this->db->where("id", $this->input->post("id"));
		$this->db->delete("im_productos_colecciones");
		return "exito";	
	}
	
	

	
	public function delete_producto($id){
		// AGREGAR CODIGO PARA ELIMINAR IMAGENES DE UNA producto
		
		$this->db->where("id", $id);
		$this->db->delete("im_productos");
		return "exito";
	}
	

}

?>