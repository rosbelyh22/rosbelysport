<?php

class Configuracion_model extends CI_Model {

    public function __construct() {
        //parent::__construct();
        $this->load->database();
		$menu_final = array();
		$c = 0; 

    }

	// CONSULTA LOS DATOS DE INICIO DE SESION Y CREA LAS VARIABLES DE SESION DEL SISTEMA
    
	public function get_conf(){
			$res_conf = $this->db->from("im_configuracion")->get();
			$res_conf = $res_conf->result();
			
			$datos_conf = array();
			
			foreach($res_conf as $rc){
				$datos_conf[$rc->nombre] =  $rc->valor;	
			}
			
			return $datos_conf;	
	}
	
	
	
	public function get_menu($idpadre = 0){
		$menu_final = array();
		$this->db->select("m.id,
							m.nombre,
							m.nombre_espanol,
							m.idrelacion,
							tm.pagina,
							tm.tabla,
							m.url");
		$this->db->from("im_menus as m");
		$this->db->join("im_menu_tipo as tm","tm.id = m.tipo", "left", FALSE);
		$this->db->where("m.idpadre", $idpadre);
		$this->db->where("m.status", "0");
		$this->db->order_by("m.posicion", "ASC");
		$menu = $this->db->get();
		$menu = $menu->result();
		
		if(count($menu) > 0){
			$c = 0;
			foreach($menu as $m){
				if(($m->idrelacion == '999' and $m->tabla == 'im_noticias_categoria') || ($m->idrelacion == '999' and $m->tabla == 'im_productos_categoria')){
					$menu_final[$c]["tags"]	  = "all-categories";	
				}else{
					if($m->tabla != ''){
						$rel = $this->db->from($m->tabla)->where("id", $m->idrelacion)->get();
						$rel = $rel->result();
						if(count($rel) > 0){
							$menu_final[$c]["tags"]	  = $rel[0]->tags;
						}
					}else{
						$menu_final[$c]["tags"]	  = "";	
					}
				}
				
				$menu_final[$c]["nombre"] = $m->nombre;
				$menu_final[$c]["nombre_espanol"] = $m->nombre_espanol;
				$menu_final[$c]["pagina"] = $m->pagina;
				$menu_final[$c]["url"] 	  = $m->url;
				$menu_final[$c]["hijos"]  = $this->get_menu($m->id);
				$c++;
			}	
		}
		
		return $menu_final;
	}

}

?>