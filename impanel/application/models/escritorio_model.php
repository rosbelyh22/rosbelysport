<?php

class Escritorio_model extends CI_Model {

    public function __construct() {
        //parent::__construct();
        $this->load->database();

    }

	// CONSULTA LA CANTIDAD DE VISTA DESDE LOS DISTINTOS TIPOS DE NAVEGADORES
    public function get_navegadores()
	{
		$sql = $this->db->query("SELECT COUNT(navegador) as cantidad,
								navegador as nombre
							FROM im_sessions_web
							GROUP BY navegador
							ORDER BY cantidad DESC");
		return $sql->result();	
	}
	
	
	public function get_plataformas()
	{
		$sql = $this->db->query("SELECT COUNT(plataforma) as cantidad,
								plataforma as nombre
							FROM im_sessions_web
							GROUP BY plataforma
							ORDER BY cantidad DESC");
		return $sql->result();	
	}
	
	
	public function get_referencias()
	{
		$sql = $this->db->query("SELECT COUNT(referencia) as cantidad,
								referencia as nombre
							FROM im_sessions_web
							GROUP BY referencia
							ORDER BY cantidad DESC");
		return $sql->result();	
	}
	
	public function get_dispositivos()
	{
		$sql = $this->db->query("SELECT COUNT(mobile) as cantidad,
								mobile as nombre
							FROM im_sessions_web
							GROUP BY mobile
							ORDER BY cantidad DESC");
		return $sql->result();	
	}
	
	public function get_visitas_mensuales(){
		$sql = $this->db->query(" SELECT COUNT( session_id ) AS cantidad, 
										 CONCAT( anio, '-', mes ) AS fecha
								FROM im_sessions_web
								GROUP BY anio, mes
								ORDER BY fecha DESC
								LIMIT 0 , 5 ");	
		return $sql->result();
	}
	
	public function get_cant_visitas($mes = '', $anio = ''){
		$where = '';
		if($mes != ''){
			$where .= "AND mes = '".$mes."'";	
		}
		
		if($anio != ''){
			$where .= "AND anio = '".$anio."'";	
		}
		
		$sql = $this->db->query("SELECT COUNT( session_id ) AS cantidad
								FROM im_sessions_web
								WHERE 1
								".$where);	
		$res = $sql->result();	
		return $res[0]->cantidad;
	}
	
	
	public function get_paises()
	{
		$sql = $this->db->query("SELECT COUNT(pais) as cantidad,
								pais as nombre
							FROM im_sessions_web
							GROUP BY pais
							ORDER BY cantidad DESC");
		return $sql->result();	
	}

	

}

?>