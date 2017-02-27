<?php

class Pedidos_model extends CI_Model {

    public function __construct() {
        //parent::__construct();
        $this->load->database();
		$this->load->library('email');

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
	
	public function get_envio ($id =''){
		if ($id != ''){
			$where =$this->db->where("id",$id);	
		}	
		$this->db->from("bss_configuracion_envio");
		$res = $this->db->get();
		$r = $res->result();
		return $r;	
	}
	
	public function get_pedido($id =''){
		if ($id != ''){
			$where =$this->db->where("id",$id);	
		}	
		$this->db->from("bss_pedidos");
		$res = $this->db->get();
		$r = $res->result();
		return $r;	
	}

    public function get_datos_cliente_viejo($id = ''){
		if($id != ''){
			$where = $this->db->where("c.id",$id);	
		}
		$this->db->select("c.*,
							c.status as status_pedido,
							c4.nombre as nombre_empresa,
							c1.*,
							c2.nombre as nombre_metodo,
							c3.nombre as nombre_producto,
							c3.precio as precio_producto,
							c.id as idpedido,
							c.codigo as codigo_pedido");
		$this->db->from("im_clientes as c1");
		$this->db->join("bss_pedidos as c", "c1.id = c.idcliente", "inner", FALSE);
		$this->db->join("bss_metodo_pago as c2", "c.idmetodo = c2.id", "inner", FALSE);
		$this->db->join("im_productos as c3", "c.pedido = c3.id", "inner", FALSE);
		$this->db->join("bss_configuracion_envio as c4", "c.id = c4.id", "inner", FALSE);
		$res = $this->db->get();
		$r = $res->result();
		return $r;
	}
    public function get_datos_cliente($id = ''){
		if($id != ''){
			$where = $this->db->where("c.id",$id);	
		}
		$this->db->select("c.*,
							c.estatus as status_pedido,
							
                                        			c1.*,
							
							c.estatus as estatus_pedido,
							c.id as idpedido,
							c.numeropedido as codigo_pedido");
		$this->db->from("im_clientes as c1");
		$this->db->join("im_pedidos as c", "c1.id = c.idusuario", "inner", FALSE);
		//$this->db->join("bss_metodo_pago as c2", "c.idmetodo = c2.id", "inner", FALSE);
		//$this->db->join("im_productos as c3", "c.pedido = c3.id", "inner", FALSE);
		//$this->db->join("bss_configuracion_envio as c4", "c.id = c4.id", "inner", FALSE);
		$res = $this->db->get();
		$r = $res->result();
		return $r;
	}

        
        public function get_pedido_productos($idpedido){
//		if($id != ''){
//			$where = $this->db->where("c.id",$id);	
//		}
		$this->db->select("pro.*, ped.*, pedliena.*");
		$this->db->from("im_productos as pro");
		$this->db->join("im_pedidolinea as pedliena", "pedliena.idproducto = pro.id", "inner", FALSE);
		$this->db->join("im_pedidos as ped", "ped.id = pedliena.idpedido", "inner", FALSE);
		//$this->db->join("im_productos as c3", "c.pedido = c3.id", "inner", FALSE);
		//$this->db->join("bss_configuracion_envio as c4", "c.id = c4.id", "inner", FALSE);
                $this->db->where("ped.id",$idpedido);
		$res = $this->db->get();
		$r = $res->result();
		return $r;
	}
        
        
	
	public function update(){
		if ($this->input->post("status") == 1) {
			$datos = array("estatus" => $this->input->post("status"),
							"codigo_seguimiento" => $this->input->post("codigo"),
							"fecha_envio" => $this->input->post("fecha_envio"),
							"direccion_envio" => $this->input->post("direccion_envio"),
							"empresa_envio" => $this->input->post("empresa"));
			$this->db->where("id", $this->input->post("id"));
			$this->db->update("im_pedidos",$datos);
			return "exito";
		}
		if ($this->input->post("status") == 2) {
			$datos = array("estatus" => $this->input->post("status"),
							"motivo" => $this->input->post("motivo"),
							"fecha_inhabilitado"=> $this->input->post("fecha_inhabilitado"));
			
			$this->db->where("id", $this->input->post("id"));
			$this->db->update("im_pedidos",$datos);
			return "exito";
		}
		
		else if ($this->input->post("status") == 3) {
			$datos = array("estatus" => $this->input->post("status"),
							"observaciones" => $this->input->post("observaciones"),
							"fecha_entrega"=> $this->input->post("fecha_entrega"));
			
			$this->db->where("id", $this->input->post("id"));
			$this->db->update("im_pedidos",$datos);
			return "exito";
		}
	}

	public function delete(){
	
		$this->db->where("id", $this->input->post("id"));
		$this->db->delete("bss_pedidos");
		return "exito";	
	}
	//------Envio de Mensajes al Cliente-------------//	
	public function enviar_mensaje(){

		$nombre_para = $this->input("nombre_cliente");
		$email_para = $this->input->post("email");
		$empresa =$this->input->post("empresa");
		$codigo =$this->input->post("codigo");
		$pedido= $this->input->post("nombre_producto");
		
		$asunto = "Su Pedido ha sido enviado";
		$mensaje ="
					<br /><br />
					<span style='color:#666'>
					
					Sr.(a) .'$nombre_para'. Su Pedido: .'$nombre_producto'. ha sido enviado satisfactoriamente </br>
					La empresa de envio es: .'$empresa'. y el codigo de seguimiento asociado a su pedido es: .'$codigo'.
					<strong>
						<a href='http://www.sistematico.com.ve' target='_blank'>
							IMPanel
						</a>
					</strong>
					</span>";
		
			$this->email->from('tuequiponline@gmail.com', 'Rosbely Hernandez'); // correo sin espacio
			$this->email->to($email_para); // correo sin espacio
			$this->email->subject($asunto);
			$this->email->message($mensaje);
			if(!$this->email->send()){
				return "error";	
			}else{
				return "exito";	
			}	
	}	

}

?>