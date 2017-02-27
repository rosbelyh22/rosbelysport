

	<?php 
	open_page($title, "camera-retro");
	?>

	
	<div class="row">
    <div class="col-sm-12">
    <form method="post" action="" name="form-add-slideshow" id="form-add-slideshow" enctype="multipart/form-data">
    
    	<div class="form-group">
            <label>
            <div class="img_cat_not img img-responsive img" title="Subir Imagen"></div>
            <input type="file" name="userfile" id="userfile" style="display:none">
            <input type="hidden" name="file_name" id="file_name">
            <input type="hidden" name="folder" id="folder" value="slideshow">
            <input type="hidden" name="mostrar" id="mostrar" value="si">
            <input type="hidden" name="nombre_form" id="nombre_form" value="form-add-slideshow">
            </label>
            <iframe width="300" height="300" name="upload_frame" style="display:none"></iframe>
        </div>
    	<div class="form-group">
        	<label>Titulo</label>
            <input type="text" name="titulo" id="titulo" required class="form-control" value="">
        </div>
        <div class="form-group">
        	<label>Descripción</label>
            <textarea name="descripcion" id="descripcion"  class="form-control"></textarea>
        </div>
        <div class="form-group">
        	<label>Titulo Español</label>
            <input type="text" name="titulo_espanol" id="titulo_espanol" required class="form-control" value="">
        </div>
        <div class="form-group">
        	<label>Descripción Español</label>
            <textarea name="descripcion_espanol" id="descripcion_espanol"  class="form-control"></textarea>
        </div>
        <div class="form-group">
        	<label>Url de Redirección</label>
            <input type="text" name="link" id="link" required class="form-control" value="">
        </div>
        <div class="form-group">
        	<label>Posición de Mostrado</label>
            <input type="text" name="posicion" id="posicion" required class="form-control" value="">
        </div>
    	<input type="button" name="btn-add-slideshow" id="btn-add-slideshow" value="Cargar Slideshow" class="btn btn-success">
        <input type="button" name="btn-regresar" id="btn-regresar" value="Regresar" class="btn btn-warning">
    </form>
	
    </div>
    
    </div>
    
   <?php close_page();?>

<script src="<?=base_url()?>js/script_slideshow.js"></script>