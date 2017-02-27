<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Colecciones extends CI_Controller {

	 
	public function __construct() {
        parent::__construct();
        $this->load->model(array("colecciones_model"));
		
    } 
	 
	 
	public function index()
	{
		$data = array("title" => "Colecciones",
						"list_colecciones" => $this->colecciones_model->get_colecciones());
		$this->plantillas->getPlt('colecciones/principal', $data);
	}
	
	public function agregar(){
		$data = array("title" => "Agregar Colección",
						"list_col" => $this->colecciones_model->get_colecciones());
		$this->plantillas->getPlt('colecciones/agregar', $data);	
	}
	
	public function editar($id){
		$data = array("title" => "Editar Colecciones",
						"coleccion" => $this->colecciones_model->get_colecciones($id),
						"list_col" => $this->colecciones_model->get_colecciones(),
						"id" => $id);
		$this->plantillas->getPlt('colecciones/editar', $data);	
	}
	
	
	
	
	
	
	
	public function insert(){
		$res = $this->colecciones_model->insert();
		echo $res;	
	}
	public function update(){
		$res = $this->colecciones_model->update();
		echo $res;	
	}
	public function delete(){
		$res = $this->colecciones_model->delete();
		echo $res;	
	}
	
	
	
	
	
	

}

/* End of file inicio.php */
/* Location: ./application/controllers/inicio.php */