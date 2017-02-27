<?
load_modal("model_del_publicidad", 
			"Eliminar Publicidad", 
			"¿Realmente deseas eliminar el anuncio publicitario seleccionado?", 
			"del_publicidad()");
?>




	<?php 
	$btn = array(array("name" => "btn-agregar-publicidad",
				"id" => "btn-agregar-publicidad",
				"value" => "Agregar Anuncio",
				"url" => base_url()."index.php/publicidad/agregar"));
	open_page($title, "external-link-square", $btn);
	?>


	<input type="hidden" name="id_eliminar" id="id_eliminar">
    <input type="hidden" name="archivo_eliminar" id="archivo_eliminar">
	<div class="dataTable_wrapper table-responsive">
	<table class="table table-striped table-bordered table-hover" id="datatable">
    <thead>
    	<tr>
        <th>Ver</th>
        <th>Nombre</th>
        <th>URL</th>
        <th>Cliente</th>
        <th>Posición</th>
        <th>Sección</th>
        <th>Status</th>
        <th>Acciones</th>
    </thead>
    <tbody>
    	<?
        foreach($list_publicidad as $lp){
			?>
            <div class="modal fade" id="ver_publicidad_<?=$lp->id?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel"><?=$lp->nombre?></h4>
                        </div>
                        <div class="modal-body">
                            <center>
                            <img src="<?=base_url()?>files/publicidad/<?=$lp->archivo?>" style="max-width:250px;" class="img-responsive">
                            </center>
                            <br /><br />
                            
                            <div class="row">
                                <div class="form-group col-sm-6">
                                    <label>URL de redirección</label><br />
                                    <?=$lp->url?>
                                </div>
                                <div class="form-group col-sm-6">
                                    <label>Nombre</label><br />
                                    <?=$lp->nombre?>
                                </div>
                                <div class="form-group col-sm-12">
                                    <label>Descripción</label><br />
                                    <?=$lp->descripcion?>
                                </div>
                            </div>
                            
                            
                            <div class="row">
                                <div class="form-group col-sm-6">
                                    <label>Nombre del Cliente</label><br />
                                    <?=$lp->nombre_cliente?>
                                </div>
                                <div class="form-group col-sm-6">
                                    <label>Datos Contacto Cliente</label><br />
                                    <?=$lp->telefono_cliente?>
                                </div>
                            </div>
                            
                            
                            
                            <div class="row">
                                <div class="form-group col-sm-6">
                                    <label>Posición del Anuncio</label><br />
                                    <?
									switch($lp->posicion){
										case "0":
											echo "Centro";
										break;
										case "1":
											echo "Izquierda";
										break;
										case "2":
											echo "Derecha";
										break;	
									}
									?>
                                </div>
                                <div class="form-group col-sm-6">
                                    <label>Secciones</label><br />
                                    <?
                                    
									switch($lp->secciones){
										case "0":
											echo "Todas";
										break;
										case "1":
											echo "Inicio";
										break;
										case "2":
											echo "Internas";
										break;	
									}
									
									?>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-sm-6">
                                    <label>Cantidad maxima de impresiones</label><br />
                                    <?
                                    if($lp->cantidad_impresiones == '0'){
										echo "Sin definir";	
									}else{
										echo $lp->cantidad_impresiones;	
									}
									?>
                                </div>
                                <div class="form-group col-sm-6">
                                    <label>Cantidad maxima de Clic</label><br />
                                    <?
                                    if($lp->cantidad_clic == '0'){
										echo "Sin Definir";	
									}else{
										echo $lp->cantidad_clic;	
									}
									?>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-sm-6">
                                    <label>Fecha de Inicio</label><br />
                                    <?=$lp->fecha_inicio?>    
                                </div>
                                <div class="form-group col-sm-6">
                                    <label>Fecha Fin</label><br />
                                    <?
                                    if($lp->fecha_fin == '0000-00-00'){
										echo "Sin definir";	
									}else{
										echo $lp->fecha_fin;	
									}
									
									?>
                                </div>
                            </div>
                            
                            
                        </div>
                        <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
						</div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
			<tr>
                <td align="center">
                <a data-toggle="modal" data-target="#ver_publicidad_<?=$lp->id?>" href="javascript:;">
                	<span class="fa  fa-search-plus" style="font-size:18px;"></span>
                </a>
                </td>
                <td><?=$lp->nombre?></td>
                <td><a href="<?=$lp->url?>" target="_blank"><?=$lp->url?></a></td>
                <td><?=$lp->nombre_cliente." - ".$lp->telefono_cliente?></td>
                <td>
                <?
                switch($lp->posicion){
					case "0":
						echo "Centro";
					break;
					case "1":
						echo "Izquierda";
					break;
					case "2":
						echo "Derecha";
					break;	
				}
				?></td>
                <td>
                <?
                switch($lp->secciones){
					case "0":
						echo "Todas";
					break;
					case "1":
						echo "Inicio";
					break;
					case "2":
						echo "Internas";
					break;	
				}
				?></td>
                
                <td>
				<?
                if($lp->status == '0'){
					$nombre = "Activo";
					$class = "success";
					$color = "#F00";
					$title = "Bloquear";
				}else if($lp->status == '1'){
					$nombre = "Inactivo";
					$class = "danger";
					$color = "#093";
					$title = "Activar";
				}
				?>
                <div class="alert alert-<?=$class?> div-status"><?=$nombre?></div>
                </td>
                <td class="td-acciones">
                	<ul class="ul-acciones">
                    	<li>
                        	<a href="<?=base_url()?>index.php/publicidad/estadisticas/<?=$lp->id?>" title="Estadisticas">
                            	<span class="fa fa-bar-chart-o "></span>
                            </a>
                        </li>
                        <li>
                        	<a href="<?=base_url()?>index.php/publicidad/editar/<?=$lp->id?>" title="Editar">
                            	<span class="glyphicon glyphicon-edit"></span>
                            </a>
                        </li>
                        <li>
                        	<a href="javascript:;" onclick="block_publicidad('<?=$lp->id?>', '<?=$title?>')" title="<?=$title?>">
                            	<span class="glyphicon glyphicon-lock" style="color:<?=$color?>"></span>
                            </a>
                        </li>
                        <li>
                        	<a href="javascript:;" data-toggle="modal" data-target="#model_del_publicidad" title="Eliminar" onclick="$('#id_eliminar').val('<?=$lp->id?>'), $('#archivo_eliminar').val('<?=$lp->archivo?>')">
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


<script src="<?=base_url()?>js/script_publicidad.js"></script>

<script>
	$("#datatable").dataTable();
</script>


