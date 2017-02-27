<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if ( ! function_exists('element'))
{
	
	function get_publicidad_helper($posicion, $secciones, $cantidad) {
		$CI = & get_instance();
		$CI->load->database();
		
		$CI->db->from("im_publicidad");
		

		$where = '(';
		foreach($secciones as $sec){
			$where .= "secciones = '".$sec."' OR ";
		}
		$where = substr($where,0,-3);
		$where .= ")";
		$CI->db->where($where);	

		
		
		$CI->db->where("posicion", $posicion);	
		
		$CI->db->where("fecha_inicio <=", date("Y-m-d"));
		$CI->db->where("((fecha_fin != '0000-00-00' AND fecha_fin <= '".date("Y-m-d")."') OR 
						(fecha_fin = '0000-00-00'))");
		$CI->db->where("(cantidad_impresiones = '0' OR cantidad_impresiones > impresiones)");
		$CI->db->where("(cantidad_clic = '0' OR cantidad_clic > clic)");
		
		$CI->db->order_by("RAND()");
		$CI->db->limit($cantidad, "0");
		$get = $CI->db->get();
		$res = $get->result();
                ?>
                <div class="row">    
                <?php
		foreach($res as $p){
			$CI->load->library("session");
			$impresiones = $p->impresiones+1;
			$datos = array("impresiones" => $impresiones);
			$CI->db->where("id", $p->id);
			$CI->db->update("im_publicidad", $datos);
			
			$datos_p = array("idpublicidad" => $p->id,
							"pais" => $CI->session->userdata("pais"),
							"anio" => date("Y"),
							"mes" => date("m"),
							"dia" => date("d"));
			$CI->db->insert("im_publicidad_impresiones", $datos_p);
					
		?>
                <div class="col-sm-<?=(12/$cantidad)?>">    
                    <a href="<?=base_url()?>publicidad/get_anuncio/<?=$p->id?>" target="_blank">
                    <img src="<?=base_url()?>impanel/files/publicidad/<?=$p->archivo?>" alt="<?=$p->nombre?>" class="img-responsive" style="width:100%; height:130px !important;">
                    </a>
                </div>
		<?php
		}
                ?>
                </div>    
                    <?php
	  }  

}

/* End of file array_helper.php */
/* Location: ./system/helpers/array_helper.php */
?>