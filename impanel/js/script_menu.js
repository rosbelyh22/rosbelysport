// JavaScript Document

$(document).ready(function(e) {
    $("#form-add-menu").submit(function(){

			open_loading();
			$.post(base_url()+"menu/insert", $(this).serialize(), function(data){
				if(data == "exito"){
					msj_exito("<strong>Bien!</strong> El menu se agrego con éxito", 3000);
					redirect("menu/", 3000);	
				}else{
					msj_error("<strong>Opps!</strong> algo hemos hecho mal y el menu que intentas ingresar no ha sido guardado, por favor intenta de nuevo mas tarde, si el problema persiste ponte en contacto con el administrador del sistema", 5000);	
					close_loading();
				}
				
			});
		return false;	
	});
	
	
	
	
	 $("#form-edit-menu").submit(function(){
		
			
			open_loading();
			$.post(base_url()+"menu/update", $(this).serialize(), function(data){
				if(data == "exito"){
					msj_exito("<strong>Bien!</strong> El menu se edito con éxito", 3000);
					redirect("menu/", 3000);	
				}else{
					msj_error("<strong>Opps!</strong> algo hemos hecho mal y el menu que intentas actualizar no ha sido guardado, por favor intenta de nuevo mas tarde, si el problema persiste ponte en contacto con el administrador del sistema", 5000);	
					close_loading();
				}
				
			});
		return false;	
	});
	
	
	
	
	
	$("#tipo").change(function(e) {
        load_relacion();
    });
	
	
	
	

	
	
	
	
	
	
});



function del_menu(){
	var id  = $("#id_eliminar").val();
	open_loading();
	$.post(base_url()+"menu/delete", {"id":id}, function(data){
		if(data == "exito"){
			msj_exito("<strong>Bien!</strong> El menu se elimino con éxito", 3000);
			redirect("menu/", 2000);
		}else{
			msj_error("<strong>Opps!</strong> Hicimos algo mal y el menu que seleccionaste no se pudo eliminar, por favor intenta de nuevo mas tarde, si el problema persiste, ponte en contacto con el amdinistrador del sistema");
			close_loading();	
		}
	});	
}



function block_menu(id, titulo){
		open_loading();
		$.post(base_url()+"menu/block", {"id":id, "tipo":titulo}, function(data){
			if(data == "exito"){
				redirect("menu/", 0);
			}else{
				msj_error("<strong>Opps!</strong> No se pudo "+titulo+" el menu que seleccionaste, intenta de nuevo mas tarde");
				close_loading();
			}
		});	
		
}



function load_relacion(){
	var tipo = $("#tipo").val();
	var sel_idrelacion = $("#sel_idrelacion").val();	
	var sel_url = $("#sel_url").val();	

	open_loading();
	$.post(base_url()+"menu/get_relacion", {"tipo":tipo, "sel_idrelacion":sel_idrelacion,  "sel_url":sel_url}, function(data){
		$("#sec_rel").html(data);
		close_loading();
	});	
}