// JavaScript Document

$(document).ready(function(e) {
    $("#form-inicio").submit(function(){
		open_loading();
		$.post(base_url()+"inicio/ini_ses", $(this).serialize(), function(data){
			if(data == "no_existe"){
				msj_advertencia("Los datos de acceso ingresados no se encuentran registrados en el sistema", 4000);
				close_loading();
			}else if(data == "bloqueado"){
				msj_advertencia("Disculpa el usuario con el cual intentas ingresar se encuentra bloqueado",4000);
				close_loading();
			}else if(data == "exito"){
				redirect("escritorio/", 0);
			}else if(data == "error"){
				msj_error("<strong>Opps</strong>... Ocurrio un error al momento de intentar iniciar sesión, por favor intenta de nuevo mas tarde", 5000);
				close_loading();
			}
			
		});
		return false;
	});
});