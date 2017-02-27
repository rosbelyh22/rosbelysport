<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Login extends CI_Controller {

	public function __construct() {
        parent::__construct();
        $this->load->model(array("contacto_model", "clientes_model", "email_model", "productos_model", "noticias_model", "inicio_model", "carrito_model"));
	$this->load->helper(array("contacto_helper", "contenido_helper", "categoria_helper"));
    }  
	 
	 
	public function index()
	{
            $productos_destacados = $this->productos_model->get_productos_destacados();
	$data = array("title" => "OMZ Construcciones",
					  "conf" => $this->configuracion_model->get_conf(),
					  //"slide" => $this->slideshow_model->get_slide(),
					  "productos_destacados"=> $productos_destacados,
                                          //"obras"   => $obras
					  );	
	$this->load->view('login', $data);
		
	}
        
        // EJECUTA LA ACCIÓN PARA EL INICIO DE SESION Y DEVUELVE EL RESULTADO
	
	public function ini_ses()
	{
                $idsesionviejo = $this->session->userdata("session_id");
		$res = $this->inicio_model->ini_ses();		
		echo $res;
                $this->carrito_model->actualizarIdSessionCarrito($idsesionviejo);
	}
	
	public function ses_out(){
		$this->session->sess_destroy();
                redirect(base_url()."home");
	}
	
	
	
	
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */
?>