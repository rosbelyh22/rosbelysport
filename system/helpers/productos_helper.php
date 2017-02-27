<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if ( ! function_exists('element'))
{
	
	function get_img_categorias_helper($categorias, $cantidad, $tamano){
		$CI =& get_instance();
		$CI->load->library("session");
		?>
		<div class="row">
          <?php
			$i=1;
		  foreach($categorias as $c){
          $col = 12/$cantidad;
		  ?>      
            <div class="col-sm-<?=($col)?> img-btn">
                <a href="<?=base_url()?>categories/get/<?=$c->tags?>">
                <img src="<?=base_url()?>impanel/files/categoria_producto/<?=$c->imagen?>" class="image-responsive" style='width:325px; height:325px'>
                <div class="nombre_btn_img">
					<?php
                    $nombre = "nombre".$CI->session->userdata("idi_camp");
					?>
					<?=$c->$nombre?>
                </div>
                </a>
            </div>
		<?php
			if($i == $cantidad){
				?>
				</div>
                <div class="row">
				<?php
				$i=1;
			}else{
				$i++;	
			}
		  }
		?>
		</div>
		<?php
	}
	
	
	
	
	function get_productos_categoria_verena($cat, $list_product, $cant){
		$CI =& get_instance();
		$CI->load->library("session");
		$nombre = "nombre".$CI->session->userdata("idi_camp");
		?>
		
        <div class="col-sm-6 li_cat">
        	<img src="<?=base_url()?>impanel/files/categoria_producto/<?=$cat[0]->imagen?>">
        </div>
        
        <?php
        $i=0;
		foreach($list_product as $p){
			?>
			<div class="col-sm-3 img_p">
			<div class="desc_pro">
            	<h5><?=$p->$nombre?></h5>
                <p><?=$p->codigo?><br />
                $<?=number_format($p->precio,2,",",".")?></p>
                <a href="<?=base_url()?>product_details/get/<?=$p->tags?>">
                <input type="button" name="btn-view-details" id="btn-view-details" value="<?=get_lang("view_details")?>" class="btn-details">
                </a>
            </div>
            <img src="<?=base_url()?>impanel/files/productos/<?=$p->img_producto?>" class="image-reponsive" style='height:300px;'>
			</div>
			<?php
		}
		?>
        
		<?php
	}
	
	
	
	
	function get_collection($col, $list_product, $list_col){
        $CI =& get_instance();
		$CI->load->library("session");
		$nombre = "nombre".$CI->session->userdata("idi_camp");
		if($col != ''){
		?>
		<div class="col-sm-6 li_cat cuadro_col">
        	<div class="cont_cuadro_col">
			<?=$col[0]->$nombre?>
            <div style="font-size:18px; color:#FFF">
            <?php
            if($CI->session->userdata("idi") == "eng"){
				echo "COLLECTION";
			}else{
				echo "COLECCIONES";	
			}
			?>
            </div>
            </div>
        </div>
		<?php
		$i=0;
		foreach($list_product as $p){
			?>
			<div class="col-sm-3 img_p">
			<div class="desc_pro">
            	<h5><?=$p->$nombre?></h5>
                <p><?=$p->codigo?><br />
                $<?=number_format($p->precio,2,",",".")?></p>
                <a href="<?=base_url()?>product_details/get/<?=$p->tags?>">
                <input type="button" name="btn-view-details" id="btn-view-details" value="<?=get_lang("view_details")?>" class="btn-details">
                </a>
            </div>
            <img src="<?=base_url()?>impanel/files/productos/<?=$p->img_producto?>" class="image-reponsive" style='height:300px;'>
			</div>
			<?php
		}
		}else{
			$i=0;
			$j=0;
			?>
			
			<?php
			foreach($list_col as $c){
				//echo "I VALE: ".$i." J VALE: ".$j."<br />";
			
				
				if($j == 0 and $i == 0){
					$class = "col-sm-5";
				}else if($j == 1 and $i == 1){
					$class = "col-sm-7";
				}else if($j == 0 and $i == 2){
					$class = "col-sm-7";
				}else if($j == 1 and $i == 3){
					$class = "col-sm-5";	
				}else if($j == 0 and $i == 4){
					$class = "col-sm-5";		
				}else if($j == 1 and $i == 5){
					$class = "col-sm-7";		
				}else if($j == 0 and $i == 6){
					$class = "col-sm-7";		
				}else if($j == 1 and $i == 7){
					$class = "col-sm-5";		
				}else if($j == 0 and $i == 8){
					$class = "col-sm-5";		
				}else if($j == 1 and $i == 9){
					$class = "col-sm-7";		
				}else if($j == 0 and $i == 10){
					$class = "col-sm-7";		
				}else if($j == 1 and $i == 11){
					$class = "col-sm-5";		
				}
			
			?>
			<div class="<?=$class?> img-btn" style="margin:0px; margin-bottom:20px;">
            	<a href="<?=base_url()?>collection/get/<?=$c->tags?>">
                <img src="<?=base_url()?>impanel/files/coleccion_producto/<?=$c->imagen?>" class="image-reponsive" style="width:100%; max-height:300px;">
                <div class="nombre_btn_img">
					<?=$c->$nombre?>
                </div>
                </a>
            </div>
			<?php
			if($j==1){
				$j=0;
			}else{
				$j++;
			}
			$i++;
			}
			
			?>
			</div>
			<?php
			
		}
	}
	
	
	
	
	function get_similar_products($list_product, $id){
		$CI =& get_instance();
		$CI->load->library("session");
		$nombre = "nombre".$CI->session->userdata("idi_camp");
		?>
		<div class="row">
        <?php
        $i=0;
		foreach($list_product as $p){
			if($p->id != $id){
			?>
			<div class="col-sm-3 img_p">
			<div class="desc_pro">
            	<h5><?=$p->$nombre?></h5>
                <p><?=$p->codigo?><br />
                $<?=number_format($p->precio,2,",",".")?></p>
                <a href="<?=base_url()?>product_details/get/<?=$p->tags?>">
                <input type="button" name="btn-view-details" id="btn-view-details" value="<?=get_lang("view_details")?>" class="btn-details">
                </a>
            </div>
            <img src="<?=base_url()?>impanel/files/productos/<?=$p->img_producto?>" class="image-reponsive" style='height:300px;'>
			</div>
			<?php
			}
		}
		?>
        </div>
		<?php
	}

}

/* End of file array_helper.php */
/* Location: ./system/helpers/array_helper.php */
?>