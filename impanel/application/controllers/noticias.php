<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Noticias extends CI_Controller {

	 
	public function __construct() {
        parent::__construct();
        $this->load->model(array("noticias_model"));
		
    } 
	 
	 
	public function index()
	{
		$data = array("title" => "Categorias de Noticia",
						"list_categorias" => $this->noticias_model->get_categorias());
		$this->plantillas->getPlt('noticias/principal', $data);
	}
	
	public function agregar(){
		$data = array("title" => "Agregar Categoria de Noticia",
						"list_cat" => $this->noticias_model->get_categorias());
		$this->plantillas->getPlt('noticias/agregar', $data);	
	}
	
	public function editar($id){
		$data = array("title" => "Editar Categoria de Noticia",
						"categoria" => $this->noticias_model->get_categorias($id),
						"list_cat" => $this->noticias_model->get_categorias(),
						"id" => $id);
		$this->plantillas->getPlt('noticias/editar', $data);	
	}
	
	
	
	public function agregar_noticia($idc = ''){
		$data = array("title" => "Agregar Noticia",
					"list_categorias" => $this->noticias_model->get_categorias());
		if($idc != ''){
			$data["categoria"] = $this->noticias_model->get_categorias($idc);	
		}
		$this->plantillas->getPlt('noticias/agregar_noticia', $data);	
	}
	
	
	
	
	
	public function lista_noticias($idc){
		$cat = $this->noticias_model->get_categorias($idc);
		
		$data = array("title" => "Noticias -> <a href='".base_url()."index.php/noticias'>".$cat[0]->nombre."</a>",
					"list_noticias" => $this->noticias_model->lista_noticias($idc),
					"categoria" => $cat);
		$this->plantillas->getPlt('noticias/lista_noticias', $data);	
	}
	
	
	
	
	public function editar_noticia($id){
		$not = $this->noticias_model->lista_noticias('',$id);
		$data = array("title" => "Editar Noticia",
						"noticia" => $not,
						"list_categorias" => $this->noticias_model->get_categorias());
		$this->plantillas->getPlt('noticias/editar_noticia', $data);	
	}
	
	
	
	
	
	public function insert(){
		$res = $this->noticias_model->insert();
		echo $res;	
	}
	public function update(){
		$res = $this->noticias_model->update();
		echo $res;	
	}
	public function delete(){
		$res = $this->noticias_model->delete();
		echo $res;	
	}
	
	
	
	
	
	public function insert_noticia(){
		$res = $this->noticias_model->insert_noticia();
		echo $res;	
	}
	public function update_noticia(){
		$res = $this->noticias_model->update_noticia();
		echo $res;	
	}
	public function delete_noticia(){
		$res = $this->noticias_model->delete_noticia($this->input->post("id"));
		echo $res;	
	}
	
	public function destacar(){
		$this->noticias_model->destacar();	
	}
	
	
	
	public function galeria($id){
		$not = $this->noticias_model->lista_noticias('', $id);
		$data = array("title" => "Imagenes -> ".$not[0]->titulo,
						"noticia" => $not);
		$this->plantillas->getPlt('noticias/galeria', $data);	
	}
	
	public function load_galeria($id){
		$gal = $this->noticias_model->load_galeria($id);
		if(count($gal) == 0){
			echo "<div style='text-align:center; color:#999'>No se encontraron imagenes para esta noticia</div>";	
		}else{
			?>
			<div class="row">
			<?
			$i=0;
			foreach($gal as $g){
				?>
				<div class="col-sm-4  <? if($g->principal == 1){?> alert alert-warning <? }else{ ?> well<? }?>" style="text-align:center; margin-right:5px; width:285px;">
                	<img src="<?=base_url()?>files/noticias/<?=$g->archivo?>" class="img-responsive" style="width:100%; height:250px;">
                    <br />
                    <?
                    if($g->principal == 0){
					?>
                    <input type="button" name="btn-principal" id="btn-principal" value="Principal" class="btn btn-success btn-sm" onclick="set_principal('<?=$g->id?>', '<?=$g->idnoticia?>')">
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
	
	
	
	
	
	public function set_principal($id, $idnoticia){
		$get = $this->noticias_model->set_principal($id, $idnoticia);
		echo $get;	
	}
	
	public function delete_galeria(){
		$get = $this->noticias_model->delete_galeria();
		echo $get;	
	}
	
	
	

}

/* End of file inicio.php */
/* Location: ./application/controllers/inicio.php */