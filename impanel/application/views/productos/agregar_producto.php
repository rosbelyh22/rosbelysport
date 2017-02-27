<link rel="stylesheet" href="<?=base_url()?>css/jquery-ui.css">

	<?php 
	open_page($title, "barcode");
	?>



	
	<div class="row">
    <div class="col-sm-12">
    <form method="post" action="" name="form-add-pro" id="form-add-pro" enctype="multipart/form-data">
    
    	<div class="form-group col-sm-6">
        	<label>Categoria</label>
            <select name="idcategoria" id="idcategoria" class="form-control">	
            	<?
                foreach($list_categorias as $lc){
					?>
					<option value="<?=$lc->id?>"><?=$lc->nombre?></option>
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
					<option value="<?=$lc->id?>"><?=$lc->nombre?></option>
					<?	
				}
				?>
            </select>
        </div>
        
        <div class="form-group col-sm-6">
        	<label>Codigo</label>
            <div class="input-group">
            <input type="text" name="codigo" id="codigo" required class="form-control" value="" maxlength="50">
            <div class="input-group-addon"><i class="fa fa-barcode"></i></div>
            </div>
        </div>
        <div class="form-group col-sm-12">
        	<label>Nombre en Ingles</label>
            <input type="text" name="nombre" id="nombre" required class="form-control" value="">
        </div>
        <div class="form-group col-sm-12">
        	<label>Nombre en Español</label>
            <input type="text" name="nombre_espanol" id="nombre_espanol" required class="form-control" value="">
        </div>
        
        <div class="form-group col-sm-12">
        	<label>Descripción en Ingles</label>
            <textarea name="descripcion" id="descripcion"  class="form-control tinymce editor" style="height:300px;"></textarea>
        </div>
        <div class="form-group col-sm-12">
        	<label>Descripción en Español</label>
            <textarea name="descripcion_espanol" id="descripcion_espanol"  class="form-control tinymce editor" style="height:300px;"></textarea>
        </div>
        <div class="form-group col-sm-12">
        	<label>Descripción Breve en Ingles</label>
            <input type="text" name="descripcion_breve" id="descripcion_breve"  class="form-control" maxlength="255">
        </div>
        <div class="form-group col-sm-12">
        	<label>Descripción Breve en Español</label>
            <input type="text" name="descripcion_breve_espanol" id="descripcion_breve_espanol"  class="form-control" maxlength="255">
        </div>
        <div class="form-group col-sm-3">
        	<label>Cantidad</label>
            <input type="text" name="cantidad" id="cantidad" required class="form-control" value="0.00" style="text-align:right" onclick="this.select()">
        </div>
        <div class="form-group col-sm-3">
        	<label>Precio en Bolivares</label>
            <input type="text" name="precio" id="precio" required class="form-control" value="0.00" style="text-align:right" onclick="this.select()">
        </div>
        <div class="form-group col-sm-3">
        	<label>Precio en Dolares</label>
            <input type="text" name="precio_dolares" id="precio_dolares" required class="form-control" value="0.00" style="text-align:right" onclick="this.select()">
        </div>
        <div class="form-group col-sm-3">
        	<label>Stock Minimo</label>
            <input type="text" name="stock_min" id="stock_min" required class="form-control" value="0.00" style="text-align:right" onclick="this.select()">
        </div>
        <div class="form-group col-sm-3">
        	<label>Stock Maximo</label>
            <input type="text" name="stock_max" id="stock_max" required class="form-control" value="0.00" style="text-align:right" onclick="this.select()">
        </div>
        <div class="form-group col-sm-3">
        	<label>Modelo</label>
            <input type="text" name="modelo" id="modelo" required class="form-control" value="">
        </div>
        <div class="form-group col-sm-3">
        	<label>Marca</label>
            <input type="text" name="marca" id="marca" required class="form-control" value="">
        </div>
        <div class="form-group col-sm-3">
        	<label>Año</label>
            <input type="text" name="anio" id="anio" required class="form-control" value="">
        </div>
        <div class="form-group col-sm-3">
        	<label>Talla</label>
            <input type="text" name="talla" id="talla" required class="form-control" style="text-align:right">
        </div>
       
        <div class="form-group col-sm-12">
    	<input type="submit" name="btn-add-pro" id="btn-add-pro" value="Guardar Producto" class="btn btn-success">
        <input type="button" name="btn-regresar" id="btn-regresar" value="Regresar" class="btn btn-warning" onClick="window.history.back()">
        </div>
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