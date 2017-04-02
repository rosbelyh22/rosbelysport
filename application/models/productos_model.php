<?php

class Productos_model extends CI_Model {

    public function __construct() {
        //parent::__construct();
    }

    public function get_productos($idc = '', $idcol = '', $tags = '',$limitFrom = 0, $limitTo = 0, $idcate = 0) {
        $this->db->select("p.*,
                            g.archivo as img_producto,
                            c.nombre as nombre_categoria,
                            c.nombre_espanol as nombre_categoria_espanol,
                            c.tags as tags_categoria");
        $this->db->from("im_productos p");
        $this->db->join("im_productos_categoria as c", "p.idcategoria = c.id", "INNER", FALSE);
        $this->db->join("im_productos_galeria g", "g.idproducto = p.id and principal = '1'", "INNER", FALSE);
        if ($limitFrom>0 && $limitTo>0) {
            $this->db->limit($limitTo, $limitFrom);
        }
        $this->db->last_query();
        $where = array("p.status" => "0", "g.principal" => "1");

        if ($idc != '') {
            $where["c.tags"] = $idc;
        }
        if ($idcate != '') {
            $where["p.idcategoria"] = $idcate;
        }
        if ($idcol != '') {
            $where["p.idcoleccion"] = $idcol;
        }

        if ($tags != '') {
            $where["p.tags"] = $tags;
        }

        $this->db->where($where);
        $this->db->order_by("RAND()");
        $get = $this->db->get();
        return $get->result();
    }
    
    public function get_productos_por_categoria($idCategoria = NULL, $childrens = FALSE){
        //Buscamos las categorias hijas
        if($childrens){
            $idPadre = $idCategoria;
            $categoriasHijos[] = $idPadre;
            while(is_numeric($idPadre)){
                $idPadre = $this->db->select('id')->from("im_productos_categoria")->where('idPadre',$idPadre)->get()->row();
                if(isset($idPadre->id)){
                    $categoriasHijos[] = $idPadre = $idPadre->id;
                } else {
                    $idPadre = null;
                }
            }
            $products = $this->db->from("im_productos as p")->
                    where_in('p.idcategoria',$categoriasHijos);
                     $this->db->join("im_productos_galeria g", "g.idproducto = p.id and principal = '1'", "LEFT", FALSE);
                     $get = $this->db->get();
                    return $get->result();
        } else {
            $products = $this->db->from("im_productos AS P")->where('P.idcategoria',$idCategoria);
                        $this->db->join("im_productos_galeria g", "g.idproducto = p.id and principal = '1'", "LEFT", FALSE);
                        $get = $this->db->get();
        return $get->result();
                        
        }           
        return $products->result();
    }
    
    public function get_productos_similares( $idcate) {
        $this->db->select("p.*,
                            g.archivo as img_producto,
                            c.nombre as nombre_categoria,
                            c.nombre_espanol as nombre_categoria_espanol,
                            c.tags as tags_categoria");
        $this->db->from("im_productos p");
        $this->db->join("im_productos_categoria as c", "p.idcategoria = c.id", "INNER", FALSE);
        $this->db->join("im_productos_galeria g", "g.idproducto = p.id and principal = '1'", "INNER", FALSE);
        

        $where = array("p.status" => "0", "g.principal" => "1");

        if ($idcate != '') {
            $where["c.id"] = $idcate;
        }
        

        $this->db->where($where);
        $this->db->order_by("RAND()");
        $get = $this->db->get();
        return $get->result();
    }
    

    public function get_productos_destacados($limit = '') {
        $this->db->select("p.*,
							g.archivo as img_producto,
							c.nombre as nombre_categoria,
							c.nombre_espanol as nombre_categoria_espanol,
                                                        c.tags as tags_categoria");
        $this->db->from("im_productos p");
        $this->db->join("im_productos_categoria as c", "p.idcategoria = c.id", "INNER", FALSE);
        $this->db->join("im_productos_galeria g", "g.idproducto = p.id and g.principal = '1'", "INNER", FALSE);
        $this->db->where("p.status", "0");
        $this->db->where("p.destacado", "1");
        $this->db->order_by("rand()");
        if ($limit != '') {
            $this->db->limit($limit, 0);
        }
        $get = $this->db->get();
        return $get->result();
    }

    public function GetGaleriaProducto($idproducto = '') {
        if ($idproducto != '') {
            $this->db->where("idproducto", $idproducto);
        }
        $this->db->from("im_productos_galeria");
        $get = $this->db->get();
        return $get->result();
    }

    public function get_categorias($tags = '') {
        if ($tags != '') {
            $this->db->where("tags", $tags);
        }

        $this->db->from("im_productos_categoria");
        $get = $this->db->get();
        return $get->result();
    }

    public function get_colecciones($tags = '') {
        if ($tags != '') {
            $this->db->where("tags", $tags);
        }
        $get = $this->db->from("im_productos_colecciones")->getAll();
        return $get->result();
    }
    
    /**
     * get_marcas si le pasa el parametro idcategoria buscara las marcas de esa categoria
     * si se envia el paramtro children true buscara todas las marcas de esa categoria y sus 
     * si no te traera todas las marcas
     * @param type $idCategoria
     * @return type
     */
    public function get_marcas($idCategoria = 0, $childrens = false){
        $marcas = array();
        
        if($idCategoria == 0){
            $products = $this->db->from("im_productos")->get();
        } else {
            //Buscamos las categorias hijas
            if($childrens){
                $idPadre = $idCategoria;
                $categoriasHijos[] = $idPadre;
                while(is_numeric($idPadre)){
                    $idPadre = $this->db->select('id')->from("im_productos_categoria")->where('idPadre',$idPadre)->get()->row();
                    if(isset($idPadre->id)){
                        $categoriasHijos[] = $idPadre = $idPadre->id;
                    } else {
                        $idPadre = null;
                    }
                }
                $products = $this->db->from("im_productos")->
                        where_in('idcategoria',$categoriasHijos)->get();
            } else {
                $products = $this->db->from("im_productos")->where('idcategoria',$idCategoria)->get();
            }
        }
        
        foreach ($products->result() as $product) {
            if(!in_array($product->marca, $marcas)){
                $marcas[] = $product->marca;
            }
        }
        return $marcas;
    }
    
     public function get_anios($idCategoria = 0, $childrens = false){
        $anios = array();
        
         if($idCategoria == 0){
            $products = $this->db->from("im_productos")->get();
        } else {
            //Buscamos las categorias hijas
            if($childrens){
                $idPadre = $idCategoria;
                $categoriasHijos[] = $idPadre;
                while(is_numeric($idPadre)){
                    $idPadre = $this->db->select('id')->from("im_productos_categoria")->where('idPadre',$idPadre)->get()->row();
                    if(isset($idPadre->id)){
                        $categoriasHijos[] = $idPadre = $idPadre->id;
                    } else {
                        $idPadre = null;
                    }
                }
                $products = $this->db->from("im_productos")->
                        where_in('idcategoria',$categoriasHijos)->get();
            } else {
                $products = $this->db->from("im_productos")->where('idcategoria',$idCategoria)->get();
            }
        }
        
        foreach ($products->result() as $product) {
            if(!in_array($product->anio, $anios)){
                $anios[] = $product->anio;
            }
        }
        return $anios;
       
    }
    
    public function get_modelos($idCategoria = 0, $childrens = FALSE){
        $modelos = array();
        
         if($idCategoria == 0){
            $products = $this->db->from("im_productos")->get();
        } else {
            //Buscamos las categorias hijas
            if($childrens){
                $idPadre = $idCategoria;
                $categoriasHijos[] = $idPadre;
                while(is_numeric($idPadre)){
                    $idPadre = $this->db->select('id')->from("im_productos_categoria")->where('idPadre',$idPadre)->get()->row();
                    if(isset($idPadre->id)){
                        $categoriasHijos[] = $idPadre = $idPadre->id;
                    } else {
                        $idPadre = null;
                    }
                }
                $products = $this->db->from("im_productos")->
                        where_in('idcategoria',$categoriasHijos)->get();
            } else {
                $products = $this->db->from("im_productos")->where('idcategoria',$idCategoria)->get();
            }
        }
        
        foreach ($products->result() as $product) {
            if(!in_array($product->modelo, $modelos)){
                $modelos[] = $product->modelo;
            }
        }
        return $modelos;
    }
    
    public function get_productos_paginacion( $products = null , $perPage = 3){
        $this->load->library('pagination');

        $config['base_url'] = 'http://adidas.pro/shop/pages';
        $config['total_rows'] = count($products);
        $config['per_page'] = $perPage;

        $this->pagination->initialize($config);

        return $this->pagination->create_links();
    }
    
    public function get_tree_categorias() {
        $results = $this->db->from('im_productos_categoria')->get()->result();

        $childs = array();
        
        // armar array hijos ($childs) con todos los arrays colocando como
        // key el idpadre
        foreach($results as $item){
            $childs[$item->idpadre][] = $item;
        }

        // recorre nuevamente $results y pregunta por cada uno si existe un key
        // con el mismo valor del id dentro del array childs
        // si existe un hijo***
        // y si existe lo agregar dentro del mismo en el atributo childs

        foreach($results as $item) {
            if (isset($childs[$item->id])){
                $item->childs = $childs[$item->id];
            }
        }

        $tree = $childs[0];

        return $tree;
    }
}
?>