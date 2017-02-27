<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Menu extends CI_Controller {

	 
	public function __construct() {
        parent::__construct();
        $this->load->model(array("menu_model"));
		
    } 
	 
	 
	public function index()
	{
		$data = array("title" => "Gestor de Menus",
						"list_menu" => $this->menu_model->get_menu());
		$this->plantillas->getPlt('menu/principal', $data);
	}
	
	public function agregar(){
		$data = array("title" => "Agregar Nuevo Menu",
					"tipo" => $this->menu_model->get_menu_tipo(),
					"list_padres" => $this->menu_model->get_menu());
		$this->plantillas->getPlt('menu/agregar', $data);	
	}
	
	public function editar($id){
		$con = $this->menu_model->get_menu($id);
		$data = array("title" => "Editar Menu -> ".$con[0]->nombre,
						"menu" => $con,
						"tipo" => $this->menu_model->get_menu_tipo(),
						"list_padres" => $this->menu_model->get_menu());
		$this->plantillas->getPlt('menu/editar', $data);	
	}
	
	
	public function insert(){
		$res = $this->menu_model->insert();
		echo $res;	
	}
	public function update(){
		$res = $this->menu_model->update();
		echo $res;	
	}
	public function delete(){
		$res = $this->menu_model->delete();
		echo $res;	
	}
	
	
	public function block(){
		$res = $this->menu_model->block();
		echo $res;	
	}
	
	
	public function get_relacion(){
		$dtipo = tipo_menu($this->input->post("tipo"));	
		$get = $this->menu_model->get_relacion($dtipo);
		
		if($this->input->post("tipo") == '11'){
			?>
			<input type="text" name="idrelacion" id="idrelacion" value="<?=$this->input->post("sel_url")?>" class="form-control">
			<?
		}else{
		if(count($get) > 0){
		?>
		<select id="idrelacion" name="idrelacion" class="form-control">
        <?
		
		
		if($dtipo["tabla"] == "im_noticias_categoria" || $dtipo["tabla"] == "im_productos_categoria"){
			?>
			<option value="999">Todas</option>
			<?	
		}
        	foreach($get as $g){
				?>
				<option <? if($this->input->post("sel_idrelacion") == $g->id){ echo "selected";}?> value="<?=$g->id?>"><?=$g->nombre?></option>
				<?	
			}
		?>
        </select>
		<?
		}else{
			?>
			<select id="idrelacion" name="idrelacion" class="form-control">
            	<option value="0">Sin Datos</option>
            </select>
			<?	
		}
		}
	}
	
	
	

}

/* End of file inicio.php */
/* Location: ./application/controllers/inicio.php */