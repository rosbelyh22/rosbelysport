<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Contactanos extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model(array("categorias_model","noticias_model", "contenido_model", "slideshow_model", "productos_model", "configuracion_model", "obras_model", "Clientes_model", "email_model"));
        $this->load->helper(array("contenido_helper", "contacto_helper", "slideshow_helper", "productos_helper", "menu_helper","categoria"));
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
        $this->load->view('contactanos', $data);
    }

    public function mensajeContacto() {
        $conf = $this->configuracion_model->get_conf();
        $mensaje = "
                <strong>Nombre: </strong>".$this->input->post("nombre")."<br />
                <strong>Rif o CI: </strong>".$this->input->post("rif-cedula")."<br />
                <strong>Teléfono: </strong>".$this->input->post("codigo").$this->input->post("telefono")."<br />
                <strong>Email: </strong>".$this->input->post("email")."<br />
                <strong>Mensaje: </strong><br />".$this->input->post("mensaje")."<br />
                ";
            $asunto = "Mensaje de Contacto";    
            $cuerpo = template_email($this->input->post("asunto"), $mensaje);

            
            $para = array($conf["email_empresa"]);
            $send = $this->email_model->send($para, $asunto, $cuerpo);
            
            echo $send;
//            $data = array("title" => get_lang("contacto")." - Sporthouse",
//                          "menu" => $this->configuracion_model->get_menu(),
//                          "resultado" => $send,
//                          "obras" => $obras,
//                          "productos_destacados" => $productos_destacados,
//                          "conf" => $conf);
//            $this->load->view('contactanos', $data);
    }

}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */
?>