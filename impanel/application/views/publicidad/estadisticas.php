	<?php 
	$btn = array(array("name" => "btn-imprimir",
				"id" => "btn-imprimir",
				"value" => "Imprimir",
				"url" => "javascript:window.print()"));
	open_page($title, "bar-chart-o", $btn);
	?>



	
	<div class="row">
    	<div class="col-sm-12">
        	<div class="panel panel-default">
                <div class="panel-heading">
                    Promedio de Clic en los ultimos 5 Meses
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div id="graf-clic-5-meses">
                    <?
                    if(count($clic_men) == 0){
						?>
						<center>Aun no se han recolectado datos para este anuncio</center>
						<?	
					}
					?>
                    
                    </div>
                </div>
                <!-- /.panel-body -->
            </div>
        </div>
    </div>
    
    
    <div class="row">
    	<div class="col-sm-12">
        	<div class="panel panel-default">
                <div class="panel-heading">
                    Promedio de Impresiones en los ultimos 5 Meses
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div id="graf-impresiones-5-meses">
                    <?
                    if(count($impresiones_men) == 0){
						?>
						<center>Aun no se han recolectado datos para este anuncio</center>
						<?	
					}
					?>
                    </div>
                </div>
                <!-- /.panel-body -->
            </div>
        </div>
    </div>
    
    
    <div class="row">
    	<div class="col-lg-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Impresiones por Paises
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="flot-chart">
                        <div class="flot-chart-content" id="graf-impresiones-paises">
                        <?
						if(count($impresiones_paises) == 0){
							?>
							<center>Aun no se han recolectado datos para este anuncio</center>
							<?	
						}
						?>
                        </div>
                    </div>
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div> 
            
         <div class="col-lg-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Clic por Paises
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="flot-chart">
                        <div class="flot-chart-content" id="graf-clic-paises">
                        <?
						if(count($clic_paises) == 0){
							?>
							<center>Aun no se han recolectado datos para este anuncio</center>
							<?	
						}
						?>
                        
                        </div>
                    </div>
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div> 
    </div>
	
    <input type="button" name="btn-regresar" id="btn-regresar" value="Regresar" class="btn btn-warning">
    <br>
    
    
   <? close_page(); ?>


<script src="<?=base_url()?>js/script_publicidad.js"></script>
 <!-- MORRIS JS-->
 <script src="<?=base_url()?>bower_components/raphael/raphael-min.js"></script>
 <script src="<?=base_url()?>bower_components/morrisjs/morris.min.js"></script>
 
 <script>
 
 $(function(){
	
	 Morris.Area({
		element: 'graf-clic-5-meses',
		data: [
		<?
		$i=1;
		foreach($clic_men as $cm){
			?>
			{
				y: '<?=$cm->fecha?>',
				clic: <?=$cm->cantidad?>
			}
			<?	
			if($i < count($clic_men)){
				?>
				,
				<?	
			}
			$i++;	
		}
		?>
		],
		xkey: ['y'],
		ykeys: ['clic'],
		labels: ['Clic'],
		pointSize: 5,
		hideHover: 'auto',
		resize: true
	});
	
	
	Morris.Area({
		element: 'graf-impresiones-5-meses',
		data: [
		<?
		$i=1;
		foreach($impresiones_men as $im){
			?>
			{
				y: '<?=$im->fecha?>',
				impresiones: <?=$im->cantidad?>
			}
			<?	
			if($i < count($impresiones_men)){
				?>
				,
				<?	
			}
			$i++;	
		}
		?>
		],
		xkey: ['y'],
		ykeys: ['impresiones'],
		labels: ['Impresiones'],
		pointSize: 5,
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
	<?
	if(count($impresiones_paises) > 0){
	?>
		$(function() {
				var data =[
				<?
				$i=1;
				foreach($impresiones_paises as $ip){
					?>
					{
					label: "<?=$ip->nombre?>",
					data: <?=$ip->cantidad?>
					}					
					<?
					if($i < count($impresiones_paises)){
						?>
						,
						<?	
					}
					$i++;	
				}
				?>
				];
			
				var plotObj = $.plot($("#graf-impresiones-paises"), data, {
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
			
	<?
	}
	
	if(count($clic_paises) > 0){
	?>		
			
			
	$(function() {
				var data =[
				<?
				$i=1;
				foreach($clic_paises as $cp){
					?>
					{
					label: "<?=$cp->nombre?>",
					data: <?=$cp->cantidad?>
					}					
					<?
					if($i < count($clic_paises)){
						?>
						,
						<?	
					}
					$i++;	
				}
				?>
				];
			
				var plotObj = $.plot($("#graf-clic-paises"), data, {
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
		<?
	}
		?>
	</script>



