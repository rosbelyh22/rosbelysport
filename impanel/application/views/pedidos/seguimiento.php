<?php 
open_page($title, "user");
?>
<?php 

foreach ($list_pedidos as $lp){
?>
<!----------------------Origen del Pedido--------------------------->
	<div class="panel panel-default">
<!--        <div class="panel-heading">
            Pedido: <?=$lp->nombre_producto?>
        </div>-->
        <!-- /.panel-heading -->
        <div class="panel-body">
            <ul class="timeline">
                <li>
                    <div class="timeline-badge primary"><i class="fa fa-pencil"></i>
                    </div>
                    <div class="timeline-panel">
                        <div class="timeline-heading">
                            <h4 class="timeline-title" style="color: #039">Origen del Pedido</h4>
                        </div>
                        <div class="timeline-body">
                            <div class="form-group col-sm-6">
                                <label> Fecha del Pedido</label> <br/>
                                <?=$lp->fechacreacion?>
                            </div>
                            <div class="form-group col-sm-6">
                                <label>Cod. del Pedido:</label> <br/>
                                <?=$lp->numeropedido?>
                            </div>
                        </div>
                    </div>
                </li>
<!----------------------Envio del Pedido---------------------------> 
				<?php if ($lp->fecha_envio != 0){	
				?>	                
                <li class="timeline-inverted">
                    <div class="timeline-badge warning"><i class="fa fa-plane"></i>
                    </div>
                    <div class="timeline-panel">
                        <div class="timeline-heading">
                            <h4 class="timeline-title" style="color: #C90">Envio del Pedido</h4>
                        </div>
                        <div class="timeline-body">
                          <div class="form-group col-sm-6">
                                <label> Fecha de envio:</label> <br/>
                                <?=$lp->fecha_envio?>
                            </div>
                            
                            <div class="form-group col-sm-6">
                                <label>Cod. de Seguimiento:</label> <br/>
                                <?=$lp->codigo_seguimiento?>
                            </div>
                            <div class="form-group col-sm-6">
                                <label>Direccion de Envio:</label> <br/>
                                <?=$lp->direccion_envio?>
                            </div>  
                            <div class="form-group col-sm-6">
                                <label>Empresa de Envio:</label> <br/>
                                <?=$lp->empresa_envio?>
                            </div>  
                        </div>
                    </div>
                </li>
                <?php }?>
<!----------------------Entrega del pedido--------------------------->  
				<?php if ($lp->fecha_entrega != 0) {
				?>	
                <li>
                    <div class="timeline-badge success"><i class="fa fa-check "></i>
                    </div>
                    <div class="timeline-panel">
                        <div class="timeline-heading">
                            <h4 class="timeline-title" style=" color:#060">Entrega del Pedido</h4>
                        </div>
                        <div class="timeline-body">
                            <div class="form-group col-sm-6">
                                <label> Fecha de Entrega:</label> <br/>
                                <?=$lp->fecha_entrega?>
                            </div>
                           <div class="form-group col-sm-6">
                                <label> Observaciones:</label> <br/>
                                <?=$lp->observaciones?>
                            </div> 
                        </div>
                    </div>
                </li>
                <?php } ?> 
<!----------------------Pedido Inhabilitado--------------------------->
				<?php if ($lp->fecha_inhabilitado !=0){
				?>	
					                  
                <li class="timeline-inverted">
                <div class="timeline-badge danger "><i class="fa fa-times"></i>
                    </div>
                    <div class="timeline-panel">
                        <div class="timeline-heading">
                            <h4 class="timeline-title" style="color:#900">Pedido Inhabilitado</h4>
                        </div>
                        <div class="timeline-body">
                           <div class="form-group col-sm-6">
                                <label> Fecha de inhabilitacion:</label> <br/>
                                <?=$lp->fecha_inhabilitado?>
                            </div>
                            <div class="form-group col-sm-6">
                                <label> Motivo</label> <br/>
                                <?=$lp->motivo?>
                            </div>
                        </div>
                    </div>
                </li>
              <?php  } ?>
            </ul>
        </div>
        <!-- /.panel-body -->
    </div>
	
   

<?php } close_page(); ?>

<script src="<?=base_url()?>js/script_pedidos.js"></script>
