<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Shop extends CI_Controller {

    public function __construct() {
        parent::__construct();
        //$this->load->model(array("contacto_model", "clientes_model", "email_model", "productos_model", "noticias_model", "obras_model"));
        $this->load->model(array("categorias_model", "productos_model"));
        $this->load->helper(array("contacto_helper", "contenido_helper", "categoria"));
    }

    public function index() {
        if (isset($_GET['categoria'])) {
            $nombreCategoria = $_GET['categoria'];
            $categoria = $this->categorias_model->get_categoria_por_nombre($_GET['categoria']);

            // BreadCumb
            $row = 0;
            $result = $this->db->from('im_productos_categoria');
            $result->where('nombre', $nombreCategoria);
            $result->or_where('nombre_espanol', $nombreCategoria);
            $results[$row] = $result->get()->row();

            if (isset($results[$row]->idpadre) && isset($results[$row]->nombre)) {
                $categorianombres[$row] = $results[$row]->nombre;

                while ($results[$row]->idpadre > 0) {
                    $this->db->from('im_productos_categoria');
                    $this->db->where('id', $results[$row]->idpadre);

                    $row++;
                    $results[$row] = $this->db->get()->row();
                    $categorianombres[$row] = $results[$row]->nombre;
                }
            }

            $products = $this->productos_model->get_productos_por_categoria($categoria->id, true);
            $productsPagination = $this->productos_model->get_productos_paginacion($this->productos_model->get_productos(), 9);
            $modelos = $this->productos_model->get_modelos($categoria->id, true);
            $marcas = $this->productos_model->get_marcas($categoria->id, true);
            $anios = $this->productos_model->get_anios($categoria->id, true);

            $data = array(
                "products" => $products,
                "marcas" => $marcas,
                "pagination" => $productsPagination,
                "categorias" => (isset($categorianombres)) ? array_reverse($categorianombres) : null,
                "conf" => $this->configuracion_model->get_conf(),
                "title" => "Sporthouse",
                "anios" => $anios,
                "modelos" => $modelos
            );
            $this->load->view('shop', $data);
        } else {
            $this->load->view('home');
        }
    }

    public function pages($pageFrom = 1) {

        ($pageFrom == 1) ? $pageTo = 9 : $pageTo = $pageFrom * 2;
        $this->load->model('productos_model');


        $products = $this->productos_model->get_productos($idc = '', $idcol = '', $tags = '');
        $productsPagination = $this->productos_model->get_productos_paginacion($this->productos_model->get_productos(), 9);
        $marcas = $this->productos_model->get_marcas();

        $data = array("products" => $products,
            "marcas" => $marcas,
            "pagination" => $productsPagination,
            "conf" => $this->configuracion_model->get_conf(),
            "title" => "Sporthouse",);

        $this->load->view('shop', $data);
    }

}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */
?>