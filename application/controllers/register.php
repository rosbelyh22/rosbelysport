<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Register extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model(array("noticias_model", "contenido_model", "slideshow_model", "productos_model", "configuracion_model", "obras_model", "Clientes_model"));
        $this->load->helper(array("contenido_helper", "contacto_helper", "slideshow_helper", "productos_helper", "menu_helper", "categoria_helper"));
    }

    public function index() {
        $productos_destacados = $this->productos_model->get_productos_destacados();
        $obras = $this->obras_model->get_obras();

        if ($this->session->userdata("idi") == "") {
            $this->session->set_userdata("idi", "esp");
            $this->session->set_userdata("idi_camp", '_espanol');
        }

        $this->session->set_userdata("menu_active", "home");

        $data = array("title" => "Sporthouse",
            "conf" => $this->configuracion_model->get_conf(),
            "slide" => $this->slideshow_model->get_slide(),
            "productos_destacados" => $productos_destacados,
            "obras" => $obras
        );
        $this->load->view('register', $data);
    }

    public function agregarCliente() {
        $resp = $this->Clientes_model->insert_client_contact();
        echo $resp;
//        $idsesionviejo = $this->session->userdata("session_id");
//        $ini = $this->inicio_model->ini_ses();		
//        echo $ini;
//        $this->carrito_model->actualizarIdSessionCarrito($idsesionviejo);
    }

}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */
?>