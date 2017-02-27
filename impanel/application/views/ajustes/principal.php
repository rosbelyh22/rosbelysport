
	<?php 
	open_page($title, "user");
	?>
	
		<form method="post" action="<?=base_url()?>index.php/ajustes/actualizar" name="form-edit-ajustes">
        	
            
            <?php
            open_panel(array(), "Datos de la empresa");
			?>
            <div class="row">
            	
                <div class="col-sm-6 form-group">
                	<label>Email de Contacto</label>
                    <div class="input-group">
                    <input type="text" name="emailemp" id="email_empresa" class="form-control" value="<?=$config["email_empresa"]?>">
                    <span class="input-group-addon">@</span>
                    </div>
                </div>
                <div class="col-sm-6 form-group">
                	<label>Teléfono de la Empresa</label>
                    <div class="input-group">
                    <input type="text" name="telefonoemp" id="telefono_empresa" class="form-control" value="<?=$config["telefono_empresa"]?>">
                    <span class="input-group-addon"><span class="fa fa-phone"></span></span>
                    </div>
                </div>
             </div>
			 <div class="row">
				<div class="col-sm-12 form-group">
                	<label>CopyRight</label>
                    <input type="text" name="copyright" id="copyright" class="form-control" value="<?=$config["copyright"]?>">
                </div>
			 </div>
             <div class="row">
                <div class="col-sm-12 form-group">
                	<label>Dirección de la Empresa</label>
                    <textarea name="direccionemp" id="direccion_empresa" class="form-control"><?=$config["direccion_empresa"]?></textarea>
                </div>
            </div>
             <div class="row">
                <div class="col-sm-12 form-group">
                	<label>Meta Claves (Separe las palabras por coma)</label>
                    <textarea name="meta_clave" id="meta_clave" class="form-control"><?=$config["meta_clave"]?></textarea>
                </div>
            </div>
            <?php
            close_panel();
			?>
            
            
            
            <?php
            open_panel(array(), "Redes Sociales");
			?>
            <div class="row">
            	<div class="col-sm-4 form-group">
                	<label>Url Facebook</label>
                    <div class="input-group">
                    <input type="text" name="urlfacebook" id="url_facebook" class="form-control" value="<?=$config["url_facebook"]?>">
                    <span class="input-group-addon"><span class="fa fa-facebook"></span></span>
                    </div>
                </div>
                <div class="col-sm-4 form-group">
                	<label>Url Twitter</label>
                    <div class="input-group">
                    <input type="text" name="urltwitter" id="url_twitter" class="form-control" value="<?=$config["url_twitter"]?>">
                    <span class="input-group-addon"><span class="fa fa-twitter"></span></span>
                    </div>
                </div>
                <div class="col-sm-4 form-group">
                	<label>Url Instagram</label>
                    <div class="input-group">
                    <input type="text" name="urlinstagram" id="url_instagram" class="form-control" value="<?=$config["url_instagram"]?>">
                    <span class="input-group-addon"><span class="fa fa-instagram"></span></span>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4 form-group">
                	<label>Url Pinterest</label>
                    <div class="input-group">
                    <input type="text" name="urlpinteres" id="url_pinteres" class="form-control" value="<?=$config["url_pinteres"]?>">
                    <span class="input-group-addon"><span class="fa fa-pinterest"></span></span>
                    </div>
                </div>
                <div class="col-sm-4 form-group">
                	<label>Url Linkedin</label>
                    <div class="input-group">
                    <input type="text" name="urllinkedin" id="url_linkedin" class="form-control" value="<?=$config["url_linkedin"]?>">
                    <span class="input-group-addon"><span class="fa fa-linkedin"></span></span>
                    </div>
                </div>
                <div class="col-sm-4 form-group">
                	<label>Url Google+</label>
                    <div class="input-group">
                    <input type="text" name="urlgoogleplus" id="url_googleplus" class="form-control" value="<?=$config["url_googleplus"]?>">
                    	<span class="input-group-addon"><span class="fa fa-google-plus"></span></span>
                    </div>
                </div>
            </div>
            <div class="row">
            	<div class="col-sm-6">
                	<label> Usuario Skype</label>
                    <div class="input-group">
                    <input type="text" name="userskype" id="user_skype" class="form-control" value="<?=$config["user_skype"]?>">
                    	<span class="input-group-addon"><span class="fa fa-skype"></span></span>
                    </div>
                </div>
            </div>
            <?php
            close_panel();
			?>
            
            
           
            
            
            <div class="row">
            	<input type="submit" name="btn-ajustes" id="btn-ajustes" class="btn btn-success" value="Guardar Ajustes">
            </div>
            
            </form>
            


	<?php close_page(); ?>


<script src="<?=base_url()?>js/script_configuracion.js"></script>