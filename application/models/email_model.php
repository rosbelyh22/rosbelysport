<?php

class Email_model extends CI_Model {

    public function __construct() {
        //parent::__construct();
        $this->load->database();
		
    }

	public function send($para, $asunto, $mensaje)
	{
		//cargamos la libreria email de ci
		
 		
		$conf = get_conf_helper();
		
		//configuracion para gmail
		//
			//'smtp_host' => $conf["smtp_host"],
			//'smtp_port' => $conf["smtp_port"],
			//'smtp_user' => $conf["smtp_user"],
			//'smtp_pass' => $conf["smtp_pass"],



		//cargamos la configuración para enviar con gmail
		//$this->email->initialize();
 
 		$this->load->library('email');
		
		$this->email->to($para); 
		$this->email->from("contacto@ccsconstrucciones.com", "CCS Construcciones"); 
		$this->email->subject($asunto); 
		$this->email->message($mensaje); 

		if(!$this->email->send()){
			return "error::".$this->email->print_debugger();
                        
		}else{
			return "exito";
		}
		//con esto podemos ver el resultado
		
	}
    
	

}



	
?>