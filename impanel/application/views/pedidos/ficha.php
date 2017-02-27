<?php 
open_page($title, "user");
?>

	
    
    
    <?php
    	open_panel(array(),"");
		
	?>
   	<?php 
	 foreach($list_pedidos as $lp){
 	?>
    
     <div class="alert alert-success"> DATOS DEL PEDIDO DEL CLIENTE	 </div>
		<div class="row">
       		<div class="form-group col-sm-6">
                <label>Metodo de Pago:</label> <br /> 
				<?=$lp->metodo_pago?>  
            </div>
<!--            <div class="form-group col-sm-6">
             	 <img src="<?=base_url()?>index.php/barcode/getBarcode/<?=$lp->codigo_pedido?>">
            </div>-->
            <div class="form-group col-sm-6">
                <label>Numero del Pedido:</label>  <br />
                  <?=$lp->codigo_pedido?>
               
            </div>
            
         </div>
         
      	<div class="row">
            <div class="form-group col-sm-6">
                <label>Nombre del Remitente:</label>  <br />
                  <?=$lp->nombre?>
                   
            </div>
            <div class="form-group col-sm-6">
             <label>Direccion del Remitente:</label>  <br />
             <?=$lp->direccion?> 
            </div>
        </div>
        <?php if ($lp->fecha_envio != 0){	?>
        <div class="row">
            <div class="form-group col-sm-6">
                <label>Codigo de Seguimiento:</label>  <br />
                  <?=$lp->codigo_seguimiento?>
               
            </div>
            <div class="form-group col-sm-6">
                <label>Empresa de Envio:</label> <br /> 
                 <?=$lp->empresa_envio?>
                
            </div>
        </div>
        <div class="row">
            <div class="form-group col-sm-6">
                <label>Fecha de Envio:</label>  <br />
                  <?=$lp->fecha_envio?>
               
            </div>
            
        </div>
        
        
     <?php } if ($lp->fecha_entrega !=0){ ?>
        <div class="row">
            <div class="form-group col-sm-6">
                <label>Observaciones de la Entrega:</label>  <br />
                  <?=$lp->observaciones?>
               
            </div>
            <div class="form-group col-sm-6">
                <label>Fecha de Entrega:</label>  <br />
                  <?=$lp->fecha_entrega?>
               
            </div>
            
        </div>
    <?php } if ($lp->fecha_inhabilitado != 0) { ?>
        <div class="row">
            <div class="form-group col-sm-6">
                <label>Motivo por el cual se inhabilito el pedido:</label>  <br />
                  <?=$lp->motivo?>
               
            </div>
            <div class="form-group col-sm-6">
                <label>Fecha:</label>  <br />
                  <?=$lp->fecha_inhabilitado?>
               
            </div>
            
        </div>
        <?php } ?>
     
    <?php	} 
  	close_panel();
  	?>     
    
    <?php 
	open_panel (array (), "");
	?>
	<div class="alert alert-success"> LISTA DE PRODUCTOS DEL CLIENTE </div>
	
    <div class="dataTable_wrapper table-responsive">
	<table class="table table-striped table-bordered table-hover" id="datatable">
    <thead>
    	<tr>
            <th>Productos</th>
            <th>Cantidad</th>
    <!--        <th>Fecha</th>-->
            <th>Precio Unitario</th>
            <th>Total</th>
<!--        <th>Status</th>-->
        
        </tr>
    </thead>
    <tbody>
    	
    <?php
    foreach($list_pedidos_productos as $lc){
    ?>
        <tr>
            <td><?=$lc->nombre?></td>
            <td><?=$lc->cantidad?></td>
            <td><?=$lc->preciounitario?></td>
<!--        <td><?=$lc->fecha?></td>-->
<!--         <td>
                <?php 
                    $cantidad=$lc->cantidad_producto;
                    $precio=$lc->precio_producto;
                    $total= $cantidad*$precio;
                    echo $total.' Bs';
                ?>
            </td>-->
            <td><?=$lc->totalproducto?></td>
<!--            <td><?=$lc->totalproducto?>
                        <?php
                         if($lc->status_pedido == '0'){
                                $nombre = "Procesado";
                                $class = "info";
                                $color = "#F00";
                                $title = "Bloquear";
                        }else if($lc->status_pedido == '1'){
                                $nombre = "Enviado";
                                $class = "warning";
                                $color = "#093";
                                $title = "Activar";
                        }
                        else if($lc->status_pedido == '2'){
                                $nombre = "Inhabilitado";
                                $class = "danger";
                                $color = "#093";
                                $title = "Activar";
                        }
                        else if($lc->status_pedido == '3'){
                                $nombre = "Entregado";
                                $class = "success";
                                $color = "#093";
                                $title = "Activar";
                        }
                        ?>
               	<div class="alert alert-<?=$class?> div-status"><?=$nombre?></div>
                </td>-->
        </tr>       
    <?php	
        } 
    ?>
    </tbody>
    </table>
    </div>
	
	<?php
  	close_panel();
  	?> 

<?php close_page(); ?>

<script src="<?=base_url()?>js/script_pedidos.js"></script>
<script>
	$("#datatable").dataTable();
</script>