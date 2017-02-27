// JavaScript Document


$(document).ready(function(e) {
    $("#userfile").change(function(){
	   var nombre_form = $("#nombre_form").val();
	   open_loading();
	   $("#"+nombre_form).attr("action", base_url()+"load_image/do_upload");
	   $("#"+nombre_form).attr("target", "upload_frame");
	   setTimeout("$('#"+nombre_form+"').submit()",500);
	   setTimeout("close_loading()",5000);
	   
	}); 
	
	
	$("#btn-regresar").click(function(e) {
        window.history.back();
    });
});


function base_url(){
	var base_url = $("#base_url").val()+"index.php/";
	return base_url;	
}



function ses_out(){
	open_loading();
		$.post(base_url()+"inicio/ses_out",{},function(data){
			redirect("inicio/", 0);	
		});
	close_loading();	
}



function msj_exito(mensaje, tiempo){
	$("#msj_exito div").html(mensaje);
	$("#msj_exito").fadeIn(500);
	setTimeout("close_msj('exito')",tiempo);	
}


function msj_error(mensaje, tiempo){
	$("#msj_error div").html(mensaje);
	$("#msj_error").fadeIn(500);
	setTimeout("close_msj('error')",tiempo);	
}

function msj_advertencia(mensaje, tiempo){
	$("#msj_advertencia div").html(mensaje);
	$("#msj_advertencia").fadeIn(500);
	setTimeout("close_msj('advertencia')",tiempo);	
}


function close_msj(tipo){
	$("#msj_"+tipo).fadeOut(500);	
}



function redirect(url, tiempo){
	setTimeout("location.href='"+base_url()+url+"'",tiempo);	
}

function open_loading(){
	$("#div_loading").fadeIn(500);	
}

function close_loading(){
	$("#div_loading").fadeOut();	
}


function reset_form(form){
	$("#"+form).each(function(index, element) {
        element.reset();
    });	
}


function quitarOption(id, sel){
	$("#"+sel).find("option[value='"+id+"']").remove();	
}

