<?
load_modal("model_del_galeria", 
			"Eliminar Imagen", 
			"¿Realmente deseas eliminar la imagen seleccionada?", 
			"del_galeria()");
?>



	<?php 
	open_page($title, "globe");
	?>
	<div class="alert alert-warning"><strong>Nota Importante:</strong> Al momento que seleccione el archivo a subir en su carpeta, el sistema comenzara la subida automaticamente, no genere ninguna otra acción y espere pacientemente a que el sistema le de respuesta de la tarea ejecutada.<br /><br />
    <strong>Imagen Principal:</strong> Cuando una imagen es seleccionada como principal, el color de fondo de la misma debe cambiarse a un color similar al de este cuadro de mensaje, y al mismo tiempo debe desaparecer el boton de Principal de las opciones de esa imagen. Si no tiene ninguna imagen seleccionada como principal, el sistema tomara cualquiera de las imagenes para colocarla como principal en el portal web.</div> 
    <form method="post" enctype="multipart/form-data" name="form-add-galeria" id="form-add-galeria">
    <input type="hidden" name="id_eliminar" id="id_eliminar">
	<input type="hidden" id="id" name="id" value="<?=$producto[0]->id?>">
    <input type="hidden" name="model" id="model" value="productos_model">
	<label>
    	<div class="btn btn-success">
        Subir Imagen
        <input type="file" name="userfile" id="userfile" style="display:none">
        <input type="hidden" name="file_name" id="file_name">
        <input type="hidden" name="folder" id="folder" value="productos">
        <input type="hidden" name="mostrar" id="mostrar" value="no">
        <input type="hidden" name="nombre_form" id="nombre_form" value="form-add-galeria">
        </div>
    </label>
    <input type="button" name="btn-regresar" id="btn-regresar" value="Regresar" onClick="location.href='<?=base_url()."index.php/productos/lista_productos/".$producto[0]->idcategoria?>'" class="btn btn-warning">
    <iframe width="300" height="300" name="upload_frame" style="display:none"></iframe>
    </form>
    
    <hr>
    <div id='galeria'></div>
   <?php close_page();?>

<script src="<?=base_url()?>js/script_productos.js"></script>
<script>
$(document).ready(function(e) {
    var id = $("#id").val();
	load_galeria(id);
});

</script>