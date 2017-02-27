<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Micuenta extends CI_Controller {

	public function __construct() {
        parent::__construct();
        $this->load->model(array("noticias_model", "contenido_model", "slideshow_model", "productos_model", "configuracion_model", "obras_model", "clientes_model"));
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
		$pedidos = $this->clientes_model->get_cliente_pedidos($this->session->userdata("idcliente"));
                $productospedidos = "0";
                if ($pedidos){
                   $productospedidos = $this->clientes_model->get_cliente_productospedido($pedidos[0]->idpedidolinea); 
                }
		$data = array("title" => "OMZ Construcciones",
					  "conf" => $this->configuracion_model->get_conf(),
					  "slide" => $this->slideshow_model->get_slide(),
					  "productos_destacados"	=> $productos_destacados,
                                          "obras"   => $obras,
                                          "clientes" => $this->clientes_model->get_cliente($this->session->userdata("idcliente")),
                                          "pedidos" => $pedidos,
                                          "productospedidos" => $productospedidos ,
                                                
					  );
		$this->load->view('micuenta', $data);
	}
	
	
	public function lang($idi='')
	{
		
		$productos_destacados = $this->productos_model->get_productos_destacados();
                $obras = $this->obras_model->get_obras();
                
		if($idi == 'eng'){
			$this->session->set_userdata("idi", "eng");
			$this->session->set_userdata("idi_camp", '');		
		}else{
			$this->session->set_userdata("idi", 'esp');
			$this->session->set_userdata("idi_camp", "_espanol");		
		}
		$this->session->set_userdata("menu_active", "home");
		
		$data = array("title" => "OMZ Construcciones - ".get_lang("eslogan"),
					  "conf" => $this->configuracion_model->get_conf(),
					  "slide" => $this->slideshow_model->get_slide(),
					  "productos_destacados"	=> $productos_destacados,
                                          "obras"   => $obras
					  );
		redirect(base_url()."home");
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */