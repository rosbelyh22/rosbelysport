<link rel="stylesheet" href="<?=base_url()?>css/jquery-ui.css">

	<?php 
	open_page($title, "barcode");
	?>



	
	<div class="row">
    <div class="col-sm-12">
    <form method="post" action="" name="form-edit-pro" id="form-edit-pro" enctype="multipart/form-data">
    <input type="hidden" name="id" id="id" value="<?=$producto[0]->id?>">
    	<div class="form-group col-sm-6">
        	<label>Categoria</label>
            <select name="idcategoria" id="idcategoria" class="form-control">	
            	<?
                foreach($list_categorias as $lc){
					?>
					<option <? if($producto[0]->idcategoria == $lc->id){ echo "selected";}?> value="<?=$lc->id?>"><?=$lc->nombre?></option>
					<?	
				}
				?>
            </select>
        </div>
        
        <div class="form-group col-sm-6">
        	<label>Colección</label>
            <select name="idcoleccion" id="idcoleccion" class="form-control">	
            	<?
                foreach($list_coleccion as $lc){
					?>
					<option <? if($producto[0]->idcoleccion == $lc->id){ echo "selected";}?> value="<?=$lc->id?>"><?=$lc->nombre?></option>
					<?	
				}
				?>
            </select>
        </div>
        
        
        <div class="form-group col-sm-6">
        	<label>Codigo</label>
            <input type="text" name="codigo" id="codigo" required class="form-control" value="<?=$producto[0]->codigo?>" maxlength="50">
        </div>
        <div class="form-group col-sm-12">
        	<label>Nombre en Ingles</label>
            <input type="text" name="nombre" id="nombre" required class="form-control" value="<?=$producto[0]->nombre?>">
        </div>
        
        <div class="form-group col-sm-12">
        	<label>Nombre en Español</label>
            <input type="text" name="nombre_espanol" id="nombre_espanol" required class="form-control" value="<?=$producto[0]->nombre_espanol?>">
        </div>
        
        
        
        
        
        <div class="form-group col-sm-12">
        	<label>Descripción en Ingles</label>
            <textarea name="descripcion" id="descripcion"  class="form-control tinymce" style="height:300px;"><?=$producto[0]->descripcion?></textarea>
        </div>
        <div class="form-group col-sm-12">
        	<label>Descripción en Español</label>
            <textarea name="descripcion_espanol" id="descripcion_espanol"  class="form-control tinymce" style="height:300px;"><?=$producto[0]->descripcion_espanol?></textarea>
        </div>
        <div class="form-group col-sm-12">
        	<label>Descripción Breve en Ingles</label>
            <input type="text" name="descripcion_breve" id="descripcion_breve"  class="form-control" maxlength="255" value="<?=$producto[0]->descripcion_breve?>">
        </div>
        <div class="form-group col-sm-12">
        	<label>Descripción Breve en Español</label>
            <input type="text" name="descripcion_breve_espanol" id="descripcion_breve_espanol"  class="form-control" maxlength="255" value="<?=$producto[0]->descripcion_breve_espanol?>">
        </div>
        <div class="form-group col-sm-3">
        	<label>Cantidad</label>
            <input type="text" name="cantidad" id="cantidad" required class="form-control"  style="text-align:right" onclick="this.select()" value="<?=$producto[0]->cantidad?>">
        </div>
        <div class="form-group col-sm-3">
        	<label>Precio en Bolivares</label>
            <input type="text" name="precio" id="precio" required class="form-control"  style="text-align:right" onclick="this.select()" value="<?=$producto[0]->precio?>">
        </div>
        <div class="form-group col-sm-3">
        	<label>Precio en Dolares</label>
            <input type="text" name="precio_dolares" id="precio_dolares" required class="form-control"  style="text-align:right" onclick="this.select()" value="<?=$producto[0]->precio_dolares?>">
        </div>
        <div class="form-group col-sm-3">
        	<label>Stock Minimo</label>
            <input type="text" name="stock_min" id="stock_min" required class="form-control" style="text-align:right" onclick="this.select()" value="<?=$producto[0]->stock_min?>">
        </div>
        <div class="form-group col-sm-3">
        	<label>Stock Maximo</label>
            <input type="text" name="stock_max" id="stock_max" required class="form-control"  style="text-align:right" onclick="this.select()" value="<?=$producto[0]->stock_max?>">
        </div>
        
        <div class="form-group col-sm-3">
        	<label>Modelo</label>
            <input type="text" name="modelo" id="modelo" required class="form-control" value="<?=$producto[0]->modelo?>">
        </div>
        <div class="form-group col-sm-3">
        	<label>Marca</label>
            <input type="text" name="marca" id="marca" required class="form-control" value="<?=$producto[0]->marca?>">
        </div>
        <div class="form-group col-sm-3">
        	<label>Año</label>
            <input type="text" name="anio" id="anio" required class="form-control" value="<?=$producto[0]->anio?>">
        </div>
        <div class="form-group col-sm-3">
        	<label>Talla</label>
            <input type="text" name="talla" id="talla" required class="form-control" value="<?=$producto[0]->talla?>">
        </div>
        
        
       
        
    	<input type="submit" name="btn-edit-pro" id="btn-edit-pro" value="Guardar Producto" class="btn btn-success">
        <input type="button" name="btn-regresar" id="btn-regresar" value="Regresar" class="btn btn-warning" onClick="window.history.back()">
    </form>
	
    </div>
    
    </div>
    
   <?php close_page();?>


<script src="<?=base_url()?>lib/tinymce/tinymce.min.js"></script>

<script>

$(document).ready(function(e) {
    
	
	tinymce.init({
    selector: "#descripcion"
	});
	
	tinymce.init({
    selector: "#descripcion_espanol"
	});
	
	
});

</script>
<script src="<?=base_url()?>js/script_productos.js"></script>

  <script src="<?=base_url()?>js/jquery-ui.js"></script>
<script>
  $(function() {
    $( "#fecha" ).datepicker({ 
		minDate: "-0" 
		//maxDate: "+0" 
	});

  });
  </script>