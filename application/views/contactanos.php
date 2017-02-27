<html lang="en">
<head>
<!-- Basic Page Needs
================================================== -->
<meta charset="utf-8">
<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sporthouse</title>
<meta name="description" content="<?= $conf["meta_descripcion"] ?>">
<meta name="keywords" content="<?= $conf["meta_clave"] ?>">
<meta name="author" content="Omz Construcciones, C.A">

<!-- Favicons
================================================== -->
<!--    <link rel="shortcut icon" href="<?= base_url() ?>img/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="<?= base_url() ?>img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72" href="<?= base_url() ?>img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="<?= base_url() ?>img/apple-touch-icon-114x114.png">-->

<!-- Bootstrap -->
<link rel="stylesheet" type="text/css"  href="<?= base_url() ?>css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<?= base_url() ?>fonts/font-awesome/css/font-awesome.css">

<!-- Slider
================================================== -->
<link href="<?= base_url() ?>css/owl.carousel.css" rel="stylesheet" media="screen">
<link href="<?= base_url() ?>css/owl.theme.css" rel="stylesheet" media="screen">

<!-- Stylesheet
================================================== -->
<!--    <link rel="stylesheet" type="text/css"  href="<?= base_url() ?>css/style.css">
<link rel="stylesheet" type="text/css" href="<?= base_url() ?>css/responsive.css">-->

<link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,700,300,600,800,400' rel='stylesheet' type='text/css'>

<script type="text/javascript" src="<?= base_url() ?>js/modernizr.custom.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->


<meta name="description" content="<?= $conf["meta_descripcion"] ?>">
<meta name="keywords" content="<?= $conf["meta_clave"] ?>">
<!-- FACEBOOK -->
<meta property="og:title" content="<?= $title ?>" />
<meta property="og:description" content="<?= $conf["meta_descripcion"] ?>"/>
<meta property="og:type" content="website" />
<meta property="og:url" content="<?= current_url() ?>" >
<meta property="og:image" content="<?= base_url() ?>img/logo.png" />
<link rel="image_src" href="<?= base_url() ?>" />
<meta property="og:site_name" content="<?= $title ?>" />
<!-- FACEBOOK -->

<?= $conf["api_analytics"] ?>

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<?=base_url()?>css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="<?=base_url()?>js/jquery.min.js"></script>
<script type="text/javascript">
        $(document).ready(function() {
            $(".dropdown img.flag").addClass("flagvisibility");

            $(".dropdown dt a").click(function() {
                $(".dropdown dd ul").toggle();
            });
                        
            $(".dropdown dd ul li a").click(function() {
                var text = $(this).html();
                $(".dropdown dt a span").html(text);
                $(".dropdown dd ul").hide();
                $("#result").html("Selected value is: " + getSelectedValue("sample"));
            });
                        
            function getSelectedValue(id) {
                return $("#" + id).find("dt a span.value").html();
            }

            $(document).bind('click', function(e) {
                var $clicked = $(e.target);
                if (! $clicked.parents().hasClass("dropdown"))
                    $(".dropdown dd ul").hide();
            });


            $("#flagSwitcher").click(function() {
                $(".dropdown img.flag").toggleClass("flagvisibility");
            });
        });
     </script>
<!-- start menu -->     
<link href="<?=base_url()?>css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="<?=base_url()?>js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
<!-- end menu -->
<!-- top scrolling -->
<script type="text/javascript" src="<?=base_url()?>js/move-top.js"></script>
<script type="text/javascript" src="<?=base_url()?>js/easing.js"></script>
   <script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){		
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
			});
		});
	</script>
</head>
<body>
<!--    <div id="msj_exito"> </div> -->
  <?=GetMenu()?>
    
       <div class="register_account">
       
            <div class="wrap">
                <div id="msj_exito" class="alert alert-success" style="display: none;" ><?=get_lang("mensaje-exitoso")?></div>
                <div id="msj_existe" class="alert alert-warning " style="display: none;" ><?=get_lang("email-existe")?> </div>
                <div id="msj_error" class="alert alert-danger " style="display: none;" ><?=get_lang("mensaje-error")?> </div>
                
                <div id="nombre-error" class="alert alert-danger " style="display: none;" ><?=get_lang("error-nombre")?> </div>
                <div id="email-error" class="alert alert-danger " style="display: none;" ><?=get_lang("error-email")?> </div>
                <div id="mensaje-error" class="alert alert-danger " style="display: none;" ><?=get_lang("error-mensaje")?> </div>
                <div id="codigo-error" class="alert alert-danger " style="display: none;" ><?=get_lang("error-codigo")?> </div>
                <div id="numero-error" class="alert alert-danger " style="display: none;" ><?=get_lang("error-numero")?> </div>
                <div id="rifcedula-error" class="alert alert-danger " style="display: none;" ><?=get_lang("error-rifcedula")?> </div>
                <div id="estado-error" class="alert alert-danger " style="display: none;" ><?=get_lang("error-estado")?> </div>
                <div id="clave-error" class="alert alert-danger " style="display: none;" ><?=get_lang("error-clave")?> </div>
                <div id="pais-error" class="alert alert-danger " style="display: none;" ><?=get_lang("error-pais")?> </div>
                <div id="direccion-error" class="alert alert-danger " style="display: none;" ><?=get_lang("error-direccion")?> </div>
    	      <h4 class="title"><?=get_lang("contactanos")?></h4> 
    		   <form method="post" action="" name="form-contacto" id="form-contacto">
    			 <div class="col_1_of_2 span_1_of_2">
                            <div><input type="text" name="nombre" id="nombre" placeholder="<?=get_lang("nombre-completo")?>"></div>
                            
                            <div><input type="text" name="email" id="email" placeholder="<?=get_lang("email")?>"></div>
                            <div><textarea name="mensaje" id="mensaje" placeholder="<?=get_lang("mensaje")?>"></textarea></div>
		    	 </div>
		    	  <div class="col_1_of_2 span_1_of_2">	
                    <input type="text" name="codigo"  id="codigo" class="code" placeholder="<?=get_lang("codigo")?>"> - <input type="text" name="numero" id="numero" class="number"placeholder="<?=get_lang("numero")?>">
		    		<div>
                        <input type="text" name="rif-cedula" id="rif-cedula" placeholder="<?=get_lang("rif")?>" ></div>
                        
                        </div>
                             
		    				        
		        <div class="col-sm-12">
                            <button class="grey" ><?=get_lang("contactanos")?></button>
                                
                                
		          </div>
                      
		         <div class="clear"></div>
                       
		    </form>
    	  </div> 
        </div>
        <script src="<?=base_url()?>js/script_clientes.js"></script>
       	 
       	 
<?= GetFooter()?>   