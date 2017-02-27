// JavaScript Document


$(document).ready(function(){
	var fecha_envio = $("#fecha_envio").val();  
	$("#btn-edit-pedido").click(function(){
		open_loading();
		$.post(base_url()+"pedidos/update", $("#form-edit-pedidos").serialize(), function(data){
			if(data == "exito"){
				msj_exito("<strong>Bien! ...</strong> El pedido se edito con éxito", 3000);
				redirect("pedidos", 2000);
				
			}else{
				msj_error("<strong>Opps! </strong> Hemos hecho algo mal y el pedido no se pudo editar, por favor intenta de nuevo mas tarde, si el problema persiste ponte en contacto con el administrador del sistema.", 5000);
				close_loading();	
			}
		});
});	
});


function del_pedido(){
	open_loading();
	var id = $("#id_eliminar").val();
	$.post(base_url()+"pedidos/delete", {"id":id}, function(data){
		if(data == "exito"){
			msj_exito("<strong>Bien!</strong> El pedido fue eliminado con éxito", 3000);
			redirect("pedidos", 2000);	
		}else{
			msj_error("<strong>Opps!</strong> Hicimos algo mal y el pedido seleccionado no se pudo eliminar, por favor intenta de nuevo mas tarde, si el problema persiste ponte en contacto con el administrador del sistema");	
		}
	});		
}

function del_mensaje(){
	$.post(base_url()+"pedidos/enviar_mensaje", {"id":id}, function(data){
		if(data == "exito"){
			msj_exito("<strong>Bien!</strong> El mensaje fue enviado con éxito", 3000);
			redirect("pedidos", 2000);	
		}else{
			msj_error("<strong>Opps!</strong> Hicimos algo mal y el mensaje no se pudo enviar, por favor intenta de nuevo mas tarde, si el problema persiste ponte en contacto con el administrador del sistema");	
		}
	});		
}
	

$(document).ready(function(){ 
   $('#alternar-respuesta-ej1').on('click',function(){
      //$('#enviado').toggle('slow');
      $('#enviado').fadeIn();
      $('#inhabilitado').fadeOut();
      $('#entregado').fadeOut();
   });
    $('#alternar-respuesta-ej2').on('click',function(){
      //$('#inhabilitado').toggle('slow');
      $('#inhabilitado').fadeIn();
      $('#enviado').fadeOut();
      $('#entregado').fadeOut();
   });
   $('#alternar-respuesta-ej3').on('click',function(){
      $('#entregado').fadeIn();
      $('#inhabilitado').fadeOut();
      $('#enviado').fadeOut();
   });
   
});
 
	
	
	
	
	
