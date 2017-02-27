<?php 
open_page($title, "shopping-cart ");
?>
    <form method="post" action="" id="form-edit-pedidos" name="form-edit-pedidos" enctype="multipart/form-data">
      <input type="hidden" name="id" id="id" value="<?=$pedido[0]->idpedido?>">
     	
        <?php
        open_panel(array(), "Detalles del Pedido");
        ?>
        <div class="row">
            <div class="col-sm-6 form-group">
                <label>Nombre del Cliente</label>
                <div class="input-group">
                <input type="text" disabled="disabled" name="pedido" id="pedido" class="form-control" value="<?=$pedido[0]->nombre?>">
                <span class="input-group-addon">N</span>
                </div>
            </div>
            <div class="col-sm-6 form-group">
                <label>Fecha</label>
                <div class="input-group">
                <input type="text" disabled="disabled" class="form-control" value="<?=$pedido[0]->fechacreacion?>">
                <span class="input-group-addon"> <span> <i class="fa fa-calendar"> </i> </span></span>
                </div>
            </div>
         </div>
        <div class="row">
            <div class="col-sm-6 form-group">
                <label>Total</label>
                <div class="input-group">
                <input type="text" disabled="disabled" name="pedido" id="pedido" class="form-control" value="<?=$pedido[0]->grantotal?>">
                <span class="input-group-addon">$</span>
                </div>
            </div>
<!--            <div class="col-sm-6 form-group">
                <label>Fecha</label>
                <div class="input-group">
                <input type="text" disabled="disabled" class="form-control" value="<?=$pedido[0]->fechacreacion?>">
                <span class="input-group-addon"> <span> <i class="fa fa-calendar"> </i> </span></span>
                </div>
            </div>-->
         </div>
        
        <?php
        close_panel();
        ?>  
        <?php
        open_panel(array(), "Configuracion de Estado del Pedido");
        ?>
            <div class="col-sm-6 form-group">
                <label>Cambiar Estado a: </label>
                <div class="radio">
                	
                   <label class="radio-inline">
                      <a href="#" id="alternar-respuesta-ej1"> <input type="radio" value="1" id="status" name="status" onclick="del_mensaje()"> </a> Enviado 
                    </label>
                   
                    <label class="radio-inline">
                       <a href="#" id="alternar-respuesta-ej2"> <input type="radio" value="2" id="status" name="status"> </a>Inhabilitado 
                    </label>
                    
                    
                    <label class="radio-inline">
                         <a href="#" id="alternar-respuesta-ej3"> <input type="radio" value="3" id="status" name="status"> </a>Entregado
                    </label>
                    
                    
                </div>
            </div> 
            
        <?php
        close_panel();
        ?>
        
        <div class="row" id="enviado" style="display:none;">   
			<?php
            open_panel(array(), "Configuracion de Estado del Pedido: Enviado");
            ?>	
        
        
            <div class="col-sm-6 form-group" >
                <label>Nombre de la empresa de envio</label>
                <select name="empresa" id="empresa" class="form-control"> 
                <?php
					foreach ($list_envio as $lp){
					?>	
						<option value="<?=$lp->nombre?>"><?=$lp->nombre?></option>
				<?php		
						}
				?>
                </select>
            </div>
            <div class="col-sm-6 form-group">
            	<label> Seleccionar Direccion de Envio </label>
<!--                <select name="direccion_envio" id="direccion_envio" class="form-control"> 
                <?php
					foreach ($nombremepresa as $lp){
					?>	
						<option value="<?=$lp->direccion?>"><?=$lp->direccion?></option>
                    	<option value="<?=$lp->direccion2?>"><?=$lp->direccion2?></option>
                    	<option value="<?=$lp->direccion3?>"><?=$lp->direccion3?></option>
				<?php		
						}
				?>
                
                </select>-->
                <input type="text" id="direccion_envio" name="direccion_envio"  class="form-control" 
                       value="<?=$pedido[0]->direccion ?>" >

            </div>
            <div class="col-sm-6 form-group">
                <label>Codigo de Seguimiento</label>
                <div class="input-group">
                <input type="text" name="codigo" id="codigo" class="form-control" value="">
              
                <span class="input-group-addon"><span>C</span></span>
                </div>
            </div>
            <div class="col-sm-6 form-group">
                <label>Fecha de Envio</label>
                <div class="input-group" >
                    <input type="text" id="fecha_envio" name="fecha_envio" readonly="readonly" class="form-control" placeholder="Seleccione una Fecha">
             	<!--<input type="hidden" id="dbfecha_envio" name="dbfecha_envio">-->
                <span class="input-group-addon"><span> <i class="fa fa-calendar"> </i></span></span>
                </div>
            </div>
            
			<?php
            close_panel();
            ?>
        </div>
        
        <div class="row" id="inhabilitado" style="display:none;" > 
        <?php
        open_panel(array(), "Configuracion de Estado del Pedido: Inhabilitado");
        ?>	
            <div class="col-sm-6 form-group">
                <label>Especifique un motivo por el cual inhabilita el pedido</label>
                <div class="input-group">
                <input type="text" name="motivo" id="motivo" class="form-control" value="">
                <span class="input-group-addon">D</span>
                </div>
            </div> 
            <div class="col-sm-6 form-group">
                <label>Por favor indique fecha en que se inhabilito el pedido</label>
                <div class="input-group" >
                    <input type="text" name="fecha_inhabilitado" id="fecha_inhabilitado" readonly="readonly" class="form-control" placeholder="Seleccione una Fecha">
                <!--<input type="hidden" id="dbfecha_inhabilitado" name="dbfecha_inhabilitado" />--> 
                <span class="input-group-addon"><span> <i class="fa fa-calendar"> </i></span></span>
                </div>
            </div>  
        <?php
        close_panel();
        ?>
        </div>
        
        <div class="row" id="entregado" style="display:none;" > 
        <?php
        open_panel(array(), "Configuracion de Estado del Pedido: Entregado");
        ?>	
            <div class="col-sm-6 form-group">
                <label>Observaciones</label>
                <div class="input-group">
                <input type="text" name="observaciones" id="observaciones" class="form-control" value="">
                <span class="input-group-addon">O</span>
                </div>
               
                
            </div>
            <div class="col-sm-6 form-group">
                <label>Fecha de Entrega</label>
                <div class="input-group" >
                    <input type="text" name="fecha_entrega" id="fecha_entrega" readonly="readonly" class="form-control" placeholder="Seleccione una Fecha">
               	<!--<input type="hidden" id="dbfecha_entrega" name="dbfecha_entrega"  />-->
                <span class="input-group-addon"><span> <i class="fa fa-calendar"> </i></span></span>
                </div>
            </div>   
        <?php
        close_panel();
        ?>
        </div>
	<div class="col-sm-6">
        <input type="button" name="btn-edit-pedido" id="btn-edit-pedido" class="btn btn-success" value="Editar Pedido" >
        <input type="button" name="btn-regresar" id="btn-regresar" value="Regresar" class="btn btn-warning" onClick="window.history.back()">
    </div>
  
    </form>
     
<?php close_page(); ?>

<script src="<?=base_url()?>js/script_pedidos.js"></script>
<script src="<?=base_url()?>js/calendario.js"></script>
<script src="<?=base_url()?>js/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="<?=base_url()?>css/jquery-ui.css"> 

<!--<script src="<?=base_url()?>js/datepicker"></script>-->
<!--<script src="<?=base_url()?>js/datepicker/js/datepicker.js"></script>-->
<!--  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>-->
<script type="text/javascript">
	$ (function(){
		$("#fecha_envio").datepicker();
		$("#fecha_inhabilitado").datepicker();
		$("#fecha_entrega").datepicker();
		}) 
</script>
