<?
load_modal("model_del_contenido", 
			"Eliminar Contenido", 
			"¿Realmente deseas eliminar el contenido seleccionado?", 
			"del_cont()");
?>




	<?php 
	$btn = array(array("name" => "btn-agregar-contenido",
				"id" => "btn-agregar-contenido",
				"value" => "Agregar Contenido",
				"url" => base_url()."index.php/contenido/agregar"));
	open_page($title, "file-o", $btn);
	?>


	<input type="hidden" name="id_eliminar" id="id_eliminar">
	<div class="dataTable_wrapper table-responsive">
	<table class="table table-striped table-bordered table-hover" id="datatable">
    <thead>
    	<tr>
        <th>Nombre Ingles</th>
        <th>Nombre Español</th>
        <th>Tags</th>
        <th>Contenido Ingles</th>
        <th>Contenido Español</th>
        <th>Status</th>
        <th>Acciones</th>
    </thead>
    <tbody>
    	<?
        foreach($list_contenidos as $lc){
			?>
			<tr>
                <td><?=$lc->titulo?></td>
                <td><?=$lc->titulo_espanol?></td>
                <td><?=$lc->tags?></td>
                <td><?=character_limiter(strip_tags($lc->contenido), 30);?></td>
                <td><?=character_limiter(strip_tags($lc->contenido_espanol), 30);?></td>
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
                        	<a href="<?=base_url()?>index.php/contenido/editar/<?=$lc->id?>" title="Editar">
                            	<span class="glyphicon glyphicon-edit"></span>
                            </a>
                        </li>
                        
                        <li>
                        	<a href="javascript:;" data-toggle="modal" data-target="#model_del_contenido" title="Eliminar" onclick="$('#id_eliminar').val('<?=$lc->id?>')">
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


<script src="<?=base_url()?>js/script_contenido.js"></script>

<script>
	$("#datatable").dataTable();
</script>


