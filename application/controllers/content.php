<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Content extends CI_Controller {

	public function __construct() {
        parent::__construct();
        $this->load->model(array("contenido_model", "noticias_model", "productos_model", "obras_model"));
		$this->load->helper("contenido_helper");
    }  
	 
	 
	public function get($tags)
	{
		$contenido = $this->contenido_model->get_contenido($tags);
		$productos_destacados = $this->productos_model->get_productos_destacados(4);
		$obras = $this->obras_model->get_obras();
		
		$this->session->set_userdata("menu_active", $tags);
		
		
		if(count($contenido) > 0){
			$titulo = "titulo".$this->session->userdata("idi_camp");
			$tit = $contenido[0]->$titulo;
		}else{
			$tit = $tags;	
		}
		
		$data = array("title" 		=> $tit." - OMZ Construcciones",
					  "conf" 		=> $this->configuracion_model->get_conf(),
					  "tags" 		=> $tags,
					  "conten"		=> $contenido,
					  "obras"		=> $obras,
					  "productos_destacados"	=> $productos_destacados);
		$this->load->view('contenido', $data);
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */