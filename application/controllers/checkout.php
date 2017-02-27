<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Checkout extends CI_Controller {

	public function __construct() {
        parent::__construct();
        //$this->load->model(array("contacto_model", "clientes_model", "email_model", "productos_model", "noticias_model", "obras_model"));
	//$this->load->helper(array("contacto_helper", "contenido_helper"));
    }  
	 
	 
	public function index()
	{
	$data='';	
	$this->load->view('checkout', $data);
		
	}
	
	
	
	
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */
?>