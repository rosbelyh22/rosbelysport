// JavaScript Document


$(document).ready(function (e) {
    
    $("#form-edit-cliente").submit(function () {

        $.post("index.php/products/agregarCliente", $(this).serialize(), function (data) {
            if ($.trim(data) == "exito") {
                $("#msj_exito").fadeIn(3000);
                $("#msj_exito").fadeOut(3000);
            } else if ($.trim(data) == "existe") {
                $("#msj_existe").fadeIn(3000);
                $("#msj_existe").fadeOut(3000);
            } else {
                $("#msj_error div").html("Disculpe, su registro no se pudo procesar, intente de nuevo mas tarde");

            }
        });

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