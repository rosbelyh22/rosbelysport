<?php

class Contacto_model extends CI_Model {

    public function __construct() {
        //parent::__construct();
        $this->load->database();

    }

	public function insert_contacto($idcliente){
		$datos = array("idcliente" => $idcliente,
						"asunto" => $this->input->post("asunto"),
						"mensaje" => $this->input->post("mensaje"));
		$this->db->insert("im_mensajes", $datos);	
	}
    
	

}

?>