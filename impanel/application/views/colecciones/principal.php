
<div class="modal fade" id="model_del_col_productos" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="redirect('productos')">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Eliminar Colección</h4>
            </div>
            <div class="modal-body">
                ¿Realmente deseas eliminar la colección seleccionada? <br /><br />
				Esta colección puede tener productos incluidos, cuentame que deseas hacer con estas productos:<br />
                <select name="que_hacer_productos" id="que_hacer_productos" class="form-control">
                <option value="0">No hacer nada y eliminarlas</option>
                <?
                	foreach($list_categorias as $lic){
						?>
						<option value="<?=$lic->id?>">Pasar las productos a la categoria "<?=$lic->nombre?>"</option>
						<?	
					}
				?>
                </select><br />
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="redirect('coleccion')">No</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="del_col_pro()">Si, Eliminar</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>




	<?php 
	$btn = array(array("name" => "btn-agregar-coleccion",
						"id" => "btn-agregar-coleccion",
						"value" => "Agregar Colección de Producto",
						"url" => base_url()."index.php/colecciones/agregar"));
	open_page($title, "globe", $btn);
	?>


	<input type="hidden" name="id_eliminar" id="id_eliminar">
	<div class="dataTable_wrapper table-responsive">
	<table class="table table-striped table-bordered table-hover" id="datatable">
    <thead>
    	<tr>
        <th>Imagen</th>
        <th>Nombre</th>
        <th>Nombre en Español</th>
        <th>Tags</th>
        <th>Descripcion</th>
        <th>Descripcion en Español</th>
        <th>Status</th>
        <th>Acciones</th>
    </thead>
    <tbody>
    	<?
        foreach($list_colecciones as $lc){
			?>
			<tr>
                <td align="center">
                <?
                if($lc->imagen != ''){
					?>
					<img src="<?=base_url()?>files/coleccion_producto/<?=$lc->imagen?>" class="img-reponsive img-circle" style="width:50px; height:50px;">
					<?	
				}else{
					echo "N/A";	
				}
				?>
                </td>
                <td><?=$lc->nombre?></td>
                <td><?=$lc->nombre_espanol?></td>
                <td><?=$lc->tags?></td>
                <td><?=$lc->descripcion?></td>
                <td><?=$lc->descripcion_espanol?></td>
                <td>
				<?
                if($lc->status == '0'){
					$nombre = "Activo";
					$class = "success";
					$color = "#F00";
					$title = "Bloquear";
				}else if($lc->status == '1'){
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
                        	<a href="<?=base_url()?>index.php/colecciones/editar/<?=$lc->id?>" title="Editar">
                            	<span class="glyphicon glyphicon-edit"></span>
                            </a>
                        </li>
                        
                        <li>
                        	<a href="javascript:;" data-toggle="modal" data-target="#model_del_col_productos" title="Eliminar" onclick="$('#id_eliminar').val('<?=$lc->id?>'), quitarOption('<?=$lc->id?>', 'que_hacer_productos')">
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


<script src="<?=base_url()?>js/script_colecciones.js"></script>

<script>
	$("#datatable").dataTable();
</script>


