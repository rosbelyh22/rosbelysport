<?php

class Pedido_model extends CI_Model {

    public function __construct() {
        //parent::__construct();
        $this->load->database();
        $this->load->model(array("productos_model"));
    }


    public function agregarPedido($carrito){
        $carrito = json_decode($carrito);       
        //---Inserto en la tabla pedidos datos vacios----//
        $datos = array("numeropedido"  => 0,
                       "total"  => 0,
                       "iva"  => 0,
                       "grantotal"  => 0,
                       "estatus"  => 0,
                    );
        $insert = $this->db->insert("im_pedidos", $datos);
        $idpedido= $this->db->insert_id(); 
        $numeropedido = str_pad($idpedido, '5', '0', STR_PAD_RIGHT);
        if($insert){
            //---Inserto en la tabla la linea de pedidos----//
            $total =0; 
            foreach($carrito as $ca) {
                $total += ($ca->precio*$ca->cantidad);
                $totalproducto = $ca->precio*$ca->cantidad; 
                $datos = array("idproducto"  => $ca->idproducto,
                                "preciounitario"=> $ca->precio,
                                "cantidad"  => $ca->cantidad,
                                "idpedido"  => $idpedido,
                                "totalproducto" => $totalproducto);
                $insert_lineapedido = $this->db->insert("im_pedidolinea", $datos); 
           }
           
            if($insert_lineapedido){
                $datos = array("numeropedido"  => $numeropedido,
                       "total"  => $total,
                       
                    );
                $this->db->where("id", $idpedido);
                $updatepedido = $this->db->update("im_pedidos", $datos); 
                
            }
             
            return "exito";
        }else{
            return "error";
        }
        

    }  
	
}

?>