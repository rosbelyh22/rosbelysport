

	<?php 
	open_page($title, "list-alt");
	?>

	<form method="post" action="" name="form-add-menu" id="form-add-menu">
	<div class="row">
    
    
    	<input type="hidden" name="sel_idrelacion" id="sel_idrelacion" value="0">
        
        
    	<div class="form-group col-sm-6">
        	<label>Nombre en Ingles</label>
            <input type="text" name="nombre" id="nombre" required class="form-control" value="">
        </div>
        <div class="form-group col-sm-6">
        	<label>Nombre en Español</label>
            <input type="text" name="nombre_espanol" id="nombre_espanol" required class="form-control" value="">
        </div>
        <div class="form-group col-sm-6">
        	<label>Menu Padre</label>
            <select name="idpadre" id="idpadre" class="form-control">
            <option value="0">Ninguno</option>
            <?
            foreach($list_padres as $p){
				?>
				<option value="<?=$p->id?>"><?=$p->nombre?></option>
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
					<option value="<?=$t->id?>"><?=$t->nombre?></option>
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
            <input type="text" name="posicion" id="posicion" class="form-control" value="<?=count($list_padres)+1?>">
        </div>
        
        <div class="col-sm-12">
    	<input type="submit" name="btn-add-menu" id="btn-add-menu" value="Guardar Menu" class="btn btn-success">
        <input type ='button' name="btn-regresar" id="btn-regresar" value="Regresar" class="btn btn-warning">
        </div>
   
	
    
    
    </div>
     </form>
    
   <?php close_page();?>


<script src="<?=base_url()?>js/script_menu.js"></script>