// JavaScript Document


$(document).ready(function(e) {
    $("#btn-add-cat").click(function(){
		open_loading();
		$.post(base_url()+"noticias/insert", $("#form-add-cat-not").serialize(), function(data){
			if(data == "exito"){
				msj_exito("<strong>Bien! ...</strong> La categoria de noticia se inserto con éxito", 3000);
				redirect("noticias", 2000);	
			}else{
				msj_error("<strong>Opps! </strong> Hemos hecho algo mal y la categoria no se pudo insertar, por favor intenta de nuevo mas tarde, si el problema persiste ponte en contacto con el administrador del sistema.", 5000);
				close_loading();	
			}
		});
	});
	
	
	$("#btn-edit-cat").click(function(){
		open_loading();
		$.post(base_url()+"noticias/update", $("#form-edit-cat-not").serialize(), function(data){
			if(data == "exito"){
				msj_exito("<strong>Bien! ...</strong> La categoria de noticia se edito con éxito", 3000);
				redirect("noticias", 2000);	
			}else{
				msj_error("<strong>Opps! </strong> Hemos hecho algo mal y la categoria no se pudo editar, por favor intenta de nuevo mas tarde, si el problema persiste ponte en contacto con el administrador del sistema.", 5000);
				close_loading();	
			}
		});
	});
	
	
	
	
	
	
	// NOTICIAS
	
	
	$("#form-add-not").submit(function(){
		open_loading();
		$("#contenido").val(tinyMCE.get(0).getContent());
		$("#contenido_espanol").val(tinyMCE.get(1).getContent());
		$.post(base_url()+"noticias/insert_noticia", $(this).serialize(), function(data){
			if(data == "exito"){
				msj_exito("<strong>Bien!</strong> La noticia se ha guardado con éxito, recuerda que desde el listado de noticias podras cargar su respectiva galeria de imagenes", 5000);
				redirect("noticias/lista_noticias/"+$("#idcategoria").val(), 4000);	
			}else{
				msj_error("<strong>Opps!</strong> Hicimos algo mal y la noticia no se pudo cargar, por favor intenta de nuevo mas tarde, si el problema persiste ponte en contacto con el administrador del sistema.");
				close_loading();	
			}
		});
		return false;
	});
	
	
	
	
	
	$("#form-edit-not").submit(function(){
		open_loading();
		$("#contenido").val(tinyMCE.get(0).getContent());
		$("#contenido_espanol").val(tinyMCE.get(1).getContent());
		$.post(base_url()+"noticias/update_noticia", $(this).serialize(), function(data){
			if(data == "exito"){
				msj_exito("<strong>Bien!</strong> La noticia se ha guardado con éxito, recuerda que desde el listado de noticias podras cargar su respectiva galeria de imagenes", 5000);
				redirect("noticias/lista_noticias/"+$("#idcategoria").val(), 4000);	
			}else{
				msj_error("<strong>Opps!</strong> Hicimos algo mal y la noticia no se pudo editar, por favor intenta de nuevo mas tarde, si el problema persiste ponte en contacto con el administrador del sistema.");
				close_loading();	
			}
		});
		return false;
	});
	
	
	
});


function del_cat_not(){
	open_loading();
	var id = $("#id_eliminar").val();
	var cambio = $("#que_hacer_noticias").val();
	$.post(base_url()+"noticias/delete", {"id":id, "cambio":cambio}, function(data){
		if(data == "exito"){
			msj_exito("<strong>Bien!</strong> La categoria de noticia fue eliminada con éxito", 3000);
			redirect("noticias", 2000);	
		}else{
			msj_error("<strong>Opps!</strong> Hicimos algo mal y la categoria seleccionada no se pudo eliminar, por favor intenta de nuevo mas tarde, si el problema persiste ponte en contacto con el administrador del sistema");	
		}
	});	
}


function del_not(){
	open_loading();
	var id = $("#id_eliminar").val();
	var idcategoria = $("#idcategoria").val();
	$.post(base_url()+"noticias/delete_noticia", {"id":id}, function(data){
		if(data == "exito"){
			msj_exito("<strong>Bien!</strong> La noticia fue eliminada con éxito", 3000);
			redirect("noticias/lista_noticias/"+idcategoria, 2000);	
		}else{
			msj_error("<strong>Opps!</strong> Hicimos algo mal y la noticia seleccionada no se pudo eliminar, por favor intenta de nuevo mas tarde, si el problema persiste ponte en contacto con el administrador del sistema");	
		}
	});		
}



function load_galeria(id){
	open_loading();
	$.post(base_url()+"noticias/load_galeria/"+id, {}, function(data){
		$("#galeria").html(data);
		close_loading();
	});	
}


function set_principal(id, idnoticia){
	open_loading();
	$.post(base_url()+"noticias/set_principal/"+id+"/"+idnoticia, {}, function(data){
		if(data == "exito"){
			msj_exito("<strong>Bien!</strong> La imagen seleccionada ahora es la imagen principal de la noticia", 3000);
			load_galeria($("#id").val());
		}else{
			msj_error("<strong>Opps!</strong> Hemos hecho algo mal y la imagen seleccionada no se pudo colocar como principal, por favor intenta de nuevo mas tarde, si el problema persiste ponte en contacto con el administrador del sistema", 5000);
		}
	});	
}



function del_galeria(){
	open_loading();
	var id = $("#id_eliminar").val();
	var nombre = $("#file_name").val();
	$.post(base_url()+"noticias/delete_galeria", {"id":id, "nombre":nombre}, function(data){
		if(data == "exito"){
			msj_exito("<strong>Bien!</strong> La imagen fue eliminada con éxito", 3000);
			load_galeria($("#id").val());
		}else{
			msj_error("<strong>Opps!</strong> Hicimos algo mal y la imagen seleccionada no se pudo eliminar, por favor intenta de nuevo mas tarde, si el problema persiste ponte en contacto con el administrador del sistema", 5000);
			close_loading();	
		}
	});			
}


function destacar(id, destacar){
	var idcategoria = $("#idcategoria").val();
	open_loading();
	$.post(base_url()+"noticias/destacar", {"id":id, "destacar":destacar}, function(data){
		redirect("noticias/lista_noticias/"+idcategoria);
	});	
}