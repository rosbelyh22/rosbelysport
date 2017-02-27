
	<?php 
	open_page($title, "user");
	?>
	
		<form method="post" action="" target="" id="form-add-cliente" name="form-add-cliente" enctype="multipart/form-data">
        <input type="hidden" name="nombre_form" id="nombre_form" value="form-add-cliente">
        	<div class="row">
                <div class="col-sm-12">
                
                    
                    <div class="row">
                        
                        <div class="form-group col-sm-12">
                            <label>Nombre</label>
                            <div class="input-group">
                                <input type="text" name="nombre" id="nombre" required class="form-control">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                            </div>
                        </div>
                        
                    </div>
                    
                    
                    
                    <div class="row">
                        
                        <div class="form-group col-sm-6">
                            <label>Pais</label>
                            <div class="input-group">
                                <input type="text" name="pais" id="pais" required class="form-control">
                                <span class="input-group-addon"><span class="fa fa-globe"></span></span>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label>Estado</label>
                            <div class="input-group">
                                <input type="text" name="estado" id="estado" required class="form-control">
                                <span class="input-group-addon"><span class="fa fa-globe"></span></span>
                            </div>
                        </div>
                     
                     </div>
                    
                    
 
                    
                    
                     <div class="row">
                        
                        <div class="form-group col-sm-6">
                            <label>Email</label>
                            <div class="input-group">
                                <input type="email" name="email" id="email" required class="form-control">
                                <span class="input-group-addon">@</span>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label>Teléfono</label>
                            <div class="input-group">
                                <input type="text" name="telefono" id="telefono" required class="form-control">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-phone"></span></span>
                            </div>
                        </div>
                     
                     </div>
                     <div class="row">
                     
                        <div class="form-group col-sm-12">
                            <label>Dirección</label>
                            <div class="input-group">
                                <textarea name="direccion" id="direccion" required class="form-control"></textarea>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-link"></span></span>
                            </div>
                        </div>
                        
                     </div>   
                     
                     
                     <div class="row">
                        
                        
                        <div class="form-group col-sm-6">
                            <label>Clave de Acceso</label>
                            <div class="input-group">
                                <input type="password" name="clave" id="clave" required class="form-control">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label>Repetir Clave</label>
                            <div class="input-group">
                            <input type="password" name="repetir_clave" id="repetir_clave" required class="form-control">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                            </div>
                        </div>
                           
                           
                    </div>
                
                
                </div>
            
                
                
                <input type="submit" name="btn-add-clientes" id="btn-add-clientes" value="Agregar Cliente" class="btn btn-success">
            
            </div>
            
            
            
            </form>
            
        

	


	<?php close_page(); ?>


<script src="<?=base_url()?>js/script_clientes.js"></script>