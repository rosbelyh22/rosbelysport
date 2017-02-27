<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Obras extends CI_Controller {

	 
	public function __construct() {
        parent::__construct();
        $this->load->model(array("obras_model"));
		
    } 
	 
	 
	public function index()
	{
		$data = array("title" => "Categorias de Obras",
						"list_categorias" => $this->obras_model->get_categorias());
		$this->plantillas->getPlt('obras/principal', $data);
	}
	
	public function agregar(){
		$data = array("title" => "Agregar Categoria de Obra",
						"list_cat" => $this->obras_model->get_categorias());
		$this->plantillas->getPlt('obras/agregar', $data);	
	}
	
	public function editar($id){
		$data = array("title" => "Editar Categoria de Obra",
						"categoria" => $this->obras_model->get_categorias($id),
						"list_cat" => $this->obras_model->get_categorias(),
						"id" => $id);
		$this->plantillas->getPlt('obras/editar', $data);	
	}
	
	
	
	public function agregar_obra($idc = ''){
		$data = array("title" => "Agregar Obra",
					"list_categorias" => $this->obras_model->get_categorias(),
					"list_coleccion" => $this->obras_model->get_colecciones());
		if($idc != ''){
			$data["categoria"] = $this->obras_model->get_categorias($idc);	
		}
		$this->plantillas->getPlt('obras/agregar_obra', $data);	
	}
	
	
	
	
	
	public function lista_obras($idc){
		$cat = $this->obras_model->get_categorias($idc);
		
		$data = array("title" => "Obras -> <a href='".base_url()."index.php/obras'>".$cat[0]->nombre."</a>",
					"list_obras" => $this->obras_model->lista_obras($idc),
					"categoria" => $cat);
		$this->plantillas->getPlt('obras/lista_obras', $data);	
	}
	
	
	
	
	public function editar_obra($id){
		$not = $this->obras_model->lista_obras('',$id);
		$data = array("title" => "Editar Obra",
						"obra" => $not,
						"list_categorias" => $this->obras_model->get_categorias(),
						"list_coleccion" => $this->obras_model->get_colecciones());
		$this->plantillas->getPlt('obras/editar_obra', $data);	
	}
	
	
	
	
	
	public function insert(){
		$res = $this->obras_model->insert();
		echo $res;	
	}
	public function update(){
		$res = $this->obras_model->update();
		echo $res;	
	}
	public function delete(){
		$res = $this->obras_model->delete();
		echo $res;	
	}
	
	
	
	
	
	public function insert_obra(){
		$res = $this->obras_model->insert_obra();
		echo $res;	
	}
	public function update_obra(){
		$res = $this->obras_model->update_obra();
		echo $res;	
	}
	public function delete_obra(){
		$res = $this->obras_model->delete_obra($this->input->post("id"));
		echo $res;	
	}
	
	public function destacar(){
		$this->obras_model->destacar();	
	}
	
	
	
	public function galeria($id){
		$not = $this->obras_model->lista_obras('', $id);
		$data = array("title" => "Imagenes -> ".$not[0]->nombre,
						"obra" => $not);
		$this->plantillas->getPlt('obras/galeria', $data);	
	}
	
	public function load_galeria($id){
		$gal = $this->obras_model->load_galeria($id);
		if(count($gal) == 0){
			echo "<div style='text-align:center; color:#999'>No se encontraron imagenes para este obra</div>";	
		}else{
			?>
			<div class="row">
			<?php
			$i=0;
			foreach($gal as $g){
				?>
				<div class="col-sm-4  <?php if($g->principal == 1){?> alert alert-warning <?php }else{ ?> well<?php }?>" style="text-align:center; margin-right:5px; width:285px;">
                	<img src="<?=base_url()?>files/obras/<?=$g->archivo?>" class="img-responsive" style="width:100%; height:250px;">
                    <br />
                    <?php
                    if($g->principal == 0){
					?>
                    <input type="button" name="btn-principal" id="btn-principal" value="Principal" class="btn btn-success btn-sm" onclick="set_principal('<?=$g->id?>', '<?=$g->idobra?>')">
                    <?php
					}
					?>
                    <a href="javascript:;" data-toggle="modal" data-target="#model_del_galeria" onclick="$('#id_eliminar').val('<?=$g->id?>'), $('#file_name').val('<?=$g->archivo?>')">
                    <input type="button" name="btn-eliminar" id="btn-eliminar" value="Eliminar" class="btn btn-danger btn-sm">
                    </a>
                </div>
				<?php	
				if($i == 2){
				?>
                    </div>
                    <div class="row">
				<?php	
					$i=0;
				}else{
					$i++;	
				}
			}
			?>
			</div>
			<?php	
		}
	}
	
	
	
	
	
	public function set_principal($id, $idobra){
		$get = $this->obras_model->set_principal($id, $idobra);
		echo $get;	
	}
	
	public function delete_galeria(){
		$get = $this->obras_model->delete_galeria();
		echo $get;	
	}
	
	
	

}

/* End of file inicio.php */
/* Location: ./application/controllers/inicio.php */