<?php

class Obras_model extends CI_Model {

    public function __construct() {
        //parent::__construct();
        $this->load->database();

    }

    public function get_categorias($id=''){
		if($id != ''){
			$this->db->where("c.id", $id);	
		}
		$this->db->select("c.*,
							c1.nombre as nombre_padre");
		$this->db->from("im_obras_categoria as c");
		$this->db->join("im_obras_categoria as c1", "c1.id = c.idpadre", "left", FALSE);
		$get = $this->db->get();
		return $get->result();
		
	}
	
	
	
	public function get_colecciones($id=''){
		if($id != ''){
			$this->db->where("c.id", $id);	
		}
		$this->db->select("c.*");
		$this->db->from("im_obras_colecciones as c");
		$get = $this->db->get();
		return $get->result();
		
	}
	
	
	public function insert(){
		$con = $this->db->from("im_obras_categoria")->get();
		$con = $con->result();
		
		$datos = array("nombre" => $this->input->post("nombre"),
						"nombre_espanol" => $this->input->post("nombre_espanol"),
						"idpadre" => $this->input->post("idpadre"),
						"descripcion" => $this->input->post("descripcion"),
						"descripcion_espanol" => $this->input->post("descripcion_espanol"),
						"tags" => url_friend($this->input->post("nombre"), $con),
						"imagen" => $this->input->post("file_name"));
						
		$this->db->insert("im_obras_categoria", $datos);
		return "exito";
	}
	
	public function update(){
		$con = $this->db->from("im_obras_categoria")->where("id", $this->input->post("id"))->get();
		$con = $con->result();
		
		$datos = array("nombre" => $this->input->post("nombre"),
						"nombre_espanol" => $this->input->post("nombre_espanol"),
						"idpadre" => $this->input->post("idpadre"),
						"descripcion" => $this->input->post("descripcion"),
						"descripcion_espanol" => $this->input->post("descripcion_espanol"),
						"imagen" => $this->input->post("file_name"));
						
		if($con[0]->nombre == $this->input->post("nombre")){
			$datos["tags"] = $con[0]->tags;
		}else{
			$con = $this->db->from("im_obras_categoria")->get();
			$con = $con->result();
			$datos["tags"] = url_friend($this->input->post("nombre"), $con);	
		}
				
		$this->db->where("id", $this->input->post("id"));
		$this->db->update("im_obras_categoria",$datos);
		
		return "exito";
		
	}
	
	
	public function delete(){
		if($this->input->post("cambio") != '0'){
			$datos = array("idcategoria" => $this->input->post("cambio"));
			$this->db->where("idcategoria", $this->input->post("id"));
			$this->db->update("im_obras", $datos);
		}else{
			$this->db->where("idcategoria", $this->input->post("id"));
			$get = $this->db->from("im_obras")->get();	
			$res = $get->result();
			foreach($res as $r){
				self::delete_obra($r->id);	
			}
		}
		
		$datos = array("idpadre" => "0");
		$this->db->where("idpadre", $this->input->post("id"));
		$this->db->update("im_obras_categoria", $datos);
		
		
		$this->db->where("id", $this->input->post("id"));
		$this->db->delete("im_obras_categoria");
		return "exito";	
	}
	
	
	
	
	public function insert_obra(){
		$fecha = $this->input->post("fecha")." ".$this->input->post("hora").":".$this->input->post("minuto").":00";
		
		
		$con = $this->db->from("im_obras")->get()->result();		
		
		$datos = array("idcategoria" => $this->input->post("idcategoria"),
						"idcoleccion" => $this->input->post("idcoleccion"),
						"codigo" => $this->input->post("codigo"),
						"nombre" => $this->input->post("nombre"),
						"nombre_espanol" => $this->input->post("nombre_espanol"),
						"tags" => url_friend($this->input->post("nombre"), $con),
						"descripcion" => $this->input->post("descripcion"),
						"descripcion_espanol" => $this->input->post("descripcion_espanol"),
						"descripcion_breve" => $this->input->post("descripcion_breve"),
						"descripcion_breve_espanol" => $this->input->post("descripcion_breve_espanol"),
						"cantidad" => $this->input->post("cantidad"),
						"precio" => $this->input->post("precio"),
						"stock_min" => $this->input->post("stock_min"),
						"stock_max" => $this->input->post("stock_max"),
						"modelo" => $this->input->post("modelo"),
						"marca" => $this->input->post("marca"),
						"anio" => $this->input->post("anio"),
						"idusuario" => $this->session->userdata("idusuario"));
						
		$this->db->insert("im_obras", $datos);	
		return "exito";
	}
	
	
	
	public function lista_obras($idc = '', $id = ''){
		$this->db->select("n.*,
							u.nombre as nombre_usuario");
		$this->db->from("im_obras as n");
		$this->db->join("im_usuarios as u", "u.id = n.idusuario", "left", FALSE);
		if($idc != ''){
			$this->db->where("n.idcategoria", $idc);	
		}
		if($id != ''){
			$this->db->where("n.id", $id);	
		}
		$get = $this->db->get();
		return $get->result();
		
	}
	
	public function delete_obra($id){
		// AGREGAR CODIGO PARA ELIMINAR IMAGENES DE UNA obra
		
		$this->db->where("id", $id);
		$this->db->delete("im_obras");
		return "exito";
	}
	
	
	public function update_obra(){
		$con = $this->db->from("im_obras")->where("id", $this->input->post("id"))->get();
		$con = $con->result();
		
		
		$datos = array("idcategoria" => $this->input->post("idcategoria"),
						"idcoleccion" => $this->input->post("idcoleccion"),
						"codigo" => $this->input->post("codigo"),
						"nombre" => $this->input->post("nombre"),
						"nombre_espanol" => $this->input->post("nombre_espanol"),
						"descripcion" => $this->input->post("descripcion"),
						"descripcion_espanol" => $this->input->post("descripcion_espanol"),
						"descripcion_breve" => $this->input->post("descripcion_breve"),
						"descripcion_breve_espanol" => $this->input->post("descripcion_breve_espanol"),
						"cantidad" => $this->input->post("cantidad"),
						"precio" => $this->input->post("precio"),
						"stock_min" => $this->input->post("stock_min"),
						"stock_max" => $this->input->post("stock_max"),
						"modelo" => $this->input->post("modelo"),
						"marca" => $this->input->post("marca"),
						"anio" => $this->input->post("anio"));
		
						
		if($con[0]->nombre == $this->input->post("nombre")){
			$datos["tags"] = $con[0]->tags;
		}else{
			$con = $this->db->from("im_obras")->get();
			$con = $con->result();
			$datos["tags"] = url_friend($this->input->post("nombre"), $con);	
		}
		
		
				
		$this->db->where("id", $this->input->post("id"));
		$this->db->update("im_obras",$datos);
		
		return "exito"; 	
	}
	
	
	public function insert_galeria($im){
		$con = $this->db->from("im_obras_galeria")->where("idobra", $this->input->post("id"))->get();
		$con = $con->result();
		
		if(count($con) == 0){
			$principal = '1';	
		}else{
			$principal = '0';	
		}
		
		$datos = array("idobra" => $this->input->post("id"),
						"tipo" => "0",
						"archivo" => $im,
						"principal" => $principal);
		$this->db->insert("im_obras_galeria", $datos);
		return "exito";	
	}
	
	public function load_galeria($id){
		$get = $this->db->from("im_obras_galeria")->where("idobra", $id)->get();	
		return $get->result();
	}
	
	
	public function set_principal($id, $idobra){
		$datos = array("principal" => "0");
		$this->db->where("idobra", $idobra);
		$this->db->update("im_obras_galeria", $datos);
		
		$datos = array("principal" => "1");
		$this->db->where("id", $id);
		$this->db->update("im_obras_galeria", $datos);
		return "exito";
	}
	
	public function delete_galeria(){
		unlink("./files/obras/".$this->input->post("nombre"));
		$this->db->where("id", $this->input->post("id"));
		$this->db->delete("im_obras_galeria");
		return "exito";	
	}
	
	

	public function destacar(){
		if($this->input->post("destacar") == 'destacar'){
			$d = "1";	
		}else{
			$d = "0";
		}
		$datos = array("destacado" => $d);
		$this->db->where("id", $this->input->post("id"));
		$this->db->update("im_obras", $datos);	
	}

}

?>