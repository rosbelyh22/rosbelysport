<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if ( ! function_exists('element'))
{
	

	
	
	function get_formcontacto_helper(){
		$conf = get_conf_helper();
		?>
        <script>
			$(function(){
				$("#form-contacto").submit(function(){
					var catpcha = grecaptcha.getResponse();
					if(catpcha == ""){
						alert("Comprueba que no eres un robot");	
						return false;
					}else{
						return true;
					}
					
				});
			
				
			});
			
			var correctCaptcha = function(response) {
				 $("#res_captcha").val(response);
				};
				
				var onloadCallback = function() {
				grecaptcha.render('html_element', {
				  'sitekey' : '<?=$conf["key_recatpcha"]?>',
				  'callback' : 'correctCaptcha'
				});
			  };
		</script>
        <script src="https://www.google.com/recaptcha/api.js"></script>
        <div class="row">
            <div class="col-sm-6" style="border-right:#CCC solid 1px;">
            <form method="post" action="" name="form-contacto" id="form-contacto">
            <input type="hidden" name="res_captcha" id="res_captcha">
            <div class="row">
                <div class="col-sm-12 form-group">
                    <label><?=get_lang("name")?></label>
                    <input type="text" name="nombre" id="nombre" class="form-control" required>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 form-group">
                    <label><?=get_lang("phone")?></label>
                    <input type="text" name="telefono" id="telefono" class="form-control" required>
                </div>
                <div class="col-sm-6 form-group">
                    <label>Email</label>
                    <input type="email" name="email" id="email" class="form-control" required>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 form-group">
                    <label><?=get_lang("subject")?></label>
                    <input type="text" name="asunto" id="asunto" class="form-control" required>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 form-group">
                    <label><?=get_lang("message")?></label>
                    <textarea name="mensaje" id="mensaje" class="form-control" required></textarea>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 form-group">
                <div class="g-recaptcha" data-sitekey="<?=$conf["key_recatpcha"]?>"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <input type="submit" name="btn-contacto" id="btn-contacto" class="btn btn-success" value="<?=get_lang("contact")?>">
                </div>
            </div>
        </form>
        </div>
        <div class="col-sm-6">
			<?php
            if($conf["api_googlemap"] != ''){
				echo $conf["api_googlemap"]."<br /><hr><br />";
			}
			
			if($conf["email_empresa"] != ''){
				?>
				<label><b>Email:</b></label><br>
				<?=$conf["email_empresa"]?><br />
				<?php	
			}
			
			if($conf["telefono_empresa"] != ''){
				?>
				<label><b><?=get_lang("phone")?>:</b></label><br>
				<?=$conf["telefono_empresa"]?><br />
				<?php	
			}
			
			if($conf["direccion_empresa"] != ''){
				?>
				<label><b><?=get_lang("address")?>:</b></label><br>
				<?=$conf["direccion_empresa"]?><br /><br />
				<?php	
			}
			
			
			?>
        </div>
        </div>
		<?php	
	}
	
	
	function get_basic_form_contact($action = ''){
		$conf = get_conf_helper();
		?>
		
        <script src="https://www.google.com/recaptcha/api.js"></script>
            <form method="post" action="<?=$action?>" name="form-contacto" id="form-contacto">
            <input type="hidden" name="res_captcha" id="res_captcha">
                    <div class="form-group">
                    <input type="text" name="nombre" id="nombre" class="form-campo" required placeholder="Nombre" style="color:#666">
                    </div>
                    <div class="form-group">
                    <input type="text" name="telefono" id="telefono" class="form-campo" required placeholder="Teléfono">
                    </div>
                    <div class="form-group">
                    <input type="email" name="email" id="email" class="form-campo" required placeholder="Email">
                    </div>
                    <div class="form-group">
                    <input type="text" name="asunto" id="asunto" class="form-campo" required placeholder="Asunto">
                    </div>
                    <div class="form-group">
                    <textarea name="mensaje" id="mensaje" class="form-campo" required placeholder="Mensaje"></textarea>
                    </div>
                    <div class="form-group">
                		<div class="g-recaptcha" data-sitekey="<?=$conf["key_recatpcha"]?>" data-theme="light"></div>
                	</div>
                	<div class="form-group">
                    <input type="submit" name="btn-contacto" id="btn-contacto" class="btn btn-primary" value="Contactar">
                    </div>
        </form>
        <script>
			$(document).ready(function(e) {
				$("#form-contacto").submit(function(){
					var catpcha = grecaptcha.getResponse();
					if(catpcha == ""){
						alert("Comprueba que no eres un robot");	
						return false;
					}else{
						return true;
					}
					
				});
			
				
			});
			
			var correctCaptcha = function(response) {
				 $("#res_captcha").val(response);
				};
				
				var onloadCallback = function() {
				grecaptcha.render('html_element', {
				  'sitekey' : '<?=$conf["key_recatpcha"]?>',
				  'callback' : 'correctCaptcha'
				});
			  };
		</script>
		<?php	
	}

}

/* End of file array_helper.php */
/* Location: ./system/helpers/array_helper.php */
?>