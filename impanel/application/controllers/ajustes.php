<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Ajustes extends CI_Controller {

	 
	public function __construct() {
        parent::__construct();
        $this->load->model(array("ajustes_model"));
        } 
	 
	 
	public function index()
	{
		$data = array("title" => "Configuración del Sistema",
						"config" => $this->ajustes_model->get_config());
		$this->plantillas->getPlt('ajustes/principal', $data);
	}
	
	
	
	public function actualizar(){
		$this->ajustes_model->actualizar();
		redirect("ajustes");
	}
	
	
	
}

/* End of file inicio.php */
/* Location: ./application/controllers/inicio.php */