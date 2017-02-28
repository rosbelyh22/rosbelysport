<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Products extends CI_Controller {

	public function __construct() {
        parent::__construct();
        $this->load->model(array("contenido_model", "productos_model", "obras_model"));
		$this->load->helper(array("productos_helper", "contenido_helper"));
    }  
	 
	 
	public function get($tags_cat)
	{
		$categorias_producto = $this->productos_model->get_categorias();
		$categoria = $this->productos_model->get_categorias($tags_cat);
		$productos = $this->productos_model->get_productos($tags_cat);
                $obras = $this->obras_model->get_obras();
                $productos_destacados = $this->productos_model->get_productos_destacados();
                
		
		$this->session->set_userdata("menu_active", "products");
				
		$data = array("title" => get_lang("productos")." - OMZ Construcciones",
					  "conf" => $this->configuracion_model->get_conf(),
					  "categoria" => $categoria,
					  "categorias_producto" => $categorias_producto,
					  "productos" => $productos,
                                          "tags_cat" => $tags_cat,
                                          "obras" => $obras,
                                          "productos_destacados" => $productos_destacados);
		$this->load->view('productos', $data);
	}
        
        public function get_products($marca = '', $modelo = '', $precioMax = '', $precioMin = ''){
            
        }
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */