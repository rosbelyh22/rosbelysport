<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if ( ! function_exists('element'))
{
	
	function GetContenido($tags, $etiT, $etiP){
		$CI =& get_instance();
		$CI->load->library("session");
		$CI->load->model("contenido_model");
		$contenido = $CI->contenido_model->get_contenido($tags);
		
		$etiTa = "<".$etiT." style='color:#333; border-bottom:1px solid #CCC; padding-bottom:5px;'>";
		$etiTc = "</".$etiT.">";
		
		$etiPa = "<".$etiP.">";
		$etiPc = "</".$etiP.">";
		
		$titulo = "titulo".$CI->session->userdata("idi_camp");
		$contenidov = "contenido".$CI->session->userdata("idi_camp");
		
		if($etiT != ''){
			echo $etiTa.$contenido[0]->$titulo.$etiTc;
		}
		if($etiP != ''){
			echo $etiPa.$contenido[0]->$contenidov.$etiPc;
		}
	}
	
	
	
	
	function GetContenidoSinHTML($tags, $t = '', $c = ''){
		$CI =& get_instance();
		$CI->load->library("session");
		$CI->load->model("contenido_model");
		$contenido = $CI->contenido_model->get_contenido($tags);
		
		if($t != ''){
			echo $contenido[0]->titulo;	
		}
		
		if($c != ''){
			echo $contenido[0]->contenido;	
		}
	}

}

/* End of file array_helper.php */
/* Location: ./system/helpers/array_helper.php */

