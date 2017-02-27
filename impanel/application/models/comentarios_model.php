<?php

class Comentarios_model extends CI_Model {

    public function __construct() {
        //parent::__construct();
        $this->load->database();

    }

    public function get_comentarios($id=''){
		if($id != ''){
			$this->db->where("id", $id);	
		}
		$this->db->select("nc.*,
							c.nombre as nombre_cliente,
							n.titulo as titulo_noticia");
		$this->db->from("im_noticias_comentarios as nc");
		$this->db->join("im_clientes as c", "c.id = nc.idcliente", "inner", FALSE);
		$this->db->join("im_noticias as n", "n.id = nc.idnoticia", "inner", FALSE);
		$get = $this->db->get();
		return $get->result();
		
	}
	
	public function insert(){
		
		$datos = array("idnoticia" => $this->input->post("idnoticia"),
						"idcliente" => $idcliente,
						"comentario" => censurar_string($this->input->post("comentario")));
						
		$this->db->insert("im_noticias_comentarios", $datos);
		return "exito";
	}
	
	
	
	
	public function delete(){
		$this->db->where("id", $this->input->post("id"));
		$this->db->delete("im_noticias_comentarios");
		return "exito";	
	}
	
	
	
	
	


}

?>