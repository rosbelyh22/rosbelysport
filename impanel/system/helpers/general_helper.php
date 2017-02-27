<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if ( ! function_exists('element'))
{
	function open_page($title, $icono = '', $btn = array())
	{
		?>
			
			<div id="page-wrapper">
            
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                        <div class="row">
                        <div class="<?php if(count($btn) > 0){ echo "col-lg-7";}else{ echo "col-lg-12";}?> hidden-xs">
						<? if($icono != ''){ ?>
                        	<i class="fa fa-<?=$icono?> fa-fw"></i>
						<? } ?>
						<?=$title?>
                        </div>
                        <?php
                        if(count($btn) != 0){
							?>
                            <div class="col-lg-5" style="text-align:right">
                            <?php
							$cel = 12/count($btn);
                            foreach($btn as $b){
								?>
								<div class="col-sm-<?=$cel?>">
									<a href="<?=$b["url"]?>">
									<input type="button" name="<?=$b["name"]?>" id="<?=$b["id"]?>" value="<?=$b["value"]?>" class="btn btn-primary">
									</a>
								</div>
								<?php
							}
							?>
                            </div>
							<?php	
						}
						?>
                        </div>
                        </h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
		<?php
	}
	
	
	
	function close_page(){
		?>
		    
                <!-- /.container-fluid -->
                <br /><br />
                <div class="footer">
                &copy; CopyRight <a href="http://www.sistematico.com.ve"><strong>Jose Bello</strong></a> 2015
                </div>
            </div>
            <!-- jQuery -->
            <script src="<?=base_url()?>bower_components/jquery/dist/jquery.min.js"></script>
        
            <!-- Bootstrap Core JavaScript -->
            <script src="<?=base_url()?>bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
        
            <!-- Metis Menu Plugin JavaScript -->
            <script src="<?=base_url()?>bower_components/metisMenu/dist/metisMenu.min.js"></script>
            
            <!-- Custom Theme JavaScript -->
            <script src="<?=base_url()?>dist/js/sb-admin-2.js"></script>
            
            <script src="<?=base_url()?>bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
            
    		<!-- DataTables JavaScript -->
			<script src="<?=base_url()?>bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
            
            <script src="<?=base_url()?>js/script.js"></script>
            
		<?php	
	}
	
	
	function num_format($n) {
        // first strip any formatting;
        $n = (0+str_replace(",","",$n));
       
        // is this a number?
        if(!is_numeric($n)) return false;
       
        // now filter it;
        if($n>=1000000000000) return round(($n/1000000000000),1).'T';
        else if($n>=1000000000) return round(($n/1000000000),1).'B';
        else if($n>=1000000) return round(($n/1000000),1).'M';
        else if($n>1000) return round(($n/1000),1).'K';
       
        return number_format($n);
    }
	

	function url_friend($string, $object){
		$string = url_title($string, 'dash', TRUE);
		$ban = TRUE;
		while($ban == TRUE){
			if(count($object) > 0){
				foreach($object as $ob){
					if($ob->tags == $string){
						$ban = TRUE;
						$string .= "-".random_string("numeric", 4);
					}else{
						$ban = FALSE;	
					}// end else	
				}// end foreach
			}else{
				$ban = FALSE;	
			}
		}// end while
		return $string;
	}
	
	
	
	
	function open_panel($arr = array(), $msj_top, $tipo_panel = '', $icono = '')
	{
		
		if($tipo_panel == ''){
			$tipo_panel = "default";	
		}
		?>
        <div class="panel panel-<?=$tipo_panel?>">
		<div class="panel-heading">
            <span style="font-weight:normal;">
			<?php
            if($icono != ''){
				?>
				<span class='glyphicon glyphicon-<?=$icono?>'></span>&nbsp;
				<?php	
			}
			?>
			<?=$msj_top?>
            </span>
            <?php
            if(count($arr) != 0){
			foreach($arr as $ar){
				if(!isset($ar["js"])){
					$ar["js"] = "no";	
				}
				if(!isset($ar["class"])){
					$class = "success";	
				}else{
					$class = $ar["class"];
				}
			?>
            <div class="pull-right btn btn-<?=$class?> btn-xs hidden-print" style="margin-right:5px;">
                <?php
                if($ar["js"] == 'no'){
					?>
					<a href="<?=base_url()?>index.php/<?=$ar["url"]?>" style="color:#FFF" title="<?=$ar["title"]?>">
					<?php
				}else{
					?>
					<a href="javascript:;" onclick="<?=$ar["url"]?>" style="color:#FFF" title="<?=$ar["title"]?>">
					<?php	
				}
				?>
                <span class="glyphicon glyphicon-<?=$ar["icon"]?>"></span>
                </a>
            </div>
            <?php
			}
			}
			?>
        </div>
        <div class="panel-body">
		<?php	
	}
	
	
	
	function close_panel(){
		?>
		</div>
    	</div>
		<?php	
	}
	
	
	function load_modal($id, $titulo, $contenido, $funct){
		?>
			
            <div class="modal fade" id="<?=$id?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel"><?=$titulo?></h4>
                        </div>
                        <div class="modal-body">
                            <?=$contenido?>
                        </div>
                        <div class="modal-footer">
                            
                            <?php
                            if($funct == "solo_cerrar"){
								?>
								<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
								<?php	
							}else{
							?>
                            <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="<?=$funct?>">Si</button>
                            <?php
							}
							?>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            
		
		<?php	
	}
	
	

// ESTA FUNCION VERIFICA EL CONTENIDO QUE SE LE PASE COMO parametro y lo censura segun el array de palabras prohibidas

	function censurar_string($string){
		$pro = array('coño', 
					'pajuo', 
					'marico', 
					'mamaguevo',
					"becerro",
					"malnacido",
					"cabron",
					"puta",
					"guevo",
					"maburro",
					"maduro",
					"marica");
		$string = word_censor($string, $pro, '*****');
		return $string;

	}
	
	
	function tipo_menu($tipo){
		$tipo_menu = array();
		
		$CI = & get_instance();
		$CI->load->database();
		$CI->db->from("im_menu_tipo");
		$get = $CI->db->get();
		$res = $get->result();
		
		foreach($res as $r){
			$tipo_menu[$r->id] = array("id" => $r->id,
											"tabla" => $r->tabla,
											"pagina" => $r->pagina);
		}
		
		return $tipo_menu[$tipo];
	}
	
	function get_fecha($fecha) {
		$nombres_mes=array(1=>"Enero", "Febrero", "Marzo", "Abril", "Mayo",   "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre",  "Diciembre"  );
		
		$ano=substr($fecha,0,4);
		$mes=substr($fecha,5,2);
		$dia=substr($fecha,8,2);
		
		$dia=(integer)$dia;
		$mes=(integer)$mes;
		$mes=$nombres_mes[$mes];
		
		
		$cadena=$dia."/".$mes."/".$ano;
		return($cadena);
	  }  
	  
	  
	  function fecha_actual()
		{
			$CI = & get_instance();
			$CI->load->helper('date');
			 
			$esVerano = date('I', now()); //Obtenemos TRUE si es horario de verano
			$fechaGMTUnix = now(); //Fecha actual en GMT
			$fechaLocalUnix = gmt_to_local($fechaGMTUnix, "UM45", $esVerano); //Convertimos la fecha GMT a local a partir del código de zona horaria
			$fechaLocalFormateada = mdate("%Y-%m-%d %H:%i:%s", $fechaLocalUnix); //Formato español (dd/mm/yyyy HH:mm:ss)
			return $fechaLocalFormateada;
		}
	
	

}
?>