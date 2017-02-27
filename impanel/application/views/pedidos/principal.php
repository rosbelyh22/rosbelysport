
<div class="modal fade" id="model_del_pedido" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="redirect('pedidos')">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Eliminar Pedido</h4>
            </div>
            <div class="modal-body">
                ¿Realmente deseas eliminar este pedido seleccionado? <br /><br />
				
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="redirect('pedidos')">No</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="del_pedido()">Si, Eliminar</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>




	<?php 
						
	open_page($title, "shopping-cart ");
	?>


	<input type="hidden" name="id_eliminar" id="id_eliminar">
	<div class="dataTable_wrapper table-responsive">
	<table class="table table-striped table-bordered table-hover" id="datatable">
    <thead>
    	<tr>
        <th>Detalles</th>
	<th>Cliente</th>
        <th>Numero de Pedido</th>
<!--        <th>Metodo de Pago</th>-->
        <th>Fecha</th>
        <th>Status</th>
        <th>Acciones</th>
    </thead>
    <tbody>
    	
	 	<?php
        	foreach($list_pedidos as $lc){
		?>
        	
			<tr>
               <td align="center">
               		<a href="<?=base_url()?>index.php/pedidos/ficha/<?=$lc->idpedido?>" title="Datos del Pedido">
                   		<span class="fa  fa-search-plus" style="font-size:18px;"></span>
                    </a>
                </td>
                <td><a href="#" title="Editar">
                             <?=$lc->nombre?>
                            </a></td>
                <td><?=$lc->codigo_pedido?></td>
    <!--               	<td><?=$lc->nombre_metodo?></td>-->
                <td><?=$lc->fechacreacion?></td>
                <td>
				<?php
			
                            if($lc->estatus_pedido == '0'){
					$nombre = "Procesado";
					$class = "info";
					$color = "#F00";
					$title = "Bloquear";
				}else if($lc->estatus_pedido == '1'){
					$nombre = "Enviado";
					$class = "warning";
					$color = "#093";
					$title = "Activar";
				}
				else if($lc->estatus_pedido == '2'){
					$nombre = "Inhabilitado";
					$class = "danger";
					$color = "#093";
					$title = "Activar";
				}
				else if($lc->estatus_pedido == '3'){
					$nombre = "Entregado";
					$class = "success";
					$color = "#093";
					$title = "Activar";
				}
				?>
                <div class="alert alert-<?=$class?> div-status"><?=$nombre?></div>
                </td>
                <td class="td-acciones">
                	<ul class="ul-acciones">
                    	<li>
                        	<a href="<?=base_url()?>index.php/pedidos/editar/<?=$lc->idpedido?>" title="Editar">
                            	<span class="glyphicon glyphicon-edit"></span>
                            </a>
                        </li>
<!--                        <li>
                        	<a href="javascript:;" data-toggle="modal" data-target="#model_del_pedido" title="Eliminar" onclick="$('#id_eliminar').val('<?=$lc->idpedido?>'), quitarOption('<?=$lc->idpedido?>')">
                            	<span class="glyphicon glyphicon-remove"></span>
                            </a>
                        </li>-->
                        <li>
                        	<a href="<?=base_url()?>index.php/pedidos/seguimiento/<?=$lc->idpedido?>" title="Seguimiento">
                            	<span class="glyphicon glyphicon-eye-open"></span>
                            </a>
                        </li>
                    </ul>
                </td>
			<?php	
		}
		?>
    </tbody>
    </table>
    </div>
    
   <?php close_page(); ?>


<script src="<?=base_url()?>js/script_pedidos.js"></script>

<script>
	$("#datatable").dataTable();
</script>


