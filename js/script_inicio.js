// JavaScript Document

$(document).ready(function(e) {
    $("#form-inicio").submit(function(){
		$.post("index.php/login/ini_ses", $(this).serialize(), function(data){
			if($.trim(data) == "no_existe"){
                            $("#form-inicio")[0].reset();
                            $("#msj_noexiste").fadeIn(3000);
                            $("#msj_noexiste").fadeOut(3000);
			}else if($.trim(data) == "bloqueado"){
                                $("#form-inicio")[0].reset();
                                $("#msj_bloqueado").fadeIn(3000);
                                $("#msj_bloqueado").fadeOut(3000);
			}else if($.trim(data) == "exito"){
                                $("#form-inicio")[0].reset();
				$("#msj_exito").fadeIn(3000);
                                $("#msj_exito").fadeOut(3000);
                                setTimeout("redireccionarPagina()", 5000);
			}else if($.trim(data) == "error"){
                                $("#form-inicio")[0].reset();
                                $("#msj_error").fadeIn(3000);
                                $("#msj_error").fadeOut(3000);		
			}
		});
		return false;
	});
});

function redireccionarPagina() {
  window.location = "index.php/home";
}