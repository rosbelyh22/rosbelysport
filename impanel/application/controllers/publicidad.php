<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Publicidad extends CI_Controller {

	 
	public function __construct() {
        parent::__construct();
        $this->load->model(array("publicidad_model"));
		
    } 
	 
	 
	public function index()
	{
		$data = array("title" => "Gestor de Publicidad",
						"list_publicidad" => $this->publicidad_model->get_publicidad());
		$this->plantillas->getPlt('publicidad/principal', $data);
	}
	
	public function agregar(){
		$data = array("title" => "Agregar Anuncio");
		$this->plantillas->getPlt('publicidad/agregar', $data);	
	}
	
	public function editar($id){
		$data = array("title" => "Editar Anuncio",
						"publicidad" => $this->publicidad_model->get_publicidad($id));
		$this->plantillas->getPlt('publicidad/editar', $data);	
	}
	
	public function estadisticas($id){
		$pub = $this->publicidad_model->get_publicidad($id);
		$data = array("title" => "Estadisticas -> ".$pub[0]->nombre,
						"clic_men"	=> $this->publicidad_model->clic_men($id),
						"impresiones_men" => $this->publicidad_model->impresiones_men($id),
						"impresiones_paises" => $this->publicidad_model->impresiones_paises($id),
						"clic_paises" => $this->publicidad_model->clic_paises($id));
		$this->plantillas->getPlt('publicidad/estadisticas', $data);	
	}
	
	
	public function insert(){
		$res = $this->publicidad_model->insert();
		echo $res;	
	}
	public function update(){
		$res = $this->publicidad_model->update();
		echo $res;	
	}
	public function delete(){
		$res = $this->publicidad_model->delete();
		echo $res;	
	}
	
	public function block(){
		$res = $this->publicidad_model->block();
		echo $res;	
	}
	
	
	

}

/* End of file inicio.php */
/* Location: ./application/controllers/inicio.php */