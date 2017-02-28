<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if ( ! function_exists('element'))
{
	
    function GetMenu(){
        $CI =& get_instance();
        $CI->load->library("session");
        $CI->load->database();
        $categorias = get_base_categories();
        $color = 0; // for init menu background color
?>
                

    <div class="header-top">
	<div class="wrap"> 
            <div class="logo">
                <a href="<?=base_url()?>home"><img style="height: 90px; width: 260px" src="<?=base_url()?>img/logo2_1.jpg" alt=""/></a>
	    </div>
            <div class="cssmenu" style="margin-top: 30px">
                <ul>

                    <li><a href="<?=base_url()?>quienes_somos"><?=get_lang("quienes-somos")?></a></li>
                    <li><a href="<?=base_url()?>contactanos"><?=get_lang("contactanos")?></a></li> 
                    <li><a href="<?=base_url()?>como_comprar"><?=get_lang("como-comprar")?></a></li> 
                    <?php if($CI->session->userdata("idcliente")){ ?>
                     <li><a href="<?=base_url()?>micuenta"><?=get_lang("mi-cuenta")?></a></li>    
                    <?php }else { ?>
                    <li class="active"><a href="<?=base_url()?>register"><?=get_lang("registrate")?></a></li> 
                    <li><a href="<?=base_url()?>login"><?=get_lang("login")?></a></li>
                    <?php } ?>
                    
                    <a href="<?=base_url()?>carrito"> <i class="fa fa-cart-plus " aria-hidden="true" style=" font-size: 30px; color: #df8a13; " title="<?=get_lang("mi-carrito")?>"></i></a>

<!--                    <ul class="icon2 sub-icon2 profile_img">
                        <li><a class="active-icon c2" href="#"> </a>
                            <ul class="sub-icon2 list">
                                    <li><h3><?=get_lang("productos")?></h3><a href=""></a></li>
                                    <li><p></p></li>
                            </ul>
                        </li>
                    </ul>-->
                </ul>
                <?php if ($CI->session->userdata("nombre")){ ?>
                <div class="cssmenu" style=" font-size: 13px" >Bienvenido: <h3 style="color: #df8a13; font-size: 13px">  <?php echo $CI->session->userdata("nombre"); ?> <a href="<?=base_url()?>login/ses_out"> <i class="fa fa-close" title="<?=get_lang("cerrar-sesion")?>"> </i> </a></h3> </div>   
                <?php } ?>
            </div>
            
        </div>
           
		
	<div class="clear"></div>
 	</div>
   </div>

   <div class="header-bottom">
   	<div class="wrap">
            <!-- start header menu -->
            <ul class="megamenu skyblue">
                <li><a class="color" href="<?=base_url()?>home"><?=get_lang("inicio")?></a></li>

                    <?php foreach($categorias as $c){
                        $color++;
                        $nombre = "nombre".$CI->session->userdata("idi_camp");
                    ?>
                        <li>
                            <a class="color<?php echo $color?>" href="<?=base_url()?>shop?categoria=<?=$c->nombre?>">
                                <?=ucwords(strtolower($c->$nombre))?>
                            </a>
                            <div class="megapanel">
                                <div class="row">
                                    <div class="col1" style="display: none">
                                        <div class="h_nav">
                                        <?php
                                            list_tree_cat_id($c->id);
                                        ?>
                                        </div>
                                    </div>
<!--                                    <img src="<?=base_url()?>images/nav_img2.jpg" alt=""/>-->
                                </div>
                            </div>
                        </li>    

                    <?php } ?>
               </ul>
<!--            <div class="col-sm-12" style="margin-top: 5px; margin-bottom: 10px; " >
                <div class="input-group" style="width: 100%">
                    <input type="text" class="form-control" style="border-color:#df8a13;" placeholder="<?=get_lang("buscar")?>">
                    <span class="input-group-addon" style=" background-color: #df8a13; border-color:#df8a13"><i class="fa fa-search"  ></i>
                    </span>
                </div>
            </div>-->
            <div class="clear"></div>
     	</div>
       </div>
		
		
		<?php
	}
	
	

}

/* End of file array_helper.php */
/* Location: ./system/helpers/array_helper.php */

