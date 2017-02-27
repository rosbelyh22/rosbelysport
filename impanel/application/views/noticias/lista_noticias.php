<?
load_modal("model_del_noticia", 
			"Eliminar Noticia", 
			"¿Realmente deseas eliminar la noticia seleccionada?", 
			"del_not()");
?>



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

	<input type="hidden" name="idcategoria" id="idcategoria" value="<?=$categoria[0]->id?>">
	<input type="hidden" name="id_eliminar" id="id_eliminar">
	<div class="dataTable_wrapper table-responsive">
	<table class="table table-striped table-bordered table-hover" id="datatable">
    <thead>
    	<tr>
        <th>Galeria</th>
        <th>Titulo</th>
        <th>Titulo Español</th>
        <th>Fecha Creación</th>
        <th>Fecha Publicación</th>
        <th>Usuario</th>
        <th>Status</th>
        <th>Acciones</th>
    </thead>
    <tbody>
    	<?
        foreach($list_noticias as $ln){
			?>
			<tr>
                <td align="center"><a href="<?=base_url()?>index.php/noticias/galeria/<?=$ln->id?>" title="Galeria de Imagenes">
                <span class="fa fa-camera-retro " style="font-size:18px"></span>
                </a></td>
                
                <td><?=$ln->titulo?></td>
                <td><?=$ln->titulo_espanol?></td>
               	<td>
				<?
                $unix = mysql_to_unix($ln->fecha_creacion);
				echo unix_to_human($unix);
				?>
                </td>
                <td>
                <?
                $unix = mysql_to_unix($ln->fecha_publicacion);
				echo unix_to_human($unix);
				?>
                </td>
                <td><?=$ln->nombre_usuario?></td>
                <td>
				<?
                if($ln->status == '0'){
					$nombre = "Activo";
					$class = "success";
					$color = "#F00";
					$title = "Bloquear";
				}else if($ln->status == '1'){
					$nombre = "Inactivo";
					$class = "danger";
					$color = "#093";
					$title = "Activar";
				}
				
				if($ln->destacado == "0"){
					$destacar = "destacar";	
				}else{
					$destacar = "nodestacar";	
				}
				?>
                <div class="alert alert-<?=$class?> div-status"><?=$nombre?></div>
                </td>
                <td class="td-acciones">
                	<ul class="ul-acciones">
                    	
                        <li>
                        	<a href="javascript:;" onclick="destacar('<?=$ln->id?>', '<?=$destacar?>')" title="Destacar Noticia">
                            	<span class="fa fa-star" <? if($ln->destacado == "1"){ ?> style="color:#FC0" <? }?>></span>
                            </a>
                        </li>
                        
                        <li>
                        	<a href="<?=base_url()?>index.php/noticias/editar_noticia/<?=$ln->id?>" title="Editar">
                            	<span class="glyphicon glyphicon-edit"></span>
                            </a>
                        </li>
                        
                        <li>
                        	<a href="javascript:;" data-toggle="modal" data-target="#model_del_noticia" title="Eliminar" onclick="$('#id_eliminar').val('<?=$ln->id?>'), quitarOption('<?=$ln->id?>', 'que_hacer_noticias')">
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
    <br />
    <input type="button" value="Regresar al Listado de Categorias" class="btn btn-warning" onclick="location.href='<?=base_url()?>index.php/noticias'">
    <br /><br />
    
    
    
   <? close_page(); ?>


<script src="<?=base_url()?>js/script_noticias.js"></script>

<script>
	var table_creadas = $("#datatable").dataTable();
	table_creadas.fnSort( [ [3,'desc'] ] );
</script>
