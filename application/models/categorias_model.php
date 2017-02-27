<?php

class Categorias_model extends CI_Model {

    public function __construct() {
        //parent::__construct();
    }
    
    public function get_categorias() {
        $this->db->from("im_productos_categoria");
        $get = $this->db->get();
        return $get->result();
    }
   
    public function get_categoria_por_nombre($nombre) {
        if ($nombre != null) {
            $this->db->from("im_productos_categoria");
            $this->db->where('nombre', $nombre);
            $this->db->or_where('nombre_espanol', $nombre);
            return $this->db->get()->row();
        } 
        return null;
    }

    
}
?>