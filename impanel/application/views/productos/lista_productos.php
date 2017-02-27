<?
load_modal("model_del_producto", 
			"Eliminar Producto", 
			"¿Realmente deseas eliminar el producto seleccionado?", 
			"del_pro()");
?>



	<?php 
	$btn = array(array("name" => "btn-agregar-categorias",
						"id" => "btn-agregar-categorias",
						"value" => "Agregar Categoria de Producto",
						"url" => base_url()."index.php/productos/agregar"),
				array("name" => "btn-agregar-productos",
						"id" => "btn-agregar-productos",
						"value" => "Agregar Producto",
						"url" => base_url()."index.php/productos/agregar_producto"));
	open_page($title, "globe", $btn);
	?>

	<input type="hidden" name="idcategoria" id="idcategoria" value="<?=$categoria[0]->id?>">
	<input type="hidden" name="id_eliminar" id="id_eliminar">
	<div class="dataTable_wrapper table-responsive">
	<table class="table table-striped table-bordered table-hover" id="datatable">
    <thead>
    	<tr>
        <th>Galeria</th>
        <th>Codigo</th>
        <th>Nombre Ingles</th>
        <th>Nombre Español</th>
        <th>Descripción Ingles</th>
        <th>Descripción Español</th>
        <th>Cantidad</th>
        <th>Precio</th>
        <th>Status</th>
        <th>Acciones</th>
    </thead>
    <tbody>
    	<?
        foreach($list_productos as $ln){
			?>
			<tr>
                <td align="center"><a href="<?=base_url()?>index.php/productos/galeria/<?=$ln->id?>" title="Galeria de Imagenes">
                <span class="fa fa-camera-retro " style="font-size:18px"></span>
                </a></td>
                
                <td><?=$ln->codigo?></td>
                <td><?=$ln->nombre?></td>
                <td><?=$ln->nombre_espanol?></td>
                <td><?=$ln->descripcion_breve?></td>
                <td><?=$ln->descripcion_breve_espanol?></td>
                <td><?=$ln->cantidad?></td>
                <td><?=number_format($ln->precio,2,",",".")?>Bs</td>
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
                        	<a href="javascript:;" onclick="destacar('<?=$ln->id?>', '<?=$destacar?>')" title="Destacar Producto">
                            	<span class="fa fa-star" <? if($ln->destacado == "1"){ ?> style="color:#FC0" <? }?>></span>
                            </a>
                        </li>
                        
                        <li>
                        	<a href="<?=base_url()?>index.php/productos/editar_producto/<?=$ln->id?>" title="Editar">
                            	<span class="glyphicon glyphicon-edit"></span>
                            </a>
                        </li>
                        
                        <li>
                        	<a href="javascript:;" data-toggle="modal" data-target="#model_del_producto" title="Eliminar" onclick="$('#id_eliminar').val('<?=$ln->id?>'), quitarOption('<?=$ln->id?>', 'que_hacer_productos')">
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
    <input type="button" value="Regresar al Listado de Categorias" class="btn btn-warning" onclick="location.href='<?=base_url()?>index.php/productos'">&nbsp;
    <a href="<?=base_url()?>index.php/colecciones">
    <input type="button" value="Admin. Colecciones" class="btn btn-success">
    </a>
    <br /><br />
    
    
    
   <? close_page(); ?>


<script src="<?=base_url()?>js/script_productos.js"></script>

<script>
	var table_creadas = $("#datatable").dataTable();
	table_creadas.fnSort( [ [3,'desc'] ] );
</script>
