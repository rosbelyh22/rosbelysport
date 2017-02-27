<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Productos extends CI_Controller {

	 
	public function __construct() {
        parent::__construct();
        $this->load->model(array("productos_model"));
		
    } 
	 
	 
	public function index()
	{
		$data = array("title" => "Categorias de Productos",
						"list_categorias" => $this->productos_model->get_categorias());
		$this->plantillas->getPlt('productos/principal', $data);
	}
	
	public function agregar(){
		$data = array("title" => "Agregar Categoria de Producto",
						"list_cat" => $this->productos_model->get_categorias());
		$this->plantillas->getPlt('productos/agregar', $data);	
	}
	
	public function editar($id){
		$data = array("title" => "Editar Categoria de Producto",
						"categoria" => $this->productos_model->get_categorias($id),
						"list_cat" => $this->productos_model->get_categorias(),
						"id" => $id);
		$this->plantillas->getPlt('productos/editar', $data);	
	}
	
	
	
	public function agregar_producto($idc = ''){
		$data = array("title" => "Agregar Producto",
					"list_categorias" => $this->productos_model->get_categorias(),
					"list_coleccion" => $this->productos_model->get_colecciones());
		if($idc != ''){
			$data["categoria"] = $this->productos_model->get_categorias($idc);	
		}
		$this->plantillas->getPlt('productos/agregar_producto', $data);	
	}
	
	
	
	
	
	public function lista_productos($idc){
		$cat = $this->productos_model->get_categorias($idc);
		
		$data = array("title" => "Productos -> <a href='".base_url()."index.php/productos'>".$cat[0]->nombre."</a>",
					"list_productos" => $this->productos_model->lista_productos($idc),
					"categoria" => $cat);
		$this->plantillas->getPlt('productos/lista_productos', $data);	
	}
	
	
	
	
	public function editar_producto($id){
		$not = $this->productos_model->lista_productos('',$id);
		$data = array("title" => "Editar Producto",
						"producto" => $not,
						"list_categorias" => $this->productos_model->get_categorias(),
						"list_coleccion" => $this->productos_model->get_colecciones());
		$this->plantillas->getPlt('productos/editar_producto', $data);	
	}
	
	
	
	
	
	public function insert(){
		$res = $this->productos_model->insert();
		echo $res;	
	}
	public function update(){
		$res = $this->productos_model->update();
		echo $res;	
	}
	public function delete(){
		$res = $this->productos_model->delete();
		echo $res;	
	}
	
	
	
	
	
	public function insert_producto(){
		$res = $this->productos_model->insert_producto();
		echo $res;	
	}
	public function update_producto(){
		$res = $this->productos_model->update_producto();
		echo $res;	
	}
	public function delete_producto(){
		$res = $this->productos_model->delete_producto($this->input->post("id"));
		echo $res;	
	}
	
	public function destacar(){
		$this->productos_model->destacar();	
	}
	
	
	
	public function galeria($id){
		$not = $this->productos_model->lista_productos('', $id);
		$data = array("title" => "Imagenes -> ".$not[0]->nombre,
						"producto" => $not);
		$this->plantillas->getPlt('productos/galeria', $data);	
	}
	
	public function load_galeria($id){
		$gal = $this->productos_model->load_galeria($id);
		if(count($gal) == 0){
			echo "<div style='text-align:center; color:#999'>No se encontraron imagenes para este producto</div>";	
		}else{
			?>
			<div class="row">
			<?
			$i=0;
			foreach($gal as $g){
				?>
				<div class="col-sm-4  <? if($g->principal == 1){?> alert alert-warning <? }else{ ?> well<? }?>" style="text-align:center; margin-right:5px; width:285px;">
                	<img src="<?=base_url()?>files/productos/<?=$g->archivo?>" class="img-responsive" style="width:100%; height:250px;">
                    <br />
                    <?
                    if($g->principal == 0){
					?>
                    <input type="button" name="btn-principal" id="btn-principal" value="Principal" class="btn btn-success btn-sm" onclick="set_principal('<?=$g->id?>', '<?=$g->idproducto?>')">
                    <?
					}
					?>
                    <a href="javascript:;" data-toggle="modal" data-target="#model_del_galeria" onclick="$('#id_eliminar').val('<?=$g->id?>'), $('#file_name').val('<?=$g->archivo?>')">
                    <input type="button" name="btn-eliminar" id="btn-eliminar" value="Eliminar" class="btn btn-danger btn-sm">
                    </a>
                </div>
				<?	
				if($i == 2){
				?>
                    </div>
                    <div class="row">
				<?	
					$i=0;
				}else{
					$i++;	
				}
			}
			?>
			</div>
			<?	
		}
	}
	
	
	
	
	
	public function set_principal($id, $idproducto){
		$get = $this->productos_model->set_principal($id, $idproducto);
		echo $get;	
	}
	
	public function delete_galeria(){
		$get = $this->productos_model->delete_galeria();
		echo $get;	
	}
	
	
	

}

/* End of file inicio.php */
/* Location: ./application/controllers/inicio.php */