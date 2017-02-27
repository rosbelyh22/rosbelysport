
<div class="modal fade" id="model_del_cat_noticias" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="redirect('noticias')">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Eliminar Categoria de Noticia</h4>
            </div>
            <div class="modal-body">
                ¿Realmente deseas eliminar la la categoria seleccionada? <br /><br />
				Esta categoria puede tener noticias incluidas, cuentame que deseas hacer con estas noticias:<br />
                <select name="que_hacer_noticias" id="que_hacer_noticias" class="form-control">
                <option value="0">No hacer nada y eliminarlas</option>
                <?
                	foreach($list_categorias as $lic){
						?>
						<option value="<?=$lic->id?>">Pasar las noticias a la categoria "<?=$lic->nombre?>"</option>
						<?	
					}
				?>
                </select><br />
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="redirect('noticias')">No</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="del_cat_not()">Si, Eliminar</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>




	<?php 
	$btn = array(array("name" => "btn-agregar-categorias",
						"id" => "btn-agregar-categorias",
						"value" => "Agregar Categoria de Noticia",
						"url" => base_url()."index.php/noticias/agregar"),
				array("name" => "btn-agregar-noticias",
						"id" => "btn-agregar-noticias",
						"value" => "Agregar Noticia",
						"url" => base_url()."index.php/noticias/agregar_noticia"));
	open_page($title, "globe", $btn);
	?>


	<input type="hidden" name="id_eliminar" id="id_eliminar">
	<div class="dataTable_wrapper table-responsive">
	<table class="table table-striped table-bordered table-hover" id="datatable">
    <thead>
    	<tr>
        <th>Imagen</th>
        <th>Noticias</th>
        <th>Padre</th>
        <th>Nombre</th>
        <th>Tags</th>
        <th>Descripcion</th>
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
					<img src="<?=base_url()?>files/categoria_noticia/<?=$lc->imagen?>" class="img-reponsive img-circle" style="width:50px; height:50px;">
					<?	
				}else{
					echo "N/A";	
				}
				?>
                </td>
                <td align="center"><a href="<?=base_url()?>index.php/noticias/lista_noticias/<?=$lc->id?>" title="Listado de Noticias">
                Ver Noticias
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
                <td><?=$lc->tags?></td>
                <td><?=$lc->descripcion?></td>
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
                        	<a href="<?=base_url()?>index.php/noticias/editar/<?=$lc->id?>" title="Editar">
                            	<span class="glyphicon glyphicon-edit"></span>
                            </a>
                        </li>
                        
                        <li>
                        	<a href="javascript:;" data-toggle="modal" data-target="#model_del_cat_noticias" title="Eliminar" onclick="$('#id_eliminar').val('<?=$lc->id?>'), quitarOption('<?=$lc->id?>', 'que_hacer_noticias')">
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


<script src="<?=base_url()?>js/script_noticias.js"></script>

<script>
	$("#datatable").dataTable();
</script>


