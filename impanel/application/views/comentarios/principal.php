<?
load_modal("model_del_comentarios", 
			"Eliminar Comentarios", 
			"¿Realmente deseas eliminar el comentario seleccionado?", 
			"del_coment()");
			
load_modal("model_ver_comentarios", 
			"<div id='ti_ver'></div>", 
			"<div id='con_ver'></div>", 
			"solo_cerrar");
?>




	<?php 
	
	open_page($title, "comments");
	?>


	<input type="hidden" name="id_eliminar" id="id_eliminar">
	<div class="dataTable_wrapper table-responsive">
	<table class="table table-striped table-bordered table-hover" id="datatable">
    <thead>
    	<tr>
        <th>Cliente</th>
        <th>Noticia</th>
        <th>Comentario</th>
        <th>Acciones</th>
    </thead>
    <tbody>
    	<?
        foreach($list_comentarios as $lc){
			?>
			<tr>
                <td><?=$lc->nombre_cliente?></td>
                <td><?=$lc->titulo_noticia?></td>
                <td><?=character_limiter(strip_tags($lc->comentario), 30);?></td>
                <td class="td-acciones">
                <?
                $unix = mysql_to_unix($lc->fecha);
				$fecha = unix_to_human($unix);
				?>
                	<ul class="ul-acciones">
                    	<li>
                        	<a href="javascript:;" onclick="$('#ti_ver').html('Comentario de (<?=$lc->nombre_cliente?>) en (<?=$lc->titulo_noticia?>)'); $('#con_ver').html('<?=$lc->comentario?> <br><br> Publicado el <?=$fecha?>')" data-toggle="modal" data-target="#model_ver_comentarios" title="Ver mas">
                            	<span class="fa fa-search-plus "></span>
                            </a>
                        </li>
                        
                        <li>
                        	<a href="javascript:;" data-toggle="modal" data-target="#model_del_comentarios" title="Eliminar" onclick="$('#id_eliminar').val('<?=$lc->id?>')">
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


<script src="<?=base_url()?>js/script_comentarios.js"></script>

<script>
	$("#datatable").dataTable();
		
</script>


