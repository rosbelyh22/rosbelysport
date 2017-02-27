<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Publicidad extends CI_Controller {

	public function __construct() {
        parent::__construct();
        $this->load->model(array("publicidad_model"));		
    }  
	 
	 
	public function get_anuncio($id)
	{
		$url = $this->publicidad_model->get_anuncio($id);
		redirect($url, "refresh");
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */