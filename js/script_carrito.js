// JavaScript Document


$(document).ready(function (e) {
    ListaCarrito();
   
//    $("#buttonMercadoPago").click(function(){
//        carrito = $("#carrito").val();
//        console.log(carrito);
//        $.post(base_url()+"pedido/agregarPedido",{"carrito": carrito }, function (data) {
////            ListaCarrito();
//        });
//    });
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
    $.post(base_url()+"carrito/ListaCarrito", {}, function(data){
       $("#lista_carrito").html(data); 
    });
}
function agregarPedido(carrito){
    alert(carrito);
//    $("#lista_carrito").html("Cargando...");
//    $.post(base_url()+"pedido/agregarPedido/"+carrito, function(data){
//       ListaCarrito(); 
//    });
}

function base_url(){
    var base_url = $("#base_url").val();
    return base_url;
}

function ActualizarCantidad(cantidad, idcarrito){
    $.post(base_url()+"carrito/ActualizarCantidad", {"cantidad":cantidad, "idcarrito":idcarrito}, function(data){
        ListaCarrito();
    });
}

function EliminarCarrito(idcarrito){
   $.post(base_url()+"carrito/EliminarCarrito", {"idcarrito":idcarrito}, function(data){
        ListaCarrito();
    }); 
}
