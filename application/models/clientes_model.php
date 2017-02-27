<?php

class Clientes_model extends CI_Model {

    public function __construct() {
        //parent::__construct();
        $this->load->database();

    }

	public function insert_client_contact(){
		$con = $this->db->from("im_clientes")->where("email", $this->input->post("email"))->get();
		$con = $con->result();
		$codigo= $this->input->post("codigo");
		$numero= $this->input->post("numero");
		if(count($con) > 0){
			return "existe";	
		}else{
			$con_cli = $this->db->from("im_clientes")->get();
			$con_cli = $con_cli->result();
			$datos = array("nombre" => $this->input->post("nombre"),
                                        "tags" => url_friend($this->input->post("nombre"), $con_cli),
                                        "telefono" => $codigo.$numero,
                                        "email" => $this->input->post("email"),
                                        "estado" => $this->input->post("estado"),
                                        "pais" => $this->input->post("pais"),
                                        "direccion" => $this->input->post("direccion"),
                                        "clave" => md5($this->input->post("clave"))
                            );
			$insertar= $this->db->insert("im_clientes", $datos);
			//return $this->db->insert_id();	
                        if($insertar){return "exito";} else { return "error";}	
		}
	}
        
        public function get_cliente_pedidos($id = ''){
		if($id != ''){
			$where = $this->db->where("pe.idusuario",$id);	
		}
		$this->db->select("cli.*, pe.*, pe.id as idpedido, lipe.id as idpedidolinea");
		$this->db->from("im_clientes as cli");
		$this->db->join("im_pedidos as pe", "pe.idusuario = cli.id", "left");
                $this->db->join("im_pedidolinea as lipe", "lipe.idpedido = pe.id", "left");
		$res = $this->db->get();
		$r = $res->result();
		return $r;
	}
        
        public function get_cliente_productospedido($idpedido){
		$where = $this->db->where("lipe.id",$idpedido);	
		$this->db->select("pro.*, lipe.*");
		$this->db->from("im_productos as pro");
		$this->db->join("im_pedidolinea as lipe", "lipe.idproducto = pro.id", "left");
		$res = $this->db->get();
		$r = $res->result();
		return $r;
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
	
	
    
	

}
?>