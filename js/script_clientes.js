// JavaScript Document


$(document).ready(function (e) {
    $("#form-agregar-cliente").submit(function () {
        var nombre = $("#nombre").val();
        var email = $("#email").val();
        var mensaje = $("#mensaje").val();
        var codigo = $("#codigo").val();
        var numero = $("#numero").val();
        var rifcedula = $("#rif-cedula").val();
        var estado = $("#estado").val();
        var clave = $("#clave").val();
        var pais = $("#country").val();
        var direccion = $("#direccion").val();
        var recaptcha = $("#recaptcha").val();
        
        if(nombre == ''){
            $("#nombre-error").fadeIn(3000);
            $("#nombre-error").fadeOut(3000);
        }else if(email == ''){
            $("#email-error").fadeIn(3000);
            $("#email-error").fadeOut(3000);
        }
        else if(mensaje == ''){
            $("#mensaje-error").fadeIn(3000);
            $("#mensaje-error").fadeOut(3000);
        }
        else if(codigo == ''){
            $("#codigo-error").fadeIn(3000);
            $("#codigo-error").fadeOut(3000);
        }
        else if(numero == ''){
            $("#numero-error").fadeIn(3000);
            $("#numero-error").fadeOut(3000);
        }
        else if(rifcedula == ''){
            $("#rifcedula-error").fadeIn(3000);
            $("#rifcedula-error").fadeOut(3000);
        }
        else if(estado == ''){
            $("#estado-error").fadeIn(3000);
            $("#estado-error").fadeOut(3000);
        }
        else if(pais == 'ninguno'){
            $("#pais-error").fadeIn(3000);
            $("#pais-error").fadeOut(3000);
        }
        else if(direccion == ''){
            $("#direccion-error").fadeIn(3000);
            $("#direccion-error").fadeOut(3000); 
        }else if(clave == ''){
            $("#clave-error").fadeIn(3000);
            $("#clave-error").fadeOut(3000);
        }
        else if(recaptcha == ''){
            $("#recaptcha").fadeIn(3000);
            $("#recaptcha").fadeOut(3000);
        }
        
        else {
            $.post("index.php/register/agregarCliente", $(this).serialize(), function (data) {
                if ($.trim(data) == "exito") {
                    $("#form-agregar-cliente")[0].reset();
                    $("#msj_exito").fadeIn(3000);
                    $("#msj_exito").fadeOut(3000);
                    $("#registrar").fadeOut(3000);
                    $("#iniciarsesion").fadeIn(3000);
                    //setTimeout("redireccionarPagina()", 5000);
                } else if ($.trim(data) == "existe") {
                    $("#msj_existe").fadeIn(3000);
                    $("#msj_existe").fadeOut(3000);
                } else {
                    $("#msj_error").fadeIn(3000);
                    $("#msj_error").fadeOut(3000);

                }
            });
        }
        return false;
    });
    
    $("#form-contacto").submit(function () {
        var nombre = $("#nombre").val();
        var email = $("#email").val();
        var mensaje = $("#mensaje").val();
        var codigo = $("#codigo").val();
        var numero = $("#numero").val();
        var rifcedula = $("#rif-cedula").val();
        var recaptcha = $("#recaptcha").val();
        
        if(nombre == ''){
            $("#nombre-error").fadeIn(3000);
            $("#nombre-error").fadeOut(3000);
        }else if(email == ''){
            $("#email-error").fadeIn(3000);
            $("#email-error").fadeOut(3000);
        }
        else if(mensaje == ''){
            $("#mensaje-error").fadeIn(3000);
            $("#mensaje-error").fadeOut(3000);
        }
        else if(codigo == ''){
            $("#codigo-error").fadeIn(3000);
            $("#codigo-error").fadeOut(3000);
        }
        else if(numero == ''){
            $("#numero-error").fadeIn(3000);
            $("#numero-error").fadeOut(3000);
        }
        else if(rifcedula == ''){
            $("#rifcedula-error").fadeIn(3000);
            $("#rifcedula-error").fadeOut(3000);
        }
        else if(recaptcha == ''){
            $("#recaptcha").fadeIn(3000);
            $("#recaptcha").fadeOut(3000);
        }
        else {
            $.post("index.php/contactanos/mensajeContacto", $(this).serialize(), function (data) {
                if ($.trim(data) == "exito") {
                   $("#form-contacto")[0].reset();
                    $("#msj_exito").fadeIn(3000);
                    $("#msj_exito").fadeOut(3000);
                } else if ($.trim(data) == "error") {
                    $("#msj_error").fadeIn(3000);
                    $("#msj_error").fadeOut(3000);
                } 
            }); 
        }
        return false;
    });

    $("#form-edit-cliente").submit(function () {
        open_loading();
        if (($("#clave").val() != '' || $("#repetir_clave").val() != '') && ($("#clave").val() != $("#repetir_clave").val())) {
            msj_advertencia("<strong>Cuidado!</strong> la clave y su confirmación son diferentes, revisalo bien y vuelve a intentarlo", 3000);
            close_loading();
        } else {
            $.post(base_url() + "clientes/update", $(this).serialize(), function (data) {
                if (data == "exito") {
                    msj_exito("<strong>Bien!...</strong> El cliente se edito con éxito!", 3000);
                    redirect("clientes/", 2000);
                } else if (data == "existe") {
                    msj_advertencia("<strong>Cuidado!</strong> el correo eléctronico que estas ingresando ya esta registrado en el sistema para otro usuario", 3000);
                    close_loading();
                } else {
                    msj_error("<strong>Opps!</strong> Algo hicimos mal y el cliente no se pudo agregar, intenta de nuevo mas tarde, si el problema persiste ponte en contacto con el administrador del sistema", 5000);
                    close_loading();
                }
            });
        }
        return false;
    });
});


function del_cliente() {
    var id = $("#id_eliminar").val();
    open_loading();
    $.post(base_url() + "clientes/delete", {"id": id}, function (data) {
        if (data == "exito") {
            msj_exito("<strong>Bien!...</strong> El cliente fue eliminado con éxito", 5000);
            redirect("clientes/", 2000);
        } else if (date == "error") {
            msj_error("<strong>Opps!...</strong> Hubo un error y el cliente seleccionado no se pudo eliminar, intenta de nuevo mas tarde");
        }
    });
    close_loading();
}


function block_cliente() {
    var id = $("#id_block").val();
    var titulo = $("#titulo_block").val()
    open_loading();
    $.post(base_url() + "clientes/block", {"id": id, "tipo": titulo}, function (data) {
        if (data == "exito") {
            redirect("clientes/", 0);
        } else if (data == "error") {
            msj_error("<strong>Opps!</strong> No se pudo " + titulo + " el cliente que seleccionaste, intenta de nuevo mas tarde");
            close_loading();
        }
    });
}

function ListaCarrito(){
    $("#lista_carrito").html("Cargando...");
    $.post("index.php/carrito/ListaCarrito", {}, function(data){
       $("#lista_carrito").html(data); 
    });
}
function redireccionarPagina() {
  window.location = "index.php/home";
}