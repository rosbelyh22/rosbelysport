<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>IMPanel - <?=strip_tags($title)?></title>

    <!-- Bootstrap Core CSS -->
    <link href="<?=base_url()?>bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<?=base_url()?>bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Timeline CSS -->
    <link href="<?=base_url()?>dist/css/timeline.css" rel="stylesheet">
	
    
     <!-- DataTables CSS -->
    <link href="<?=base_url()?>bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="<?=base_url()?>bower_components/datatables-responsive/css/dataTables.responsive.css" rel="stylesheet">
    
    
    <!-- Custom CSS -->
    <link href="<?=base_url()?>dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="<?=base_url()?>bower_components/morrisjs/morris.css" rel="stylesheet">


    <!-- Custom Fonts -->
    <link href="<?=base_url()?>bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    
    
    
    <link href="<?=base_url()?>css/estilos.css" rel="stylesheet">
    
    

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    

</head>

<body>

<div id="msj_exito">
	<div class="alert alert-success"></div>
</div>
<div id="msj_error">
	<div class="alert alert-danger"></div>
</div>
<div id="msj_advertencia">
	<div class="alert alert-warning"></div>
</div>


<div class="divCarga" id="div_loading">
    <div class="fontmensaje" style='color: #ffffff; margin-top:250px;' id="mensajetextoCarga"></div>
    <img id="imgtextocarga" style='margin-top:10px;  width: 30px;' src='<?= base_url() ?>img/loading_trans.gif'>    
</div>

<input type="hidden" name="base_url" id="base_url" value="<?=base_url();?>">

<div id="wrapper">