<?php

class Noticias_model extends CI_Model {

    public function __construct() {
        //parent::__construct();

    }

	public function get_destacadas(){
		$this->db->select("n.*,
							ng.archivo");
		$this->db->from("im_noticias as n");
		$this->db->join("im_noticias_galeria as ng", "n.id = ng.idnoticia", "inner", FALSE);
		$this->db->where("n.fecha_publicacion <=",fecha_actual());
		$this->db->where("ng.principal", "1");
		$this->db->where("n.destacado", "1");
		$this->db->where("n.status", "0");
		$this->db->order_by("n.fecha_publicacion", "desc");
		$get = $this->db->get();
		return $get->result();
	}
	
	
	
	public function get_destacadas_rand(){
		$this->db->select("n.*,
							ng.archivo");
		$this->db->from("im_noticias as n");
		$this->db->join("im_noticias_galeria as ng", "n.id = ng.idnoticia", "inner", FALSE);
		$this->db->where("n.fecha_publicacion <=",fecha_actual());
		$this->db->where("ng.principal", "1");
		$this->db->where("n.destacado", "1");
		$this->db->where("n.status", "0");
		$this->db->order_by("RAND()");
		$get = $this->db->get();
		//echo $this->db->last_query();
		return $get->result();
	}
	
	
	public function get_noticias($tags_cat = '', $tags_not = '', $comen = 0 ){
		
		$conf = $this->db->from("im_configuracion")->where("nombre", "noticias_pagina")->get();
		$conf = $conf->result();
		
		$this->db->select("n.*,
							ng.archivo,
							nc.nombre as nombre_categoria,
							nc.tags as tags_categoria,
							nc.imagen as imagen_categoria");
		$this->db->from("im_noticias as n");
		$this->db->join("im_noticias_galeria as ng", "n.id = ng.idnoticia", "left", FALSE);
		$this->db->join("im_noticias_categoria as nc", "n.idcategoria = nc.id", "inner", FALSE);
		if($tags_cat != ''){
			$this->db->where("nc.tags", $tags_cat);	
		}
		if($tags_not != ''){
			$this->db->where("n.tags", $tags_not);	
		}
		$this->db->where("n.fecha_publicacion <=",fecha_actual());
		//$this->db->where("ng.principal", "1");
		$this->db->where("n.status", "0");
		$this->db->limit($conf[0]->valor, $comen);
		$this->db->order_by("n.fecha_publicacion", "DESC");
		
		$get = $this->db->get();	
		//echo $this->db->last_query();
		return $get->result();
	}
	
	
	public function cant_noticias($tags_cat){
		
		$this->db->select("n.id");
		$this->db->from("im_noticias as n");
		$this->db->join("im_noticias_categoria as nc", "n.idcategoria = nc.id", "inner", FALSE);
		if($tags_cat != ''){
			$this->db->where("nc.tags", $tags_cat);	
		}
		
		$this->db->where("n.fecha_publicacion <=",fecha_actual());
		
		$get = $this->db->get();	
		//echo $this->db->last_query();
		return count($get->result());
	}
	
	
	public function get_galeria($id){
		$get = $this->db->from("im_noticias_galeria")->where(array("idnoticia"=> $id, "principal" => "0"))->get();	
		return $get->result();
	}

}

?>