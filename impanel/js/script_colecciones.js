// JavaScript Document


$(document).ready(function(e) {
    $("#btn-add-col").click(function(){
		open_loading();
		$.post(base_url()+"colecciones/insert", $("#form-add-col-pro").serialize(), function(data){
			if(data == "exito"){
				msj_exito("<strong>Bien! ...</strong> La colección de producto se inserto con éxito", 3000);
				redirect("colecciones", 2000);	
			}else{
				msj_error("<strong>Opps! </strong> Hemos hecho algo mal y la colección no se pudo insertar, por favor intenta de nuevo mas tarde, si el problema persiste ponte en contacto con el administrador del sistema.", 5000);
				close_loading();	
			}
		});
	});
	
	
	$("#btn-edit-col").click(function(){
		open_loading();
		$.post(base_url()+"colecciones/update", $("#form-edit-col-pro").serialize(), function(data){
			if(data == "exito"){
				msj_exito("<strong>Bien! ...</strong> La colección de producto se edito con éxito", 3000);
				redirect("colecciones", 2000);	
			}else{
				msj_error("<strong>Opps! </strong> Hemos hecho algo mal y la colección no se pudo editar, por favor intenta de nuevo mas tarde, si el problema persiste ponte en contacto con el administrador del sistema.", 5000);
				close_loading();	
			}
		});
	});

	
	
});


function del_col_pro(){
	open_loading();
	var id = $("#id_eliminar").val();
	var cambio = $("#que_hacer_productos").val();
	$.post(base_url()+"colecciones/delete", {"id":id, "cambio":cambio}, function(data){
		if(data == "exito"){
			msj_exito("<strong>Bien!</strong> La colección de producto fue eliminada con éxito", 3000);
			redirect("colecciones", 2000);	
		}else{
			msj_error("<strong>Opps!</strong> Hicimos algo mal y la colección seleccionada no se pudo eliminar, por favor intenta de nuevo mas tarde, si el problema persiste ponte en contacto con el administrador del sistema");	
		}
	});	
}

