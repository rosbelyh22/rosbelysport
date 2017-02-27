<link rel="stylesheet" href="<?=base_url()?>css/jquery-ui.css">

	<?php 
	open_page($title, "external-link-square");
	?>

	
	<div class="row">
    <div class="col-sm-12">
    <form method="post" action="" name="form-add-publicidad" id="form-add-publicidad" enctype="multipart/form-data">
    
    	<?
        open_panel(array(),"Datos del Anuncio");
		?>
        <div class="row">
            <div class="form-group col-sm-6">
                <label>
                <div class="img_cat_not img img-responsive img" title="Subir Imagen"></div>
                <input type="file" name="userfile" id="userfile" style="display:none">
                <input type="hidden" name="file_name" id="file_name">
                <input type="hidden" name="folder" id="folder" value="publicidad">
                <input type="hidden" name="mostrar" id="mostrar" value="si">
                <input type="hidden" name="nombre_form" id="nombre_form" value="form-add-publicidad">
                </label>
                <iframe width="300" height="300" name="upload_frame" style="display:none"></iframe>
            </div>
            <div class="form-group col-sm-6">
                <label>URL de redirección</label>
                <input type="text"name="url" id="url"  class="form-control" required="required">
            </div>
            <div class="form-group col-sm-6">
                <label>Nombre</label>
                <input type="text" name="nombre" id="nombre" required class="form-control" value="">
            </div>
            <div class="form-group col-sm-6">
                <label>Descripción</label>
                <textarea name="descripcion" id="descripcion"  class="form-control"></textarea>
            </div>
		</div>    
        <?
        close_panel();
		?>  
        
        
        
        <?
        open_panel(array(),"Datos del Cliente");
		?>      
        <div class="row">
            <div class="form-group col-sm-6">
                <label>Nombre del Cliente</label>
                <input type="text" name="nombre_cliente" id="nombre_cliente" required class="form-control" value="">
            </div>
            <div class="form-group col-sm-6">
                <label>Datos Contacto Cliente</label>
                <input type="text" name="telefono_cliente" id="telefono_cliente"  class="form-control" value="">
            </div>
        </div>
        <?
        close_panel();
		?>
        
        
        
        <?
        open_panel(array(),"Configuración de la Visualización");
		?>
        <div class="alert alert-warning">
        	<strong>Nota Importante:</strong><br />
            El sistema dejara el anuncio activo hasta que se cumpla alguno de los valores maximos de la configuración o se llegue a la fecha fin de la misma. Si los valores son declarados en cero (0), el sistema mostrara de manera infinita el anuncio hasta que sea dado de baja manualmente o hasta que los parametros sean modificados por algun valor deseado.
        </div>
        <div class="row">
        
        
            <div class="form-group col-sm-6">
                <label>Posición del Anuncio</label>
                <select name="posicion" id="posicion" class="form-control">
                    <option value="0">Centro</option>
                    <option value="1">Izquierda</option>
                    <option value="2">Derecha</option>
                </select>
            </div>
            <div class="form-group col-sm-6">
                <label>Secciones</label>
                <select name="secciones" id="secciones" class="form-control">
                    <option value="0">Todas</option>
                    <option value="1">Inicio</option>
                    <option value="2">Paginas Internas</option>
                </select>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-sm-6">
            	<label>Cantidad maxima de impresiones</label>
                <input type="text" name="cantidad_impresiones" id="cantidad_impresiones" class="form-control" value="0">    
            </div>
            <div class="form-group col-sm-6">
            	<label>Cantidad maxima de Clic</label>
                <input type="text" name="cantidad_impresiones" id="cantidad_impresiones" class="form-control" value="0">    
            </div>
        </div>
        <div class="row">
            <div class="form-group col-sm-6">
            	<label>Fecha de Inicio</label>
                <input type="text" name="fecha_inicio" id="fecha_inicio" class="form-control" readonly="readonly" value="<?=date("Y-m-d")?>">    
            </div>
            <div class="form-group col-sm-6">
            	<label>Fecha Fin</label>
                <input type="text" name="fecha_fin" id="fecha_fin" class="form-control" readonly="readonly">    
            </div>
        </div>
        <?
        close_panel();
		?>
        
        
        
        
        
        
        
    	<input type="button" name="btn-add-publicidad" id="btn-add-publicidad" value="Guardar Anuncio" class="btn btn-success">
        <input type="button" name="btn-regresar" id="btn-regresar" value="Regresar" class="btn btn-warning">
    </form>
	
    </div>
    
    </div>
    
   <?php close_page();?>




<script src="<?=base_url()?>js/script_publicidad.js"></script>

  <script src="<?=base_url()?>js/jquery-ui.js"></script>
<script>
  $(function() {
    $( "#fecha_inicio" ).datepicker({ 
		minDate: "-0" 
		//maxDate: "+0" 
	});
	
	$( "#fecha_fin" ).datepicker({
	minDate: "-0"	
	});
  });
  </script>