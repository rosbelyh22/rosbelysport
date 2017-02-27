<link rel="stylesheet" href="<?=base_url()?>css/jquery-ui.css">

	<?php 
	open_page($title, "globe");
	?>



	
	<div class="row">
    <div class="col-sm-12">
    <form method="post" action="" name="form-add-not" id="form-add-not" enctype="multipart/form-data">
    
    	<div class="form-group">
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
        
        <div class="form-group">
        	<label>Titulo</label>
            <input type="text" name="titulo" id="titulo" required class="form-control" value="">
        </div>
        <div class="form-group">
        	<label>Titulo Español</label>
            <input type="text" name="titulo_espanol" id="titulo_espanol" required class="form-control" value="">
        </div>
        <div class="form-group">
        	
            	<label>Programación de la Publicación (Fecha / Hora y Minuto)</label>
            
            <div class="row">
            <div class="col-sm-3">
            	<?
                $fecha = explode(" ",fecha_actual());
				$hora = explode(":", $fecha[1]);
				?>
            	<input type="text" name="fecha" id="fecha" required class="form-control" value="<?=$fecha[0]?>" style="width:200px" readonly>
            </div>
            <div class="col-sm-4">
            	<table>
                <tr>
                    <td>
                        <select name="hora" id="hora" class="form-control" style="width:100px">
                            <?
                            for($h=1;$h<=23; $h++){
                                ?>
                                <option <? if($h == $hora[0]){ echo "selected"; }?> value="<?=$h?>"><? if($h<10){ echo "0".$h;}else{ echo $h;}?></option>
                                <?	
                            }
                            ?>
                        </select>
                    </td>
                    <td>
                        <strong style="font-size:24px">:</strong>
                    </td>
                    <td>
                        <select name="minuto" id="minuto" class="form-control" style="width:100px">
                            <?
                            for($m=0;$m<=59; $m++){
                                ?>
                                <option <? if($m == $hora[1]){ echo "selected"; }?> value="<?=$m?>"><? if($m<10){ echo "0".$m;}else{ echo $m;}?></option>
                                <?	
                            }
                            ?>
                        </select>
                   </td>
               </tr>
               </table>
            </div>
            </div>
        </div>
        <div class="form-group">
        	<label>Contenido</label>
            <textarea name="contenido" id="contenido"  class="form-control tinymce" style="height:300px;"></textarea>
        </div>
        <div class="form-group">
        	<label>Contenido Español</label>
            <textarea name="contenido_espanol" id="contenido_espanol"  class="form-control tinymce" style="height:300px;"></textarea>
        </div>
        
        
        
       
        
    	<input type="submit" name="btn-add-not" id="btn-add-not" value="Guardar Noticia" class="btn btn-success">
        <input type="button" name="btn-regresar" id="btn-regresar" value="Regresar" class="btn btn-warning" onClick="window.history.back()">
    </form>
	
    </div>
    
    </div>
    
   <?php close_page();?>


<script src="<?=base_url()?>lib/tinymce/tinymce.min.js"></script>

<script>

$(document).ready(function(e) {
    
	
	tinymce.init({
    	selector: "#contenido",
		plugins: [
        "advlist autolink lists link image charmap print preview anchor",
        "searchreplace visualblocks code fullscreen",
        "insertdatetime media table contextmenu paste"
		],
		toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image",
		init_instance_callback : function(editor) {
			tinyMCE.activeEditor.setContent($("#contenido").val());
		}
	});
	tinymce.init({
    	selector: "#contenido_espanol",
		plugins: [
        "advlist autolink lists link image charmap print preview anchor",
        "searchreplace visualblocks code fullscreen",
        "insertdatetime media table contextmenu paste"
		],
		toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image",
		init_instance_callback : function(editor) {
			tinyMCE.activeEditor.setContent($("#contenido_espanol").val());
		}
	});
	
});

</script>
<script src="<?=base_url()?>js/script_noticias.js"></script>


  <script src="<?=base_url()?>js/jquery-ui.js"></script>
<script>
  $(function() {
    $( "#fecha" ).datepicker({ 
		minDate: "-0" 
		//maxDate: "+0" 
	});

  });
  </script>