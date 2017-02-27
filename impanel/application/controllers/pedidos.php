<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Pedidos extends CI_Controller {

	 
	public function __construct() {
        parent::__construct();
        $this->load->model(array("pedidos_model"));
		
    } 
	 
	 
	public function index()
	{
		$data = array("title" => "Pedidos",
						"list_pedidos" => $this->pedidos_model->get_datos_cliente(),
						"status"=> $this->pedidos_model->get_pedido());
		$this->plantillas->getPlt('pedidos/principal', $data);
	}
	
	//---------------Pedidos-------------------------//
	
	public function editar($id){
		$data = array("title" => "Editar Pedido",
						"pedido" => $this->pedidos_model->get_datos_cliente($id),
						"list_pedidos" => $this->pedidos_model->get_datos_cliente($id),
						"list_envio"=>$this->pedidos_model->get_envio(),
						"nombreempresa"=>$this->pedidos_model->get_envio($id));
		$this->plantillas->getPlt('pedidos/editar', $data);	
	}
	
	
	public function lista_pedidos($idp){
		$cat = $this->pedidos_model->get_datos_cliente($idp);
		
		$data = array("title" => "Pedidos -> <a href='".base_url()."index.php/pedidos'>".$cat[0]->nombre."</a>",
						"list_pedidos" => $this->pedidos_model->get_datos_cliente($idp),
						"pedidos" => $ped);
		$this->plantillas->getPlt('pedidos/lista_pedidos', $data);	
	}
	
	public function ficha($id){
		$data = array("title" => "Ficha del Pedido",
						"list_clientes" => $this->pedidos_model->get_cliente($id),
						"list_pedidos" => $this->pedidos_model->get_datos_cliente($id),
						"list_pedidos_productos" => $this->pedidos_model->get_pedido_productos($id),
                    );
		$this->plantillas->getPlt('pedidos/ficha', $data);
	}
	
	public function seguimiento ($id){
		$data= array ( "title" => "Seguimiento del Pedido",
						"list_pedidos" => $this->pedidos_model->get_datos_cliente($id));
		$this->plantillas->getPlt('pedidos/seguimiento', $data);		
	}
	
	public function update(){
		$res = $this->pedidos_model->update();
		echo $res;	
	}
	public function delete(){
		$res = $this->pedidos_model->delete();
		echo $res;	
	}
	
	//------Envio de Mensajes al Cliente-------------// 
	public function enviar_mensaje(){
		$res = $this->pedidos_model->enviar_mensaje();
		echo $res;	
	}
	
	
	
	

}

/* End of file inicio.php */
/* Location: ./application/controllers/inicio.php */