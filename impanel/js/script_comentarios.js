// JavaScript Document

function del_coment(){
	var id  = $("#id_eliminar").val();
	open_loading();
	$.post(base_url()+"comentarios/delete", {"id":id}, function(data){
		if(data == "exito"){
			msj_exito("<strong>Bien!</strong> El comentario se elimino con éxito", 3000);
			redirect("comentarios/", 2000);
		}else{
			msj_error("<strong>Opps!</strong> Hicimos algo mal y el comentario que seleccionaste no se pudo eliminar, por favor intenta de nuevo mas tarde, si el problema persiste, ponte en contacto con el amdinistrador del sistema");
			close_loading();	
		}
	});	
}