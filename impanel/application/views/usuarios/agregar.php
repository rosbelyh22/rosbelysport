
	<?php 
	open_page($title, "user");
	?>
	
		<form method="post" action="" target="" id="form-add-user" name="form-add-user" enctype="multipart/form-data">
        <input type="hidden" name="nombre_form" id="nombre_form" value="form-add-user">
        	<div class="row">
                <div class="col-sm-8">
                
                    
                    <div class="row">
                    	
                        <div class="col-sm-6">
                        	<label>
                            <div class="img_user img-circle img" title="Subir Imagen"></div>
                            <input type="file" name="userfile" id="userfile" style="display:none">
                            <input type="hidden" name="file_name" id="file_name">
                            <input type="hidden" name="folder" id="folder" value="perfil">
                            <input type="hidden" name="mostrar" id="mostrar" value="si">
                            </label>
                            <iframe width="300" height="300" name="upload_frame" style="display:none"></iframe>
                        </div>
                        
                        <div class="form-group col-sm-6">
                            <label>Nombre</label>
                            <div class="input-group">
                                <input type="text" name="nombre" id="nombre" required class="form-control">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label>Cargo</label>
                            <div class="input-group">
                                <input type="text" name="cargo" id="cargo" required class="form-control">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
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
                            <label>Usuario</label>
                            <div class="input-group">
                                <input type="text" name="usuario" id="usuario" required class="form-control">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
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
            
                <div class="col-sm-4">
               	
                	<?
					open_panel(array(), "Privilegios", "warning");
					?>
                    
					<ul class="list_modulos">
					<?
					$get_mod = $this->session->userdata("mods");
					for($i=0; $i<count($get_mod); $i++){
						$priv[$i] = $get_mod[$i]["tags"];	
					}

                	foreach($modulos as $m){
						if(in_array($m->tags, $priv)){
						?>
						<li>
                        <label>
                        <input type="checkbox" name="privilegios[]" id="privilegios_<?=$m->id?>" value="<?=$m->id?>">&nbsp;<?=$m->nombre?>
                        </label>
                        </li>
						<?
						}
					}
                	?>
					</ul>
					<?
                    close_panel();
					?>
                    <input type="button" name="btn-add-user" id="btn-add-user" value="Agregar Usuario" class="btn btn-success">
                </div>
                
                
            
            </div>
            
            
            
            </form>
            
        

	


	<?php close_page(); ?>


<script src="<?=base_url()?>js/script_usuarios.js"></script>