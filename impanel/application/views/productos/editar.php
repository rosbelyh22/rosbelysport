	<?php 
	open_page($title, "barcode");
	?>

	<form method="post" action="" name="form-edit-cat-pro" id="form-edit-cat-pro" target="" enctype="multipart/form-data">
    <input type="hidden" name="id" id="id" value="<?=$id?>">
	<div class="row">
    <div class="col-sm-4">
    	<label>
        <div class="img_cat_pro img img-responsive img" title="Subir Imagen" style="background-image:url(<?=base_url()?>files/categoria_producto/<?=$categoria[0]->imagen?>)"></div>
        <input type="file" name="userfile" id="userfile" style="display:none">
        <input type="hidden" name="file_name" id="file_name" value="<?=$categoria[0]->imagen?>">
        <input type="hidden" name="folder" id="folder" value="categoria_noticia">
        <input type="hidden" name="mostrar" id="mostrar" value="si">
        <input type="hidden" name="nombre_form" id="nombre_form" value="form-edit-cat-pro">
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
					<option value="<?=$lc->id?>" <? if($categoria[0]->idpadre == $lc->id){ echo "selected";}?>><?=$lc->nombre?></option>
					<?	
				}
				?>
            </select>    
        </div>
        <div class="form-group">
        	<label>Nombre en Ingles</label>
            <div class="input-group">
            <input type="text" name="nombre" id="nombre" required class="form-control" value="<?=$categoria[0]->nombre?>">
            <div class="input-group-addon">N</div>
            </div>
        </div>
        <div class="form-group">
        	<label>Nombre en Español</label>
            <div class="input-group">
            <input type="text" name="nombre_espanol" id="nombre_espanol" required class="form-control" value="<?=$categoria[0]->nombre_espanol?>">
            <div class="input-group-addon">N</div>
            </div>
        </div>
        <div class="form-group">
        	<label>Descripcion en Ingles</label>
            <div class="input-group">
            <textarea name="descripcion" id="descripcion"  class="form-control" style=""><?=$categoria[0]->descripcion?></textarea>
            <div class="input-group-addon">D</div>
            </div>
        </div>
        <div class="form-group">
        	<label>Descripcion en Español</label>
            <div class="input-group">
            <textarea name="descripcion_espanol" id="descripcion_espanol"  class="form-control" style=""><?=$categoria[0]->descripcion_espanol?></textarea>
            <div class="input-group-addon">D</div>
            </div>
        </div>
    	<input type="button" name="btn-edit-cat" id="btn-edit-cat" value="Guardar Categoria" class="btn btn-success">
    </div>    
    </div>
    </form>
    
   <?php close_page();?>

<script src="<?=base_url()?>js/script_productos.js"></script>