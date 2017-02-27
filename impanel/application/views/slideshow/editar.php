

	<?php 
	open_page($title, "camera-retro");
	?>

	
	<div class="row">
    <div class="col-sm-12">
    	<img src="<?=base_url()?>files/slideshow/<?=$slide[0]->archivo?>" class="img-responsive">
    </div>
    
    <div class="col-sm-12">
    <form method="post" action="" name="form-edit-slideshow" id="form-edit-slideshow">
    	<input type="hidden" name="id" id="id" value="<?=$id?>">
    	<div class="form-group">
        <br />
        	<label>Titulo</label>
            <input type="text" name="titulo" id="titulo" required class="form-control" value="<?=$slide[0]->titulo?>">
        </div>
        <div class="form-group">
        	<label>Descripcion</label>
            <textarea name="descripcion" id="descripcion"  class="form-control tinymce"><?=$slide[0]->descripcion?></textarea>
        </div>
        <div class="form-group">
        <br />
        	<label>Titulo Español</label>
            <input type="text" name="titulo_espanol" id="titulo_espanol" required class="form-control" value="<?=$slide[0]->titulo_espanol?>">
        </div>
        <div class="form-group">
        	<label>Descripcion Español</label>
            <textarea name="descripcion_espanol" id="descripcion_espanol"  class="form-control tinymce"><?=$slide[0]->descripcion_espanol?></textarea>
        </div>
        <div class="form-group">
        	<label>Url de Redirección</label>
            <input type="text" name="link" id="link" class="form-control" value="<?=$slide[0]->link?>">
        </div>
        <div class="form-group">
        	<label>Posición de Mostrado</label>
            <input type="text" name="posicion" id="posicion" required class="form-control" value="<?=$slide[0]->posicion?>">
        </div>
    	<input type="submit" name="btn-edit-slideshow" id="btn-edit-slideshow" value="Guardar Slideshow" class="btn btn-success">
    </form>
	
    </div>
    
    </div>
    
   <?php close_page();?>


<script src="<?=base_url()?>js/script_slideshow.js"></script>