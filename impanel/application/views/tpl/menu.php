<div class="modal fade" id="mo_salir" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Salir del Sistema</h4>
            </div>
            <div class="modal-body">
                ¿Realmente deseas salir del sistema?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                <button type="button" class="btn btn-primary" onclick="ses_out()">Si, Salir</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>





<nav class="navbar navbar-default navbar-static-top hidden-print" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<?=base_url()?>index.php/escritorio/">IMPanel</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-envelope fa-fw" <?php if($msj_noleidos > 0){ ?> style="color:#F00" title="Tienes mensajes sin Leer" <?php }?>></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    
                    
                    
                    
                    <ul class="dropdown-menu dropdown-messages">
                        <?php
						if($msj_noleidos == 0){
							?>
							<li style="text-align:center"><em>No se encontraron mensajes sin leer</em></li>
                            <li class="divider"></li>	
							<?	
						}else{
						$i=0;
                        foreach($not_msj as $nm){
							?>
							<li>
                                <a href="<?=base_url()?>index.php/mensajes/responder/<?=$nm->id?>">
                                    <div>
                                        <strong><?=$nm->nombre_cliente?></strong>
                                        <span class="pull-right text-muted">
                                            <em>
                                            <?
                                            $unix = mysql_to_unix($nm->fecha);
											$fecha = unix_to_human($unix);
											echo $fecha;
											?>
                                            </em>
                                        </span>
                                    </div>
                                    <div><?=character_limiter(strip_tags($nm->mensaje), 30);?></div>
                                </a>
                            </li>
                            <li class="divider"></li>	
							<?
							if($i==3){
								break;	
							}else{
								$i++;	
							}	
						}
						}
						?>
                        

                        <li>
                            <a class="text-center" href="<?=base_url()?>index.php/mensajes/">
                                <strong>Leer todos los Mensajes</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    
                    
                    
                    
                    
                    <!-- /.dropdown-messages -->
                </li>
                <!-- /.dropdown -->
                
                
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li style="background:#069; color:#FFF">
                        <span class="datos_per_menu">
							<div class="row">
                                <div class="col-sm-4">
                                	<?
                                    if($this->session->userdata("imagen") != ''){
									?>
                                    <div class="img-circle" style="background:url(<?=base_url()?>files/perfil/<?=$this->session->userdata("imagen")?>) center no-repeat; background-size:contain; width:60px; height:60px; border:#CCC solid 1px; background-color:#FFF"></div>
                                    <?
									}
									?>
                                </div>
                                <div class="col-sm-8">
                                    <?=$this->session->userdata("nombre")?><br />
                                    <?=$this->session->userdata("cargo")?><br />
                                </div>
                            </div>
                        </span>
                        </li>
                        <li>
                        <a href="#">
                        	<i class="fa fa-user fa-fw"></i> Mi Perfil
                        </a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Configurar mi Cuenta</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="#" data-toggle="modal" data-target="#mo_salir"><i class="fa fa-sign-out fa-fw"></i> Salir</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        
                        <li>
                            <a href="<?=base_url()?>index.php/escritorio/"><i class="fa fa-dashboard fa-fw"></i> Escritorio</a>
                        </li>
                        
                        <?
						$mo = array();
                        $mo = $this->session->userdata("mods");
						//var_dump($this->session->all_userdata());
						foreach($mo as $m){
							?>
							<li>
                            	<a href="<?=base_url()?>index.php/<?=$m["url"]?>"><i class="fa fa-<?=$m["icono"]?> fa-fw"></i> <?=$m["nombre"]?>
                                </a>
                       		</li>
							<?	
						}
						?>
                        
                        
                        
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>