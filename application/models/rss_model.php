<?php

class Rss_model extends CI_Model {

    public function __construct() {
        //parent::__construct();
        $this->load->database();

    }

	// CONSULTA LOS DATOS DE INICIO DE SESION Y CREA LAS VARIABLES DE SESION DEL SISTEMA
    
	public function get_rss(){
			$this->db->select("n.*,
								c.nombre as nombre_categoria");
			$this->db->from("im_noticias as n")->where("fecha_publicacion <=", date("Y-m-d H:i:s"));
			$this->db->join("im_noticias_categoria c ", "c.id = n.idcategoria", "inner", FALSE);
			$this->db->order_by("n.id", "desc");
			$this->db->limit(10, 0);
			$get = $this->db->get();
			
			return $get->result();	
	}
	
	
	
	

}

?>