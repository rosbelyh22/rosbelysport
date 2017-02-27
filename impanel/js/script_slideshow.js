// JavaScript Document

$(document).ready(function(e) {
    $("#btn-add-slideshow").click(function(){
			if($("#file_name").val() == '' ){
				msj_error("Debe seleccionar un slideshow para subir",2000);	
			}else{
			
				var form = $("#nombre_form").val();
				open_loading();
				$.post(base_url()+"slideshow/insert", $("#"+form).serialize(), function(data){
					if(data == "exito"){
						msj_exito("<strong>Bien!</strong> El Slideshow se agrego con éxito", 3000);
						redirect("slideshow/", 2000);	
					}else{
						msj_error("<strong>Opps!</strong> algo hemos hecho mal y el slideshow que intentas ingresar no ha sido guardado, por favor intenta de nuevo mas tarde, si el problema persiste ponte en contacto con el administrador del sistema", 5000);	
						close_loading();
					}
					
				}); // END POST
			
			}// END IF
	});
	
	
	
	
	 $("#form-edit-slideshow").submit(function(){
			open_loading();
			$.post(base_url()+"slideshow/update", $(this).serialize(), function(data){
				if(data == "exito"){
					msj_exito("<strong>Bien!</strong> El slideshow se edito con éxito", 3000);
					redirect("slideshow/", 3000);	
				}else{
					msj_error("<strong>Opps!</strong> algo hemos hecho mal y el slideshow que intentas actualizar no ha sido guardado, por favor intenta de nuevo mas tarde, si el problema persiste ponte en contacto con el administrador del sistema", 5000);	
					close_loading();
				}
				
			});
		return false;	
	});
	

	
	
});



function block_slide(id, titulo){
	if(confirm("¿Seguro deseas "+titulo+" este slideshow?")){
		open_loading();
		$.post(base_url()+"slideshow/block", {"id":id, "tipo":titulo}, function(data){
			if(data == "exito"){
				redirect("slideshow/", 0);
			}else{
				msj_error("<strong>Opps!</strong> No se pudo "+titulo+" el slideshow que seleccionaste, intenta de nuevo mas tarde", 3000);
				close_loading();
			}
		});	
		
	}	
}



function del_slide(){
	var id  = $("#id_eliminar").val();
	open_loading();
	$.post(base_url()+"slideshow/delete", {"id":id}, function(data){
		if(data == "exito"){
			msj_exito("<strong>Bien!</strong> El slideshow se elimino con éxito", 3000);
			redirect("slideshow/", 2000);
		}else{
			msj_error("<strong>Opps!</strong> Hicimos algo mal y el slideshow que seleccionaste no se pudo eliminar, por favor intenta de nuevo mas tarde, si el problema persiste, ponte en contacto con el amdinistrador del sistema");
			close_loading();	
		}
	});	
}