<?
load_modal("model_del_slideshow", 
			"Eliminar Slideshow", 
			"¿Realmente deseas eliminar el slidehow seleccionado?", 
			"del_slide()");
?>




	<?php 
	$btn = array(array("name" => "btn-agregar-slideshow",
				"id" => "btn-agregar-slideshow",
				"value" => "Agregar Slideshow",
				"url" => base_url()."index.php/slideshow/agregar"));
	open_page($title, "camera-retro", $btn);
	?>


	<input type="hidden" name="id_eliminar" id="id_eliminar">
	<div class="dataTable_wrapper table-responsive">
	<table class="table table-striped table-bordered table-hover" id="datatable">
    <thead>
    	<tr>
        <th>Imagen</th>
        <th>Titulo</th>
        <th>Descripcion</th>
        <th>Titulo Español</th>
        <th>Descripcion Español</th>
        <th>Url Redirección</th>
        <th>Posición</th>
        <th>Status</th>
        <th>Acciones</th>
    </thead>
    <tbody>
    	<?
        foreach($list_slide as $ls){
			?>
			<tr>
                <td><img src="<?=base_url()?>files/slideshow/<?=$ls->archivo?>" class="img-responsive" style="max-width:150px;"></td>
                <td><?=$ls->titulo?></td>
                <td><?=character_limiter(strip_tags($ls->descripcion), 30);?></td>
                <td><?=$ls->titulo_espanol?></td>
                <td><?=character_limiter(strip_tags($ls->descripcion_espanol), 30);?></td>
                <td>
                <?
                if($ls->link == ""){
					echo "N/A";	
				}else{
					?>
					<a href="<?=$ls->link?>" target="_blank"><?=$ls->link?></a>	
					<?	
				}
				?>
                
                
                </td>
                <td><?=$ls->posicion?></td>
                <td>
				<?
                if($ls->status == '0'){
					$nombre = "Activo";
					$class = "success";
					$color = "#F00";
					$title = "Bloquear";
				}else if($ls->status == '1'){
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
                        	<a href="<?=base_url()?>index.php/slideshow/editar/<?=$ls->id?>" title="Editar">
                            	<span class="glyphicon glyphicon-edit"></span>
                            </a>
                        </li>
                        <li>
                        	<a href="javascript:;" onclick="block_slide('<?=$ls->id?>', '<?=$title?>')" title="<?=$title?>">
                            	<span class="glyphicon glyphicon-lock" style="color:<?=$color?>"></span>
                            </a>
                        </li>
                        <li>
                        	<a href="javascript:;" data-toggle="modal" data-target="#model_del_slideshow" title="Eliminar" onclick="$('#id_eliminar').val('<?=$ls->id?>')">
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


<script src="<?=base_url()?>js/script_slideshow.js"></script>

<script>
	$("#datatable").dataTable();
</script>


