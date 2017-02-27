<?php
class Ajustes_model extends CI_Model {

    public function __construct() {
        //parent::__construct();
        $this->load->database();

    }

    public function get_config(){
		$config = array();
		$get = $this->db->from("im_configuracion")->get();
		foreach($get->result() as $g){
			$config[$g->nombre] = $g->valor;	
		}
		return $config;
	}
	
    public function actualizar(){
        // EMAIL DE LA EMPRESA
        $this->db->where("nombre", "email_empresa");
        $datos = array("valor" => $this->input->post("emailemp"));
        $this->db->update("im_configuracion", $datos);
        
        // TELEFONO EMPRESA
        $this->db->where("nombre", "telefono_empresa");
        $datos = array("valor" => $this->input->post("telefonoemp"));
        $this->db->update("im_configuracion", $datos);
        
        // DIRECCIÓN EMPRESA
        $this->db->where("nombre", "direccion_empresa");
        $datos = array("valor" => $this->input->post("direccionemp"));
        $this->db->update("im_configuracion", $datos);
        
        
        
        // METAS CLAVES
        $this->db->where("nombre", "meta_clave");
        $datos = array("valor" => $this->input->post("meta_clave"));
        $this->db->update("im_configuracion", $datos);
        
        
        // CopyRight
        $this->db->where("nombre", "copyright");
        $datos = array("valor" => $this->input->post("copyright"));
        $this->db->update("im_configuracion", $datos);

        
       
        
        
        // URL FACEBOOK
        $this->db->where("nombre", "url_facebook");
        $datos = array("valor" => $this->input->post("urlfacebook"));
        $this->db->update("im_configuracion", $datos);
        
        
        // URL TWITTER
        $this->db->where("nombre", "url_twitter");
        $datos = array("valor" => $this->input->post("urltwitter"));
        $this->db->update("im_configuracion", $datos);
        
        
        // URL INSTAGRAM
        $this->db->where("nombre", "url_instagram");
        $datos = array("valor" => $this->input->post("urlinstagram"));
        $this->db->update("im_configuracion", $datos);
        
        
        // USER SKYPE
        $this->db->where("nombre", "user_skype");
        $datos = array("valor" => $this->input->post("userskype"));
        $this->db->update("im_configuracion", $datos);
        
        
        // URL PINTERES
        $this->db->where("nombre", "url_pinteres");
        $datos = array("valor" => $this->input->post("urlpinteres"));
        $this->db->update("im_configuracion", $datos);
        
        
        // URL GOOGLEPLS
        $this->db->where("nombre", "url_googleplus");
        $datos = array("valor" => $this->input->post("urlgoogleplus"));
        $this->db->update("im_configuracion", $datos);
        
        // URL LINKEDIN
        $this->db->where("nombre", "url_linkedin");
        $datos = array("valor" => $this->input->post("urllinkedin"));
        $this->db->update("im_configuracion", $datos);
        
        
        
        /*
        // API Twitter
        $this->db->where("nombre", "api_twitter");
        $datos = array("valor" => $this->input->post("apitwitter"));
        $this->db->update("im_configuracion", $datos);
        
         // API ANALYTICS
        $this->db->where("nombre", "api_analytics");
        $datos = array("valor" => $this->input->post("apianalytics"));
        $this->db->update("im_configuracion", $datos);
        
        
        // API OTROS
        $this->db->where("nombre", "api_otros");
        $datos = array("valor" => $this->input->post("apiotros"));
        $this->db->update("im_configuracion", $datos);
        
        // API GOOGLEMAP
        $this->db->where("nombre", "api_googlemap");
        $datos = array("valor" => $this->input->post("apigooglemap"));
        $this->db->update("im_configuracion", $datos);
        */
        
        return "exito";
}
	
}
?>