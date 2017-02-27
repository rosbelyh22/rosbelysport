<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Rss extends CI_Controller {

	public function __construct() {
        parent::__construct();
        $this->load->model(array("rss_model", "configuracion_model"));
		$this->load->helper('xml');
    }  
	 
	 
	public function index()
	{
		//var_dump($this->rss_model->get_rss());
		$conf = $this->configuracion_model->get_conf();
		$data['encoding'] = 'utf-8';
        $data['nombre_feed'] = $conf["nombre_rss"];
        $data['url_feed'] = base_url().'rss';
        $data['descripcion'] = $conf["descripcion_rss"];
        $data['lenguaje'] = 'es-VE';
        $data['autor'] = $conf["email_empresa"];
        $data['articulos'] = $this->rss_model->get_rss();
        header("Content-Type: application/rss+xml; charset=utf-8");
        $this->load->view('rss', $data);
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */