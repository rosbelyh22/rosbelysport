<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Contenido extends CI_Controller {

	 
	public function __construct() {
        parent::__construct();
        $this->load->model(array("contenido_model"));
		
    } 
	 
	 
	public function index()
	{
		$data = array("title" => "Gestor de Contenidos",
						"list_contenidos" => $this->contenido_model->get_contenidos());
		$this->plantillas->getPlt('contenido/principal', $data);
	}
	
	public function agregar(){
		$data = array("title" => "Agregar Nuevo Contenido");
		$this->plantillas->getPlt('contenido/agregar', $data);	
	}
	
	public function editar($id){
		$data = array("title" => "Editar Contenido",
						"contenido" => $this->contenido_model->get_contenidos($id),
						"id" => $id);
		$this->plantillas->getPlt('contenido/editar', $data);	
	}
	
	
	public function insert(){
		$res = $this->contenido_model->insert();
		echo $res;	
	}
	public function update(){
		$res = $this->contenido_model->update();
		echo $res;	
	}
	public function delete(){
		$res = $this->contenido_model->delete();
		echo $res;	
	}
	
	
	

}

/* End of file inicio.php */
/* Location: ./application/controllers/inicio.php */