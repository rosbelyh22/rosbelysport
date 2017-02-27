// JavaScript Document

function del_mensaje(){
	var id  = $("#id_eliminar").val();
	open_loading();
	$.post(base_url()+"mensajes/delete", {"id":id}, function(data){
		if(data == "exito"){
			msj_exito("<strong>Bien!</strong> El mensaje se elimino con éxito", 3000);
			redirect("mensajes/", 2000);
		}else{
			msj_error("<strong>Opps!</strong> Hicimos algo mal y el mensaje que seleccionaste no se pudo eliminar, por favor intenta de nuevo mas tarde, si el problema persiste, ponte en contacto con el amdinistrador del sistema");
			close_loading();	
		}
	});	
}


$(document).ready(function(e) {

$("#form-responder").submit(function(e) {
	$("#mensaje").val(tinyMCE.activeEditor.getContent());    
	open_loading();
	$.post(base_url()+"mensajes/enviar_respuesta", $(this).serialize(), function(data){
		if(data == "exito"){
			msj_exito("<strong>Bien!</strong> el mensaje se ha enviado con éxito", 3000);
			redirect("mensajes/", 2000);	
		}else{
			msj_error("<strong>Opps!</strong> hemos hecho algo mal y no pudimos enviar el mensaje, por favor intenta de neuvo mas tarde, si el problema persiste ponte en contacto con el administrador del sistema");	
			close_loading();
		}	
	});
	return false;
});
    
});
