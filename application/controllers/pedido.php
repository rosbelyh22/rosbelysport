<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Pedido extends CI_Controller {

	public function __construct() {
        parent::__construct();
        $this->load->model(array("productos_model", "configuracion_model", "pedido_model", "email_model", "obras_model","categorias_model"));
        $this->load->helper(array("contenido_helper", "contacto_helper", "slideshow_helper", "productos_helper", "menu_helper", "categoria"));
    }  
	 
	 
    public function agregarPedido(){
        $carrito = $_POST['carrito'];
        $resp =  $this->pedido_model->agregarPedido($carrito);
    }
    
    
    
    
    public function ObtenerCarrito($data = array()){
      
       $conf = $this->configuracion_model->get_conf();
        $obras = $this->obras_model->get_obras();
        
       $data["title"] = get_lang("carrito")." - OMZ Construcciones";
       $data["conf"] = $conf;
       $data["obras"] = $obras;
       $data["productos_destacados"] = $this->productos_model->get_productos_destacados(4);
       $this->session->set_userdata("menu_active", "cotizacion");
        
       $this->load->view('carrito', $data);
    }
    
    
    
    public function ActualizarCantidad(){
        echo $this->carrito_model->ActualizarCantidad();
    }
    
    public function EliminarCarrito(){
        echo $this->carrito_model->EliminarCarrito();
    }
    
    public function ListaCarrito(){
        $carrito = $this->carrito_model->ObtenerCarrito();
        ?>
        <table class="table">
            <thead>
            <tr>
                <th>Imagen</th>
                <th>Nombre</th>
                <th>Precio</th>
                <th>Cantidad</th>
                <th>Total</th>
                <th>Acción</th>
            </tr>
            </thead>

            <tbody>
            <?php
            $total = 0;
            $cantidadtotal =0;
                $nombretotal = '';
            if(count($carrito) != 0){
            foreach($carrito as $c){
                $total += ($c->precio*$c->cantidad);
                $cantidadtotal += $c->cantidad;
                
                $nombre = "nombre".$this->session->userdata("idi_camp");
                $nombretotal = $nombretotal ." ". $c->$nombre.' ('.$c->cantidad.')';
                ?>
                <tr>
                    <td><img src="<?=base_url()?>impanel/files/productos/<?=$c->img_producto?>" style='width: 50px;'></td>
                    <td><?=$c->$nombre?></td>
                    <td align="left"><?=number_format($c->precio,2,",",".")?> Bs</td>
                    <td><input style='text-align: right; width: 100px;' onclick='this.select()' type='text' name='cantidad' id='cantidad_<?=$c->idproducto?>' class='form-control' value='<?=$c->cantidad?>' onchange="ActualizarCantidad(this.value, '<?=$c->idcarrito?>')"></td>
                    <td align="left"><?=number_format(($c->precio*$c->cantidad),2,",",".")?> Bs</td>
                    <td align='center'>
                        <a href='javascript:;' onclick="EliminarCarrito('<?=$c->idcarrito?>')">
                            <i class="fa fa-trash-o" aria-hidden="true"></i>
                        </a>

                    </td>
                </tr>    
                <?php
            }
            }else{
                ?>
                <tr>
                    <td align='center' colspan="6"><?=get_lang("no-hay-productos-carrito")?></td>
                </tr>
                <?php
            }
            ?>
                <tr>
                    <td colspan='3' align='center'><b><?=get_lang("total")?></b></td>
                    <td colspan='2' align='center'><b><?=number_format($total,2,",",".")?> Bs.</b></td>
                    
                </tr>
            </tbody>
        </table>
           
        <?php
//        echo "---->".$cantidadtotal."<br>";
//        echo "---->".$nombretotal."<br>";
//        echo "---->".$total."<br>";
        require_once('/../../lib/mercadopago/mercadopago.php');
        //Id cliente y clave secreta
        $mp = new MP("8893661173963621", "nviUDHBMNKWjLwoheeE5boZ05kNXXFf3");

        $preference_data = array(
            "items" => array(
                array(
                    "title" => $nombretotal,
                    "currency_id" => "VEF",
//                    "category_id" => "Category",
                    "quantity" => $cantidadtotal,
                    "unit_price" => $total,
                )
            )
        );

        $preference = $mp->create_preference($preference_data);
        
    ?> 
<a href="<?=base_url()?>home"><button class="grey"><?=get_lang("seguir-comprando")?></button> </a>
<!--        <div class='pull-left'>
            <a href="<?=base_url()?>home">
                <input type='button' id='btn-seguir-comprando' class='btn btn-warning' value='<?=get_lang("seguir-comprando")?>'>
            </a>
        </div> -->
        <div class='pull-right'>
             <!--Boton de Mercado Pago -->
        <a href="<?php echo $preference["response"]["init_point"]; ?>" name="MP-Checkout" class="blue-m-Rn-ar-VeOn" onclick="agregarPedido('<?=$total?>', '<?=$cantidadtotal?>')">Mercado Pago </a>
        <script type="text/javascript" src="//resources.mlstatic.com/mptools/render.js"></script>
        </div> 
       
       
    <?php
    }
    
    
    
    public function MostrarFormularioCarrito(){
        $tipo = $this->input->post("tipo");
        if($tipo == '0'){
            echo "<br><hr><br><h2>".get_lang("formulario-solicitud")."</h2><br><center>".get_lang("cargue-productos")."</center>";
        }else{
            ?>
        <br>
        <hr>
        <br>
        <h2><?=get_lang("formulario-solicitud")?></h2>
        <form method='post' action='<?=base_url()?>carrito/EnviarCotizacion' accept-charset="form-cotizacion">
            <div class='row'>
                <div class='col-sm-12 form-group'>
                   <input type="text" name="nombre" class="form-control" required placeholder="<?=get_lang("nombre-completo")?>">
                </div>            
                <div class="form-group col-sm-12">
                    <input type="text" name="telefono" class="form-control" required placeholder="<?=get_lang("telefono")?>">
                </div>
                <div class="form-group col-sm-12">
                    <input type="email" name="email" class="form-control" required placeholder="<?=get_lang("email")?>">
                </div>
                <div class="form-group col-sm-12">
                    <input type="text" name="rif" class="form-control" required placeholder="<?=get_lang("rif")?>">
                </div>
                <div class="col-sm-12 form-group">
                    <textarea name="mensaje" id="mensaje" required class="form-control" rows="8" placeholder="<?=get_lang("mensaje")?>"></textarea>
                </div>
            </div>
            <div class="row">
            <div class="col-sm-12 form-group">
                    <input type="submit" class="btn btn-primary btn-lg" value="<?=get_lang("solicitar-cotizacion")?>">
            </div>    
            </div>
        </form>    
            <?php
        }
    }
    
    
    public function EnviarCotizacion(){
        $conf = $this->configuracion_model->get_conf();
        $carrito = $this->carrito_model->ObtenerCarrito();
        $total = 0;
        $mensaje = "
                <strong>Nombre: </strong>".$this->input->post("nombre")."<br />
                <strong>Rif o CI: </strong>".$this->input->post("rif")."<br />
                <strong>Teléfono: </strong>".$this->input->post("telefono")."<br />
                <strong>Email: </strong>".$this->input->post("email")."<br />
                <strong>Mensaje: </strong><br />".$this->input->post("mensaje")."<br />
                <hr>    
                ";
        
        $mensaje .= "<table width:'100%'>"
                . "<thead>"
                . "<tr>"
                . "<th>Imagen</th>"
                . "<th>Nombre</th>"
                . "<th>Precio</th>"
                . "<th>Cantidad</th>"
                . "<th>Total</th>"
                . "</tr>"
                . "</thead>"
                . "<tbody>";
        
        foreach($carrito as $c){
                $total += ($c->precio*$c->cantidad);
                $nombre = "nombre".$this->session->userdata("idi_camp");
                
                $mensaje .= "<tr>
                    <td><img src='".base_url()."impanel/files/productos/".$c->img_producto."' style='width: 50px;'></td>
                    <td>".$c->$nombre."</td>
                    <td align='right'>".number_format($c->precio,2,",",".")." Bs</td>
                    <td>".$c->cantidad."</td>
                    <td align='right'>".number_format(($c->precio*$c->cantidad),2,",",".")." Bs</td>
                </tr>";    
                
        }
        
        $mensaje .= "<tr>
            <td colspan='3' align='right'><b>".get_lang("total")."</b></td>
            <td colspan='2' align='right'><b>".number_format($total,2,",",".")." Bs.</b></td>
        </tr>";
        
        $asunto = "Solicitud Cotización";	
        $cuerpo = template_email($this->input->post("asunto"), $mensaje);


        $para = array($conf["email_empresa"]);
        $send = $this->email_model->send($para, $asunto, $cuerpo);
        
        if($send == "exito"){
            $this->carrito_model->LimpiarCarrito();
            $data["tipo_msj"] = "exito";
            $data["msj_resp"] = get_lang("solicitud-cotizacion-exito");
        }else{
            $data["tipo_msj"] = "error";
            $data["msj_resp"] = get_lang("solicitud-cotizacion-error");
        }
        $this->carrito_model->LimpiarCarrito();
        $this->ObtenerCarrito($data);
    }
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */