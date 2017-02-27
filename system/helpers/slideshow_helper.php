<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if ( ! function_exists('element'))
{
	
	function GetSlideshow($slide = ''){
		$CI =& get_instance();
		$CI->load->library("session");
		?>
		
		<div id="header" class="text-center hidden-xs">
                    <div id="headerimgs">
                            <div id="headerimg1" class="headerimg"></div>
                            <div id="headerimg2" class="headerimg"></div>
                    </div>
                    <div id="headernav-outer">
                            <div id="headernav">
                                    <div id="back" class="btnslide"></div>
                                    <div id="control" class="btnslide"></div>
                                    <div id="next" class="btnslide"></div>
                            </div>
                    </div>
                </div>
		
		<?php	
	}
	
         function GetSlideshowModif() {
        $CI = & get_instance();
        $CI->load->library("session");
        $CI->load->model("slideshow_model");
        $slideshow= $CI->slideshow_model->get_slide();
	
        ?>

        <div class="index-banner">
            <div class="wmuSlider example1" style="height: 560px;">
                <div class="wmuSliderWrapper">
                    <?php foreach($slideshow as $slide){?>
                    <article style="position: relative; width: 100%; opacity: 1;"> 
                        <div class="banner-wrap">
                            <div class="slider-left">
                                <img style=" height: 450px" src="<?= base_url() ?>impanel/files/slideshow/<?=$slide->archivo?>" alt=""/> 
                            </div>
                            <div class="slider-right">
                                <h2><?=get_lang("tenemos")?></h2>
                                <h3><?=get_lang("lo-mejor-para-ti")?></h3>
                                <p><?=get_lang("nuestros-productos")?></p>
<!--                                <div class="btn"><a href="<?= base_url()?>shop"><?=get_lang("ver-mas")?></a></div>-->
                            </div>
                            <div class="clear"></div>
                        </div>
                    </article>
                   <?php } ?> 
                </div>
                
                <a class="wmuSliderPrev">Previous</a><a class="wmuSliderNext">Next</a>
<!--                <ul class="wmuSliderPagination">
                   
                   
                </ul>-->
<!--                <a class="wmuSliderPrev">Previous</a><a class="wmuSliderNext">Next</a><ul class="wmuSliderPagination"><li><a href="#" class="wmuActive">0</a></li><li><a href="#" class="">1</a></li><li><a href="#" class="">2</a></li><li><a href="#" class="">3</a></li><li><a href="#" class="">4</a></li></ul>-->
            </div>
            <script src="<?= base_url() ?>js/jquery.wmuSlider.js"></script> 
            <script type="text/javascript" src="<?= base_url() ?>js/modernizr.custom.min.js"></script> 
            <script>
            $('.example1').wmuSlider();
            </script> 	           	      
        </div>

        <?php
    }
	
	
	
	
	
	
	
	function GetSlideshowProductos($galeria){
		$CI =& get_instance();
		$CI->load->library("session");
		?>
		
		<section id="main-slider" class="no-margin">
                    <div class="carousel slide wet-asphalt">
                        <ol class="carousel-indicators">
                            <?php
                            for($i=0; $i<count($galeria); $i++){
                                            ?>
                            <li data-target="#main-slider" data-slide-to="<?=$i?>" <?php if($i == 0){ echo "class='active'";}?>></li>
                            <?php
                            }
                                            ?>
                        </ol>
                        <div class="carousel-inner" role="listbox">

                            <?php
                                            $i = 0;
                            foreach($galeria as $s){
                                                    ?>

                                    <div class="item <?php if($i == 0){ echo "active";}?>" style="background-image: url(<?=base_url()?>impanel/files/productos/<?=$s->archivo?>);  background-size: 100% auto; background-color:#FFF; min-height: 450px">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="carousel-content centered" style="">

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div><!--/.item-->

                                                    <?php
                                                    $i++;	
                                            }
                                            ?> 

                        </div><!--/.carousel-inner-->
                    </div><!--/.carousel-->
                    <a class="prev hidden-xs" href="#main-slider" data-slide="prev">
                        <i class="icon-angle-left"></i>
                    </a>
                    <a class="next hidden-xs" href="#main-slider" data-slide="next">
                        <i class="icon-angle-right"></i>
                    </a>
                </section><!--/#main-slider-->
		
		<?php	
	}
        
        
        
        
        
        
        
        
        
        
        
        
        function GetSlideshowObras($galeria){
		$CI =& get_instance();
		$CI->load->library("session");
		?>
		
		<section id="main-slider" class="no-margin">
                <div class="carousel slide wet-asphalt">
                    <ol class="carousel-indicators">
                        <?php
                        for($i=0; $i<count($galeria); $i++){
                                        ?>
                        <li data-target="#main-slider" data-slide-to="<?=$i?>" <?php if($i == 0){ echo "class='active'";}?>></li>
                        <?php
                        }
                                        ?>
                    </ol>
                    <div class="carousel-inner">

                        <?php
                                        $i = 0;
                        foreach($galeria as $s){
                                                ?>

                                <div class="item <?php if($i == 0){ echo "active";}?>" style="background-image: url(<?=base_url()?>impanel/files/obras/<?=$s->archivo?>); background-repeat: no-repeat;  background-size: 100% auto; background-color:#FFF; min-height: 450px !important;">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="carousel-content centered">
                                            
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div><!--/.item-->

                                                <?php
                                                $i++;	
                                        }
                                        ?> 

                    </div><!--/.carousel-inner-->
                </div><!--/.carousel-->
                <a class="prev hidden-xs" href="#main-slider" data-slide="prev">
                    <i class="icon-angle-left"></i>
                </a>
                <a class="next hidden-xs" href="#main-slider" data-slide="next">
                    <i class="icon-angle-right"></i>
                </a>
            </section><!--/#main-slider-->
		
		<?php	
	}
        
        
	
	

}

/* End of file array_helper.php */
/* Location: ./system/helpers/array_helper.php */
?>