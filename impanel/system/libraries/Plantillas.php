<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Plantillas {

    private static $plt = array(
        "header" => "tpl/header",
        "menu" => "tpl/menu",
        "footer" => "tpl/footer");

    ////////////////////////////////////////////////////
    //Consulta todas las plantillas a mostrar y adapta la solicitada
    ////////////////////////////////////////////////////

    function getPlt($con, $data) {
        $CI = & get_instance();
        $CI->load->view(self::$plt['header'], $data);
		
		$CI->load->model("mensajes_model");
		
		$msj = $CI->mensajes_model->get_noleidos();
		$data["msj_noleidos"] = count($msj);
		$data["not_msj"] = $msj;
		
		$CI->load->view(self::$plt['menu'], $data);			
        $CI->load->view($con, $data);
        $CI->load->view(self::$plt["footer"]);
    }

}
