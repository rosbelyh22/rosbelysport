<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Slideshow extends CI_Controller {

	 
	public function __construct() {
        parent::__construct();
        $this->load->model(array("slideshow_model"));
		
    } 
	 
	 
	public function index()
	{
		$data = array("title" => "Gestor de SlideShow",
						"list_slide" => $this->slideshow_model->get_slide());
		$this->plantillas->getPlt('slideshow/principal', $data);
	}
	
	public function agregar(){
		$data = array("title" => "Agregar Nuevo SlideShow");
		$this->plantillas->getPlt('slideshow/agregar', $data);	
	}
	
	public function editar($id){
		$data = array("title" => "Editar SlideShow",
						"slide" => $this->slideshow_model->get_slide($id),
						"id" => $id);
		$this->plantillas->getPlt('slideshow/editar', $data);	
	}
	
	
	public function insert(){
		$res = $this->slideshow_model->insert();
		echo $res;	
	}
	public function update(){
		$res = $this->slideshow_model->update();
		echo $res;	
	}
	public function delete(){
		$res = $this->slideshow_model->delete();
		echo $res;	
	}
	
	public function block(){
		$res = $this->slideshow_model->block();
		echo $res;
	}
	
	
	

}

/* End of file inicio.php */
/* Location: ./application/controllers/inicio.php */