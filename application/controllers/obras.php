<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Obras extends CI_Controller {

	public function __construct() {
        parent::__construct();
        $this->load->model(array("contenido_model", "obras_model", "productos_model"));
		$this->load->helper(array("productos_helper", "contenido_helper"));
    }  
	 
	 
	public function get()
	{
		$categorias_producto = $this->obras_model->get_categorias();
		$obras = $this->obras_model->get_obras();
                $productos_destacados = $this->productos_model->get_productos_destacados();
                
		
		$this->session->set_userdata("menu_active", "obras");
				
		$data = array("title" => get_lang("obras")." - OMZ Construcciones",
					  "conf" => $this->configuracion_model->get_conf(),
					  "categorias_producto" => $categorias_producto,
					  "obras" => $obras,
					  "productos_destacados" => $productos_destacados,
                        );
		$this->load->view('obras', $data);
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */