// JavaScript Document

$(document).ready(function(e) {
    $("#form-add-con").submit(function(){
			$("#contenido").val(tinyMCE.get(0).getContent());
			$("#contenido_espanol").val(tinyMCE.get(1).getContent());
			open_loading();
			$.post(base_url()+"contenido/insert", $(this).serialize(), function(data){
				if(data == "exito"){
					msj_exito("<strong>Bien!</strong> El contenido se agrego con éxito", 3000);
					redirect("contenido/", 3000);	
				}else if(data == "error"){
					msj_error("<strong>Opps!</strong> algo hemos hecho mal y el contenido que intentas ingresar no ha sido guardado, por favor intenta de nuevo mas tarde, si el problema persiste ponte en contacto con el administrador del sistema", 5000);	
					close_loading();
				}
				
			});
		return false;	
	});
	
	
	
	
	 $("#form-edit-con").submit(function(){
		
			$("#contenido").val(tinyMCE.get(0).getContent());
			$("#contenido_espanol").val(tinyMCE.get(1).getContent());
			open_loading();
			$.post(base_url()+"contenido/update", $(this).serialize(), function(data){
				if(data == "exito"){
					msj_exito("<strong>Bien!</strong> El contenido se edito con éxito", 3000);
					redirect("contenido/", 3000);	
				}else if(data == "error"){
					msj_error("<strong>Opps!</strong> algo hemos hecho mal y el contenido que intentas actualizar no ha sido guardado, por favor intenta de nuevo mas tarde, si el problema persiste ponte en contacto con el administrador del sistema", 5000);	
					close_loading();
				}
				
			});
		return false;	
	});
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
});



function del_cont(){
	var id  = $("#id_eliminar").val();
	open_loading();
	$.post(base_url()+"contenido/delete", {"id":id}, function(data){
		if(data == "exito"){
			msj_exito("<strong>Bien!</strong> El contenido se elimino con éxito", 3000);
			redirect("contenido/", 2000);
		}else{
			msj_error("<strong>Opps!</strong> Hicimos algo mal y el contenido que seleccionaste no se pudo eliminar, por favor intenta de nuevo mas tarde, si el problema persiste, ponte en contacto con el amdinistrador del sistema");
			close_loading();	
		}
	});	
}