

	<?php 
	open_page($title, "file-o");
	?>

	
	<div class="row">
    <div class="col-sm-12">
    <form method="post" action="" name="form-responder" id="form-responder">
    	<input type="hidden" name="id" id="id" value="<?=$mensaje[0]->id?>">
    	<div class="form-group">
        	<label>Para</label><br>
            <?=$mensaje[0]->nombre_cliente?> < <?=$mensaje[0]->email_cliente?> >
        </div>
        <div class="form-group">
        	<label>Asunto</label><br>
            <?=$mensaje[0]->asunto?>
        </div>
        <div class="form-group">
        	<label>Respuesta</label>
            <?
            $respuesta = "<br><br><hr><b>Mensaje Original del Cliente</b><br><br>".$mensaje[0]->nombre_cliente."<br>".$mensaje[0]->email_cliente."<br><hr><br>".$mensaje[0]->mensaje;
			?>
            <textarea name="mensaje" id="mensaje"  class="form-control tinymce" style="height:300px;"><?=$respuesta?></textarea>
        </div>
    	<input type="submit" name="btn-responder" id="btn-responder" value="Responder" class="btn btn-success">
    </form>
	
    </div>
    
    </div>
    
   <?php close_page();?>


<script src="<?=base_url()?>lib/tinymce/tinymce.min.js"></script>

<script>

$(document).ready(function(e) {
    
	
	tinymce.init({
    selector: "textarea",
    plugins: [
        "advlist autolink lists link image charmap print preview anchor",
        "searchreplace visualblocks code fullscreen",
        "insertdatetime media table contextmenu paste"
    ],
    toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image",
	init_instance_callback : function(editor) {
        tinyMCE.activeEditor.setContent($("#mensaje").val());
    }
	});
	
});

</script>
<script src="<?=base_url()?>js/script_mensajes.js"></script>