<?php

class Productos_model extends CI_Model {

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
		$this->db->from("im_productos_categoria as c");
		$this->db->join("im_productos_categoria as c1", "c1.id = c.idpadre", "left", FALSE);
		$get = $this->db->get();
		return $get->result();
		
	}
	
	
	
	public function get_colecciones($id=''){
		if($id != ''){
			$this->db->where("c.id", $id);	
		}
		$this->db->select("c.*");
		$this->db->from("im_productos_colecciones as c");
		$get = $this->db->get();
		return $get->result();
		
	}
	
	
	public function insert(){
		$con = $this->db->from("im_productos_categoria")->get();
		$con = $con->result();
		
		$datos = array("nombre" => $this->input->post("nombre"),
						"nombre_espanol" => $this->input->post("nombre_espanol"),
						"idpadre" => $this->input->post("idpadre"),
						"descripcion" => $this->input->post("descripcion"),
						"descripcion_espanol" => $this->input->post("descripcion_espanol"),
						"tags" => url_friend($this->input->post("nombre"), $con),
						"imagen" => $this->input->post("file_name"));
						
		$this->db->insert("im_productos_categoria", $datos);
		return "exito";
	}
	
	public function update(){
		$con = $this->db->from("im_productos_categoria")->where("id", $this->input->post("id"))->get();
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
			$con = $this->db->from("im_productos_categoria")->get();
			$con = $con->result();
			$datos["tags"] = url_friend($this->input->post("nombre"), $con);	
		}
				
		$this->db->where("id", $this->input->post("id"));
		$this->db->update("im_productos_categoria",$datos);
		
		return "exito";
		
	}
	
	
	public function delete(){
		if($this->input->post("cambio") != '0'){
			$datos = array("idcategoria" => $this->input->post("cambio"));
			$this->db->where("idcategoria", $this->input->post("id"));
			$this->db->update("im_productos", $datos);
		}else{
			$this->db->where("idcategoria", $this->input->post("id"));
			$get = $this->db->from("im_productos")->get();	
			$res = $get->result();
			foreach($res as $r){
				self::delete_producto($r->id);	
			}
		}
		
		$datos = array("idpadre" => "0");
		$this->db->where("idpadre", $this->input->post("id"));
		$this->db->update("im_productos_categoria", $datos);
		
		
		$this->db->where("id", $this->input->post("id"));
		$this->db->delete("im_productos_categoria");
		return "exito";	
	}
	
	
	
	
	public function insert_producto(){
		$fecha = $this->input->post("fecha")." ".$this->input->post("hora").":".$this->input->post("minuto").":00";
		
		
		$con = $this->db->from("im_productos")->get()->result();		
		
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
						"talla" => $this->input->post("talla"),
						"precio_dolares" => $this->input->post("precio_dolares"),
						"idusuario" => $this->session->userdata("idusuario"));
						
		$this->db->insert("im_productos", $datos);	
		return "exito";
	}
	
	
	
	public function lista_productos($idc = '', $id = ''){
		$this->db->select("n.*,
							u.nombre as nombre_usuario");
		$this->db->from("im_productos as n");
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
	
	public function delete_producto($id){
		// AGREGAR CODIGO PARA ELIMINAR IMAGENES DE UNA producto
		
		$this->db->where("id", $id);
		$this->db->delete("im_productos");
		return "exito";
	}
	
	
	public function update_producto(){
		$con = $this->db->from("im_productos")->where("id", $this->input->post("id"))->get();
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
						"talla" => $this->input->post("talla"),
						"pecio_dolares" => $this->input->post("pecio_dolares"),
						"anio" => $this->input->post("anio"));
		
						
		if($con[0]->nombre == $this->input->post("nombre")){
			$datos["tags"] = $con[0]->tags;
		}else{
			$con = $this->db->from("im_productos")->get();
			$con = $con->result();
			$datos["tags"] = url_friend($this->input->post("nombre"), $con);	
		}
		
		
				
		$this->db->where("id", $this->input->post("id"));
		$this->db->update("im_productos",$datos);
		
		return "exito"; 	
	}
	
	
	public function insert_galeria($im){
		$con = $this->db->from("im_productos_galeria")->where("idproducto", $this->input->post("id"))->get();
		$con = $con->result();
		
		if(count($con) == 0){
			$principal = '1';	
		}else{
			$principal = '0';	
		}
		
		$datos = array("idproducto" => $this->input->post("id"),
						"tipo" => "0",
						"archivo" => $im,
						"principal" => $principal);
		$this->db->insert("im_productos_galeria", $datos);
		return "exito";	
	}
	
	public function load_galeria($id){
		$get = $this->db->from("im_productos_galeria")->where("idproducto", $id)->get();	
		return $get->result();
	}
	
	
	public function set_principal($id, $idproducto){
		$datos = array("principal" => "0");
		$this->db->where("idproducto", $idproducto);
		$this->db->update("im_productos_galeria", $datos);
		
		$datos = array("principal" => "1");
		$this->db->where("id", $id);
		$this->db->update("im_productos_galeria", $datos);
		return "exito";
	}
	
	public function delete_galeria(){
		unlink("./files/productos/".$this->input->post("nombre"));
		$this->db->where("id", $this->input->post("id"));
		$this->db->delete("im_productos_galeria");
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
		$this->db->update("im_productos", $datos);	
	}

}

?>