<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Load_image extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -  
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in 
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see http://codeigniter.com/user_guide/general/urls.html
	 */
	 
	 public function __construct() {
        parent::__construct();
        //$this->load->model(array("escritorio_model"));

    } 
	 
	function do_upload() {
 
		$mostrar = $this->input->post("mostrar");
		$folder = $this->input->post("folder");

		$config['upload_path'] = './files/'.$folder.'/';
		$config['allowed_types'] = 'gif|jpg|png';
        $config['max_size'] = '2000';
        $config['max_width'] = '5000';
        $config['max_height'] = '5000';
		$config['encrypt_name'] = TRUE;


        $this->load->library('upload', $config);
        if (!$this->upload->do_upload()) {
            ?>
			<script>
				window.parent.msj_error('<strong>Opps!</strong> Hicimos algo mal y no se logro cargar la imagen, el error es el siguiente: <strong><?=$this->upload->display_errors()?></strong>', 7000);
			</script>
			<?
        } else {
            $file_info = $this->upload->data();
			$this->_create_thumbnail($folder, $file_info["file_name"]);
			if($mostrar == "si"){
				?>
                <script src="<?=base_url()?>bower_components/jquery/dist/jquery.min.js"></script>
				<script>
					$("#file_name", parent.document).val('<?=$file_info["file_name"]?>');
					$(".img", parent.document).css("background-image", 'url(<?=base_url()?>files/<?=$folder?>/<?=$file_info["file_name"]?>)');
					//parent.document.$(".img").css("background-url", './files/<?=$folder?>/<?=$file_info["file_name"]?>');
				</script>
				<?
			}else{
				$model = $this->input->post('model');
				$this->load->model($model);
				$this->$model->insert_galeria($file_info["file_name"]);
				?>
				<script>
					window.parent.load_galeria('<?=$this->input->post("id")?>');
				</script>
				<?
			}
        }
    }
    //FUNCIÓN PARA CREAR LA MINIATURA A LA MEDIDA QUE LE DIGAMOS
    function _create_thumbnail($folder, $filename){
        $config['image_library'] = 'gd2';
        //CARPETA EN LA QUE ESTÁ LA IMAGEN A REDIMENSIONAR
        $config['source_image'] = './files/'.$folder.'/'.$filename;
        $config['create_thumb'] = TRUE;
        $config['maintain_ratio'] = TRUE;
        //CARPETA EN LA QUE GUARDAMOS LA MINIATURA
        $config['new_image']= './files'.$folder.'/thum/';
        $config['width'] = 150;
        $config['height'] = 150;
        $this->load->library('image_lib', $config); 
        $this->image_lib->resize();
    }
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */