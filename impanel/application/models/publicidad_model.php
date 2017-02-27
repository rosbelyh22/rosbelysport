<?php

class Publicidad_model extends CI_Model {

    public function __construct() {
        //parent::__construct();
        $this->load->database();

    }

    public function get_publicidad($id=''){
		if($id != ''){
			$this->db->where("id", $id);	
		}
		$this->db->from("im_publicidad");
		$get = $this->db->get();
		return $get->result();
		
	}
	
	public function block(){
		if($this->input->post("tipo") == "Bloquear"){
			$datos = array("status" => "1")	;
		}else{
			$datos = array("status" => "0")	;
		}
		$this->db->where("id", $this->input->post("id"));
		$res = $this->db->update("im_publicidad", $datos);	
		return "exito";
	}
	
	public function insert(){
		$datos = array("nombre"					=> $this->input->post("nombre"),
						"descripcion"			=> $this->input->post("descripcion"),
						"url"					=> prep_url($this->input->post("url")),
						"nombre_cliente"		=> $this->input->post("nombre_cliente"),
						"telefono_cliente"		=> $this->input->post("telefono_cliente"),
						"archivo"				=> $this->input->post("file_name"),
						"posicion"				=> $this->input->post("posicion"),
						"cantidad_impresiones"	=> $this->input->post("cantidad_impresiones"),
						"cantidad_clic"			=> $this->input->post("cantidad_clic"),
						"fecha_inicio"			=> $this->input->post("fecha_inicio"),
						"fecha_fin"				=> $this->input->post("fecha_fin"),
						"secciones"				=> $this->input->post("secciones"));
		$this->db->insert("im_publicidad", $datos);
		return "exito";	
	}
	
	public function update(){
		$datos = array("nombre"					=> $this->input->post("nombre"),
						"descripcion"			=> $this->input->post("descripcion"),
						"url"					=> prep_url($this->input->post("url")),
						"nombre_cliente"		=> $this->input->post("nombre_cliente"),
						"telefono_cliente"		=> $this->input->post("telefono_cliente"),
						"archivo"				=> $this->input->post("file_name"),
						"posicion"				=> $this->input->post("posicion"),
						"cantidad_impresiones"	=> $this->input->post("cantidad_impresiones"),
						"cantidad_clic"			=> $this->input->post("cantidad_clic"),
						"fecha_inicio"			=> $this->input->post("fecha_inicio"),
						"fecha_fin"				=> $this->input->post("fecha_fin"),
						"secciones"				=> $this->input->post("secciones"));
		$this->db->where("id", $this->input->post("id"));
		$this->db->update("im_publicidad", $datos);
		return "exito";		
	}
	
	
	public function delete(){
		if($this->input->post("archivo") != ''){
			unlink("./files/publicidad/".$this->input->post("archivo"));
		}
		$this->db->where("id", $this->input->post("id"));
		$this->db->delete("im_publicidad");
		return "exito";	
	}
	
	
	public function clic_men($id){
		$sql = $this->db->query(" SELECT COUNT( id ) AS cantidad, 
										 CONCAT( anio, '-', mes ) AS fecha
								FROM im_publicidad_clic
								WHERE idpublicidad = '".$id."'
								GROUP BY anio, mes
								ORDER BY fecha DESC
								LIMIT 0 , 5 ");	
		return $sql->result();	
	}
	
	public function impresiones_men($id){
		$sql = $this->db->query(" SELECT COUNT( id ) AS cantidad, 
										 CONCAT( anio, '-', mes ) AS fecha
								FROM im_publicidad_impresiones
								WHERE idpublicidad = '".$id."'
								GROUP BY anio, mes
								ORDER BY fecha DESC
								LIMIT 0 , 5 ");	
		return $sql->result();	
	}
	
	
	public function impresiones_paises($id){
		$sql = $this->db->query("SELECT COUNT(pais) as cantidad,
								pais as nombre
							FROM im_publicidad_impresiones
							WHERE idpublicidad = '".$id."'
							GROUP BY pais
							ORDER BY cantidad DESC");
		return $sql->result();		
	}
	
	public function clic_paises($id){
		$sql = $this->db->query("SELECT COUNT(pais) as cantidad,
								pais as nombre
							FROM im_publicidad_clic
							WHERE idpublicidad = '".$id."'
							GROUP BY pais
							ORDER BY cantidad DESC");
		return $sql->result();		
	}
	
	
	
	


}

?>