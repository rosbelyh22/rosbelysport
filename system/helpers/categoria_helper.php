<?php
const PASS = 0;

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/**
 * 
 * @param type $categoria array categoria
 */
function getCategoriasTree($categoria) {

    $CI = & get_instance();
    $CI->load->library("session");
    $CI->load->database();
}

function get_base_categories() {
    $CI = & get_instance();
    $CI->load->database();
    $data = array();
    $results = $CI->db
            ->from('im_productos_categoria')
            ->where("idpadre", 0)
            ->get()
            ->result();
    foreach ($results as $result) {
        $data[] = $result;
    }
    return $data;
}

function get_second_level_categories(){
    foreach (get_base_categories() as $idFirsLevel) {
        $base[] = $idFirsLevel->id;
    }
    
    $CI = & get_instance();
    $CI->load->database();
    $data = array();
    $results = $CI->db
            ->from('im_productos_categoria')
            ->where_in("idpadre", $base)
            ->get()
            ->result();
    foreach ($results as $result) {
        $data[] = $result;
    }
    return $data;
    
}

function get_cat_by_id($id) {
    $CI = & get_instance();
    $CI->load->database();
    $results = $CI->db
            ->from('im_productos_categoria')
            ->where("id", $id)
            ->get()
            ->result();
    foreach ($results as $result) {
        $data = $result;
    }
    return $data;
}

function get_cats_by_cat_id($id) {
    $CI = & get_instance();
    $CI->load->database();
    $data = array();
    $results = $CI->db
            ->from('im_productos_categoria')
            ->where("idpadre", $id)
            ->get()
            ->result();

    foreach ($results as $result) {
        $data[] = $result;
    }

    return $data;
}

function list_tree_cat_id($id) {
    $title = false;
    $subs = get_cats_by_cat_id($id);
    if (count($subs) > 0) {
        foreach ($subs as $s) {
       
            
        // foreach para ver si es un una categoria de segundo nivel y ponerle el hr o lo q sea
        foreach (get_second_level_categories() as $categorySecondLevel){
            if($s->id == $categorySecondLevel->id){
                $title = true;
                echo "</div></div>";
                echo '<div class="col1"><div class="h_nav">';
           }
        }
        echo "<ul>";    
            if($title){                                   
                echo '<h4><a style="color:black" href="'.base_url().'shop?categoria='.$s->nombre.'" title="'.$s->descripcion.'" >'.$s->nombre.'</a></h4>';
            } else {
                echo '<li><a style="color:black" href="'.base_url().'shop?categoria='.$s->nombre.'" title="'.$s->descripcion.'" >'.$s->nombre.'</a></li>';
            }
            list_tree_cat_id($s->id);
        echo "</ul>";
            
        }

    } else {
        
    }
}

//<div class="col1">
//    <div class="h_nav">
//        <h4>style zone</h4>
//        <ul>
//            <li><a href="shop.html">men</a></li>
//            <li><a href="shop.html">women</a></li>
//            <li><a href="shop.html">accessories</a></li>
//            <li><a href="shop.html">kids</a></li>
//            <li><a href="shop.html">brands</a></li>
//        </ul>	
//    </div>							
//</div>
