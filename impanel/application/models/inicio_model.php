<?php

class Inicio_model extends CI_Model {

    public function __construct() {
        //parent::__construct();
        $this->load->database();

    }

	// CONSULTA LOS DATOS DE INICIO DE SESION Y CREA LAS VARIABLES DE SESION DEL SISTEMA
    public function ini_ses(){
		$where = array("usuario" => $this->input->post("usuario"), "clave" => md5($this->input->post("clave")));
		$res = $this->db->from("im_usuarios")->where($where)->get();
		//echo $this->input->post("usuario")." - ".md5($this->input->post("clave"));
		$res = $res->result();
		
		//var_dump($res);
			if(count($res) > 0){
				$datos = array("idusuario"		=> $res[0]->id,
								"nombre" 		=> $res[0]->nombre,
								"cargo" 		=> $res[0]->cargo,
								"email" 		=> $res[0]->email,
								"telefono" 		=> $res[0]->telefono,
								"direccion" 	=> $res[0]->direccion,
								"imagen" 		=> $res[0]->imagen,
								"usuario" 		=> $res[0]->usuario,
								"status" 		=> $res[0]->status);
				
				$res_conf = $this->db->from("im_configuracion")->get();
				$res_conf = $res_conf->result();
				
				$datos_conf = array();
				
				foreach($res_conf as $rc){
					$datos_conf[$rc->nombre] =  $rc->valor;	
				}
				
				$datos["conf"] = $datos_conf;
				
				$this->db->select("m.*");
				$this->db->from("im_modulos as m");
				$this->db->join("im_modulos_privilegios as mp", "mp.idmodulo = m.id and mp.idusuario = '".$res[0]->id."'", "inner", FALSE);
				$this->db->where("m.status", '0');
				$this->db->order_by("m.nombre", "ASC");
				$this->db->group_by("mp.idmodulo");
				$res_mod = $this->db->get();
				$res_mod = $res_mod->result();
				
				//var_dump($res_mod);
				
				$datos_mod = array();
				$i=0;
				foreach($res_mod as $rm){
					$datos_mod[$i] = array("nombre" 	=> $rm->nombre,
											"url" 		=> $rm->url,
											"icono" 	=> $rm->icono,
											"cantidad" 	=> $rm->cantidad,
											"tags"		=> $rm->tags);	
					$i++;
				}
				
				//var_dump($datos_mod);
				
				$datos["mods"] = $datos_mod;
				
				$this->session->set_userdata($datos);
				return "exito";
			}else if(count($res) == 0){
				return 	"no_existe";
			}else if($res[0]->status == '1'){
				return "bloqueado";	
			}
		
	}

}

?>