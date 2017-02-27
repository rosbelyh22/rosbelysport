<?php

class Mensajes_model extends CI_Model {

    public function __construct() {
        //parent::__construct();
        $this->load->database();

    }

    public function get_mensajes($id=''){
		if($id != ''){
			$this->db->where("m.id", $id);	
		}
		$this->db->select("m.*,
							c.nombre as nombre_cliente,
							c.pais as pais_cliente,
							c.estado as estado_cliente,
							c.telefono as telefono_cliente,
							c.email as email_cliente,
							c.direccion as direccion_cliente,
							c.status as status_cliente");
		$this->db->from("im_mensajes as m");
		$this->db->join("im_clientes as c", "c.id = m.idcliente", "inner", FALSE);

		$get = $this->db->get();
		return $get->result();
		
	}
	
	public function get_noleidos(){
		$this->db->select("m.*,
							c.nombre as nombre_cliente,
							c.pais as pais_cliente,
							c.estado as estado_cliente,
							c.telefono as telefono_cliente,
							c.email as email_cliente,
							c.direccion as direccion_cliente,
							c.status as status_cliente");
		$this->db->where("m.status", "0");					
		$this->db->from("im_mensajes as m");
		$this->db->join("im_clientes as c", "c.id = m.idcliente", "inner", FALSE);
		$this->db->order_by("m.fecha", "desc");
		$get = $this->db->get();	
		return $get->result();
	}
	
	
	
	
	
	public function delete(){
		$this->db->where("id", $this->input->post("id"));
		$this->db->delete("im_mensajes");
		return "exito";	
	}
	
	
	
	public function enviar_respuesta(){
		$datos = array("status" => "1",
						"respuesta" => censurar_string($this->input->post("mensaje")));
		$this->db->where("id", $this->input->post("id"));
		$this->db->update("im_mensajes", $datos);
		
		$nombre_para = $this->input->post("nombre_para");
		$email_para = $this->input->post("email_para");
		$asunto = "Respuesta para su mensaje de Contacto";
		$mensaje = $this->input->post("mensaje")."
					<br /><br />
					<span style='color:#666'>
					Este mensaje fue enviado desde 
					<strong>
						<a href='http://www.sistematico.com.ve' target='_blank'>
							IMPanel
						</a>
					</strong>
					</span>";
		
		// HACER EL LLAMADO AL EMAIL
		
		return "exito";	
	}
	
	
	
	
	


}

?>