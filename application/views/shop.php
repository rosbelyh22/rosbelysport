
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Sporthouse</title>
        <meta name="description" content="<?= $conf["meta_descripcion"] ?>">
        <meta name="keywords" content="<?= $conf["meta_clave"] ?>">
        <meta name="author" content="Omz Construcciones, C.A">

        <link rel="stylesheet" type="text/css"  href="<?= base_url() ?>css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="<?= base_url() ?>fonts/font-awesome/css/font-awesome.css">


        <link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,700,300,600,800,400' rel='stylesheet' type='text/css'>


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
            $(function ()
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
            jQuery(document).ready(function ($) {

                $('#etalage').etalage({
                    thumb_image_width: 300,
                    thumb_image_height: 400,
                    show_hint: true,
                    click_callback: function (image_anchor, instance_id) {
                        alert('Callback example:\nYou clicked on an image with the anchor: "' + image_anchor + '"\n(in Etalage instance: "' + instance_id + '")');
                    }
                });
                // This is for the dropdown list example:
                $('.dropdownlist').change(function () {
                    etalage_show($(this).find('option:selected').attr('class'));
                });

            });
        </script>
        <!----//details-product-slider--->	
        <!-- top scrolling -->
        <script type="text/javascript" src="<?= base_url() ?>js/move-top.js"></script>
        <script type="text/javascript" src="<?= base_url() ?>js/easing.js"></script>
        <script type="text/javascript">
//            jQuery(document).ready(function ($) {
//                $(".scroll").click(function (event) {
//                    event.preventDefault();
//                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1200);
//                });
//            });
        </script>					
    </head>
    <body>
        <?php get_base_categories(); ?>
        <?= GetMenu() ?>

            <div class="login">
                <div class="wrap">
                    <div class="col col-xs-12 rsidebar"> <a href="<?= base_url() ?>home"> Inicio</a>  
                        <?php
                        foreach ($categorias as $categoria) {
                            echo "> <a href='http://adidas.pro/shop?categoria=" . $categoria . "'> " . $categoria . "</a> ";
                        }
                        ?>
                    </div>
                    <div class="hidden-xs rsidebar span_1_of_left">
                        <section  class="sky-form">
                            <h4><?= get_lang("marca") ?></h4>
                            <div class="row row1 scroll-pane">
                                <?php
                                if (count($marcas) <= 0) {
                                    echo '<div class="col col-sm-12">Sin marcas asociados</div>';
                                } else {
                                    foreach ($marcas as $marca) {
                                        ?>
                                        <div class="col col-sm-12">
                                            <label class="checkbox">
                                                <input type="checkbox" 
                                                       name="marca" 
                                                       value="<?= $marca ?>">
                                                <i></i><?= $marca ?>
                                            </label>
                                        </div>
                                    <?php }
                                }
                                ?>
                            </div>
                        </section>
                        <section  class="sky-form">
                            <h4><?= get_lang("modelo") ?></h4>
                            <div class="row row1 scroll-pane">
                                <?php
                                if (count($modelos) <= 0) {
                                    echo '<div class="col col-sm-12">Sin modelos asociados</div>';
                                } else {
                                    foreach ($modelos as $modelo) {
                                        ?>
                                        <div class="col col-sm-12">
                                            <label class="checkbox">
                                                <input type="checkbox" name="modelo" value="<?= $modelo ?>"><i></i><?= $modelo ?>
                                            </label>
                                        </div>
                                    <?php }
                                }
                                ?>
                            </div>
                        </section>
                        <section  class="sky-form">
                            <h4><?= get_lang("anio") ?></h4>
                            <div class="row row1 scroll-pane">
                                <?php
                                if (count($anios) <= 0) {
                                    echo '<div class="col col-sm-12">Sin a&ntilde;os asociados</div>';
                                } else {
                                    foreach ($anios as $anio) {
                                        ?>
                                        <div class="col col-sm-12">
                                            <label class="checkbox">
                                                <input type="checkbox" name="anio" value="<?= $anio ?>"><i></i><?= $anio ?>
                                            </label>
                                        </div>
    <?php }
}
?>
                            </div>
                        </section>
                    </div>
                    <div class="cont span_2_of_3">
                        <div class="mens-toolbar">
<!--                            <div class="sort">
                                <div class="sort-by">
                                    <label>Ordenar por</label>
                                    <select>
                                        <option value="">Popularity</option>
                                        <option value="">Precio : Alto a Bajo</option>
                                        <option value="">Precio : Bajo a Alto</option>
                                    </select>
                                    <a href=""><img src="<?= base_url() ?>images/arrow2.gif" alt="" class="v-middle"></a>
                                </div>
                            </div>-->
                            <div class="pager">   
                                <div class="limiter visible-desktop">
                                    <label><?= get_lang("mostrar") ?></label>
                                    <select name="productosPorPagina" id="productosPorPagina" onchange="changePorPagina()">
                                        <option value="2" selected="selected">2</option>
                                        <option value="9" >9</option>
                                        <option value="15">15</option>
                                        <option value="30">30</option>
                                    </select> <?= get_lang("por-pagina") ?>       
                                </div>

                                <ul class="dc_pagination dc_paginationA dc_paginationA06">
                                    <em class="previous" id="pageNumbers" style="text-align: center"></em>
                                </ul>
                                <div></div>
                                <div class="clear"></div>
                            </div>
                            <div class="clear"></div>
                        </div>

                        <div class="listadeproductos">
                            <div class="box1">
                                cargando...
                            </div>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
<?= GetFooter() ?>


        <script type="text/javascript">
            jQuery(document).ready(function () {
                allproducts = <?php echo json_encode($products) ?>;
                copyAllproducts = allproducts;
                paginaActual = 0;
                porPagina = $( "#productosPorPagina" ).val();
                init();
            });
            
            // funcion que ejecuta la carga de html a la pagina
            function init() {
                productsShow = '';
                count = 0;
                console.log("pagina actual --->"+paginaActual);               
                // generacion los div para productos
                paginacion(copyAllproducts, porPagina, paginaActual).forEach(function (product) {
                    count++;
                    if (count % 3 === 1) {
                        productsShow += '<div class="box1">';
                    };
                    
                    productsShow += boxproducto("<?= base_url() ?>", product);

                    if (count % 3 === 0) {
                        productsShow += '<div class="clear"></div>';
                    };
                });
                
                
//                console.log(paginateProduct);
                
                $(".listadeproductos").html(productsShow);

                
            }


            function boxproducto(base_url, product) {
                productsShow = '';
                productsShow += '<div class="col_1_of_single1 span_1_of_single1">';
                productsShow += '<a href="' + base_url + 'product_details/get/' + product.tags + '">';
                productsShow += '<div class="view1 view-fifth1">';
                productsShow += '<div class="top_box">';
                productsShow += '<h3 class="m_1">' + product.nombre + '</h3>';
                productsShow += '<p class="m_2">' + product.codigo + '</p>';
                productsShow += '<div class="grid_img">';
                productsShow += '<div class="css3"><img src="' + base_url + 'impanel/files/productos/' + product.img_producto + '" alt=""/></div>';
                productsShow += '<div class="mask1">';
                productsShow += '<div class="info"><?= get_lang("ver-mas") ?></div>';
                productsShow += '</div>';
                productsShow += '</div>';
                productsShow += '<div class="price">' + product.precio + '</div>';
                productsShow += '</div>';
                productsShow += '</div>';
                productsShow += '<ul class="list2">';
                productsShow += '<li>';
                productsShow += '<img src="' + base_url + 'images/plus.png" alt=""/>';
                productsShow += '<ul class="icon1 sub-icon1 profile_img">';
                productsShow += '<li><a class="active-icon c1" href="#"><?= get_lang("agregar") ?> </a>';
                productsShow += '<ul class="sub-icon1 list">';
                productsShow += '<li><h3>sed diam nonummy</h3><a href=""></a></li>';
                productsShow += '<li><p>Lorem ipsum dolor sit amet, consectetuer  <a href="">adipiscing elit, sed diam</a></p></li>';
                productsShow += '</ul>';
                productsShow += '</li>';
                productsShow += '</ul>';
                productsShow += '</li>';
                productsShow += '</ul>    ';
                productsShow += '</div>    ';
                return productsShow;
            }


            // filtra los productos
            function filterProduct(productList, filtersMarcas, filtersModelos, filtersAnio) {
                paginaActual = 0;
                copyproductList = productList;
                filteredProducts = [];
                filteredProducts2 = [];
                filteredProducts3 = [];
                i = 0;
                
                // busqueda de marcas
                copyproductList.forEach(function (product) {
                    if(filtersMarcas.length > 0){
                        filtersMarcas.forEach(function (marca) {
                            if ( product.marca === marca) {
                                //Preguntar si ya existe en el array, si no existe lo agregas
                                if(filteredProducts.indexOf(product)< 0){
                                    filteredProducts.push(product);                
                                }
                            }
                        });
                        copyproductList = filteredProducts;
                    }
                });
                
                // busqueda de modelos
                copyproductList.forEach(function (product) {
                    if(filtersModelos.length > 0){
                        filtersModelos.forEach(function (modelo) {
                            if ( product.modelo === modelo) {
                                //Preguntar si ya existe en el array, si no existe lo agregas
                                if(filteredProducts2.indexOf(product)< 0){
                                    filteredProducts2.push(product);                
                                }
                            }
                        });
                        copyproductList = filteredProducts2;
                    }
                });
                
                // busqueda de anios
                copyproductList.forEach(function (product) {
                    if(filtersAnio.length > 0){
                        filtersAnio.forEach(function (anio) {
                            if ( product.anio === anio) {
                                //Preguntar si ya existe en el array, si no existe lo agregas
                                if(filteredProducts3.indexOf(product)< 0){
                                    filteredProducts3.push(product);                
                                }
                            }
                        });
                        copyproductList = filteredProducts3;
                    }
                });
                copyAllproducts = copyproductList;
                init();
            }

            // hara que la copia tome regrese a su valor original
            // retomando todos los productos de la categoria
            function deleteFilters() {
                copyAllproducts = allproducts;
            }

            $("input:checkbox[name=marca], input:checkbox[name=modelo], input:checkbox[name=anio]").change(function () {
                //cada vez que hacemos una busqueda reiniciamos el array
                copyAllproducts = allproducts;
                var filtersMarcas = [];
                var filtersModelos = [];
                var filtersAnio = [];
                $("input[name=marca]:checked").each(function (){
                    filtersMarcas.push($(this).val());
                });
                $("input[name=modelo]:checked").each(function (){
                    filtersModelos.push($(this).val());
                });
                $("input[name=anio]:checked").each(function (){
                    filtersAnio.push($(this).val());
                });
                filterProduct(copyAllproducts, filtersMarcas, filtersModelos, filtersAnio);
            });
            
            //Paginacion
            function paginacion(arrayHaPaginar, porPagina, paginaHaMostrar){
                paginateProduct = [];
                html = '<?= get_lang("paginas") ?>: ';
                
                buttonSelected = "style='background-color:#df8a13'";
                catidadPaginas = Math.ceil(arrayHaPaginar.length / porPagina);
                
                for( i = 0; i < catidadPaginas; i++){
                    
                    if(paginaHaMostrar===i){
                        html += "<button onclick='changePage("+i+")' "+buttonSelected+" class='input-group-addon'>"+(parseInt(i)+1)+"</button>";
                    } else {
                        html += "<button onclick='changePage("+i+")'class='input-group-addon'>"+(parseInt(i)+1)+"</button>";            
                    }
                    iniciaPorRegistro = (i === 0) ? 0 : (parseInt(porPagina)*i);
                    terminaPorRegistro = (i === 0) ? porPagina : (parseInt(iniciaPorRegistro)+parseInt(porPagina));
                    paginateProduct[i] = copyAllproducts.slice(iniciaPorRegistro, terminaPorRegistro)
                }
                
                
                $("#pageNumbers").html(html);

                return paginateProduct[paginaHaMostrar];
            }
            
            function changePage(numberPage){
                paginaActual = numberPage;
                init();
            }
            
            function changePorPagina(){
                porPagina = $( "#productosPorPagina" ).val();
                paginaActual = 0;
                init();
            }

        </script>