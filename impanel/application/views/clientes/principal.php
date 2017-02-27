<?
load_modal("model_del_clientes", 
			"Eliminar Cliente", 
			"¿Realmente deseas eliminar el cliente seleccionado?", 
			"del_cliente()");


load_modal("model_block_clientes", 
			"Blockear Cliente", 
			"¿Realmente deseas cambiar el status del cliente seleccionado?", 
			"block_cliente()");


?>




	<?php 
	$btn = array(array("name" => "btn-agregar-clientes",
				"id" => "btn-agregar-clientes",
				"value" => "Agregar Cliente",
				"url" => base_url()."index.php/clientes/agregar"));
	open_page($title, "user", $btn);
	?>


	<input type="hidden" name="id_eliminar" id="id_eliminar">
    <input type="hidden" name="id_block" id="id_block">
    <input type="hidden" name="titulo_block" id="titulo_block">
	<div class="dataTable_wrapper table-responsive">
	<table class="table table-striped table-bordered table-hover" id="datatable">
    <thead>
    	<tr>
        <th>Nombre</th>
        <th>Pais</th>
        <th>Estado</th>
        <th>Telefono</th>
        <th>Email</th>
        <th>Dirección</th>
        <th>Status</th>
        <th>Acciones</th>
    </thead>
    <tbody>
    	<?
        foreach($list_clientes as $lc){
			?>
			<tr>
                <td><?=$lc->nombre?></td>
                <td><?=$lc->pais?></td>
                <td><?=$lc->estado?></td>
                <td><?=$lc->telefono?></td>
                <td><?=$lc->email?></td>
                <td><?=$lc->direccion?></td>
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
                        	<a href="<?=base_url()?>index.php/clientes/editar/<?=$lc->id?>" title="Editar">
                            	<span class="glyphicon glyphicon-edit"></span>
                            </a>
                        </li>
                        <li>
                        	<a href="javascript:;" data-toggle="modal" data-target="#model_block_clientes" title="<?=$title?>" onclick="$('#id_block').val('<?=$lc->id?>'); $('#titulo_block').val('<?=$title?>')">
                            	<span class="glyphicon glyphicon-lock" style="color:<?=$color?>"></span>
                            </a>
                        </li>
                        <li>
                        	<a href="javascript:;" data-toggle="modal" data-target="#model_del_cliente" title="Eliminar" onclick="$('#id_eliminar').val('<?=$lc->id?>')">
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


<script src="<?=base_url()?>js/script_clientes.js"></script>

<script>
	$("#datatable").dataTable();
</script>


