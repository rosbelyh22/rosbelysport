<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Mensajes extends CI_Controller {

	 
	public function __construct() {
        parent::__construct();
        $this->load->model(array("mensajes_model"));
		
    } 
	 
	 
	public function index()
	{
		$data = array("title" => "Centro de Mensajes",
						"list_mensajes" => $this->mensajes_model->get_mensajes());
		$this->plantillas->getPlt('mensajes/principal', $data);
	}
	
	public function responder($id){
		$data = array("title" => "Responder Mensaje",
						"mensaje" => $this->mensajes_model->get_mensajes($id));
		$this->plantillas->getPlt('mensajes/responder', $data);	
	}
	
	
	
	public function delete(){
		$res = $this->mensajes_model->delete();
		echo $res;	
	}
	
	
	public function enviar_respuesta(){
		$res = $this->mensajes_model->enviar_respuesta();
		echo $res;	
	}
	
	
	

}

/* End of file inicio.php */
/* Location: ./application/controllers/inicio.php */