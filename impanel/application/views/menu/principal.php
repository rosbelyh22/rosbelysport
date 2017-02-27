<?php
load_modal("model_del_menu", 
			"Eliminar Menu", 
			"¿Realmente deseas eliminar el menu seleccionado?", 
			"del_menu()");
?>




	<?php 
	$btn = array(array("name" => "btn-agregar-menu",
				"id" => "btn-agregar-menu",
				"value" => "Agregar Menu",
				"url" => base_url()."index.php/menu/agregar"));
	open_page($title, "list-alt", $btn);
	?>


	<input type="hidden" name="id_eliminar" id="id_eliminar">
	<div class="dataTable_wrapper table-responsive">
	<table class="table table-striped table-bordered table-hover" id="datatable">
    <thead>
    	<tr>
        <th>Nombre Ingles</th>
        <th>Nombre Español</th>
        <th>Padre</th>
        <th>Tipo</th>
        <th>Relación</th>
        <th>Posición</th>
        <th>Status</th>
        <th>Acciones</th>
    </thead>
    <tbody>
    	<?php
        foreach($list_menu as $m){
			?>
			<tr>
                <td><?=$m->nombre?></td>
                 <td><?=$m->nombre_espanol?></td>
                <td>
                <?php
                if($m->nombre_padre == ''){
					echo "N/A";	
				}else{
					echo $m->nombre_padre;
				}
				?>
                </td>
                <td><?=$m->nombre_tipo?></td>
                <td>
				<?php
				if($m->url != ''){
					echo $m->url;
				}else{
					if($m->idrelacion != '0' and $m->idrelacion != '999'){
						$CI = & get_instance();
						$CI->load->database();
						$CI->db->select("".$m->campo." as nombre_relacion");
						$CI->db->where("id", $m->idrelacion);
						$CI->db->from($m->tabla);
						$ci_get = $CI->db->get();
						$ci_res = $ci_get->result();
						echo $ci_res[0]->nombre_relacion;
					}else if($m->idrelacion == '999'){
						echo "Todas";
					}else{
						echo "N/A";	
					}
				}
				?></td>
                <td><?=$m->posicion?></td>
                <td>
				<?php
                if($m->status == '0'){
					$nombre = "Activo";
					$class = "success";
					$color = "#F00";
					$title = "Bloquear";
				}else if($m->status == '1'){
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
                        	<a href="<?=base_url()?>index.php/menu/editar/<?=$m->id?>" title="Editar">
                            	<span class="glyphicon glyphicon-edit"></span>
                            </a>
                        </li>
                        <li>
                        	<a href="javascript:;" onclick="block_menu('<?=$m->id?>', '<?=$title?>')" title="<?=$title?>">
                            	<span class="glyphicon glyphicon-lock" style="color:<?=$color?>"></span>
                            </a>
                        </li>
                        <li>
                        	<a href="javascript:;" data-toggle="modal" data-target="#model_del_menu" title="Eliminar" onclick="$('#id_eliminar').val('<?=$m->id?>')">
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
    
    
    
   <?php close_page(); ?>


<script src="<?=base_url()?>js/script_menu.js"></script>

<script>
	$("#datatable").dataTable();
</script>


