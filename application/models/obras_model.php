<?php

class Obras_model extends CI_Model {

    public function __construct() {
        //parent::__construct();

    }

	public function get_obras($idc = '', $idcol ='', $tags = ''){
		$this->db->select("p.*,
							g.archivo as img_obra,
							c.nombre as nombre_categoria,
							c.nombre_espanol as nombre_categoria_espanol,
							c.tags as tags_categoria");
		$this->db->from("im_obras p");
		$this->db->join("im_obras_categoria as c", "p.idcategoria = c.id", "INNER", FALSE);
		$this->db->join("im_obras_galeria g", "g.idobra = p.id and principal = '1'", "INNER", FALSE);
		$where = array("p.status" => "0",
						"g.principal" => "1");
		
		if($idc != ''){
			$where["p.idcategoria"] = $idc;
		}
		if($idcol != ''){
			$where["p.idcoleccion"] = $idcol;
		}
		
		if($tags != ''){
			$where["p.tags"] = $tags;
		}
		
		$this->db->where($where);
		$this->db->order_by("RAND()");
		$get = $this->db->get();
		return $get->result();
		
	}
	
	
	public function get_obras_destacados($limit = ''){
		$this->db->select("p.*,
							g.archivo as img_obra,
							c.nombre as nombre_categoria");
		$this->db->from("im_obras p");
		$this->db->join("im_obras_categoria as c", "p.idcategoria = c.id", "INNER", FALSE);
		$this->db->join("im_obras_galeria g", "g.idobra = p.id and g.principal = '1'", "INNER", FALSE);
		$this->db->where("p.status", "0");
		$this->db->where("p.destacado", "1");
		$this->db->order_by("rand()");
		if($limit != ''){
			$this->db->limit($limit, 0);	
		}
		$get = $this->db->get();
		return $get->result();
		
	}
	
	
	public function GetGaleriaObra($idproducto = ''){
		if($idproducto != ''){
			$this->db->where("idobra", $idproducto);	
		}	
		$this->db->from("im_obras_galeria");
		$get = $this->db->get();
		return $get->result();
	}
	
	
	
	public function get_categorias($tags = ''){
		
		
		
		if($tags != ''){
			$this->db->where("tags", $tags);	
		}
			
		$this->db->from("im_obras_categoria");
		$get = $this->db->get();
		return $get->result();
	}
	
	
	public function get_colecciones($tags = ''){
		if($tags != ''){
			$this->db->where("tags", $tags)	;
		}
		$get = $this->db->from("im_obras_colecciones")->get();
		return $get->result();
	}
	
	

}

?>