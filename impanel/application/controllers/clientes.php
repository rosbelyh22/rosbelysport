<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Clientes extends CI_Controller {

	 
	public function __construct() {
        parent::__construct();
        $this->load->model(array("clientes_model"));
    } 
	 
	 
	public function index()
	{
		$data = array("title" => "Control de Clientes",
						"list_clientes" => $this->clientes_model->get_cliente());
		$this->plantillas->getPlt('clientes/principal', $data);
	}
	
	
	public function agregar(){
		$data = array("title" => "Agregar Clientes");
		$this->plantillas->getPlt('clientes/agregar', $data);
	}
	
	public function editar($id){
		$data = array("title" => "Editar Clientes",
						"cliente" => $this->clientes_model->get_cliente($id));
		$this->plantillas->getPlt('clientes/editar', $data);
	}
	
	
	public function insert(){
		$res = $this->clientes_model->insert();
		echo $res;
	}
	
	public function delete(){
		$res = $this->clientes_model->delete();
		echo $res;
	}
	
	public function update(){
		$res = $this->clientes_model->update();
		echo $res;
	}
	
	
	public function block(){
		$res = $this->clientes_model->block();
		echo $res;
	}
	
}

/* End of file inicio.php */
/* Location: ./application/controllers/inicio.php */