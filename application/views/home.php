<!DOCTYPE html>
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
        <?= GetMenu() ?>
        <?= GetSlideshowModif()?>
        <div class="main">
            <div class="wrap">
                <div class="content-top">
                    <div class="lsidebar span_1_of_c1">
                        <p>Aqui va algun texto</p>
                    </div>
                    <div class="cont span_2_of_c1">
                        
                        <?= get_basic_btnredes();?>  
<!--                        <div class="social">	
                            <ul>	
                                <li class="google"><a href="#"><span> </span></a><div class="radius"> <img src="<?= base_url() ?>images/radius.png"></div><div class="border hide"><p class="num">1.51K</p></div></li>
                            </ul>
                        </div>
                        <div class="social">	
                            <ul>	
                                <li class="dot"><a href="#"><span> </span></a><div class="radius"> <img src="<?= base_url() ?>images/radius.png"></div><div class="border hide"><p class="num">1.51K</p></div></li>
                            </ul>
                        </div>-->
                        <div class="clear"> </div>
                    </div>
                    <div class="clear"></div>			
                </div>
             
            </div>
            <?php echo get_publicidad_helper(0, array(0,1), 1)?>
            <div class="header-bottom">
                
                <div class="wrap">
                    <h1 style=" color: white; text-align: center; "><b><?=strtoupper(get_lang("nuestros-productos"))?></b></h1>
                    
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <div class="wrap">
          <div class="col-sm-12" style="margin-bottom: 30px; text-align: center; margin-top: 30px " >
              <h3 ><?= get_lang("nuestros-productos-destacados")?></h3><hr>
                    <p class="m_text"><?= get_lang("hecha-un-vistazo-nuestros-productos")?><p>         
                </div> 
       <?php GetProductosDestacados($productos_destacados)?>
        </div>
        <div class="header-bottom">
                <div class="wrap">
                    <h3 style=" color: white; text-align: center; "><b><?=strtoupper(get_lang("conoce-sobre-nosotros"))?></b></h3>
                    
                    <div class="clear"></div>
                </div>
        </div>
        <div class="wrap">
            <div class="row" id="tf-about">
                <div class="col-sm-4 slider-right" style="margin-bottom: 80px; text-align: center" >
                    <h3><strong><?=get_lang("quienes-somos")?></strong></h3><hr>
                        <p class="m_text"><?=  GetContenido("about-us", "", "span")?><p>         
                </div>
                
                <?php GetProductosDestacadosSlideshow($productos_destacados)?>
            </div>
        </div>
    <?= GetFooter() ?>    	