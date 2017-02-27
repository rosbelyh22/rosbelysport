<?php

class Publicidad_model extends CI_Model {

    public function __construct() {
        //parent::__construct();

    }

	public function get_anuncio($id){
		$anuncio = $this->db->from("im_publicidad")->where("id", $id)->get();
		$anuncio = $anuncio->result();
		
		$clic = $anuncio[0]->clic+1;
		
		$datos = array("clic" => $clic);
		$this->db->where("id", $id);
		$this->db->where("status", "0");
		$this->db->update("im_publicidad", $datos);
		
		$datos_p = array("idpublicidad" => $anuncio[0]->id,
						"pais" => $this->session->userdata("pais"),
						"anio" => date("Y"),
						"mes" => date("m"),
						"dia" => date("d"));
		$this->db->insert("im_publicidad_clic", $datos_p);
		
		return $anuncio[0]->url;
	}
	
	

}

?>