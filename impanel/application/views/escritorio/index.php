<?
open_page($title, "dashboard");
$get_mod = $this->session->userdata("mods");
$mod = array();

for($i=0; $i<count($get_mod); $i++){
		$mod[$i] = $get_mod[$i]["tags"];	
}

?>
        
        
		
        
        
        
        
        
        <div class="row">		
				<div class="col-lg-3">
                    <div class="panel panel-green indicadores">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-bar-chart-o fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><?=num_format($cant_visitas)?></div>
                                    <div>Visitas!</div>
                                </div>
                            </div>
                        </div>
                        <a href="#graf-visitas-5-meses">
                            <div class="panel-footer">
                                <span class="pull-left">Ver Detalles</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                
                
                
                <div class="col-lg-3">
                    <div class="panel panel-red indicadores">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-envelope fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><?=num_format($cant_mensajes)?></div>
                                    <div>Mensajes!</div>
                                </div>
                            </div>
                        </div>
                        <a href="<?=base_url()?>index.php/mensajes/">
                            <div class="panel-footer">
                                <span class="pull-left">Ver Detalles</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
				
				
				<?
                if(in_array("comentarios", $mod)){
				?>
        
                <div class="col-lg-3">
                    <div class="panel panel-primary indicadores">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-comments fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><?=num_format($cant_comentarios)?></div>
                                    <div>Comentarios!</div>
                                </div>
                            </div>
                        </div>
                        <a href="<?=base_url()?>index.php/comentarios/">
                            <div class="panel-footer">
                                <span class="pull-left">Ver Detalle</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <?
				}
				?>
                
                
                
                
                
                
                <?
                if(in_array("pedidos", $mod)){
				?>
                <div class="col-lg-3">
                    <div class="panel panel-yellow indicadores">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-shopping-cart fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">124</div>
                                    <div>Pedidos!</div>
                                </div>
                            </div>
                        </div>
                        <a href="<?=base_url()?>index.php/pedidos/">
                            <div class="panel-footer">
                                <span class="pull-left">Ver Detalles</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <?
                }
				?>
               
               
               
                
                
                <?
                if(in_array("preguntas", $mod)){
				?>
                <div class="col-lg-3">
                    <div class="panel panel-info indicadores">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-comment fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">13</div>
                                    <div>Preguntas!</div>
                                </div>
                            </div>
                        </div>
                        <a href="<?=base_url()?>index.php/preguntas/">
                            <div class="panel-footer">
                                <span class="pull-left">Ver Detalles</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <?
				}
				?>
                
                <?
                if(in_array("noticias", $mod)){
				?>
                <div class="col-lg-3">
                    <div class="panel panel-defaul indicadores">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-tasks fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><?=num_format($cant_noticias)?></div>
                                    <div>Noticias en Cola!</div>
                                </div>
                            </div>
                        </div>
                        <a href="<?=base_url()?>index.php/noticias/">
                            <div class="panel-footer">
                                <span class="pull-left">Ver Detalles</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <?
				}
				?>
                
                <?
                if(in_array("clientes", $mod)){
				?>
                <div class="col-lg-3">
                    <div class="panel panel-success indicadores">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-user fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><?=num_format($cant_clientes)?></div>
                                    <div>Clientes!</div>
                                </div>
                            </div>
                        </div>
                        <a href="<?=base_url()?>index.php/clientes/">
                            <div class="panel-footer">
                                <span class="pull-left">Ver Detalles</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
               	<?
                }
				?>
                
                
                
                <?
                if(in_array("productos", $mod)){
				?>
                <div class="col-lg-3">
                    <div class="panel panel-danger indicadores">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-barcode fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">13</div>
                                    <div>Stock Minimo!</div>
                                </div>
                            </div>
                        </div>
                        <a href="<?=base_url()?>index.php/productos/">
                            <div class="panel-footer">
                                <span class="pull-left">Ver Detalles</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
               	<?
                }
				?>
            
            </div><!-- /.row -->
            
            
            <div class="row">
                <!-- VISITAS POR MES -->
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Visitas de los ultimos 5 Meses
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div id="graf-visitas-5-meses"></div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
            </div> <!-- /.row -->
            
            
            
            
            
            <div class="row">
            
            <!-- NAVEGADORES MAS USADOS --> 
            
            <div class="col-lg-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Navegadores mas Usados
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="flot-chart">
                            <div class="flot-chart-content" id="graf-navegadores-usados"></div>
                        </div>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
                
                
                
             <!-- PLATAFORMAS MAS USADOS --> 
            
            <div class="col-lg-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Plataformas mas Usadas
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="flot-chart">
                            <div class="flot-chart-content" id="graf-plataformas-usadas"></div>
                        </div>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
                
                
                <!-- DISPOSITIVOS --> 
            <div class="col-lg-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Dispositivos Usados
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="flot-chart">
                            <div class="flot-chart-content" id="graf-dispositivos"></div>
                        </div>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div> 
            
            
            
         </div> <!-- /.row -->
         
         
         
         <div class="row">
         

            
            
            
            <!-- PAISES VISITANTES -->
            <div class="col-lg-8">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Visitas por País
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div id="graf-paises"></div>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            
         </div><!-- /.row -->
         
         
         
         
         
         
        
<?
close_page();
?>

 <!-- MORRIS JS-->
 <script src="<?=base_url()?>bower_components/raphael/raphael-min.js"></script>
 <script src="<?=base_url()?>bower_components/morrisjs/morris.min.js"></script>
    
    
    
    <script>
	
		// VISITAS POR MES
	
		$(function() {
			
			 Morris.Area({
				element: 'graf-visitas-5-meses',
				data: [
				<?
				$i=1;
				foreach($vis_men as $vm){
					?>
					{
						y: '<?=$vm->fecha?>',
						visitas: <?=$vm->cantidad?>
					}
					<?	
					if($i < count($vis_men)){
						?>
						,
						<?	
					}
					$i++;	
				}
				?>
				],
				xkey: ['y'],
				ykeys: ['visitas'],
				labels: ['Visitas'],
				pointSize: 5,
				hideHover: 'auto',
				resize: true
			});
			
			
			
			
			
			
			
			
			
			
			
			// VISITAS POR PAISES
			
			Morris.Bar({
				element: 'graf-paises',
				data: [
				<?
				$i=1;
				foreach($paises_vis as $pv){
					?>
					{
						y: '<?=$pv->nombre?>',
						a: <?=$pv->cantidad?>
					}
					<?	
					if($i < count($paises_vis)){
						?>
						,
						<?	
					}
					$i++;	
				}
				?>
				],
				xkey: 'y',
				ykeys: ['a'],
				labels: ['Visitas'],
				hideHover: 'auto',
				resize: true
			});
			
			
			
			
			
		
		});
	
	</script>
    
    <!-- Flot Charts JavaScript -->
    <script src="<?=base_url()?>bower_components/flot/excanvas.min.js"></script>
    <script src="<?=base_url()?>bower_components/flot/jquery.flot.js"></script>
    <script src="<?=base_url()?>bower_components/flot/jquery.flot.pie.js"></script>
    <script src="<?=base_url()?>bower_components/flot/jquery.flot.resize.js"></script>
    <script src="<?=base_url()?>bower_components/flot/jquery.flot.time.js"></script>
    <script src="<?=base_url()?>bower_components/flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
    
    
    <script>
	
		//NAVEGADORES MAS USADOS
			$(function() {
				var data =[
				<?
				$i=1;
				foreach($navegadores as $nav){
					?>
					{
					label: "<?=$nav->nombre?>",
					data: <?=$nav->cantidad?>
					}					
					<?
					if($i < count($navegadores)){
						?>
						,
						<?	
					}
					$i++;	
				}
				?>
				];
			
				var plotObj = $.plot($("#graf-navegadores-usados"), data, {
					series: {
						pie: {
							show: true
						}
					},
					grid: {
						hoverable: true
					},
					tooltip: true,
					tooltipOpts: {
						content: "%p.0%, %s", // show percentages, rounding to 2 decimal places
						shifts: {
							x: 20,
							y: 0
						},
						defaultTheme: false
					}
				});
			
			});
			
			
			//PLATAFORMAS MAS USADAS
			$(function() {
				var data =[
				<?
				$i=1;
				foreach($plataformas as $pla){
					?>
					{
					label: "<?=$pla->nombre?>",
					data: <?=$pla->cantidad?>
					}					
					<?
					if($i < count($plataformas)){
						?>
						,
						<?	
					}
					$i++;	
				}
				?>
				];
			
				var plotObj = $.plot($("#graf-plataformas-usadas"), data, {
					series: {
						pie: {
							show: true
						}
					},
					grid: {
						hoverable: true
					},
					tooltip: true,
					tooltipOpts: {
						content: "%p.0%, %s", // show percentages, rounding to 2 decimal places
						shifts: {
							x: 20,
							y: 0
						},
						defaultTheme: false
					}
				});
			
			});
			
			
			
			
			
			
			
			
			
			
			//DISPOSITIVOS
			$(function() {
				var data =[
				<?
				$i=1;
				foreach($dispositivos as $dis){
					if($dis->nombre == ''){
						$dis->nombre = "PC/Laptop";	
					}
					?>
					{
					label: "<?=$dis->nombre?>",
					data: <?=$dis->cantidad?>
					}					
					<?
					if($i < count($dispositivos)){
						?>
						,
						<?	
					}
					$i++;	
				}
				?>
				];
			
				var plotObj = $.plot($("#graf-dispositivos"), data, {
					series: {
						pie: {
							show: true
						}
					},
					grid: {
						hoverable: true
					},
					tooltip: true,
					tooltipOpts: {
						content: "%p.0%, %s", // show percentages, rounding to 2 decimal places
						shifts: {
							x: 20,
							y: 0
						},
						defaultTheme: false
					}
				});
			
			});
			
	
	</script>
    