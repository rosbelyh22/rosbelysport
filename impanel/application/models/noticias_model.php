<?php

class Noticias_model extends CI_Model {

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
		$this->db->from("im_noticias_categoria as c");
		$this->db->join("im_noticias_categoria as c1", "c1.id = c.idpadre", "left", FALSE);
		$get = $this->db->get();
		return $get->result();
		
	}
	
	public function insert(){
		$con = $this->db->from("im_noticias_categoria")->get();
		$con = $con->result();
		
		$datos = array("nombre" => $this->input->post("nombre"),
						"idpadre" => $this->input->post("idpadre"),
						"descripcion" => $this->input->post("descripcion"),
						"tags" => url_friend($this->input->post("nombre"), $con),
						"imagen" => $this->input->post("file_name"));
						
		$this->db->insert("im_noticias_categoria", $datos);
		return "exito";
	}
	
	public function update(){
		$con = $this->db->from("im_noticias_categoria")->where("id", $this->input->post("id"))->get();
		$con = $con->result();
		
		$datos = array("nombre" => $this->input->post("nombre"),
						"idpadre" => $this->input->post("idpadre"),
						"descripcion" => $this->input->post("descripcion"),
						"imagen" => $this->input->post("file_name"));
						
		if($con[0]->nombre == $this->input->post("nombre")){
			$datos["tags"] = $con[0]->tags;
		}else{
			$con = $this->db->from("im_noticias_categoria")->get();
			$con = $con->result();
			$datos["tags"] = url_friend($this->input->post("nombre"), $con);	
		}
				
		$this->db->where("id", $this->input->post("id"));
		$this->db->update("im_noticias_categoria",$datos);
		
		return "exito";
		
	}
	
	
	public function delete(){
		if($this->input->post("cambio") != '0'){
			$datos = array("idcategoria" => $this->input->post("cambio"));
			$this->db->where("idcategoria", $this->input->post("id"));
			$this->db->update("im_noticias", $datos);
		}else{
			$this->db->where("idcategoria", $this->input->post("id"));
			$get = $this->db->from("im_noticias")->get();	
			$res = $get->result();
			foreach($res as $r){
				self::delete_noticia($r->id);	
			}
		}
		
		$datos = array("idpadre" => "0");
		$this->db->where("idpadre", $this->input->post("id"));
		$this->db->update("im_noticias_categoria", $datos);
		
		
		$this->db->where("id", $this->input->post("id"));
		$this->db->delete("im_noticias_categoria");
		return "exito";	
	}
	
	
	
	
	public function insert_noticia(){
		$fecha = $this->input->post("fecha")." ".$this->input->post("hora").":".$this->input->post("minuto").":00";
		
		
		$con = $this->db->from("im_noticias")->get()->result();		
		
		$datos = array("idcategoria" => $this->input->post("idcategoria"),
						"titulo" => $this->input->post("titulo"),
						"titulo_espanol" => $this->input->post("titulo_espanol"),
						"tags" => url_friend($this->input->post("titulo"), $con),
						"contenido" => $this->input->post("contenido"),
						"contenido_espanol" => $this->input->post("contenido_espanol"),
						"fecha_publicacion" => $fecha,
						"idusuario" => $this->session->userdata("idusuario"));
						
		$this->db->insert("im_noticias", $datos);	
		return "exito";
	}
	
	
	
	public function lista_noticias($idc = '', $id = ''){
		$this->db->select("n.*,
							u.nombre as nombre_usuario");
		$this->db->from("im_noticias as n");
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
	
	public function delete_noticia($id){
		// AGREGAR CODIGO PARA ELIMINAR IMAGENES DE UNA NOTICIA
		
		$this->db->where("id", $id);
		$this->db->delete("im_noticias");
		return "exito";
	}
	
	
	public function update_noticia(){
		$con = $this->db->from("im_noticias")->where("id", $this->input->post("id"))->get();
		$con = $con->result();
		
		$datos = array("titulo" => $this->input->post("titulo"),
						"contenido" => $this->input->post("contenido"),
						"titulo_espanol" => $this->input->post("titulo_espanol"),
						"contenido_espanol" => $this->input->post("contenido_espanol"));
						
		if($con[0]->titulo == $this->input->post("titulo")){
			$datos["tags"] = $con[0]->tags;
		}else{
			$con = $this->db->from("im_noticias")->get();
			$con = $con->result();
			$datos["tags"] = url_friend($this->input->post("titulo"), $con);	
		}
		
		//if($con[0]->fecha_publicacion > date("Y-m-d H:i:s")){
			$fecha = $this->input->post("fecha")." ".$this->input->post("hora").":".$this->input->post("minuto").":00";
			$datos["fecha_publicacion"] = $fecha;
		//}
				
		$this->db->where("id", $this->input->post("id"));
		$this->db->update("im_noticias",$datos);
		
		return "exito"; 	
	}
	
	
	public function insert_galeria($im){
		$con = $this->db->from("im_noticias_galeria")->where("idnoticia", $this->input->post("id"))->get();
		$con = $con->result();
		
		if(count($con) == 0){
			$principal = '1';	
		}else{
			$principal = '0';	
		}
		
		$datos = array("idnoticia" => $this->input->post("id"),
						"tipo" => "0",
						"archivo" => $im,
						"principal" => $principal);
		$this->db->insert("im_noticias_galeria", $datos);
		return "exito";	
	}
	
	public function load_galeria($id){
		$get = $this->db->from("im_noticias_galeria")->where("idnoticia", $id)->get();	
		return $get->result();
	}
	
	
	public function set_principal($id, $idnoticia){
		$datos = array("principal" => "0");
		$this->db->where("idnoticia", $idnoticia);
		$this->db->update("im_noticias_galeria", $datos);
		
		$datos = array("principal" => "1");
		$this->db->where("id", $id);
		$this->db->update("im_noticias_galeria", $datos);
		return "exito";
	}
	
	public function delete_galeria(){
		unlink("./files/noticias/".$this->input->post("nombre"));
		$this->db->where("id", $this->input->post("id"));
		$this->db->delete("im_noticias_galeria");
		return "exito";	
	}
	
	
	public function get_not_cola(){
		$this->db->where("fecha_publicacion >", date("Y-m-d H:i:s"));
		$get = $this->db->from("im_noticias")->get();
		return $get->result();
	}

	public function destacar(){
		if($this->input->post("destacar") == 'destacar'){
			$d = "1";	
		}else{
			$d = "0";
		}
		$datos = array("destacado" => $d);
		$this->db->where("id", $this->input->post("id"));
		$this->db->update("im_noticias", $datos);	
	}

}

?>