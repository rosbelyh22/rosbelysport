

	<?php 
	open_page($title, "list-alt");
	?>

	<form method="post" action="" name="form-edit-menu" id="form-edit-menu">
	<div class="row">
    
    <input type="hidden" name="sel_idrelacion" id="sel_idrelacion" value="<?=$menu[0]->idrelacion?>">
    <input type="hidden" name="sel_url" id="sel_url" value="<?=$menu[0]->url?>">
    <input type="hidden" id="id" name="id" value="<?=$menu[0]->id?>" >
    
    	<div class="form-group col-sm-6">
        	<label>Nombre en Ingles</label>
            <input type="text" name="nombre" id="nombre" required class="form-control" value="<?=$menu[0]->nombre?>">
        </div>
        <div class="form-group col-sm-6">
        	<label>Nombre en Español</label>
            <input type="text" name="nombre_espanol" id="nombre_espanol" required class="form-control" value="<?=$menu[0]->nombre_espanol?>">
        </div>
        <div class="form-group col-sm-6">
        	<label>Menu Padre</label>
            <select name="idpadre" id="idpadre" class="form-control">
            <option value="0">Ninguno</option>
            <?
            foreach($list_padres as $p){
				?>
				<option <? if($menu[0]->idpadre == $p->id){ echo "selected";}?> value="<?=$p->id?>"><?=$p->nombre?></option>
				<?	
			}
			?>
            </select>
        </div>
        <div class="form-group col-sm-6">
        	<label>Tipo de Pagina</label>
            <select name="tipo" id="tipo" class="form-control">
				<?
                foreach($tipo as $t){
					?>
					<option <? if($menu[0]->tipo == $t->id){ echo "selected";}?> value="<?=$t->id?>"><?=$t->nombre?></option>
					<?	
				}
				?>
            </select>
        </div>
        
        <div class="form-group col-sm-6">
        	<label>Sección Relacionada</label>
            <span id="sec_rel">
            <select name="idrelacion" id="idrelacion" class="form-control">
            	<option value="0">Ninguna</option>
            </select>
            </span>
        </div>
        
        <div class="form-group col-sm-6">
        	<label>Posición</label>
            <input type="text" name="posicion" id="posicion" value="<?=$menu[0]->posicion?>" class="form-control">
        </div>
    	
        <div class="col-sm-12">
        <input type="submit" name="btn-edit-menu" id="btn-edit-menu" value="Guardar Menu" class="btn btn-success">
        <input type="button" name="btn-regresar" id="btn-regresar" value="Regresar" class="btn btn-warning">
    	</div>
	
   
    
    </div>
    </form>
   <?php close_page();?>


<script src="<?=base_url()?>js/script_menu.js"></script>
<script>
$(document).ready(function(e) {
    setTimeout("load_relacion()", 500);
});
</script>