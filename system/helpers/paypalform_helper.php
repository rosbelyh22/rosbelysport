<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if ( ! function_exists('element'))
{
	
	function paypalform_helper($carrito) {
		$CI = & get_instance();
		$CI->load->database();
		
		//$CI->db->from("im_publicidad");
	?> 
            <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
                <input name="cmd" type="hidden" value="_cart" />
                <input name="upload" type="hidden" value="1" />
                <input name="business" type="hidden" value="rosbelyh22@gmail.com" />
                <input name="shopping_url" type="hidden" value="http://localhost/sporthouse/" />
                <input name="currency_code" type="hidden" value="USD" />


                <input name="return" type="hidden" value="http://localhost/sporthouse/micuenta" />
                <input name="notify_url" type="hidden" value="http://localhost/sporthouse/ipn.php" />


                <input name="rm" type="hidden" value="2" />
        <?php 
        $i= 0; 
        $total = 0;
        $cantidadtotal =0;
        $nombretotal = '';
        $totaldolares= 0;
         foreach($carrito as $c){
                $total += ($c->precio*$c->cantidad);
                $totaldolares += ($c->precio_dolares*$c->cantidad);
                $cantidadtotal += $c->cantidad;
                $preciounitario = $c->precio;
                $nombre = "nombre".$CI->session->userdata("idi_camp");
                $nombretotal = $nombretotal ." ". $c->$nombre.' ('.$c->cantidad.')';
                $i++;
                //echo intval($c->cantidad);
        ?>
                
                
                <!--LECHUGAS ; Nombre: Lechugas ; Valor : 15.00 , Cantidad : 2-->
                <input name="item_number_<?=$i?>" type="hidden" value="<?=$c->codigo?>" />
                <input name="item_name_<?=$i?>" type="hidden" value="<?=$c->$nombre?>" />
                <input name="amount_<?=$i?>" type="hidden" value="<?=$c->precio_dolares?>" />
                <input name="quantity_<?=$i?>" type="hidden" value="<?=intval($c->cantidad)?>" />
         <?php } ?>

                <!--PLÁTANOS ; Nombre: Piruletas ; Valor : 3.00 , Cantidad :15-->
<!--                <input name="item_number_2" type="hidden" value="PLÁTANOS15" />
                <input name="item_name_2" type="hidden" value="PLÁTANOS" />
                <input name="amount_2" type="hidden" value="3.00" />
                <input name="quantity_2" type="hidden" value="5" />-->
<!--                <button class="btn btn-primary " type="submit" value="">PayPal SandBox </button>-->
                
<input type="image" src="https://www.paypalobjects.com/es_XC/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" title="Paypal" alt="PayPal - The safer, easier way to pay online!">
<img alt="" border="0" src="https://www.paypalobjects.com/es_XC/i/scr/pixel.gif" width="1" height="1">


            </form>

		
        <?php
        }  

}

/* End of file array_helper.php */
/* Location: ./system/helpers/array_helper.php */
?>