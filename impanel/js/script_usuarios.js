// JavaScript Document


$(document).ready(function(e) {
   
	
	
	$("#btn-add-user").click(function(){
		open_loading();
		
		
		var form = document.forms["form-add-user"]['privilegios[]'];
		var p = 0;
		for(i=0;i<form.length;i++){
			if(form[i].checked){
				p=1;
			}
		}
		if (p==0){
			msj_advertencia("<strong>Eyy!</strong> debes seleccionar al menos un permiso de modulo para este usuario", 3000);
			close_loading();
		}else if($("#nombre").val() == ''){
			msj_advertencia("<strong>Eyy!</strong> debes escribir el nombre del usuario", 3000);
			close_loading();
		}else if($("#email").val() == ''){
			msj_advertencia("<strong>Eyy!</strong> debes escribir la dirección de correo del usuario", 3000);
			close_loading();
		}else if($("#usuario").val() == ''){
			msj_advertencia("<strong>Eyy!</strong> debes escribir el nombre de usuario a usar", 3000);
			close_loading();
		}else if($("#clave").val() == ''){
			msj_advertencia("<strong>Eyy!</strong> debes definir una clave", 3000);
			close_loading();
		}else if($("#repetir_clave").val() == ''){	
			msj_advertencia("<strong>Eyy!</strong> debes confirmar la clave de acceso", 3000);
			close_loading();
		}else if($("#clave").val() != '' && $("#clave").val() != $("#repetir_clave").val()){
			msj_advertencia("<strong>Eyy!</strong> La clave y su confirmación son diferentes", 3000);
			close_loading();
		}else if($("#clave").val() != '' && $("#repetir_clave").val() == ''){
			msj_advertencia("<strong>Eyy!</strong> Debes ingresar la confirmación de tu clave", 3000);	
			close_loading();
		}else{
			$.post(base_url()+"usuarios/insert", $("#form-add-user").serialize(), function(data){
				if(data == "exito"){
					msj_exito("<strong>Bien!...</strong> El usuario se cargo con éxito!",3000);
					redirect("usuarios/",2000);
				}else if(data == "existe"){
					msj_advertencia("<strong>Cuidado!</strong> el correo eléctronico o el nombre de usuario que estas ingresando ya esta registrado en el sistema", 3000);
					close_loading();
				}else{
					msj_error("<strong>Opps!</strong> Algo hicimos mal y el usuario no se pudo agregar, intenta de nuevo mas tarde, si el problema persiste ponte en contacto con el administrador del sistema",5000);
					close_loading();
				}
			});
		
		
		}
	});
	
	
	
	$("#btn-edit-user").click(function(){
		open_loading();
		
		var form = document.forms["form-edit-user"]['privilegios[]'];
		var p = 0;
		for(i=0;i<form.length;i++){
			if(form[i].checked){
				p=1;
			}
		}
		if (p==0){
			msj_advertencia("<strong>Eyy!</strong> debes seleccionar al menos un permiso de modulo para este usuario", 3000);
			close_loading();
		}else if($("#clave").val() != '' && $("#clave").val() != $("#repetir_clave").val()){
			msj_advertencia("<strong>Eyy!</strong> La clave y su confirmación son diferentes", 3000);
			close_loading();
		}else if($("#clave").val() != '' && $("#repetir_clave").val() == ''){
			msj_advertencia("<strong>Eyy!</strong> Debes ingresar la confirmación de tu clave", 3000);	
			close_loading();
		}else{
			
			$.post(base_url()+"usuarios/update", $("#form-edit-user").serialize(), function(data){
				if(data == "exito"){
					msj_exito("<strong>Bien!...</strong> El usuario se edito con éxito!",3000);
					redirect("usuarios/",2000);
				}else if(data == "existe"){
					msj_advertencia("<strong>Cuidado!</strong> el correo eléctronico o el nombre de usuario que estas ingresando ya esta registrado en el sistema", 3000);
					close_loading();
				}else{
					msj_error("<strong>Opps!</strong> Algo hicimos mal y el usuario no se pudo agregar, intenta de nuevo mas tarde, si el problema persiste ponte en contacto con el administrador del sistema",5000);
					close_loading();
				}
			});
				
		}
		
	});
	
	
	
});


function del_user(){
		var id = $("#id_eliminar").val();
		open_loading();
		$.post(base_url()+"usuarios/delete", {"id":id}, function(data){
			if(data == "exito"){
				msj_exito("<strong>Bien!...</strong> El usuario fue eliminado con éxito", 5000);
				redirect("usuarios/", 2000);
			}else if(date == "error"){
				msj_error("<strong>Opps!...</strong> Hubo un error y el usuario seleccionado no se pudo eliminar, intenta de nuevo mas tarde");
			}
		});	
		close_loading();	
}





function block_user(id, titulo){
	if(confirm("¿Seguro deseas "+titulo+" este usuario?")){
		open_loading();
		$.post(base_url()+"usuarios/block", {"id":id, "tipo":titulo}, function(data){
			if(data == "exito"){
				redirect("usuarios/", 0);
			}else if(data == "error"){
				msj_error("<strong>Opps!</strong> No se pudo "+titulo+" el usuario que seleccionaste, intenta de nuevo mas tarde");
			}
		});	
		close_loading();
	}	
}