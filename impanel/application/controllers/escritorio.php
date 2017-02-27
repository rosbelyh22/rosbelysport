<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Escritorio extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -  
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in 
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see http://codeigniter.com/user_guide/general/urls.html
	 */
	 
	 public function __construct() {
        parent::__construct();
        $this->load->model(array("escritorio_model", "clientes_model", "noticias_model", "comentarios_model", "mensajes_model"));

    } 
	 
	public function index()
	{
		$data = array("title" => "Escritorio",
					"navegadores" 	=> $this->escritorio_model->get_navegadores(),
					"plataformas" 	=> $this->escritorio_model->get_plataformas(),
					"referencias" 	=> $this->escritorio_model->get_referencias(),
					"dispositivos"	=> $this->escritorio_model->get_dispositivos(),
					"vis_men"		=> $this->escritorio_model->get_visitas_mensuales(),
					"cant_visitas"	=> $this->escritorio_model->get_cant_visitas(),
					"paises_vis"	=> $this->escritorio_model->get_paises(),
					"cant_clientes" => count($this->clientes_model->get_cliente()),
					"cant_noticias" => count($this->noticias_model->get_not_cola()),
					"cant_comentarios" => count($this->comentarios_model->get_comentarios()),
					"cant_mensajes" => count($this->mensajes_model->get_noleidos()));
		$this->plantillas->getPlt('escritorio/index', $data);
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */