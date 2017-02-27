<link rel="stylesheet" href="<?=base_url()?>css/jquery-ui.css">

	<?php 
	open_page($title, "barcode");
	?>



	
	<div class="row">
    <div class="col-sm-12">
    <form method="post" action="" name="form-add-pro" id="form-add-pro" enctype="multipart/form-data">
    <input type="hidden" name="idcoleccion" id="idcoleccion" value="0">
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
            <input type="hidden" name="cantidad" id="cantidad" value="0">
        </div>
        <div class="form-group col-sm-3">
            <input type="hidden" name="precio" id="precio" value="0">
        </div>
        <div class="form-group col-sm-3">
            <input type="hidden" name="stock_min" id="stock_min" value="0">
        </div>
        <div class="form-group col-sm-3">
            <input type="hidden" name="stock_max" id="stock_max" value="0">
        </div>
        
        <div class="form-group col-sm-4">
            <input type="hidden" name="modelo" id="modelo" value="0">
        </div>
        <div class="form-group col-sm-4">
            <input type="hidden" name="marca" id="marca" value="0">
        </div>
        <div class="form-group col-sm-4">
            <input type="hidden" name="anio" id="anio" value="0">
        </div>
        
       
        <div class="form-group col-sm-12">
    	<input type="submit" name="btn-add-pro" id="btn-add-pro" value="Guardar Obra" class="btn btn-success">
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
<script src="<?=base_url()?>js/script_obras.js"></script>


  <script src="<?=base_url()?>js/jquery-ui.js"></script>
<script>
  $(function() {
    $( "#fecha" ).datepicker({ 
		minDate: "-0" 
		//maxDate: "+0" 
	});

  });
  </script>