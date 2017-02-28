<?php

class Carrito_model extends CI_Model {

    public function __construct() {
        //parent::__construct();
        $this->load->database();
        $this->load->model(array("productos_model"));
    }


    public function AgregarProducto($tags){
        
        if($this->session->userdata("idcliente")){
            $cliente = $this->session->userdata("idcliente");   
        }else {
            $cliente = $this->session->userdata("session_id");   
        }
        
        $pro = $this->productos_model->get_productos('','', $tags);
        
        $where = array("idsession"  => $cliente,
                        "idproducto" => $pro[0]->id);
        $sql_con = $this->db->from("im_carrito")->where($where)->get();
        $res_con = $sql_con->result();
        
        
        if(count($res_con) == 0){
            $datos = array("idsession"  => $cliente,
                            "idproducto"=> $pro[0]->id,
                            "cantidad"  => "1");
            $insert = $this->db->insert("im_carrito", $datos);
        }else{
            $new_cant = $res_con[0]->cantidad+1;
            $where = array("idsession"  => $cliente,
                           "idproducto"=> $pro[0]->id);
            $datos = array("cantidad" => $new_cant);
            $this->db->where($where);
            $insert = $this->db->update("im_carrito", $datos);
        }
        if($insert){
            return "exito";
        }else{
            return "error";
        }
    }
    
    
    public function ObtenerCarrito(){
        if($this->session->userdata("idcliente")){
            $cliente = $this->session->userdata("idcliente");   
        }else {
            $cliente = $this->session->userdata("session_id");   
        }
       
        $where = array("c.idsession" => $cliente);
        $this->db->select("p.nombre,"
                . "p.nombre_espanol,"
                . "p.id as idproducto,"
                . "p.precio,"
                . "p.precio_dolares,"
                . "p.codigo,"
                . "c.cantidad,"
                . "c.idcarrito,"
                . "g.archivo as img_producto");
        $this->db->from("im_carrito as c");
        $this->db->join("im_productos as p", "p.id = c.idproducto", "inner");
        $this->db->join("im_productos_galeria as g", "g.idproducto = p.id and g.principal = '1'", "left");
        $this->db->where($where);
        $get = $this->db->get();
        return $get->result();
    }
    
    
    public function ActualizarCantidad(){
        
        $datos = array("cantidad" => $this->input->post("cantidad"));
        
        $where = array("idcarrito" => $this->input->post("idcarrito"));
        $update = $this->db->update("im_carrito", $datos);
        if($update){
            return "exito";
        }else{
            return "error";
        }
    }
    
    
    public function EliminarCarrito(){
        $this->db->where("idcarrito", $this->input->post("idcarrito"));
        $delete = $this->db->delete("im_carrito");
        if($delete){
            return "exito";
        }else{
            return "error";
        }
    }
	
    
    public function LimpiarCarrito(){
        
        if($this->session->userdata("idcliente")){
            $cliente = $this->session->userdata("idcliente");   
        }else {
            $cliente = $this->session->userdata("session_id");   
        }
        
        $where = array("idsession" => $cliente);
        $this->db->where($where);
        $delete = $this->db->delete("im_carrito");
        if($delete){
            return "exito";
        }else{
            return "error";
        }
    }
    public function actualizarIdSessionCarrito($idsesionviejo){
        $where = array("idsession" =>  $idsesionviejo);
       
        $datos = array("idsession" => $this->session->userdata("idcliente"));
        $this->db->where($where);
       
        $update = $this->db->update("im_carrito", $datos);
        if($update){
            return "exito";
        }else{
            return "error";
        }
    }
    
	

}

?>