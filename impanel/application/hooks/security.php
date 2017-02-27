<?php
if (!defined( 'BASEPATH')) exit('No direct script access allowed'); 
class Security
{
	private $ci;
	public function __construct()
	{
		$this->ci =& get_instance();
        $this->ci->load->database();
		!$this->ci->load->library('session') ? $this->ci->load->library('session') : false;
		!$this->ci->load->helper('url') ? $this->ci->load->helper('url') : false;
	}	
 
	public function validarSesion()
	{
            
		$controll = $this->ci->router->class;
		if($CI->session->userdata('idusuario') == '' && $controll != 'inicio')
		{
		   redirect(base_url()."index.php/inicio");
		}
	}
		
	
	
}
?>