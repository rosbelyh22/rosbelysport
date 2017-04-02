<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if ( ! function_exists('element'))
{
	
	function get_conf_helper(){
			$CI = & get_instance();
			$res_conf = $CI->db->from("im_configuracion")->get();
			$res_conf = $res_conf->result();
			
			$datos_conf = array();
			
			foreach($res_conf as $rc){
				$datos_conf[$rc->nombre] =  $rc->valor;	
			}
			
			return $datos_conf;
	}
	
	
	function GetBtnRedes(){
		$conf = get_conf_helper();
		?>
        
		<ul class="social-share "  >
        	<?php
            if($conf["url_facebook"] != ''){
				?>
				<li>
                <a href="<?=$conf["url_facebook"]?>" target="_blank">
                    <span class="fa fa-facebook-square" style="color: #df8a13; font-size: 30px"></span>
                </a>
                </li>
				<?php	
			}
			?>
            <?php
            if($conf["url_twitter"] != ''){
				?>
				<li>
                <a href="<?=$conf["url_twitter"]?>" target="_blank">
                	<span class="fa fa-twitter-square" style="color: #df8a13; font-size: 30px"></span>
                </a>
                </li>
				<?php	
			}
			?>
            <?php
            if($conf["url_instagram"] != ''){
				?>
				<li>
                <a href="<?=$conf["url_instagram"]?>" target="_blank">
                	<span class="fa fa-instagram" style="color: #df8a13; font-size: 30px"></span>
                </a>
                </li>
				<?php	
			}
			?>
            <?php
            if($conf["url_googleplus"] != ''){
				?>
				<li>
                <a href="<?=$conf["url_googleplus"]?>" target="_blank">
                	<span class="fa fa-google-plus-square"  style="color: #df8a13; font-size: 30px"></span>
                </a>
                </li>
				<?php	
			}
			?>
            <?php
            if($conf["url_linkedin"] != ''){
				?>
				<li>
                <a href="<?=$conf["url_linkedin"]?>" target="_blank">
                <span class="fa fa-linkedin-square" style="color: #df8a13; font-size: 30px"></span>
                </a>
                </li>
				<?php	
			}
			?>
            <?php
            if($conf["url_pinteres"] != ''){
				?>
				<li>
                <a href="<?=$conf["url_pinteres"]?>" target="_blank">
                <span class="fa fa-pinterest-square" style="color: #df8a13; font-size: 30px" ></span>
                </a>
                </li>
				<?php	
			}
			?>
          </ul>
        
		<?php
	}
	
	
	function get_basic_btnredes(){
		$conf = get_conf_helper();
            if($conf["url_facebook"] != ''){
				?>
                <div class="social" title="Facebook">	
                    <ul>	
                        <li class="facebook"><a href="<?=$conf["url_facebook"]?>" target="_blank"><span> </span></a><div class="radius"> <img src="<?= base_url() ?>images/radius.png"><a href="#"> </a></div><div class="border hide"><p class="num">1.51K</p></div></li>
                    </ul>
                </div>
				<?php	
			}
			?>
            <?php
            if($conf["url_twitter"] != ''){
				?>
                <div class="social" title="twitter">	
                            <ul>	
                                <li class="twitter"><a href="<?=$conf["url_twitter"]?>" target="_blank"><span> </span></a><div class="radius"> <img src="<?= base_url() ?>images/radius.png"></div><div class="border hide"><p class="num">1.51K</p></div></li>
                            </ul>
                        </div>
               
				<?php	
			}
			?>
           
            <?php
            if($conf["url_googleplus"] != ''){
				?>
                        <div class="social">	
                            <ul>	
                                <li class="google"><a href="<?=$conf["url_googleplus"]?>" target="_blank"><span> </span></a><div class="radius"> <img src="<?= base_url() ?>images/radius.png"></div><div class="border hide"><p class="num">1.51K</p></div></li>
                            </ul>
                        </div>
              
				<?php	
			}
			?>
            
				<?php	
			
	}
	
	
	function template_email($asunto, $mensaje){
		$cuerpo =  "
		
		<table width='100%' style='border:0px' border='0' cellpadding='0' cellspacing='0'>
			<tr>
				<td align='left' style='background-color:#666; padding:5px;'>
					<img src='".base_url()."img/logo.png' style='max-width:250px;'>
				</td>
				<td align='right' style='background-color:#666; padding:5px;'>
					<h4>".$asunto."</h4>
				</td>
			</tr>
			<tr>
				<td colspan='2'>
				<hr>
				</td>
			</tr>
			<tr>
				<td colspan='2'>
				<br><br>
				".$mensaje."
				<br><br>
				</td>
			</td>
			<tr>
			<td colspan='2'>
				<hr>
			</td>
			</tr>
			<tr>
				<td align='left' style='color:#999' colspan='2'>
					Este mensaje fue enviado desde
					<a href='http://www.sistematico.com.ve' target='_blank'>
						<span style='color:#999;'><strong>IMPanel</strong></span>
					</a>
				</td>
				
			</tr>
			</table>
		
		";	
		return $cuerpo;
	}
	
	
	function GetBtnFacebook(){
		?>
<!--                <li class="fb"><a href="<?=current_url()?>"><span> </span></a></li>-->
		<div class="fb-like" data-href="<?=current_url()?>" data-layout="standard" data-action="like" data-show-faces="true" data-share="true"></div>
        
        <div id="fb-root"></div>
		<script>(function(d, s, id) {
          var js, fjs = d.getElementsByTagName(s)[0];
          if (d.getElementById(id)) return;
          js = d.createElement(s); js.id = id;
          js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.3";
          fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));</script>
		<?php
	}
	
        function GetBtnTwitter(){ ?>
            <a href="https://twitter.com/share" class="twitter-share-button" data-url="http://localhost/www/sporthouse/product_details" data-via="sporthouse">Tweet</a>
            <script>
                !function(d,s,id){
                var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';
                if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}
                (document, 'script', 'twitter-wjs');
            </script>
    <?php    
    }
        
        
        function GetContadorVisitas(){
            $CI = & get_instance();
            $res_conf = $CI->db->from("im_sessions_web")->get();
            $res_conf = $res_conf->result();

            return num_twitter_format(count($res_conf));
        }
        
        
	
	function GetFooter(){
		$conf = get_conf_helper();
		$CI =& get_instance();
		$CI->load->model("productos_model");
		$CI->load->library("session");
		$categorias_producto = $CI->productos_model->get_categorias();
                $ma = $CI->session->userdata("menu_active");
                
                $sql_cat = $CI->db->from("im_productos_categoria")->get();
                $categorias = $sql_cat->result();
		?>
                <div class="footer" style="">
<!--            <div class="footer-top">
                <div class="wrap">
                    <div class="col_1_of_footer-top span_1_of_footer-top">
                        <ul class="f_list">
                            <li><img src="<?= base_url() ?>images/f_icon2.png" alt=""/><span class="delivery"><?=get_lang("nuestros-productos")?></span></li>
                        </ul>
                    </div>
                    <div class="col_1_of_footer-top span_1_of_footer-top">
                        <ul class="f_list">
                            <li><img src="<?= base_url() ?>images/f_icon1.png" alt=""/><span class="delivery"><?=get_lang("contacto")?> :<span class="orange"> (800) 000-2587</span></span></li>
                        </ul>
                    </div>
                    <div class="col_1_of_footer-top span_1_of_footer-top">
                        <ul class="f_list">
                            <li><img src="<?= base_url() ?>images/f_icon2.png" alt=""/><span class="delivery"><?=get_lang("perfiles-sociales")?></span></li>
                        </ul>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>-->
<!--            <div class="footer-middle">
                <div class="wrap">
                    <div class="section group">
                        
                        <div class="col_1_of_middle span_1_of_middle">
                            <ul class="f_list1">
                                <li>
                                    <div class="search">	  
                                        <input type="text" name="s" class="textbox" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {
                                                    this.value = 'Search';
                                                }">
                                        <input type="submit" value="Subscribe" id="submit" name="submit">
                                        <div id="response"> </div>
                                    </div>
                                    <div class="clear"></div>
                                </li>
                            </ul>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>	-->
                
<!--         <div class="footer-bottom">
       	 	<div class="wrap">
                    
       	 		<div class="section group">
                            <?php foreach($categorias as $c){
                                $nombre = "nombre".$CI->session->userdata("idi_camp");

                                if($c->idpadre == 0) {
                            ?>
			
				<div class="col_1_of_5 span_1_of_5">
					<h3 class="m_9"> <?=ucwords(strtolower($c->$nombre))?></h3>
					<ul class="list1">
                                            <?php foreach($categorias as $c2){
                                                    if($c2->idpadre == $c->id){ ?>
                                                        <li><a href="shop.html"><?= $c2->nombre ?></a></li>
                                                <?php }} ?>
                                        </ul>
				</div>
                                <?php } }?>
                            <img style="height: 80px; width: 200px; float: right" src="<?= base_url() ?>img/logo2.1.jpg" alt=""/><span class="delivery"></span>

                            <div class="clear"></div>
			</div>
       	 	</div>
             
       	 </div>       -->
<div class="copy ">
       	   <div class="wrap">
                <div class="container">
                    <div class="cssmenu" style=" font-size: 16.8px;">
                        <p>
                            
                        
                            <a style="color:#df8a13;" href="<?=base_url()?>home"><?=get_lang("quienes-somos")?></a> | 
                            <a style="color:#df8a13;" href="<?=base_url()?>home#tf-about"><?=get_lang("registrate")?></a> | 
<!--                            <a style="color:#FFF;" href="<?=base_url()?>content/get/services"><?=get_lang("tienda")?></a> | -->
                            <a style="color:#df8a13;" href="<?=base_url()?>obras/get"><?=get_lang("mi-cuenta")?></a> | 
<!--                            <a style="color:#FFF;" href="<?=base_url()?>carrito/obtenerCarrito"><?=get_lang("checkOut")?></a> | -->
                            <a style="color:#df8a13;" href="<?=base_url()?>contact"><?=get_lang("contactanos")?></a> | 
                            <a style="color:#df8a13;" href="<?=base_url()?>home/lang/esp"><?=get_lang("spanish")?></a> | 
                            <a style="color:#df8a13;" href="<?=base_url()?>home/lang/eng"><?=get_lang("english")?></a>
                            

                        </p>
                        <p><?=$conf["copyright"]?></p>
                        <p><?=get_lang("mensaje-footer")?> </p>
                        <p> <i class="fa fa-phone" aria-hidden="true" style=" font-size: 20px; color:#df8a13;"></i>
                        <?=get_lang("telefono")?>: (2345)-9453453 | 
                        
                        <i class="fa fa-map-marker" aria-hidden="true" style=" font-size: 20px; color:#df8a13;"></i>
                        <?=get_lang("direccion")?>: Urb Lomas del Este, Avenida Rosarito, Torre Trebol | 
                        <i class="fa fa-envelope" aria-hidden="true" style=" font-size: 20px; color:#df8a13;"></i>
                        <?=get_lang("email")?>: <a href="mailto:sporthouse@gmail.com"> sporthouse@gmail.com </a> </p>
                        <p>Desarrollado por <a href="http://www.jysolutions.com.ve" target="_blank" style="color:#FFDF10 !important">J&Y Solutions</a> 
                        | <?=GetBtnRedes()?>
                        </p>
                    </div>
                    
                </div>
       	   </div>
       	 </div>
       </div>
       <script type="text/javascript">
			$(document).ready(function() {
			
				var defaults = {
		  			containerID: 'toTop', // fading element id
					containerHoverID: 'toTopHover', // fading element hover id
					scrollSpeed: 1200,
					easingType: 'linear' 
		 		};
				
				
				$().UItoTop({ easingType: 'easeOutQuart' });
				
			});
	</script>
        <a href="#" id="toTop" style="display: block;"><span id="toTopHover" style="opacity: 1;"></span></a>
        </body>
        </html>
                
                
                
                
		<?php	
	}
        
        
        
        
        
        function GetNuestrasObras($obras){
            $CI=& get_instance();
            $CI->load->library("session");
            $nombre = "nombre".$CI->session->userdata("idi_camp");
            $descripcion_breve = "descripcion_breve".$CI->session->userdata("idi_camp");
            ?>
            <div id="tf-team" class="text-center">
        <div class="overlay">
            <div class="container">
                <div class="section-title center">
                    <h2><strong><?=get_lang("nuestras-obras")?></strong></h2>
                    <div class="line">
                        <hr>
                    </div>
                </div>
                
                <div id="team" class="owl-carousel owl-theme row">
                    
                    <?php
                    foreach($obras as $o){
                    ?>
                    
                    <div class="item">
                        <div class="thumbnail">
                            <a href="<?=base_url()?>obras_details/get/<?=$o->tags?>">
                            <img src="<?=base_url()?>impanel/files/obras/<?=$o->img_obra?>" alt="<?=$o->$nombre?>" class="team-img">
                            <div class="caption">
                                <h3><?=$o->$nombre?></h3>
                                <p><?=$o->$descripcion_breve?></p>
                            </div>
                            </a>
                        </div>
                    </div>
                    
                    <?php
                    }
                    ?>
                    
                </div>
                
            </div>
        </div>
    </div>    
                
            <?php
        }
        
        
        
        
    function GetNuestrosClientes(){
        ?>
            
        <div id="tf-clients" class="text-center">
        <div class="overlay">
            <div class="container">

                <div class="section-title center">
                    <h2><strong><?=get_lang("nuestros-clientes")?></strong></h2>
                    <div class="line">
                        <hr>
                    </div>
                </div>
                <div id="clients" class="owl-carousel owl-theme">
                    <div class="item">
                        <img src="<?=base_url()?>img/client/01.png" class="img-logos-clientes">
                    </div>
                    <div class="item">
                        <img src="<?=base_url()?>img/client/02.png" class="img-logos-clientes">
                    </div>
                    <div class="item">
                        <img src="<?=base_url()?>img/client/03.png" class="img-logos-clientes">
                    </div>
                    <div class="item">
                        <img src="<?=base_url()?>img/client/04.png" class="img-logos-clientes">
                    </div>
                    <div class="item">
                        <img src="<?=base_url()?>img/client/05.png" class="img-logos-clientes">
                    </div>
                    <div class="item">
                        <img src="<?=base_url()?>img/client/06.png" class="img-logos-clientes">
                    </div>
                    <div class="item">
                        <img src="<?=base_url()?>img/client/07.png" class="img-logos-clientes">
                    </div>
                    <div class="item">
                        <img src="<?=base_url()?>img/client/08.png" class="img-logos-clientes">
                    </div>
                    <div class="item">
                        <img src="<?=base_url()?>img/client/09.png" class="img-logos-clientes">
                    </div>
                    <div class="item">
                        <img src="<?=base_url()?>img/client/10.png" class="img-logos-clientes">
                    </div>
                </div>

            </div>
        </div>
    </div>    
            
        <?php
    }   
    
    
    
    function GetProductosDestacados($productos_destacados = ''){
        $CI=& get_instance();
        $CI->load->library("session");
        $nombre = "nombre".$CI->session->userdata("idi_camp");
        $descripcion_breve = "descripcion_breve".$CI->session->userdata("idi_camp");
        
        ?>
            
        <div class="content-bottom">
            <div class="box1">
            <?php
                $categorias = array();
                $nombres_cat = array();
                $nombre_categoria = "nombre_categoria".$CI->session->userdata("idi_camp");
                $boxquantity = 0;
                foreach($productos_destacados as $pd){
                    if(!in_array($pd->tags_categoria, $categorias)){
                        $categorias[] = $pd->tags_categoria;
                        $nombres_cat[] = $pd->$nombre_categoria;
                    }
                    
                    $boxquantity++;
                    if($boxquantity % 3 == 1){
                        echo '<div class="clear"></div>';
                        echo '</div>';
                        echo '<div class="box1">';
                    }
           ?> 
                   
                <div class="col_1_of_3 span_1_of_3">
                    <a href="<?=base_url()?>product_details/get/<?=$pd->tags?>">
                        <div class="view view-fifth">
                            <div class="top_box">
                                <h2 style="color:#df8a13; font-size: 18px"><?=$pd->$nombre?></h2>
                                <h2 style="color: #000; font-size: 15px"><?=$pd->$descripcion_breve?></h2>
                                <div class="grid_img">
                                    <div class="css3">
                                        <img style="height: 200px" src="<?=base_url()?>impanel/files/productos/<?=$pd->img_producto?>" alt="<?=$pd->$nombre?>"/>
                                    </div>
                                    <div class="mask">
                                        <div class="info"><?=get_lang("ver-mas")?></div>
                                    </div>
                                </div>
                                <div class="price"><?=number_format($pd->precio,2,",",".")?> Bs.</div>
                                <div class="price"><?=number_format($pd->precio_dolares,2,",",".")?> $</div>
                            </div>
                        </div>
                        <a class="active-icon c1" href="<?=base_url()?>carrito/AgregarProducto/<?=$pd->tags?>">
                            <ul class="list">
                                <li>
                                    <img  src="<?= base_url() ?>images/plus.png" alt=""/>
                                    <ul class="icon1 sub-icon1 profile_img">
                                        <li><?=get_lang("agregar")?> 
                                            <ul class="sub-icon1 list">
                                                <li><h3><?=get_lang("agregar-carrito")?></h3></li>
                                                <li><p><?= get_lang("texto-agregar-carrito")?></p></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </a>
                        <div class="clear"></div>
                    
                    </div>
                    <?php } ?>

                        <div class="clear"></div>
                    
                    </div>
                    
                </div>   
        <?php
    }
    
    function GetProductosDestacadosSlideshow($productos_destacados =''){
        $CI=& get_instance();
        $CI->load->library("session");
        $nombre = "nombre".$CI->session->userdata("idi_camp");
        $descripcion_breve = "descripcion_breve".$CI->session->userdata("idi_camp");
        
        ?>
            
    <div class="col-sm-8" style="float: right; margin-top: 50px" >
        <ul id="flexiselDemo3">
            <?php
                $categorias = array();
                $nombres_cat = array();
                $nombre_categoria = "nombre_categoria".$CI->session->userdata("idi_camp");
                $i = 0;
                foreach($productos_destacados as $pd){
                    if(!in_array($pd->tags_categoria, $categorias)){
                        $categorias[$i] = $pd->tags_categoria;
                        $nombres_cat[$i] = $pd->$nombre_categoria;
                        $i++;
                    }   
           ?> 
                 
               
			<a href="<?=base_url()?>product_details/get/<?=$pd->tags?>">
                            <li style="width: 230px; height: 200px">
                                <img src="<?=base_url()?>impanel/files/productos/<?=$pd->img_producto?>" style="width: 150px; height: 150px" />
                                <div class="grid-flex"><?=$pd->$nombre?>
                                    <p><?=$pd->$nombre_categoria?></p>
                                </div>
                            </li>
                        </a>
<!--			<li><img src="<?=base_url()?>images/pic10.jpg" /><div class="grid-flex"><a href="#">Capzio</a><p>Rs 850</p></div></li>
			<li><img src="<?=base_url()?>images/pic9.jpg" /><div class="grid-flex"><a href="#">Zumba</a><p>Rs 850</p></div></li>
			<li><img src="<?=base_url()?>images/pic8.jpg" /><div class="grid-flex"><a href="#">Bloch</a><p>Rs 850</p></div></li>
			<li><img src="<?=base_url()?>images/pic7.jpg" /><div class="grid-flex"><a href="#">Capzio</a><p>Rs 850</p></div></li>-->
                <?php }?>
        </ul>
	    <script type="text/javascript">
		 $(window).load(function() {
			$("#flexiselDemo1").flexisel();
			$("#flexiselDemo2").flexisel({
				enableResponsiveBreakpoints: true,
		    	responsiveBreakpoints: { 
		    		portrait: { 
		    			changePoint:480,
		    			visibleItems: 1
		    		}, 
		    		landscape: { 
		    			changePoint:640,
		    			visibleItems: 2
		    		},
		    		tablet: { 
		    			changePoint:768,
		    			visibleItems: 3
		    		}
		    	}
		    });
		
			$("#flexiselDemo3").flexisel({
				visibleItems: 5,
				animationSpeed: 1000,
				autoPlay: true,
				autoPlaySpeed: 3000,    		
				pauseOnHover: true,
				enableResponsiveBreakpoints: true,
		    	responsiveBreakpoints: { 
		    		portrait: { 
		    			changePoint:480,
		    			visibleItems: 1
		    		}, 
		    		landscape: { 
		    			changePoint:640,
		    			visibleItems: 2
		    		},
		    		tablet: { 
		    			changePoint:768,
		    			visibleItems: 3
		    		}
		    	}
		    });
		    
		});
	</script>
                
                    
            <script type="text/javascript" src="<?=base_url()?>js/jquery.flexisel.js"></script>
            <script type="text/javascript" src="<?=base_url()?>/js/move-top.js"></script>
    </div>
           
        <?php
    }

}