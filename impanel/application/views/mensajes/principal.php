<link rel="stylesheet" type="text/css" href="<?=base_url()?>css/estilos_mensajes.css"/>
<?
load_modal("model_del_mensajes", 
			"Eliminar Mensajes", 
			"¿Realmente deseas eliminar el mensaje seleccionado?", 
			"del_mensaje()");
			

?>




	<?php 
	
	open_page($title, "envelope");
	?>


	<input type="hidden" name="id_eliminar" id="id_eliminar">
	<div class="dataTable_wrapper table-responsive">
	<table class="table table-striped table-bordered table-hover" id="datatable">
    <thead>
    	<tr>
        <th>Cliente</th>
        <th>Asunto</th>
        <th>Mensaje</th>
        <th>Respuesta</th>
        <th>Fecha</th>
        <th>Status</th>
        <th>Acciones</th>
    </thead>
    <tbody>
    	<?
        foreach($list_mensajes as $lm){
			?>
			<tr>
                <td>
				<?
				
				$datos_cliente = '<div class="row">
										<div class="col-sm-6 form-group">
											<h4>Teléfono</h4>
											'.$lm->telefono_cliente.'
										</div>
										<div class="col-sm-6 form-group">
											<h4>Email</h4>
											'.$lm->email_cliente.'
										</div>
									</div>
									<div class="row">
										<div class="col-sm-6 form-group">
											<h4>Pais</h4>
											'.$lm->pais_cliente.'
										</div>
										<div class="col-sm-6 form-group">
											<h4>Estado</h4>
											'.$lm->estado_cliente.'
										</div>
									</div>
									<div class="row">    
										<div class="col-sm-12 form-group">
											<h4>Dirección</h4>
											'.$lm->direccion_cliente.'
										</div>
									</div>';
				
                load_modal("model_ver_cliente_".$lm->id."", 
							$lm->nombre_cliente, 
							$datos_cliente, 
							"solo_cerrar");
				?>
				
				<a href="javascript:;" data-toggle="modal" data-target="#model_ver_cliente_<?=$lm->id?>">
				<?=$lm->nombre_cliente?>
                </a>
                
                </td>
                <td><?=$lm->asunto?></td>
                <td><?=character_limiter(strip_tags($lm->mensaje), 30);?></td>
                <td>
                <?
                if($lm->respuesta == ''){
					echo "N/A";	
				}else{
					echo character_limiter(strip_tags($lm->respuesta), 30);	
				}
				
				?></td>
                <td>
                <?
                $unix = mysql_to_unix($lm->fecha);
				$fecha = unix_to_human($unix);
				echo $fecha;
				?>
                </td>
                <td>
                <?
                if($lm->status == '0'){
					$nombre = "No Respondido";
					$class = "warning";
					$color = "#F00";
				}else if($lm->status == '1'){
					$nombre = "Respondido";
					$class = "success";
					$color = "#093";
				}
				?>
                <div class="alert alert-<?=$class?> div-status"><?=$nombre?></div>
                </td>
                <td class="td-acciones">
                
                	<ul class="ul-acciones">
                    	<?
                        if($lm->status == '0'){
						?>
                        <li>
                        	<a href="<?=base_url()?>index.php/mensajes/responder/<?=$lm->id?>" title="Responder">
                            	<span class="fa fa-mail-forward"></span>
                            </a>
                        </li>
                        <?
						}
						?>
                        
                        
                        <li>
                        	<a href="javascript:;" data-toggle="modal" data-target="#model_del_mensajes" title="Eliminar" onclick="$('#id_eliminar').val('<?=$lm->id?>')">
                            	<span class="glyphicon glyphicon-remove"></span>
                            </a>
                        </li>
                    </ul>
                </td>
			<?	
		}
		?>
    </tbody>
    </table>
    </div>
    
    
    
   <? close_page(); ?>


<script src="<?=base_url()?>js/script_mensajes.js"></script>

<script>
	
	var table_creadas = $("#datatable").dataTable();
	table_creadas.fnSort( [ [4,'desc'] ] );
</script>


