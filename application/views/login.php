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

        <!--Pagina de Adidas--->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="<?= base_url() ?>css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
        <script type="text/javascript" src="<?= base_url() ?>js/jquery.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $(".dropdown img.flag").addClass("flagvisibility");

                $(".dropdown dt a").click(function () {
                    $(".dropdown dd ul").toggle();
                });

                $(".dropdown dd ul li a").click(function () {
                    var text = $(this).html();
                    $(".dropdown dt a span").html(text);
                    $(".dropdown dd ul").hide();
                    $("#result").html("Selected value is: " + getSelectedValue("sample"));
                });

                function getSelectedValue(id) {
                    return $("#" + id).find("dt a span.value").html();
                }

                $(document).bind('click', function (e) {
                    var $clicked = $(e.target);
                    if (!$clicked.parents().hasClass("dropdown"))
                        $(".dropdown dd ul").hide();
                });


                $("#flagSwitcher").click(function () {
                    $(".dropdown img.flag").toggleClass("flagvisibility");
                });
            });
        </script>
        <!-- start menu -->     
        <link href="<?= base_url() ?>css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="<?= base_url() ?>js/megamenu.js"></script>
        <script>$(document).ready(function () {
                $(".megamenu").megamenu();
            });</script>
        <!-- end menu -->
        <!-- top scrolling -->
        <script type="text/javascript" src="<?= base_url() ?>js/move-top.js"></script>
        <script type="text/javascript" src="<?= base_url() ?>js/easing.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1200);
                });
            });
        </script>
</head>
<body>
  
    <?=GetMenu()?>
       <div class="login">
            <div class="wrap">
                 
                <div class="col_1_of_login span_1_of_login">
                    <div id="msj_noexiste" class="alert alert-danger" style="display: none;" ><?=get_lang("login-no-existe")?></div>
                    <div id="msj_bloqueado" class="alert alert-warning " style="display: none;" ><?=get_lang("login-bloqueado")?> </div>
                    <div id="msj_exito" class="alert alert-success " style="display: none;" ><?=get_lang("login-exito")?> </div>
                    <div id="msj_error" class="alert alert-danger " style="display: none;" ><?=get_lang("login-erro")?> </div>
                    <h4 class="title"><?=get_lang("nuevos-clientes")?></h4> <hr>
                        <h5 class="sub_title"><?=get_lang("create-una-cuenta")?></h5>
                        <p> <?=  GetContenido("texto-registro-de-nuevos-clientes", "", "span")?></p>
                        <div class="button1">
                           <a href="<?=base_url()?>register"> <button class="grey"><?=get_lang("continuar")?></button></a>
                         </div>
                         <div class="clear"></div>
                </div>
                <div class="col_1_of_login span_1_of_login">
                    <div class="login-title">
                        <h4 class="title"><?=get_lang("clientes-registrados")?></h4>
                        <div class="comments-area">
                            <form id="form-inicio" name="form-inicio" method="POST">
                                    <p>
                                            <label><?=get_lang("email")?></label>
                                            <span>*</span>
                                            <input type="text" value="" id="email" name="email">
                                    </p>
                                    <p>
                                            <label><?=get_lang("contrasena")?></label>
                                            <span>*</span>
                                            <input type="password" value="" id="clave" name="clave">
                                    </p>
                                     
                                     <div class="col-sm-6">
                                            <button class="grey"><?=get_lang("login")?></button></a>
                                    </div>
                                    <div class="col-sm-6">
                                        <p>  <label><a href="#"><?=get_lang("olvido-contrasena")?></a></label></p>
                                     </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
	</div>
    <script src="<?=base_url()?>js/script_inicio.js"></script>
    <?= GetFooter()?> 