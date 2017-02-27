	<?php 
	open_page($title, "barcode");
	?>

	<form method="post" action="" name="form-add-cat-pro" id="form-add-cat-pro" target="" enctype="multipart/form-data">
    
	<div class="row">
    <div class="col-sm-4">
    	<label>
        <div class="img_cat_pro img img-responsive img" title="Subir Imagen"></div>
        <input type="file" name="userfile" id="userfile" style="display:none">
        <input type="hidden" name="file_name" id="file_name">
        <input type="hidden" name="folder" id="folder" value="categoria_producto">
        <input type="hidden" name="mostrar" id="mostrar" value="si">
        <input type="hidden" name="nombre_form" id="nombre_form" value="form-add-cat-pro">
        </label>
        <iframe width="300" height="300" name="upload_frame" style="display:none"></iframe>
    </div>	
    <div class="col-sm-8">
    	<div class="form-group">
        	<label>Categoria Padre</label>
            <select name="idpadre" id="idpadre" class="form-control">
            	<option value="0">Ninguna</option>
             	<?
                foreach($list_cat as $lc){
					?>
					<option value="<?=$lc->id?>"><?=$lc->nombre?></option>
					<?	
				}
				?>
            </select>    
        </div>
        <div class="form-group">
        	<label>Nombre en Ingles</label>
            <div class="input-group">
            <input type="text" name="nombre" id="nombre" required class="form-control" value="">
            <div class="input-group-addon">N</div>
            </div>
        </div>
        <div class="form-group">
        	<label>Nombre en Español</label>
            <div class="input-group">
            <input type="text" name="nombre_espanol" id="nombre_espanol" required class="form-control" value="">
            <div class="input-group-addon">N</div>
            </div>
        </div>
        <div class="form-group">
        	<label>Descripcion en Ingles</label>
            <div class="input-group">
            <textarea name="descripcion" id="descripcion"  class="form-control" style=""></textarea>
            <div class="input-group-addon">D</div>
            </div>
        </div>
        <div class="form-group">
        	<label>Descripcion en Español</label>
            <div class="input-group">
            <textarea name="descripcion_espanol" id="descripcion_espanol"  class="form-control" style=""></textarea>
            <div class="input-group-addon">D</div>
            </div>
        </div>
    	<input type="button" name="btn-add-cat" id="btn-add-cat" value="Guardar Categoria" class="btn btn-success">
    </div>    
    </div>
    </form>
    
   <?php close_page();?>

<script src="<?=base_url()?>js/script_productos.js"></script>