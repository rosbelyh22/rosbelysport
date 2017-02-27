
<div class="modal fade" id="model_del_cat_obras" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="redirect('obras')">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Eliminar Categoria de obra</h4>
            </div>
            <div class="modal-body">
                ¿Realmente deseas eliminar la la categoria seleccionada? <br /><br />
				Esta categoria puede tener obras incluidas, cuentame que deseas hacer con estas obras:<br />
                <select name="que_hacer_obras" id="que_hacer_obras" class="form-control">
                <option value="0">No hacer nada y eliminarlas</option>
                <?
                	foreach($list_categorias as $lic){
						?>
						<option value="<?=$lic->id?>">Pasar las obras a la categoria "<?=$lic->nombre?>"</option>
						<?	
					}
				?>
                </select><br />
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="redirect('obras')">No</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="del_cat_pro()">Si, Eliminar</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>




	<?php 
	$btn = array(array("name" => "btn-agregar-categorias",
						"id" => "btn-agregar-categorias",
						"value" => "Agregar Categoria de Obra",
						"url" => base_url()."index.php/obras/agregar"),
				array("name" => "btn-agregar-obras",
						"id" => "btn-agregar-obras",
						"value" => "Agregar obra",
						"url" => base_url()."index.php/obras/agregar_obra"));
	open_page($title, "globe", $btn);
	?>


	<input type="hidden" name="id_eliminar" id="id_eliminar">
	<div class="dataTable_wrapper table-responsive">
	<table class="table table-striped table-bordered table-hover" id="datatable">
    <thead>
    	<tr>
        <th>Imagen</th>
        <th>obras</th>
        <th>Padre</th>
        <th>Nombre Ingles</th>
        <th>Nombre Español</th>
        <th>Tags</th>
        <th>Descripcion Ingles</th>
        <th>Descripcion Español</th>
        <th>Status</th>
        <th>Acciones</th>
    </thead>
    <tbody>
    	<?
        foreach($list_categorias as $lc){
			?>
			<tr>
                <td align="center">
                <?
                if($lc->imagen != ''){
					?>
					<img src="<?=base_url()?>files/categoria_obra/<?=$lc->imagen?>" class="img-reponsive img-circle" style="width:50px; height:50px;">
					<?	
				}else{
					echo "N/A";	
				}
				?>
                </td>
                <td align="center"><a href="<?=base_url()?>index.php/obras/lista_obras/<?=$lc->id?>" title="Listado de obras">
                Ver obras
                </a></td>
                <td>
                <?
                if($lc->nombre_padre != ""){
					echo $lc->nombre_padre;	
				}else{
					echo "N/A";	
				}
				?></td>
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
                        	<a href="<?=base_url()?>index.php/obras/editar/<?=$lc->id?>" title="Editar">
                            	<span class="glyphicon glyphicon-edit"></span>
                            </a>
                        </li>
                        
                        <li>
                        	<a href="javascript:;" data-toggle="modal" data-target="#model_del_cat_obras" title="Eliminar" onclick="$('#id_eliminar').val('<?=$lc->id?>'), quitarOption('<?=$lc->id?>', 'que_hacer_obras')">
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
    </div><br />
    
    
    
   <? close_page(); ?>


<script src="<?=base_url()?>js/script_obras.js"></script>

<script>
	$("#datatable").dataTable();
</script>


