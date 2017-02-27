<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Usuarios extends CI_Controller {

	 
	public function __construct() {
        parent::__construct();
        $this->load->model(array("usuarios_model"));
    } 
	 
	 
	public function index()
	{
		$data = array("title" => "Control de Usuarios",
						"list_user" => $this->usuarios_model->get_usuarios());
		$this->plantillas->getPlt('usuarios/principal', $data);
	}
	
	
	public function agregar(){
		$data = array("title" => "Agregar Usuarios",
						"modulos" => $this->usuarios_model->get_modulos());
		$this->plantillas->getPlt('usuarios/agregar', $data);
	}
	
	public function editar($id){
		$data = array("title" => "Editar Usuarios",
						"user" => $this->usuarios_model->get_usuarios($id),
						"iduser" => $id,
						"modulos" => $this->usuarios_model->get_modulos());
		$priv = $this->usuarios_model->get_privilegios_modulos($id);
		$privilegios = array();
		$i=0;
		foreach($priv as $p){
			$privilegios[$i] = $p->idmodulo;
			$i++;	
		}
		
		$data["privilegios"] = $privilegios;
		$this->plantillas->getPlt('usuarios/editar', $data);
	}
	
	
	public function insert(){
		$res = $this->usuarios_model->insert();
		echo $res;
	}
	
	public function delete(){
		$res = $this->usuarios_model->delete();
		echo $res;
	}
	
	public function update(){
		$res = $this->usuarios_model->update();
		echo $res;
	}
	
	
	public function block(){
		$res = $this->usuarios_model->block();
		echo $res;
	}
	
}

/* End of file inicio.php */
/* Location: ./application/controllers/inicio.php */