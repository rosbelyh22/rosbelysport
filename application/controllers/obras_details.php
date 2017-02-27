<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Obras_details extends CI_Controller {

	public function __construct() {
        parent::__construct();
        $this->load->model(array("noticias_model", "contenido_model", "slideshow_model", "obras_model", "configuracion_model", "productos_model"));
		$this->load->helper(array("contenido_helper", "contacto_helper", "slideshow_helper", "productos_helper", "menu_helper", "slideshow_helper"));
    }  
	 
	 
	public function get($tags)
	{
            
                $obras = $this->obras_model->get_obras();
                $productos_destacados = $this->productos_model->get_productos_destacados();
		$this->session->set_userdata("menu_active", "obras");
		$pro = $this->obras_model->get_obras('','',$tags);
		$data = array("title" => $pro[0]->nombre." - OMZ Construcciones",
					  "conf" => $this->configuracion_model->get_conf(),
					  "pro" => $pro,
					  "similar_product" => $this->obras_model->get_obras($pro[0]->idcategoria),
					  "galeria"			=> $this->obras_model->GetGaleriaObra($pro[0]->id),
                                          "obras" => $obras,
                                          "productos_destacados" => $productos_destacados
					  );
		$this->load->view('obras_detalles', $data);
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */