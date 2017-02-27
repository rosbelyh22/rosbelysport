// JavaScript Document

$(document).ready(function(e) {
    $("#btn-add-publicidad").click(function(e) {
        open_loading();
		$.post(base_url()+"publicidad/insert", $("#form-add-publicidad").serialize(), function(data){
			if(data == "exito"){
				msj_exito("<strong>Bien!</strong> El anuncio se ha cargado con éxito", 3000);
				redirect("publicidad/",1000);	
			}else{
				msj_error("<strong>Opps!</strong> Hicimos algo mal y el anuncio no pudo ser cargado con éxito, por favor intenta de nuevo mas tarde, si el problema persiste, ponte en contacto con el amdinistrador del sistema");
				close_loading();	
			}
		});
    });
	
	
	
	$("#btn-edit-publicidad").click(function(e) {
        open_loading();
		$.post(base_url()+"publicidad/update", $("#form-edit-publicidad").serialize(), function(data){
			if(data == "exito"){
				msj_exito("<strong>Bien!</strong> El anuncio se ha editado con éxito", 3000);
				redirect("publicidad/",1000);	
			}else{
				msj_error("<strong>Opps!</strong> Hicimos algo mal y el anuncio no pudo ser editado con éxito, por favor intenta de nuevo mas tarde, si el problema persiste, ponte en contacto con el amdinistrador del sistema");
				close_loading();	
			}
		});
    });
	
	
	
	
	
});


function block_publicidad(id, titulo){
		open_loading();
		$.post(base_url()+"publicidad/block", {"id":id, "tipo":titulo}, function(data){
			if(data == "exito"){
				redirect("publicidad/", 0);
			}else{
				msj_error("<strong>Opps!</strong> No se pudo "+titulo+" la publicidad que seleccionaste, intenta de nuevo mas tarde, si el problema persiste comunicate con el administrador del sistema");
				close_loading();
			}
		});	
			
}



function del_publicidad(){
	open_loading();
	var archivo = $("#archivo_eliminar").val();
	var id = $("#id_eliminar").val();
	$.post(base_url()+"publicidad/delete", {"id":id, "archivo":archivo}, function(data){
		if(data == "exito"){
			msj_exito("<b>Bien!</b> El anuncio se elimino con éxito", 3000);
			redirect("publicidad/", 1000);	
		}else{
			msj_error("<b>Opps!</b> Hicimos algo mal y el anuncio no pudo ser eliminado con éxito, por favor intenta de nuevo mas tarde, si el problema persiste ponte en contacto con el administrador del sistema", 5000);
			close_loading();	
		}
	});	
}