
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
        <link href="<?= base_url() ?>/css/form.css" rel="stylesheet" type="text/css" media="all" />
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
<script type="text/javascript" src="<?= base_url() ?>/js/jquery.jscrollpane.min.js"></script>
		<script type="text/javascript" id="sourcecode">
			$(function()
			{
				$('.scroll-pane').jScrollPane();
			});
		</script>
<!----details-product-slider--->
				<!-- Include the Etalage files -->
					<link rel="stylesheet" href="<?= base_url() ?>/css/etalage.css">
					<script src="<?= base_url() ?>/js/jquery.etalage.min.js"></script>
				<!-- Include the Etalage files -->
				<script>
						jQuery(document).ready(function($){
			
							$('#etalage').etalage({
								thumb_image_width: 300,
								thumb_image_height: 400,
								
								show_hint: true,
								click_callback: function(image_anchor, instance_id){
									alert('Callback example:\nYou clicked on an image with the anchor: "'+image_anchor+'"\n(in Etalage instance: "'+instance_id+'")');
								}
							});
							// This is for the dropdown list example:
							$('.dropdownlist').change(function(){
								etalage_show( $(this).find('option:selected').attr('class') );
							});

					});
				</script>
				<!----//details-product-slider--->	
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
    <div class="single">
        <div class="wrap">
     	    
<!--		<section  class="sky-form">
                    <h4>Occasion</h4>
                      <div class="row row1 scroll-pane">
                              <div class="col col-4">
                                      <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Athletic (20)</label>
                              </div>
                              <div class="col col-4">
                                      <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Athletic Shoes (48)</label>
                                      <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Casual (45)</label>
                                      <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Casual (45)</label>
                                      <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Other (1)</label>
                          </div>
                       </div>
                    <h4>Category</h4>
                      <div class="row row1 scroll-pane">
                              <div class="col col-4">
                                      <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Flats (70)</label>
                              </div>
                              <div class="col col-4">
                                      <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Athletic Shoes (48)</label>
                                      <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Athletic Shoes (48)</label>
                                      <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Heels (38)</label>
                                      <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Other (1)</label>
                          </div>
                      </div>
                    <h4>Styles</h4>
                        <div class="row row1 scroll-pane">
                            <div class="col col-4">
                                      <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Athletic (20)</label>
                              </div>
                              <div class="col col-4">
                                      <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Ballerina (5)</label>
                                      <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Pumps (7)</label>
                                      <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>High Tops (2)</label>
                                      <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Other (1)</label>
                          </div>
                        </div>
		</section>
                <section  class="sky-form">
                              <h4>Brand</h4>
                                      <div class="row row1 scroll-pane">
                                              <div class="col col-4">
                                                      <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Adidas by Stella McCartney</label>
                                              </div>
                                              <div class="col col-4">
                                                      <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Asics</label>
                                                      <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Bloch</label>
                                                      <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Bloch Kids</label>
                                                      <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Capezio</label>
                                                      <label class="checkbox"><input type="checkbox" name="checkbox" ><i></i>Capezio Kids</label>
                                                      <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Nike</label>
                                                      <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Zumba</label>
                                              </div>
                                      </div>
               </section>
               <section  class="sky-form">
                              <h4>Heel Height</h4>
                                      <div class="row row1 scroll-pane">
                                              <div class="col col-4">
                                                      <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Flat (20)</label>
                                              </div>
                                              <div class="col col-4">
                                                      <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Under 1in(5)</label>
                                                      <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>1in - 1 3/4 in(5)</label>
                                                      <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>2in - 2 3/4 in(3)</label>
                                                      <label class="checkbox"><input type="checkbox" name="checkbox" ><i></i>3in - 3 3/4 in(2)</label>
                                              </div>
                                      </div>
              </section>
              <section  class="sky-form">
                              <h4>Price</h4>
                                      <div class="row row1 scroll-pane">
                                              <div class="col col-4">
                                                      <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>$50.00 and Under (30)</label>
                                              </div>
                                              <div class="col col-4">
                                                      <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>$100.00 and Under (30)</label>
                                                      <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>$200.00 and Under (30)</label>
                                                      <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>$300.00 and Under (30)</label>
                                                      <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>$400.00 and Under (30)</label>
                                              </div>
                                      </div>
              </section>
              <section  class="sky-form">
                              <h4>Colors</h4>
                                      <div class="row row1 scroll-pane">
                                              <div class="col col-4">
                                                      <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Red</label>
                                              </div>
                                              <div class="col col-4">
                                                      <label class="checkbox"><input type="checkbox" name="checkbox"><i></i></label>
                                                      <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Black</label>
                                                      <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Yellow</label>
                                                      <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Orange</label>
                                              </div>
                                      </div>
                </section>-->
            
		<div class="">
                    <div class="labout span_1_of_a2">
				<!-- start product_slider -->
                        <ul id="etalage">
<!--                            <li>
                                <img  class="etalage_thumb_image" src="<?=base_url()?>impanel/files/productos/<?=$pro[0]->img_producto?>" />
                            <img class="etalage_source_image" src="<?=base_url()?>impanel/files/productos/<?=$pro[0]->img_producto?>" />
                                    
                            </li>-->
                            <?php foreach ($galeria as $ga){?>
                                <li>
<!--                                    <img class="etalage_thumb_image" src="<?=base_url()?>impanel/files/productos/<?=$ga->archivo?>" />-->
                                    <img class="etalage_source_image" src="<?=base_url()?>impanel/files/productos/<?=$ga->archivo?>" />
                                </li>
                            <?php } ?>
                            
                        </ul>           
					
					
			<!-- end product_slider -->
                    </div>
                    <div style="float: left"  class="cont1 span_2_of_a1">
                        <div style=" text-align: left; ">
                            <div class="col-sm-6">
                                <h3 class="m_3" style="color: #df8a13;"><?=$pro[0]->nombre?></h3> <hr>
                            <span ><?=get_lang("categoria")?>: <?=$pro[0]->nombre_categoria?></span> <br>
                            <span ><?=get_lang("modelo")?>: <?=$pro[0]->modelo?></span> <br>
                            <span ><?=get_lang("marca")?>: <?=$pro[0]->marca?></span>
                            <div >
                                <span class="actual"><?=get_lang("precio")?>: <?=number_format($pro[0]->precio,2,",",".")?> Bs.</span> <br>
                            <span class="actual"><?=get_lang("precio")?>: <?=number_format($pro[0]->precio_dolares,2,",",".")?>  $</span>
                            </div>
    <!--				<ul class="options">
                                    <h4 class="m_9">Select a Size</h4>
                                    <li><a href="#">6</a></li>
                                    <li><a href="#">7</a></li>
                                    <li><a href="#">8</a></li>
                                    <li><a href="#">9</a></li>
                                    <div class="clear"></div>
                            </ul>-->
                        <p class="m_desc"><?=$pro[0]->descripcion_breve?></p><hr>
                            <div class="btn_form">
                               <form action="<?=base_url()?>carrito/AgregarProducto/<?=$pro[0]->tags?>">
                                    <input type="submit" value="<?=get_lang("agregar-carrito")?>" title="">
                              </form>
                            </div>
<!--                            <ul class="add-to-links">
                                <li><img src="<?= base_url() ?>/images/wish.png" alt=""/><a href="#"><?=get_lang("agregar-carrito")?></a></li>
                            </ul>-->
                           

                            <div class="social_single">	
                                <ul>
                                    <?=GetBtnFacebook()?> <br>
                                    <?=GetBtnTwitter()?>
                                       
<!--                                   <li class="tw"><a href="#"><span> </span></a></li>
                                       <li class="g_plus"><a href="#"><span> </span></a></li>
                                       <li class="rss"><a href="#"><span> </span></a></li>		-->
                                </ul>
                            </div>
                            </div>
                            <div class="col-sm-6">
                                <h3 class="m_3" style="color: #df8a13;"><?=get_lang("producto-detalle")?></h3><hr>
                                <p class="m_text">
<!--                                    <span ><?=get_lang("categoria")?>: <?=$pro[0]->nombre_categoria?></span> <br>
                                    <span ><?=get_lang("modelo")?>: <?=$pro[0]->modelo?></span> <br>
                                    <span ><?=get_lang("marca")?>: <?=$pro[0]->marca?></span><br>

                                    <span class="actual"><?=get_lang("precio")?>: <?=number_format($pro[0]->precio,2,",",".")?> Bs.</span><br>
                                    <span class="actual"><?=get_lang("precio")?>: <?=number_format($pro[0]->precio_dolares,2,",",".")?> $</span>-->
                                    <?=$pro[0]->descripcion_breve?>
                                </p> <hr>
                            </div>
                        </div>
                        <div class="col-sm-12" style=" margin-bottom: 20px">    
                        <h3 class="m_3"  style="margin-top: 30px; color: #df8a13;">
                                    <?=get_lang("productos-similares")?>
                        </h3> <hr>

                        <ul id="flexiselDemo3" style="margin-top: 30px">
                            <?php foreach($productos_similares as $sp){ ?>
                            <a href="<?=base_url()?>product_details/get/<?=$sp->tags?>">
                                <li style="width: 230px; height: 200px">
                                    <img src="<?=base_url()?>impanel/files/productos/<?=$sp->img_producto?>" style="width: 150px; height: 150px"  />
                                    <div class="grid-flex">
                                        <?=$sp->nombre?>
                                        <!--<p><?=$sp->precio?></p>-->
                                    </div>
                                </li>
                            </a>
                            <?php }?>
                        </ul>  
                    </div>
                        <div class="col-sm-6">
                                <h3 class="m_3" style="color: #df8a13;"><?=get_lang("producto-detalle")?></h3><hr>
                                <p class="m_text">
<!--                                    <span ><?=get_lang("categoria")?>: <?=$pro[0]->nombre_categoria?></span> <br>
                                    <span ><?=get_lang("modelo")?>: <?=$pro[0]->modelo?></span> <br>
                                    <span ><?=get_lang("marca")?>: <?=$pro[0]->marca?></span><br>

                                    <span class="actual"><?=get_lang("precio")?>: <?=number_format($pro[0]->precio,2,",",".")?> Bs.</span><br>
                                    <span class="actual"><?=get_lang("precio")?>: <?=number_format($pro[0]->precio_dolares,2,",",".")?> $</span>-->
                                    <?=$pro[0]->descripcion?>
                                </p> <hr>
                    </div>
                    </div>
                    <div class="clear"></div>
                   
                    
                    
	    <script type="text/javascript">
		 $(window).load(function() {
			$("#flexiselDemo1").flexisel();
			$("#flexiselDemo2").flexisel({
				enableResponsiveBreakpoints: true,
		    	responsiveBreakpoints: { 
		    		portrait: { 
		    			changePoint:480,
		    			visibleItems: 1
		    		}, 
		    		landscape: { 
		    			changePoint:640,
		    			visibleItems: 2
		    		},
		    		tablet: { 
		    			changePoint:768,
		    			visibleItems: 3
		    		}
		    	}
		    });
		
			$("#flexiselDemo3").flexisel({
				visibleItems: 5,
				animationSpeed: 1000,
				autoPlay: true,
				autoPlaySpeed: 3000,    		
				pauseOnHover: true,
				enableResponsiveBreakpoints: true,
		    	responsiveBreakpoints: { 
		    		portrait: { 
		    			changePoint:480,
		    			visibleItems: 1
		    		}, 
		    		landscape: { 
		    			changePoint:640,
		    			visibleItems: 2
		    		},
		    		tablet: { 
		    			changePoint:768,
		    			visibleItems: 3
		    		}
		    	}
		    });
		    
		});
	</script>
	<script type="text/javascript" src="<?=base_url()?>/js/jquery.flexisel.js"></script> 
<!--                    <div class="toogle">
                        <h3 class="m_3">Product Reviews</h3>
                        <p class="m_text">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.</p>
                    </div> -->
                </div>
                        
                <div class="clear"></div>
     
        </div>
       
    </div>
	  
<?= GetFooter() ?>    