<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if ( ! function_exists('element'))
{
	
	function get_noticias_helper($noticias, $col, $pagi = 'no', $cant = '', $posic = ''){
		if(count($noticias) > 0){
		$conf = get_conf_helper();
		$i=1;
		$k = 0;
		?>
		<div class="row">
		<?
		foreach($noticias as $n){
		?>
		<div class="col-lg-<?=12/$col?>">
        	<article class="noticias">
                <a href="<?=base_url()?>detalle_noticia/get/<?=$n->tags?>">
                    <img src="<?=base_url()?>impanel/files/noticias/<?=$n->archivo?>" class="img-responsive <?=$posic?>">
                    <h1><?=$n->titulo?></h1>
                </a>
                <div class="well">
                    <a href="<?=base_url()?>noticias/get/<?=$n->tags_categoria?>">
                    <?=$n->nombre_categoria?></a> | <?=get_fecha($n->fecha_publicacion)?>
                </div>
                <p><?=character_limiter(strip_tags($n->contenido), 200)?></p>
            </article>
        </div>
		<?php
			$k++;
			
			if($i == $col){
				?>
				</div>
                <?php
                if($k == $conf["publicidad_noticias"]){
                        echo get_publicidad_helper(0, array(0,1), 1);	
                        $k=0;
                }
				?>
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
		if($pagi == 'si'){
			$CI = & get_instance();
			//$CI->load->model("configuracion_model");
			$conf = get_conf_helper();
			$config['next_link'] = 'Siguiente';
			$config['prev_link'] = 'Anterior';
			$config['display_pages'] = TRUE;
			$config['base_url'] = base_url().'noticias/get/'.$noticias[0]->tags_categoria;
			$config['total_rows'] = $cant;
			$config['per_page'] = $conf["noticias_pagina"];
			
			$config['cur_tag_open'] = '<li class="active"><a href="#">';
			$config['cur_tag_close'] = '</a></li>';
			$config['num_tag_open'] = '<li>';
			$config['num_tag_close'] = '</li>';
			$config['last_link'] = FALSE;
			$config['first_link'] = FALSE;
			$config['next_link'] = 'Siguiente';
			$config['next_tag_open'] = '<li>';
			$config['next_tag_close'] = '</li>';
			$config['prev_link'] = 'Anterior';
			$config['prev_tag_open'] = '<li>';
			$config['prev_tag_close'] = '</li>';
			$config['uri_segment'] = '4';
			 $config['display_pages'] = FALSE;
					
			
			
			$CI->pagination->initialize($config); 
			?>
            
			<div class="row paginacion">
            	<div class="col-sm-12">
                    <ul>
                    <?=$CI->pagination->create_links();	?>
                    </ul>
                </div>
            </div>
            <?php
		}else{
			echo "<center>No tenemos noticias en esta sección</center>"	;
		}
	}
	
	
	function get_not_der_cat_helper($noticias){
		foreach($noticias as $n){
		?>
		<li>
            <a href="<?=base_url()?>detalle_noticia/get/<?=$n->tags?>">
            <article class="row">
                <div class="col-lg-3">
                    <img src="<?=base_url()?>impanel/files/noticias/<?=$n->archivo?>" class="img-responsive">
                </div>
                <div class="col-lg-9">
                    <h1><?=$n->titulo?></h1>
                </div>
            </article>
            </a>
        </li>
		<?php
		}
	}
	
	
	
	function get_detalle_noticia_helper($not){
		?>
		
        <article class="detalle_noticia">
        	<h1 style="color:#333"><?=$not[0]->titulo?></h1>
            <a href="<?=base_url()?>impanel/files/noticias/<?=$not[0]->archivo?>" title="<?=$not[0]->titulo?>" class="gallery-image" data-gallery>
            <img src="<?=base_url()?>impanel/files/noticias/<?=$not[0]->archivo?>" class="img-responsive">
            </a>
            <div class="well">
                <a href="<?=base_url()?>noticias/get/<?=$not[0]->tags_categoria?>">
                <?=$not[0]->nombre_categoria?></a> | <?=get_fecha($not[0]->fecha_publicacion)?>
            </div>
            <p><?=$not[0]->contenido?></p>
        </article>
        <br />
        <?=get_btn_facebook();?>
		<br />
		<?php	
		echo get_publicidad_helper(0, array(0,1), 1);	
	}
	
	function get_galeria_noticia_helper($galeria, $col){
		if(count($galeria) > 0){
		?>
        <hr>
        <h3>Galeria de Imagenes</h3>
        <br>
		<div class="row galeria-noticia gallery">
		<?php	
		$i=1;	
		foreach($galeria as $g){
			?>
			<div class="col-sm-<?=12/$col?>">
            	<a href="<?=base_url()?>impanel/files/noticias/<?=$g->archivo?>" title="<?=$g->titulo?>" class="gallery-image" data-gallery>
                	<img src="<?=base_url()?>impanel/files/noticias/<?=$g->archivo?>" class="img-responsive">	
                </a>
            </div>
			<?php	
			if($i==$col){
				?>
				</div>
                <div class="row galeria-noticia gallery">
				<?php
				$i=1;	
			}else{
				$i++;	
			}	
		}
		?>
		</div>
    
         <!-- The Bootstrap Image Gallery lightbox, should be a child element of the document body -->
        <div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls">
            <!-- The container for the modal slides -->
            <div class="slides"></div>
            <!-- Controls for the borderless lightbox -->
            <h3 class="title">title</h3>
            <a class="prev">‹</a>
            <a class="next">›</a>
            <a class="close">×</a>
            <!-- The modal dialog, which will be used to wrap the lightbox content -->    
        </div>
		<?php	
		}
	}
	
	
	
	
	
	function getNoticiasDerecha_helper($not){  
		$CI =& get_instance();
		$CI->load->library("session");
		$titulo = "titulo".$CI->session->userdata("idi_camp");
		$contenido = "contenido".$CI->session->userdata("idi_camp");
		if(count($not) > 0){
		foreach($not as $n){
		?>
		<div class="single_comments">
        <img src="<?=base_url()?>impanel/files/noticias/<?=$n->archivo?>" class="img-responsive">
        <h2><?=$n->$titulo?></h2>
        <p><?=substr($n->$contenido, 0, 150)."..."?></p>
        <div class="text-right">
        <a href="<?=base_url()?>detalle_noticia/get/<?=$n->tags?>">
        <input type="button" name="btn-vermas" id="btn-vermas" class="btn btn-success" value="<?=get_lang("ver-mas")?>">
        </a>
        </div>
        </div>
		<?php
		}
		}
	}

}
?>