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
                <div id="msj_exito" class="alert alert-success" style="display: none;" ><?=get_lang("registro-exitoso")?></div>
                <div id="msj_existe" class="alert alert-warning " style="display: none;" ><?=get_lang("email-existe")?> </div>
                <div id="msj_error" class="alert alert-danger " style="display: none;" ><?=get_lang("registro-error")?> </div>
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
    	      <h4 class="title"><?=get_lang("create-una-cuenta")?></h4> 
    		   <form method="post" action="" name="form-agregar-cliente" id="form-agregar-cliente">
    			 <div class="col_1_of_2 span_1_of_2">
                            <div><input type="text" name="nombre" id="nombre" id placeholder="<?=get_lang("nombre-completo")?>"></div>
                            <div><input type="text" name="estado" id="estado" placeholder="<?=get_lang("estado")?>" ></div>
                            <div><input type="text" name="email" id="email" placeholder="<?=get_lang("email")?>"></div>
                            <div><input type="password" name="clave" id="clave" placeholder="<?=get_lang("contrasena")?>"></div>
		    	 </div>
		    	  <div class="col_1_of_2 span_1_of_2">	
		    		<div><select id="country" name="pais" >
                                    <option value="ninguno"><?=get_lang("seleccione-pais")?></option>         
                                    <option value="AX">Åland Islands</option>
                                    <option value="AF">Afghanistan</option>
                                    <option value="AL">Albania</option>
                                    <option value="DZ">Algeria</option>
                                    <option value="AS">American Samoa</option>
                                    <option value="AD">Andorra</option>
                                    <option value="AO">Angola</option>
                                    <option value="AI">Anguilla</option>
                                    <option value="AQ">Antarctica</option>
                                    <option value="AG">Antigua And Barbuda</option>
                                    <option value="AR">Argentina</option>
                                    <option value="AM">Armenia</option>
                                    <option value="AW">Aruba</option>
                                    <option value="AU">Australia</option>
                                    <option value="AT">Austria</option>
                                    <option value="AZ">Azerbaijan</option>
                                    <option value="BS">Bahamas</option>
                                    <option value="BH">Bahrain</option>
                                    <option value="BD">Bangladesh</option>
                                    <option value="BB">Barbados</option>
                                    <option value="BY">Belarus</option>
                                    <option value="BE">Belgium</option>
                                    <option value="BZ">Belize</option>
                                    <option value="BJ">Benin</option>
                                    <option value="BM">Bermuda</option>
                                    <option value="BT">Bhutan</option>
                                    <option value="BO">Bolivia</option>
                                    <option value="BA">Bosnia and Herzegovina</option>
                                    <option value="BW">Botswana</option>
                                    <option value="BV">Bouvet Island</option>
                                    <option value="BR">Brazil</option>
                                    <option value="IO">British Indian Ocean Territory</option>
                                    <option value="BN">Brunei</option>
                                    <option value="BG">Bulgaria</option>
                                    <option value="BF">Burkina Faso</option>
                                    <option value="BI">Burundi</option>
                                    <option value="KH">Cambodia</option>
                                    <option value="CM">Cameroon</option>
                                    <option value="CA">Canada</option>
                                    <option value="CV">Cape Verde</option>
                                    <option value="KY">Cayman Islands</option>
                                    <option value="CF">Central African Republic</option>
                                    <option value="TD">Chad</option>
                                    <option value="CL">Chile</option>
                                    <option value="CN">China</option>
                                    <option value="CX">Christmas Island</option>
                                    <option value="CC">Cocos (Keeling) Islands</option>
                                    <option value="CO">Colombia</option>
                                    <option value="KM">Comoros</option>
                                    <option value="CG">Congo</option>
                                    <option value="CD">Congo, Democractic Republic</option>
                                    <option value="CK">Cook Islands</option>
                                    <option value="CR">Costa Rica</option>
                                    <option value="CI">Cote D'Ivoire (Ivory Coast)</option>
                                    <option value="HR">Croatia (Hrvatska)</option>
                                    <option value="CU">Cuba</option>
                                    <option value="CY">Cyprus</option>
                                    <option value="CZ">Czech Republic</option>
                                    <option value="DK">Denmark</option>
                                    <option value="DJ">Djibouti</option>
                                    <option value="DM">Dominica</option>
                                    <option value="DO">Dominican Republic</option>
                                    <option value="TP">East Timor</option>
                                    <option value="EC">Ecuador</option>
                                    <option value="EG">Egypt</option>
                                    <option value="SV">El Salvador</option>
                                    <option value="GQ">Equatorial Guinea</option>
                                    <option value="ER">Eritrea</option>
                                    <option value="EE">Estonia</option>
                                    <option value="ET">Ethiopia</option>
                                    <option value="FK">Falkland Islands (Islas Malvinas)</option>
                                    <option value="FO">Faroe Islands</option>
                                    <option value="FJ">Fiji Islands</option>
                                    <option value="FI">Finland</option>
                                    <option value="FR">France</option>
                                    <option value="FX">France, Metropolitan</option>
                                    <option value="GF">French Guiana</option>
                                    <option value="PF">French Polynesia</option>
                                    <option value="TF">French Southern Territories</option>
                                    <option value="GA">Gabon</option>
                                    <option value="GM">Gambia, The</option>
                                    <option value="GE">Georgia</option>
                                    <option value="DE">Germany</option>
                                    <option value="GH">Ghana</option>
                                    <option value="GI">Gibraltar</option>
                                    <option value="GR">Greece</option>
                                    <option value="GL">Greenland</option>
                                    <option value="GD">Grenada</option>
                                    <option value="GP">Guadeloupe</option>
                                    <option value="GU">Guam</option>
                                    <option value="GT">Guatemala</option>
                                    <option value="GG">Guernsey</option>
                                    <option value="GN">Guinea</option>
                                    <option value="GW">Guinea-Bissau</option>
                                    <option value="GY">Guyana</option>
                                    <option value="HT">Haiti</option>
                                    <option value="HM">Heard and McDonald Islands</option>
                                    <option value="HN">Honduras</option>
                                    <option value="HK">Hong Kong S.A.R.</option>
                                    <option value="HU">Hungary</option>
                                    <option value="IS">Iceland</option>
                                    <option value="IN">India</option>
                                    <option value="ID">Indonesia</option>
                                    <option value="IR">Iran</option>
                                    <option value="IQ">Iraq</option>
                                    <option value="IE">Ireland</option>
                                    <option value="IM">Isle of Man</option>
                                    <option value="IL">Israel</option>
                                    <option value="IT">Italy</option>
                                    <option value="JM">Jamaica</option>
                                    <option value="JP">Japan</option>
                                    <option value="JE">Jersey</option>
                                    <option value="JO">Jordan</option>
                                    <option value="KZ">Kazakhstan</option>
                                    <option value="KE">Kenya</option>
                                    <option value="KI">Kiribati</option>
                                    <option value="KR">Korea</option>
                                    <option value="KP">Korea, North</option>
                                    <option value="KW">Kuwait</option>
                                    <option value="KG">Kyrgyzstan</option>
                                    <option value="LA">Laos</option>
                                    <option value="LV">Latvia</option>
                                    <option value="LB">Lebanon</option>
                                    <option value="LS">Lesotho</option>
                                    <option value="LR">Liberia</option>
                                    <option value="LY">Libya</option>
                                    <option value="LI">Liechtenstein</option>
                                    <option value="LT">Lithuania</option>
                                    <option value="LU">Luxembourg</option>
                                    <option value="MO">Macau S.A.R.</option>
                                    <option value="MK">Macedonia</option>
                                    <option value="MG">Madagascar</option>
                                    <option value="MW">Malawi</option>
                                    <option value="MY">Malaysia</option>
                                    <option value="MV">Maldives</option>
                                    <option value="ML">Mali</option>
                                    <option value="MT">Malta</option>
                                    <option value="MH">Marshall Islands</option>
                                    <option value="MQ">Martinique</option>
                                    <option value="MR">Mauritania</option>
                                    <option value="MU">Mauritius</option>
                                    <option value="YT">Mayotte</option>
                                    <option value="MX">Mexico</option>
                                    <option value="FM">Micronesia</option>
                                    <option value="MD">Moldova</option>
                                    <option value="MC">Monaco</option>
                                    <option value="MN">Mongolia</option>
                                    <option value="ME">Montenegro</option>
                                    <option value="MS">Montserrat</option>
                                    <option value="MA">Morocco</option>
                                    <option value="MZ">Mozambique</option>
                                    <option value="MM">Myanmar</option>
                                    <option value="NA">Namibia</option>
                                    <option value="NR">Nauru</option>
                                    <option value="NP">Nepal</option>
                                    <option value="NL">Netherlands</option>
                                    <option value="AN">Netherlands Antilles</option>
                                    <option value="NC">New Caledonia</option>
                                    <option value="NZ">New Zealand</option>
                                    <option value="NI">Nicaragua</option>
                                    <option value="NE">Niger</option>
                                    <option value="NG">Nigeria</option>
                                    <option value="NU">Niue</option>
                                    <option value="NF">Norfolk Island</option>
                                    <option value="MP">Northern Mariana Islands</option>
                                    <option value="NO">Norway</option>
                                    <option value="OM">Oman</option>
                                    <option value="PK">Pakistan</option>
                                    <option value="PW">Palau</option>
                                    <option value="PS">Palestinian Territory, Occupied</option>
                                    <option value="PA">Panama</option>
                                    <option value="PG">Papua new Guinea</option>
                                    <option value="PY">Paraguay</option>
                                    <option value="PE">Peru</option>
                                    <option value="PH">Philippines</option>
                                    <option value="PN">Pitcairn Island</option>
                                    <option value="PL">Poland</option>
                                    <option value="PT">Portugal</option>
                                    <option value="PR">Puerto Rico</option>
                                    <option value="QA">Qatar</option>
                                    <option value="RE">Reunion</option>
                                    <option value="RO">Romania</option>
                                    <option value="RU">Russia</option>
                                    <option value="RW">Rwanda</option>
                                    <option value="SH">Saint Helena</option>
                                    <option value="KN">Saint Kitts And Nevis</option>
                                    <option value="LC">Saint Lucia</option>
                                    <option value="PM">Saint Pierre and Miquelon</option>
                                    <option value="VC">Saint Vincent And The Grenadines</option>
                                    <option value="WS">Samoa</option>
                                    <option value="SM">San Marino</option>
                                    <option value="ST">Sao Tome and Principe</option>
                                    <option value="SA">Saudi Arabia</option>
                                    <option value="SN">Senegal</option>
                                    <option value="VLA">Venezuela</option>
		         </select>
                        <input type="text" name="direccion" id="direccion" placeholder="<?=get_lang("direccion")?>" ></div>
                        <input type="text" name="codigo" id="codigo" class="code" placeholder="<?=get_lang("codigo")?>"> - <input type="text" name="numero" id="numero" class="number"placeholder="<?=get_lang("numero")?>">
                        </div>
                             
		    				        
                       <div class="col-sm-12" id="registrar" >
                            <button class="grey"><?=get_lang("registrar")?></button>
                            <p class="terms"><?=get_lang("terminos-condiciones")?>.</p>      
                                
		        </div>
		        
                      
		         <div class="clear"></div>
                       
		    </form>
                    <div class="col-sm-12" id="iniciarsesion" style="display: none;">
                        <a href="<?=base_url()?>login">
                            <button class="grey"><?=get_lang("login")?></button>
                            <p class="terms"><?=get_lang("texto-login")?>.</p>      
                        </a>   
                    </div>
              <div class="clear"></div>
    	  </div> 
        </div>
        <script src="<?=base_url()?>js/script_clientes.js"></script>
       	 
       	 
<?= GetFooter()?>   