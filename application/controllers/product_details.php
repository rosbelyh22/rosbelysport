<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Product_details extends CI_Controller {

	public function __construct() {
        parent::__construct();
        $this->load->model(array("noticias_model", "contenido_model", "obras_model", "slideshow_model", "productos_model", "configuracion_model"));
		$this->load->helper(array("contenido_helper", "contacto_helper", "slideshow_helper", "productos_helper", "menu_helper", "slideshow_helper", "categoria_helper"));
    }  
	 
	 
	public function get($tags)
	{
		$this->session->set_userdata("menu_active", "products");
                $obras = $this->obras_model->get_obras();
                $productos_destacados = $this->productos_model->get_productos_destacados();
		$pro = $this->productos_model->get_productos('','',$tags);
                
		$data = array("title" => $pro[0]->nombre." - OMZ Construcciones",
					  "conf" => $this->configuracion_model->get_conf(),
					  "pro" => $pro,
					  "similar_product" => $this->productos_model->get_productos($pro[0]->idcategoria),
					  "productos_similares" => $this->productos_model->get_productos_similares($pro[0]->idcategoria),
					  "galeria"			=> $this->productos_model->GetGaleriaProducto($pro[0]->id),
                                          "obras" => $obras,
                                          "productos_destacados" => $productos_destacados
					  );
		$this->load->view('product_details', $data);
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */