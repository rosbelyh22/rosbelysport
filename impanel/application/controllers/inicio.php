<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Inicio extends CI_Controller {

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
       	$this->load->model(array("inicio_model"));
    }  
	 
	 // MUESTRA LA PANTALLA DE INICIO DE SESION
	public function index()
	{
		$data = array("title" => "IMPanel");
		$this->load->view('inicio', $data);
		
	}
	
	// EJECUTA LA ACCIÓN PARA EL INICIO DE SESION Y DEVUELVE EL RESULTADO
	
	public function ini_ses()
	{
		$res = $this->inicio_model->ini_ses();		
		echo $res;
	}
	
	public function ses_out(){
		$this->session->sess_destroy();
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */