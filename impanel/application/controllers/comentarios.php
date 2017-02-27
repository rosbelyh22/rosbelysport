<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Comentarios extends CI_Controller {

	 
	public function __construct() {
        parent::__construct();
        $this->load->model(array("comentarios_model"));
		
    } 
	 
	 
	public function index()
	{
		$data = array("title" => "Gestor de Comentarios",
						"list_comentarios" => $this->comentarios_model->get_comentarios());
		$this->plantillas->getPlt('comentarios/principal', $data);
	}
	
	public function agregar(){
		$data = array("title" => "Agregar Nuevo Comentario");
		$this->plantillas->getPlt('comentarios/agregar', $data);	
	}
	
	
	public function insert(){
		$res = $this->comentarios_model->insert();
		echo $res;	
	}
	public function delete(){
		$res = $this->comentarios_model->delete();
		echo $res;	
	}
	
	
	

}

/* End of file inicio.php */
/* Location: ./application/controllers/inicio.php */