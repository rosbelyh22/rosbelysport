

	<?php 
	open_page($title, "file-o");
	?>

	
	<div class="row">
    <div class="col-sm-12">
    <form method="post" action="" name="form-add-con" id="form-add-con">
    
    	<div class="form-group">
        	<label>Titulo</label>
            <input type="text" name="titulo" id="titulo" required class="form-control" value="">
        </div>
        <div class="form-group">
        	<label>Contenido</label>
            <textarea name="contenido" id="contenido"  class="form-control tinymce" style="height:300px;"></textarea>
        </div>
    	<input type="submit" name="btn-edit-motiv" id="btn-edit-motiv" value="Guardar Contenido" class="btn btn-success">
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
<script src="<?=base_url()?>js/script_contenido.js"></script>