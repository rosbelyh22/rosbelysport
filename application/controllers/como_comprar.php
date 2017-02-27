<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Como_comprar extends CI_Controller {

	public function __construct() {
        parent::__construct();
        $this->load->model(array("contacto_model", "clientes_model", "email_model", "productos_model", "noticias_model", "obras_model", "slideshow_model"));
	//$this->load->helper(array("contacto_helper", "contenido_helper"));
        $this->load->helper(array("contenido_helper", "contacto_helper", "slideshow_helper", "productos_helper", "menu_helper", "categoria_helper"));

    }  
	 
	 
	public function index()
	{
            $productos_destacados = $this->productos_model->get_productos_destacados();
                $obras = $this->obras_model->get_obras();
		
		if($this->session->userdata("idi") == ""){
			$this->session->set_userdata("idi", "esp");
			$this->session->set_userdata("idi_camp", '_espanol') ;	
		}
		
		$this->session->set_userdata("menu_active", "home");
		
		$data = array("title" => "OMZ Construcciones",
					  "conf" => $this->configuracion_model->get_conf(),
					  "slide" => $this->slideshow_model->get_slide(),
					  "productos_destacados"	=> $productos_destacados,
                                          "obras"   => $obras
					  );
	$this->load->view('como_comprar', $data);
		
	}
	
	
	
	
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */
?>