// JavaScript Document


$(document).ready(function(e) {
    $("#btn-add-cat").click(function(){
		open_loading();
		$.post(base_url()+"productos/insert", $("#form-add-cat-pro").serialize(), function(data){
			if(data == "exito"){
				msj_exito("<strong>Bien! ...</strong> La categoria de producto se inserto con éxito", 3000);
				redirect("productos", 2000);	
			}else{
				msj_error("<strong>Opps! </strong> Hemos hecho algo mal y la categoria no se pudo insertar, por favor intenta de nuevo mas tarde, si el problema persiste ponte en contacto con el administrador del sistema.", 5000);
				close_loading();	
			}
		});
	});
	
	
	$("#btn-edit-cat").click(function(){
		open_loading();
		$.post(base_url()+"productos/update", $("#form-edit-cat-pro").serialize(), function(data){
			if(data == "exito"){
				msj_exito("<strong>Bien! ...</strong> La categoria de producto se edito con éxito", 3000);
				redirect("productos", 2000);	
			}else{
				msj_error("<strong>Opps! </strong> Hemos hecho algo mal y la categoria no se pudo editar, por favor intenta de nuevo mas tarde, si el problema persiste ponte en contacto con el administrador del sistema.", 5000);
				close_loading();	
			}
		});
	});
	
	
	
	
	
	
	// productos
	
	
	$("#form-add-pro").submit(function(){
		open_loading();
		$("#descripcion").val(tinyMCE.get(0).getContent());
		$("#descripcion_espanol").val(tinyMCE.get(1).getContent());
		$.post(base_url()+"productos/insert_producto", $(this).serialize(), function(data){
			if(data == "exito"){
				msj_exito("<strong>Bien!</strong> El producto se ha guardado con éxito, recuerda que desde el listado de productos podras cargar su respectiva galeria de imagenes", 5000);
				redirect("productos/lista_productos/"+$("#idcategoria").val(), 4000);	
			}else{
				msj_error("<strong>Opps!</strong> Hicimos algo mal y el producto no se pudo cargar, por favor intenta de nuevo mas tarde, si el problema persiste ponte en contacto con el administrador del sistema.");
				close_loading();	
			}
		});
		return false;
	});
	
	
	
	
	
	$("#form-edit-pro").submit(function(){
		open_loading();
		$("#descripcion").val(tinyMCE.get(0).getContent());
		$("#descripcion_espanol").val(tinyMCE.get(1).getContent());
		$.post(base_url()+"productos/update_producto", $(this).serialize(), function(data){
			if(data == "exito"){
				msj_exito("<strong>Bien!</strong> El producto se ha guardado con éxito, recuerda que desde el listado de productos podras cargar su respectiva galeria de imagenes", 5000);
				redirect("productos/lista_productos/"+$("#idcategoria").val(), 4000);	
			}else{
				msj_error("<strong>Opps!</strong> Hicimos algo mal y el producto no se pudo editar, por favor intenta de nuevo mas tarde, si el problema persiste ponte en contacto con el administrador del sistema.");
				close_loading();	
			}
		});
		return false;
	});
	
	
	
});


function del_cat_pro(){
	open_loading();
	var id = $("#id_eliminar").val();
	var cambio = $("#que_hacer_productos").val();
	$.post(base_url()+"productos/delete", {"id":id, "cambio":cambio}, function(data){
		if(data == "exito"){
			msj_exito("<strong>Bien!</strong> La categoria de producto fue eliminada con éxito", 3000);
			redirect("productos", 2000);	
		}else{
			msj_error("<strong>Opps!</strong> Hicimos algo mal y la categoria seleccionada no se pudo eliminar, por favor intenta de nuevo mas tarde, si el problema persiste ponte en contacto con el administrador del sistema");	
		}
	});	
}


function del_pro(){
	open_loading();
	var id = $("#id_eliminar").val();
	var idcategoria = $("#idcategoria").val();
	$.post(base_url()+"productos/delete_producto", {"id":id}, function(data){
		if(data == "exito"){
			msj_exito("<strong>Bien!</strong> el producto fue eliminada con éxito", 3000);
			redirect("productos/lista_productos/"+idcategoria, 2000);	
		}else{
			msj_error("<strong>Opps!</strong> Hicimos algo mal y el producto seleccionada no se pudo eliminar, por favor intenta de nuevo mas tarde, si el problema persiste ponte en contacto con el administrador del sistema");	
		}
	});		
}



function load_galeria(id){
	open_loading();
	$.post(base_url()+"productos/load_galeria/"+id, {}, function(data){
		$("#galeria").html(data);
		close_loading();
	});	
}


function set_principal(id, idproducto){
	open_loading();
	$.post(base_url()+"productos/set_principal/"+id+"/"+idproducto, {}, function(data){
		if(data == "exito"){
			msj_exito("<strong>Bien!</strong> La imagen seleccionada ahora es la imagen principal de el producto", 3000);
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
	$.post(base_url()+"productos/delete_galeria", {"id":id, "nombre":nombre}, function(data){
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
	$.post(base_url()+"productos/destacar", {"id":id, "destacar":destacar}, function(data){
		redirect("productos/lista_productos/"+idcategoria);
	});	
}