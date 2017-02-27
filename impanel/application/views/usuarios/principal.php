<?
load_modal("model_del_user", 
			"Eliminar Usuario", 
			"¿Realmente deseas eliminar el usuario seleccionado?", 
			"del_user()");
?>




	<?php 
	$btn = array(array("name" => "btn-agregar-usuarios",
				"id" => "btn-agregar-usuarios",
				"value" => "Agregar Usuario",
				"url" => base_url()."index.php/usuarios/agregar"));
	open_page($title, "user", $btn);
	?>


	<input type="hidden" name="id_eliminar" id="id_eliminar">
	<div class="dataTable_wrapper table-responsive">
	<table class="table table-striped table-bordered table-hover" id="datatable">
    <thead>
    	<tr>
        <th>Imagen</th>
        <th>Nombre</th>
        <th>Cargo</th>
        <th>Email</th>
        <th>Teléfono</th>
        <th>Status</th>
        <th>Acciones</th>
    </thead>
    <tbody>
    	<?
        foreach($list_user as $lu){
			?>
			<tr>
            	<td align="center">
                <?
                if($lu->imagen != ''){
				?>
                
                <div class="img-circle" style="background:url(<?=base_url()?>files/perfil/<?=$lu->imagen?>) center no-repeat; background-size:contain; width:50px; height:50px; border:#CCC solid 1px;"></div>
                <?
				}else{
					echo "N/A";	
				}
				?>
                </td>
                <td><?=$lu->nombre?></td>
                <td><?=$lu->cargo?></td>
                <td><?=$lu->email?></td>
                <td><?=$lu->telefono?></td>
                <td>
				<?
                if($lu->status == '0'){
					$nombre = "Activo";
					$class = "success";
					$color = "#F00";
					$title = "Bloquear";
				}else if($lu->status == '1'){
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
                        	<a href="<?=base_url()?>index.php/usuarios/editar/<?=$lu->id?>" title="Editar">
                            	<span class="glyphicon glyphicon-edit"></span>
                            </a>
                        </li>
                        <li>
                        	<a href="javascript:;" onclick="block_user('<?=$lu->id?>', '<?=$title?>')" title="<?=$title?>">
                            	<span class="glyphicon glyphicon-lock" style="color:<?=$color?>"></span>
                            </a>
                        </li>
                        <li>
                        	<a href="javascript:;" data-toggle="modal" data-target="#model_del_user" title="Eliminar" onclick="$('#id_eliminar').val('<?=$lu->id?>')">
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


<script src="<?=base_url()?>js/script_usuarios.js"></script>

<script>
	$("#datatable").dataTable();
</script>


