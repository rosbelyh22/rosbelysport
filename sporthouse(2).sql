-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-02-2017 a las 21:58:03
-- Versión del servidor: 10.1.9-MariaDB
-- Versión de PHP: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sporthouse`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bss_configuracion_envio`
--

CREATE TABLE `bss_configuracion_envio` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0=activo, 1=inactivo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `bss_configuracion_envio`
--

INSERT INTO `bss_configuracion_envio` (`id`, `nombre`, `status`) VALUES
(1, 'MRW', 0),
(2, 'ZOOM', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bss_metodo_pago`
--

CREATE TABLE `bss_metodo_pago` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL COMMENT '0=activo, 1=inactivo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bss_pedidos`
--

CREATE TABLE `bss_pedidos` (
  `id` int(11) NOT NULL,
  `pedido` varchar(255) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0=procesado, 1=enviado, 2=inhabilitado, 3=entregado ',
  `motivo` varchar(255) NOT NULL,
  `codigo` varchar(11) NOT NULL,
  `empresa` varchar(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `idcliente` int(11) NOT NULL,
  `idmetodo` int(11) DEFAULT NULL,
  `numero_pedido` int(11) DEFAULT NULL,
  `direccion_envio` varchar(255) DEFAULT NULL,
  `nombre_envio` varchar(255) DEFAULT NULL,
  `cantidad_producto` int(11) DEFAULT NULL,
  `fecha_envio` varchar(11) DEFAULT NULL,
  `fecha_inhabilitado` varchar(11) DEFAULT NULL,
  `fecha_entrega` varchar(11) DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `im_alertas`
--

CREATE TABLE `im_alertas` (
  `id` int(11) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `mensaje` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0 = sin leer; 1 = leido'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `im_carrito`
--

CREATE TABLE `im_carrito` (
  `idcarrito` int(11) NOT NULL,
  `idsession` varchar(255) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `cantidad` double(16,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `im_carrito`
--

INSERT INTO `im_carrito` (`idcarrito`, `idsession`, `idproducto`, `cantidad`) VALUES
(43, '15', 26, 2.00),
(44, '15', 27, 1.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `im_clientes`
--

CREATE TABLE `im_clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `pais` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `direccion` text NOT NULL,
  `gps` varchar(255) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0=activa; 1=inactiva'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `im_clientes`
--

INSERT INTO `im_clientes` (`id`, `nombre`, `tags`, `pais`, `estado`, `telefono`, `email`, `direccion`, `gps`, `clave`, `status`) VALUES
(1, 'Cliente de Prueba', '', 'Venezuela', 'Carabobo', '04128658193', 'joseeduardo.bello@gmail.com', 'San Diego', '', '81dc9bdb52d04dc20036dbd8313ed055', 0),
(2, 'Yelitza Martinez de Bello.', 'yelitza-martinez-de-bello', 'Venezuela.', 'Carabobo.', '04165555555.', 'prueba@gmail.com', 'Urb La viña...', '', '81dc9bdb52d04dc20036dbd8313ed055', 0),
(3, 'Yelitza Martinez de Bello.', 'yelitza-martinez-de-bello-3035', 'Reserved', '', '34567890', 'gerencia.academica@kg.com.ve', '', '', '', 0),
(4, 'AAAAAAA', 'aaaaaaa', 'Reserved', '', 'aaaa', 'aaaa@gmail.com', '', '', '', 0),
(5, 'a', 'a', 'Reserved', '', 'a', 'admin@gmail.com', '', '', '', 0),
(6, 'Jose Bello', 'jose-bello', 'Reserved', '', '34567890', 'preuba@gmail.com', '', '', '', 0),
(7, 'Rosbely Hernandez', 'rosbely-hernandez', 'AL', 'albania', '4666804', 'rosbe_12@hotmail.com', 'Albania 2', '', 'e10adc3949ba59abbe56e057f20f883e', 0),
(15, 'Rosbely Hernandez', 'rosbely-hernandez-3317', 'VLA', 'Carabobo', '04124666804', 'rosbelyh22@gmail.com', 'Calle el Totumo, Urb los Cardones. Municipio Libertador', '', '81dc9bdb52d04dc20036dbd8313ed055', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `im_configuracion`
--

CREATE TABLE `im_configuracion` (
  `id` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `valor` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `im_configuracion`
--

INSERT INTO `im_configuracion` (`id`, `nombre`, `valor`) VALUES
(353, 'meta_descripcion', 'Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas'),
(354, 'meta_clave', 'construccion, construcciones, ccs, grupo, remodelación, casas, edificios, locales comerciales, cemento, cabillas, venezuela, caracas construccion en valencia, vidrios, acero'),
(355, 'email_empresa', 'joseeduardo.bello@gmail.com'),
(356, 'url_web', 'http://www.ccsconstrucciones.com'),
(357, 'noticias_pagina', '20'),
(358, 'key_recatpcha', '6Ldy4BwTAAAAAHV_vVmyfYXOMcbl1ZmhHTI79QnO'),
(359, 'api_twitter', '            <a class="twitter-timeline"  href="https://twitter.com/Planfuturoseg" data-widget-id="692717040994512896" data-width="430" height="350">Tweets por el @Planfuturoseg.</a>\r\n            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?''http'':''https'';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>'),
(360, 'api_analytics', ''),
(361, 'api_otros', '<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));</script>\r\n<div class="fb-page" data-href="https://www.facebook.com/hotelsalma/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/hotelsalma/"><a href="https://www.facebook.com/hotelsalma/">Hotel Salma Suites VIP, C.A</a></blockquote></div></div>'),
(362, 'url_facebook', 'http://www.facebook.com/omzconstruccion'),
(363, 'url_twitter', 'http://www.twitter.com/omzconstruccion'),
(364, 'url_instagram', 'http://www.instagram.com/omzconstruccion'),
(365, 'user_skype', ''),
(366, 'url_pinteres', ''),
(367, 'url_googleplus', ''),
(368, 'url_linkedin', ''),
(369, 'telefono_empresa', '+58 212.501.25.21 / 407-339-2216 '),
(370, 'direccion_empresa', 'Distrito Capital - Caracas / 981 E. ALTAMONTE SPRINGS,L 32701....'),
(371, 'api_googlemap', '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d251097.9245946213!2d-67.03045464854458!3d10.468698840429772!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8c2a58adcd824807%3A0x93dd2eae0a998483!2sCaracas%2C+Distrito+Capital!5e0!3m2!1ses!2sve!4v1469423800981" width="100%" height="auto" frameborder="0" style="border:0" allowfullscreen></iframe>'),
(372, 'smtp_host', ''),
(373, 'smtp_port', ''),
(374, 'smtp_user', ''),
(375, 'smtp_pass', ''),
(376, 'email_from', ''),
(377, 'nombre_from', ''),
(378, 'copyright', ' © Copiright OMZ Construcciones RIF: J-29741518-1'),
(379, 'nombre_rss', 'FMB Group'),
(380, 'descripcion_rss', 'Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas'),
(381, 'publicidad_noticias', '4'),
(382, 'simbolo_moneda', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `im_contenidos`
--

CREATE TABLE `im_contenidos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `titulo_espanol` varchar(255) NOT NULL,
  `contenido` text NOT NULL,
  `contenido_espanol` text NOT NULL,
  `tags` varchar(255) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0=activa; 1=inactiva'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `im_contenidos`
--

INSERT INTO `im_contenidos` (`id`, `titulo`, `titulo_espanol`, `contenido`, `contenido_espanol`, `tags`, `status`) VALUES
(19, 'Texto inicio servicios', 'Texto inicio servicios', '<p>Aqui va el texto de inicio de los servicios</p>', '<p>Aqui va el texto de inicio de los servicios</p>', 'texto-inicio-servicios', 0),
(20, 'texto inicio servicio construccion', 'texto inicio servicio construccion', '<p>texto inicio servicio construccion</p>', '<p>texto inicio servicio construccion</p>', 'texto-inicio-servicio-construccion', 0),
(21, 'texto inicio servicio remodelacion', 'texto inicio servicio remodelacion', '<p>texto inicio servicio remodelacion</p>', '<p>texto inicio servicio remodelacion</p>', 'texto-inicio-servicio-remodelacion', 0),
(22, 'texto inicio servicio venta de productos', 'texto inicio servicio venta de productos', '<p>texto inicio servicio venta de productos</p>', '<p>texto inicio servicio venta de productos</p>', 'texto-inicio-servicio-venta-de-productos', 0),
(23, 'texto inicio servicio asesoria', 'texto inicio servicio asesoria', '<p>texto inicio servicio asesoria</p>', '<p>texto inicio servicio asesoria</p>', 'texto-inicio-servicio-asesoria', 0),
(24, 'quienes somos', 'quienes somos', '<p>We are a group of specialists willing to provide solutions according to the needs and expectations of our customers.</p>\r\n<p>We have extensive experience in construction and development of technologies. In the search for a social development in line with the current technological level , we seek to provide products that help for this purpose.</p>', '<p>Somos un grupo de especialistas dispuestos a proporcionar soluciones de acuerdo a las necesidades y expectativas de nuestros clientes.<br /><br />Tenemos una amplia experiencia en la construcci&oacute;n y desarrollo de tecnolog&iacute;as. En la b&uacute;squeda de un desarrollo social y de acuerdo con el nivel tecnol&oacute;gico actual, buscamos ofrecer productos que ayuden a este fin.</p>', 'quienes-somos', 0),
(25, 'texto productos destacados inicio', 'texto productos destacados inicio', '<p>texto productos destacados inicio</p>', '<p>texto productos destacados inicio</p>', 'texto-productos-destacados-inicio', 0),
(26, 'Services', 'Servicios', '<p>Servicio de Venta de Productos</p>\r\n<p>Servicio de Construccion</p>\r\n<p>Servicio de Remodelaci&oacute;n</p>\r\n<p>Servicio de Asesoria</p>', '<p>Servicio de Venta de Productos</p>\r\n<p>Servicio de Construccion</p>\r\n<p>Servicio de Remodelaci&oacute;n</p>\r\n<p>Servicio de Asesoria</p>', 'services', 0),
(27, 'texto descripcion obras', 'texto descripcion obras', '<p>texto descripcion obras</p>', '<p>texto descripcion obras</p>', 'texto-descripcion-obras', 0),
(28, 'texto superior obras', 'texto superior obras', '<p>texto superior obras</p>', '<p>texto superior obras</p>', 'texto-superior-obras', 0),
(29, 'About us', 'Quienes Somos', '<p><span id="result_box" class="" lang="en"><span class="">At Sporthouse, we have a wide range of footwear to choose the one that best suits you.</span><br /><br /><span class="">We are a store that provides you with the best products.</span></span></p>', '<p>En Sporthouse, tenemos una amplia gama de calzados para que escojas el mejor modelo que se parezca a ti.</p>\r\n<p>Somos una tienda que te proporciona los mejores productos.</p>', 'about-us', 0),
(30, 'Texto registro de nuevos clientes ', 'Texto registro de nuevos clientes ', '<p><span id="result_box" class="" lang="en"><span class="">What are you waiting for?</span> Register and start browsing our website, know our products.</span></p>', '<p>Que esperas? registrate y comienza a navegar por nuestra web, conoce nuestros productos.</p>', 'texto-registro-de-nuevos-clientes', 0),
(31, 'How to buy', 'Como Comprar', '<p><span id="result_box" class="" lang="en">In sporthouse we teach you how to buy through the portal<br /><br />Step 1. Register on our portal<br /><br />Step 2. Choose the category you are looking for in the top menu<br /><br />Step 3. Look at all the products, and choose the one of your preference<br /><br /><span class="">Step 4. Add the product to your shopping cart</span><br /><br /><span class="">Step 5. Choose your payment method</span></span></p>', '<p>En sporthouse te ense&ntilde;amos como comprar a traves del portal</p>\r\n<p>Paso 1. Registrate en nuestro portal</p>\r\n<p>Paso 2. Escoge en el menu superior la categoria que estas buscando</p>\r\n<p>Paso 3. Observa todos los productos, y escoge el de tu preferencia</p>\r\n<p>Paso 4. A&ntilde;ade el producto a tu carrito de compras</p>\r\n<p>Paso 5. Escoge tu forma de pago</p>\r\n<p>&nbsp;</p>', 'how-to-buy', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `im_galeria`
--

CREATE TABLE `im_galeria` (
  `id` int(11) NOT NULL,
  `tipo` int(11) NOT NULL COMMENT '0=img; 1=video',
  `archivo` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `status` int(11) NOT NULL COMMENT '0=activa; 1=inactiva'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `im_galeria_categoria`
--

CREATE TABLE `im_galeria_categoria` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `tags` varchar(255) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0=activa; 1=inactiva',
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `im_listas`
--

CREATE TABLE `im_listas` (
  `id` int(11) NOT NULL,
  `campo` varchar(255) NOT NULL,
  `valor` varchar(255) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0=activa; 1=inactiva'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `im_mensajes`
--

CREATE TABLE `im_mensajes` (
  `id` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `asunto` varchar(255) NOT NULL,
  `mensaje` text NOT NULL,
  `respuesta` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0= no leido; 1= leido'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `im_mensajes`
--

INSERT INTO `im_mensajes` (`id`, `idcliente`, `asunto`, `mensaje`, `respuesta`, `fecha`, `status`) VALUES
(6, 1, 'Otro mensaje de prueba mas', 'Hola esto es otro mensaje de prueba mas', '<p>Hola esto es una prueba de respuesta ! ....<br /><br /></p>\r\n<hr />\r\n<p><strong>Mensaje Original del Cliente</strong><br /><br />Cliente de Prueba<br />joseeduardo.bello@gmail.com</p>\r\n<hr />\r\n<p><br />Hola esto es otro mensaje de prueba mas</p>', '2015-06-05 22:59:38', 0),
(7, 1, 'Contacto de Prueba', 'Hola esto es una prueba', '', '2015-06-13 19:24:58', 0),
(8, 3, 'Prueba de Contacto', 'Hola esto es una prueba de contacto para elespectadoranimal.com ', '', '2015-06-13 19:36:55', 0),
(9, 1, 'Prueba de Contacto', 'Hola esto es una prueba de contacto', '', '2015-06-16 07:37:01', 0),
(10, 1, 'Prueba de Mensaje', 'Prueba de contacto', '', '2015-06-16 07:38:09', 0),
(11, 4, 'aaaa', 'aaaaaa', '', '2015-06-16 07:39:04', 0),
(12, 4, 'a', 'a', '', '2015-06-16 07:40:05', 0),
(13, 5, 'a', 'a', '', '2015-06-16 07:42:06', 0),
(14, 1, '0', '0', '', '2015-06-25 04:21:01', 0),
(15, 6, 'Esto es un mensaje de preuba', 'Hola esto es un mensaje de prueba\r\n', '<p>Esto es una prueba de mensaje<br /><br /></p>\r\n<hr />\r\n<p><strong>Mensaje Original del Cliente</strong><br /><br />Jose Bello<br />preuba@gmail.com</p>\r\n<hr />\r\n<p><br />Hola esto es un mensaje de prueba</p>', '2016-07-09 04:45:37', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `im_menus`
--

CREATE TABLE `im_menus` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `nombre_espanol` varchar(255) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `idpadre` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `idrelacion` int(11) NOT NULL DEFAULT '0',
  `posicion` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0=activa; 1=inactiva'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `im_menus`
--

INSERT INTO `im_menus` (`id`, `nombre`, `nombre_espanol`, `tags`, `idpadre`, `tipo`, `idrelacion`, `posicion`, `url`, `status`) VALUES
(1, 'Construction', 'Construcción', 'construction', 0, 2, 1, 1, '', 0),
(2, 'Investments', 'Inversiones', 'investments', 0, 2, 2, 2, '', 0),
(3, 'Foods', 'Alimentos', 'foods', 0, 2, 3, 3, '', 0),
(4, 'Agricultural', 'Agropecuaria', 'agricultural', 0, 2, 4, 4, '', 0),
(5, 'International', 'Internacional', 'international', 0, 2, 5, 5, '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `im_menu_tipo`
--

CREATE TABLE `im_menu_tipo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `tabla` varchar(255) NOT NULL,
  `pagina` varchar(255) NOT NULL,
  `campo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `im_menu_tipo`
--

INSERT INTO `im_menu_tipo` (`id`, `nombre`, `tabla`, `pagina`, `campo`) VALUES
(1, 'Inicio', '', 'home', ''),
(2, 'Pagina Contenido', 'im_contenidos', 'content/get', 'titulo'),
(3, 'Pagina Noticia', 'im_noticias_categoria', 'noticias/get', 'nombre'),
(4, 'Pagina de Productos', 'im_productos_categoria', 'categories/get', 'nombre'),
(6, 'Pagina de Sesion', '', '', ''),
(7, 'Pagina de Registro', '', '', ''),
(8, 'Pagina de Galeria', 'im_galeria_categoria', '', 'nombre'),
(9, 'Pagina de Carrito', '', '', ''),
(10, 'Pagina de Contacto', '', 'contact', ''),
(11, 'Link Interno', '', '', ''),
(12, 'Ancla Interna', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `im_modulos`
--

CREATE TABLE `im_modulos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `tags` varchar(100) NOT NULL,
  `url` varchar(255) NOT NULL,
  `icono` varchar(255) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0=activa; 1=inactiva'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `im_modulos`
--

INSERT INTO `im_modulos` (`id`, `nombre`, `tags`, `url`, `icono`, `cantidad`, `status`) VALUES
(1, 'Configuración', 'configuracion', 'configuracion/', 'wrench', 0, 0),
(2, 'Slideshow', 'slidehosw', 'slideshow/', 'camera-retro ', 0, 0),
(3, 'Noticias', 'noticias', 'noticias/', 'globe', 0, 0),
(4, 'Productos', 'productos', 'productos/', 'barcode', 0, 0),
(5, 'Pedidos', 'pedidos', 'pedidos/', 'shopping-cart ', 2, 0),
(6, 'Paginas de Contenido', 'contenido', 'contenido/', 'file-o', 0, 0),
(7, 'Gestor de Menu', 'menu', 'menu/', 'list-alt ', 0, 0),
(8, 'Publicidad', 'publicidad', 'publicidad/', 'external-link-square', 0, 0),
(9, 'Galerias', 'galerias', 'galeria/', 'film', 0, 0),
(10, 'Centro de Mensajes', 'contacto', 'mensajes/', 'envelope', 10, 0),
(11, 'Clientes', 'clientes', 'clientes/', 'user', 0, 0),
(12, 'Comentarios', 'comentarios', 'comentarios/', 'comments', 134, 0),
(13, 'Preguntas y Respuestas', 'preguntas', 'preguntas/', 'comment', 20, 0),
(14, 'Usuarios', 'usuarios', 'usuarios/', 'user', 0, 0),
(15, 'Eventos', 'eventos', 'eventos/', 'globe', 0, 0),
(16, 'Testimonio', 'testimonio', 'testimonio/', 'book', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `im_modulos_privilegios`
--

CREATE TABLE `im_modulos_privilegios` (
  `id` int(11) NOT NULL,
  `idmodulo` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `im_modulos_privilegios`
--

INSERT INTO `im_modulos_privilegios` (`id`, `idmodulo`, `idusuario`) VALUES
(116, 13, 5),
(117, 14, 5),
(119, 9, 3),
(120, 10, 3),
(121, 12, 3),
(122, 13, 3),
(123, 14, 3),
(124, 14, 6),
(125, 14, 7),
(127, 14, 8),
(128, 1, 9),
(129, 14, 9),
(169, 1, 1),
(170, 2, 1),
(171, 3, 1),
(172, 4, 1),
(173, 5, 1),
(174, 6, 1),
(175, 7, 1),
(176, 8, 1),
(177, 9, 1),
(178, 10, 1),
(179, 11, 1),
(180, 12, 1),
(181, 13, 1),
(182, 14, 1),
(183, 15, 1),
(184, 1, 2),
(185, 2, 2),
(186, 3, 2),
(187, 4, 2),
(188, 5, 2),
(189, 6, 2),
(190, 7, 2),
(191, 8, 2),
(192, 9, 2),
(193, 10, 2),
(194, 11, 2),
(195, 12, 2),
(196, 13, 2),
(197, 14, 2),
(198, 15, 2),
(199, 16, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `im_noticias`
--

CREATE TABLE `im_noticias` (
  `id` int(11) NOT NULL,
  `idcategoria` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `titulo_espanol` varchar(255) NOT NULL,
  `tags` text NOT NULL,
  `url` varchar(300) NOT NULL,
  `contenido` text NOT NULL,
  `contenido_espanol` text NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_publicacion` datetime NOT NULL,
  `idusuario` int(11) NOT NULL,
  `img_principal` varchar(255) NOT NULL,
  `visitas` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0=activa; 1=inactiva',
  `destacado` int(11) NOT NULL DEFAULT '0' COMMENT '0=no; 1=si'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `im_noticias`
--

INSERT INTO `im_noticias` (`id`, `idcategoria`, `titulo`, `titulo_espanol`, `tags`, `url`, `contenido`, `contenido_espanol`, `fecha_creacion`, `fecha_publicacion`, `idusuario`, `img_principal`, `visitas`, `status`, `destacado`) VALUES
(3, 13, 'Five tips to improve your personal finances in 2016', 'Cinco consejos para mejorar tus finanzas personales en 2016', 'five-tips-to-improve-your-personal-finances-in-2016', '', '<p><span id="result_box" class="" lang="en" tabindex="-1"><span title="Una buena planificaci&oacute;n financiera es la mejor forma de controlar nuestra econom&iacute;a dom&eacute;stica y de evitar que nuestro bolsillo se vea afectado por una mala gesti&oacute;n.">Good financial planning is the best way to control our domestic economy and prevent our pocket is affected by poor management. </span><span title="Pero no todo se reduce a llevar al d&iacute;a nuestras facturas.">But not everything is reduced to keep up to date our bills. </span><span title="Tambi&eacute;n es importante planificar con tiempo el ahorro, conocer a fondo las condiciones de los productos que tengamos contratados y no sobreendeudarnos.">It is also important to plan ahead savings, get to know the conditions of the products we have contracted and not sobreendeudarnos. </span><span title="El comparador de productos financieros HelpMyCash.com ha elaborado una lista con cinco consejos para mejorar nuestra econom&iacute;a en 2016:\r\n\r\n">The comparison of financial products HelpMyCash.com has compiled a list of five tips to improve our economy in 2016:<br /><br /></span><span title="1. Incrementar los ahorros sin asfixiar nuestra econom&iacute;a.">1. Increase savings without stifling our economy. </span><span title="Uno de los errores m&aacute;s habituales es querer aumentar los ahorros de forma considerable en muy poco tiempo.">One of the most common mistakes is to want to increase savings significantly in a short time. </span><span title="Lo m&aacute;s adecuado es elaborar un plan de ahorro y, sobre todo, cumplirlo teniendo en cuenta que cuanto mayor sea el plazo, menos esfuerzo nos costar&aacute;.">It is best to develop a savings plan and, above all, fulfill given that the longer the term, the less effort it cost us. </span><span title="Por ejemplo, si necesitamos 5.000 euros, resultar&aacute; mucho m&aacute;s c&oacute;modo ahorrarlos en dos a&ntilde;os guardando unos 200 euros cada mes, que intentar conseguirlos en solo seis meses a raz&oacute;n de m&aacute;s de 800 euros mensuales.\r\n\r\n">For example, if we need 5,000 euros, it will be much more comfortable save them in two years by saving about 200 euros each month to try to get them in just six months at over 800 euros a month.<br /><br /></span><span title="Con poco esfuerzo, podremos incrementar nuestros ahorros considerablemente.">With little effort, we can increase our savings considerably. </span><span title="Por ejemplo, depositando 150 euros mensuales en una cuenta de ahorro, a final de a&ntilde;o tendr&iacute;amos 1.800 euros ahorrados, a lo que habr&iacute;a que sumarle los intereses devengados de la cuenta.">For example, depositing 150 euros a month in a savings account at the end of the year would have saved 1,800 euros, to which should be added the interest accrued on the account. </span><span title="Combinar una buena planificaci&oacute;n con una de las mejores cuentas remuneradas del mercado, que pueden tener una rentabilidad de hasta el 7 %, es sin&oacute;nimo de incrementar nuestros ahorros sin esfuerzo.\r\n\r\n">Good planning combined with one of the best paid market accounts, which may have a return of up to 7%, is synonymous with effortless increase our savings.<br /><br /></span><span title="2. Decir adi&oacute;s a las comisiones bancarias.">2. Say goodbye to bank charges. </span><span title="En 2016 no ser&aacute; necesario pagar comisiones por tener una cuenta ni tampoco por solicitar un pr&eacute;stamo, una hipoteca o por el mantenimiento de una tarjeta.">In 2016 you will not pay commissions to have an account or not to apply for a loan, a mortgage or maintenance of a card. </span><span title="Entre la vasta oferta de productos financieros, existen muchos que est&aacute;n exentos de comisiones.">Among the vast range of financial products, there are many who are exempt from fees. </span><span title="Y la diferencia entre contratar un producto con comisiones o sin ellas es muy elevada.\r\n\r\n">And the difference between hiring a product with or without fee is very high.<br /><br /></span><span title="Por ejemplo, pagar una comisi&oacute;n de apertura de un 3 % en un pr&eacute;stamo de 10.000 euros supone un gasto inicial de 300 euros extra que podemos evitar f&aacute;cilmente contratando pr&eacute;stamos sin comisiones como el Cr&eacute;dito Proyecto de Cofidis desde el 4,95% TIN.">For example, pay an origination fee of 3% of a loan of 10,000 euros represents an initial cost of 300 euros extra we can easily avoid contracting loans without commissions as Cofidis Credit Project from 4.95% TIN. </span><span title="O los pr&eacute;stamos personales de Cetelem y de ING Direct al 6,95% TIN, entre otras opciones.\r\n\r\n">Or Cetelem personal loans and ING Direct 6.95% TIN, among other options.<br /><br /></span><span title="Lo mismo ocurre con las cuentas.">The same applies to the accounts. </span><span title="De hecho, ya no es necesario ni siquiera domiciliar una n&oacute;mina para que la entidad nos exima del pago de comisiones.">Indeed, it is no longer necessary or even household a list for the entity we exempt from paying fees. </span><span title="Productos como la Cuenta Corriente Operativa de Openbank o las cuentas corrientes de Uno-e no tienen comisiones de ning&uacute;n tipo y para contratarlas no hace falta ni domiciliar una n&oacute;mina ni mantener un saldo m&iacute;nimo.\r\n\r\n">Operational products such as Current Account Openbank or current account One-and no fees of any kind and do not need to hire them or debit a list or maintain a minimum balance.<br /><br /></span><span title="3. No dedicar m&aacute;s del 40 % de los ingresos a pagar deudas.">3. Do not spend more than 40% of the proceeds to pay down debt. </span><span title="Por lo general, los expertos coinciden en que no deber&iacute;amos dedicar m&aacute;s de un 40% de nuestros ingresos mensuales a satisfacer nuestras deudas.">In general, experts agree that we should not spend more than 40% of our monthly income to meet our debts. </span><span title="Pero, cuidado, ese 40% se refiere a la suma total de las deudas, en la que se incluyen las hipotecas, pr&eacute;stamos personales o tarjetas de cr&eacute;dito.">But beware, the 40% refers to the total amount of debt in mortgages, personal loans or credit cards are included. </span><span title="Un truco para mantener las deudas a raya es no dedicar m&aacute;s de un 30% a satisfacer un pago en concreto para as&iacute; tener cierto margen de maniobra en caso de necesitar financiaci&oacute;n extra.\r\n\r\n">A trick to keep debts at bay is not devote more than 30% to meet a particular payment so have some leeway in case of need extra funding.<br /><br /></span><span title="Una persona que cobre 1.500 euros netos mensuales, no deber&iacute;a destinar m&aacute;s de 600 euros a pagar el total de sus deudas.">A person who charges 1,500 euros net per month, you should not spend more than 600 euros to pay its total debts. </span><span title="Si su &uacute;nica deuda es una hipoteca, podr&iacute;a dedicar todo ese dinero a pagar las letras, pero en el momento en el que necesitase aumentar su nivel de endeudamiento superar&iacute;a ese 40%.">If your only debt is a mortgage, you could spend all that money to pay the letters, but in the time he needed to increase its debt level would surpass the 40%. </span><span title="Si en cambio dedicase un 30% a pagar la hipoteca, a&uacute;n tendr&iacute;a un 10% extra para maniobrar en caso de necesidad.\r\n\r\n">If instead devote 30% to pay the mortgage, still have an extra 10% to maneuver if necessary.<br /><br /></span><span title="4. Revisar las condiciones de los productos contratados.">4. Review the conditions of contracted products. </span><span title="En 2016 puede ser el momento para revisar todos esos contratos que tenemos olvidados y mejorar las condiciones de nuestros productos.">In 2016 it may be time to review all the contracts we have forgotten and improve our products. </span><span title="&iquest;Por qu&eacute; conformarnos con una tarjeta con una TAE del 25% si se puede contratar otra al 12%?">Why settle for a card with an APR of 25% if you can hire another 12%? </span><span title="&iquest;Por qu&eacute; utilizar una cuenta de ahorro al 1% si se puede conseguir hasta un 5%?">Why use a savings account at 1% if you can get up to 5%? </span><span title="Es importante conocer a fondo las condiciones de los productos que tenemos y eliminar todos aquellos que se pueden mejorar o que ya no necesitamos.">It is important to know thoroughly the conditions of the products we have and eliminate those that can be improved or no longer needed. </span><span title="Un buen ejemplo ser&iacute;an las cuentas olvidadas sin dinero que al final pueden acabar d&aacute;ndonos m&aacute;s de un susto en forma de comisiones.\r\n\r\n">A good example would be forgotten no money accounts that ultimately may end up giving us more of a scare in the form of commissions.<br /><br /></span><span title="5. Explorar el mercado en busca de nuevas propuestas: planes de pensiones, tarjetas balance &laquo;transfer&raquo; o minicr&eacute;ditos &laquo;online&raquo; para imprevistos.">5. To explore the market in search of new proposals: pension plans, balance "transfer" or minicredit cards "online" contingency. </span><span title="Nunca est&aacute; de m&aacute;s darnos una vuelta por el mercado en busca de nuevas propuestas que en alg&uacute;n momento pueden llegar a resultarnos &uacute;tiles.">It never hurts to give us a tour of the market for new proposals sometime be useful to us can reach. </span><span title="El mercado se renueva constantemente as&iacute; que por qu&eacute; no hacerlo nosotros tambi&eacute;n.">The market is constantly renewed so why do not we.</span></span></p>', '<p>Una buena planificaci&oacute;n financiera es la mejor forma de controlar nuestra econom&iacute;a dom&eacute;stica y de evitar que nuestro bolsillo se vea afectado por una mala gesti&oacute;n. Pero no todo se reduce a llevar al d&iacute;a nuestras facturas. Tambi&eacute;n es importante planificar con tiempo el ahorro, conocer a fondo las condiciones de los productos que tengamos contratados y no sobreendeudarnos. El comparador de productos financieros HelpMyCash.com ha elaborado una lista con cinco consejos para mejorar nuestra econom&iacute;a en 2016:<br /><br />1. Incrementar los ahorros sin asfixiar nuestra econom&iacute;a. Uno de los errores m&aacute;s habituales es querer aumentar los ahorros de forma considerable en muy poco tiempo. Lo m&aacute;s adecuado es elaborar un plan de ahorro y, sobre todo, cumplirlo teniendo en cuenta que cuanto mayor sea el plazo, menos esfuerzo nos costar&aacute;. Por ejemplo, si necesitamos 5.000 euros, resultar&aacute; mucho m&aacute;s c&oacute;modo ahorrarlos en dos a&ntilde;os guardando unos 200 euros cada mes, que intentar conseguirlos en solo seis meses a raz&oacute;n de m&aacute;s de 800 euros mensuales.<br /><br />Con poco esfuerzo, podremos incrementar nuestros ahorros considerablemente. Por ejemplo, depositando 150 euros mensuales en una cuenta de ahorro, a final de a&ntilde;o tendr&iacute;amos 1.800 euros ahorrados, a lo que habr&iacute;a que sumarle los intereses devengados de la cuenta. Combinar una buena planificaci&oacute;n con una de las mejores cuentas remuneradas del mercado, que pueden tener una rentabilidad de hasta el 7 %, es sin&oacute;nimo de incrementar nuestros ahorros sin esfuerzo.<br /><br />2. Decir adi&oacute;s a las comisiones bancarias. En 2016 no ser&aacute; necesario pagar comisiones por tener una cuenta ni tampoco por solicitar un pr&eacute;stamo, una hipoteca o por el mantenimiento de una tarjeta. Entre la vasta oferta de productos financieros, existen muchos que est&aacute;n exentos de comisiones. Y la diferencia entre contratar un producto con comisiones o sin ellas es muy elevada.<br /><br />Por ejemplo, pagar una comisi&oacute;n de apertura de un 3 % en un pr&eacute;stamo de 10.000 euros supone un gasto inicial de 300 euros extra que podemos evitar f&aacute;cilmente contratando pr&eacute;stamos sin comisiones como el Cr&eacute;dito Proyecto de Cofidis desde el 4,95% TIN. O los pr&eacute;stamos personales de Cetelem y de ING Direct al 6,95% TIN, entre otras opciones.<br /><br />Lo mismo ocurre con las cuentas. De hecho, ya no es necesario ni siquiera domiciliar una n&oacute;mina para que la entidad nos exima del pago de comisiones. Productos como la Cuenta Corriente Operativa de Openbank o las cuentas corrientes de Uno-e no tienen comisiones de ning&uacute;n tipo y para contratarlas no hace falta ni domiciliar una n&oacute;mina ni mantener un saldo m&iacute;nimo.<br /><br />3. No dedicar m&aacute;s del 40 % de los ingresos a pagar deudas. Por lo general, los expertos coinciden en que no deber&iacute;amos dedicar m&aacute;s de un 40% de nuestros ingresos mensuales a satisfacer nuestras deudas. Pero, cuidado, ese 40% se refiere a la suma total de las deudas, en la que se incluyen las hipotecas, pr&eacute;stamos personales o tarjetas de cr&eacute;dito. Un truco para mantener las deudas a raya es no dedicar m&aacute;s de un 30% a satisfacer un pago en concreto para as&iacute; tener cierto margen de maniobra en caso de necesitar financiaci&oacute;n extra.<br /><br />Una persona que cobre 1.500 euros netos mensuales, no deber&iacute;a destinar m&aacute;s de 600 euros a pagar el total de sus deudas. Si su &uacute;nica deuda es una hipoteca, podr&iacute;a dedicar todo ese dinero a pagar las letras, pero en el momento en el que necesitase aumentar su nivel de endeudamiento superar&iacute;a ese 40%. Si en cambio dedicase un 30% a pagar la hipoteca, a&uacute;n tendr&iacute;a un 10% extra para maniobrar en caso de necesidad.<br /><br />4. Revisar las condiciones de los productos contratados. En 2016 puede ser el momento para revisar todos esos contratos que tenemos olvidados y mejorar las condiciones de nuestros productos. &iquest;Por qu&eacute; conformarnos con una tarjeta con una TAE del 25% si se puede contratar otra al 12%? &iquest;Por qu&eacute; utilizar una cuenta de ahorro al 1% si se puede conseguir hasta un 5%? Es importante conocer a fondo las condiciones de los productos que tenemos y eliminar todos aquellos que se pueden mejorar o que ya no necesitamos. Un buen ejemplo ser&iacute;an las cuentas olvidadas sin dinero que al final pueden acabar d&aacute;ndonos m&aacute;s de un susto en forma de comisiones.<br /><br />5. Explorar el mercado en busca de nuevas propuestas: planes de pensiones, tarjetas balance &laquo;transfer&raquo; o minicr&eacute;ditos &laquo;online&raquo; para imprevistos. Nunca est&aacute; de m&aacute;s darnos una vuelta por el mercado en busca de nuevas propuestas que en alg&uacute;n momento pueden llegar a resultarnos &uacute;tiles. El mercado se renueva constantemente as&iacute; que por qu&eacute; no hacerlo nosotros tambi&eacute;n.</p>', '2016-01-28 16:12:42', '2016-01-28 11:08:00', 1, '', 0, 0, 1),
(4, 13, 'A retirement plan is always a good decision', 'Un Plan de Retiro siempre es una buena decisión', 'a-retirement-plan-is-always-a-good-decision', '', '<p><span id="result_box" class="" lang="en" tabindex="-1"><span title="Hace unos meses atr&aacute;s, cuando comenc&eacute; a escribir en este blog, les coment&eacute; c&oacute;mo fueron mis inicios en un negocio que me ha servido para potenciar mi desarrollo personal y profesional;">A few months ago, when I started writing this blog, I mentioned how were my beginnings in a business that has helped me to enhance my personal and professional development; </span><span title="sin contar las oportunidades que me brinda para echarle una mano tanto a conocidos como desconocidos que anhelan llegar a ancianos sin preocuparse por el c&oacute;mo mantendr&aacute;n su calidad de vida y bienestar.\r\n\r\n">without me the opportunities to lend a hand to both known and unknown yearning to reach elderly without worrying about how to maintain their quality of life and well-being.<br /><br /></span><span title="Cica Life, estructura de negocio a la que me dedico desde hace ya casi siete a&ntilde;os, ofrece en Estados Unidos y m&aacute;s de 40 pa&iacute;ses alrededor del mundo planes de retiros privados, instrumentos financieros vitalicios con m&uacute;ltiples beneficios para empresarios, ejecutivos y profesionales con capacidad de">Cica Life business structure to which I devote myself almost seven years now, offered in the United States and more than 40 countries around the world plans private retreats, Life financial instruments with multiple benefits for entrepreneurs, executives and professionals capable of </span><span title="ahorro a largo plazo, visi&oacute;n de futuro y buena planificaci&oacute;n.\r\n\r\n">long-term savings, foresight and good planning.<br /><br /></span><span title="Ante la futura insostenibilidad de los sistemas p&uacute;blicos de seguridad social sobre todo en pa&iacute;ses de Latinoam&eacute;rica, tanto instituciones p&uacute;blicas como organizaciones no gubernamentales -conscientes de la seguridad y fiabilidad de estos planes- est&aacute;n promoviendo fuertemente la adquisici&oacute;n de programas privados de jubilaci&oacute;n para no dejar toda">In the future unsustainability of public social security systems especially in Latin America, both public institutions and non-governmental organizations -aware security and reliability of these plans-are heavily promoting the purchase of private retirement programs to not leave any </span><span title="la responsabilidad en los estados, y garantizarle el bienestar a los ciudadanos.\r\n\r\n">responsibility in the states, and ensure the welfare of citizens.<br /><br /></span><span title="En lo individual, siempre ser&aacute; una buena decisi&oacute;n optar por iniciativas como &eacute;stas, que generen beneficios cualitativos y cuantitativos como los mostramos en nuestro video&hellip;">Individually, always it is a good decision to opt for such initiatives that generate qualitative and quantitative benefits as shown in our video ...</span></span></p>\r\n<p><iframe src="https://www.youtube.com/embed/K-DkBdT502g" width="604" height="370" frameborder="0" allowfullscreen="allowfullscreen"></iframe></p>', '<p>Hace unos meses atr&aacute;s, cuando comenc&eacute; a escribir en este blog, les coment&eacute; c&oacute;mo fueron mis inicios en un negocio que me ha servido para potenciar mi desarrollo personal y profesional; sin contar las oportunidades que me brinda para echarle una mano tanto a conocidos como desconocidos que anhelan llegar a ancianos sin preocuparse por el c&oacute;mo mantendr&aacute;n su calidad de vida y bienestar.<br /><br />Cica Life, estructura de negocio a la que me dedico desde hace ya casi siete a&ntilde;os, ofrece en Estados Unidos y m&aacute;s de 40 pa&iacute;ses alrededor del mundo planes de retiros privados, instrumentos financieros vitalicios con m&uacute;ltiples beneficios para empresarios, ejecutivos y profesionales con capacidad de ahorro a largo plazo, visi&oacute;n de futuro y buena planificaci&oacute;n.<br /><br />Ante la futura insostenibilidad de los sistemas p&uacute;blicos de seguridad social sobre todo en pa&iacute;ses de Latinoam&eacute;rica, tanto instituciones p&uacute;blicas como organizaciones no gubernamentales -conscientes de la seguridad y fiabilidad de estos planes- est&aacute;n promoviendo fuertemente la adquisici&oacute;n de programas privados de jubilaci&oacute;n para no dejar toda la responsabilidad en los estados, y garantizarle el bienestar a los ciudadanos.<br /><br />En lo individual, siempre ser&aacute; una buena decisi&oacute;n optar por iniciativas como &eacute;stas, que generen beneficios cualitativos y cuantitativos como los mostramos en nuestro video&hellip;</p>\r\n<p><iframe src="https://www.youtube.com/embed/K-DkBdT502g" width="604" height="370" frameborder="0" allowfullscreen="allowfullscreen"></iframe></p>', '2016-01-28 16:12:37', '2016-01-28 11:10:00', 1, '', 0, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `im_noticias_categoria`
--

CREATE TABLE `im_noticias_categoria` (
  `id` int(11) NOT NULL,
  `idpadre` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0=activa; 1=inactiva'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `im_noticias_categoria`
--

INSERT INTO `im_noticias_categoria` (`id`, `idpadre`, `nombre`, `tags`, `descripcion`, `imagen`, `status`) VALUES
(13, 0, 'Tips', 'tips', 'Tips sobre el mundo animal y la comida cruda para nuestras mascotas', '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `im_noticias_comentarios`
--

CREATE TABLE `im_noticias_comentarios` (
  `id` int(11) NOT NULL,
  `idnoticia` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `comentario` varchar(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `im_noticias_comentarios`
--

INSERT INTO `im_noticias_comentarios` (`id`, `idnoticia`, `idcliente`, `comentario`, `fecha`) VALUES
(2, 3, 1, 'Comentario de prueba Comentario de prueba Comentario de prueba Comentario de prueba Comentario de prueba Comentario de prueba ', '2015-06-04 03:10:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `im_noticias_galeria`
--

CREATE TABLE `im_noticias_galeria` (
  `id` int(11) NOT NULL,
  `idnoticia` int(11) NOT NULL,
  `tipo` int(11) NOT NULL COMMENT '0=img; 1=video',
  `principal` int(11) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL,
  `archivo` varchar(255) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0= activo; 1= inactivo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `im_noticias_galeria`
--

INSERT INTO `im_noticias_galeria` (`id`, `idnoticia`, `tipo`, `principal`, `url`, `archivo`, `titulo`, `descripcion`, `status`) VALUES
(9, 6, 0, 1, '', '7bb87025278a15ad177f2e33f085233e.jpg', '', '', 0),
(10, 7, 0, 1, '', '712da7af51fc99488749ec5f05ec7dc8.jpg', '', '', 0),
(11, 8, 0, 1, '', '87fda40e6f51d4aff033f3781dda9ad7.jpg', '', '', 0),
(12, 9, 0, 1, '', '1a23fc403753ba74479a1f7275b249c2.jpg', '', '', 0),
(13, 10, 0, 1, '', 'b409b21107ce2b131bb2575271c8c629.jpg', '', '', 0),
(14, 11, 0, 1, '', 'bc1a9fe0fc0069e9720eedf409f9ed75.jpg', '', '', 0),
(15, 9, 0, 0, '', '4cc69efd0f90a43c3a797e84b238fc22.jpg', '', '', 0),
(16, 9, 0, 0, '', '513744cfb0204729095f48e8fa73cc5b.jpg', '', '', 0),
(17, 9, 0, 0, '', '93ae3e1439b6d77240e58463ccc27bae.jpg', '', '', 0),
(18, 9, 0, 0, '', '7347f5dbf28b80fc0aa5dd270dc7b3d6.jpg', '', '', 0),
(19, 9, 0, 0, '', 'a9026e4a7052d3eaf7bf6de8903fb1cf.jpg', '', '', 0),
(20, 9, 0, 0, '', 'b95c13068c9aa7538da2544a9cca4d83.jpg', '', '', 0),
(21, 24, 0, 1, '', '409e44f473f9f4dea51bf9945922a862.jpg', '', '', 0),
(22, 25, 0, 1, '', '5c5d602b08bdfc8079e7650b4f79fd16.jpg', '', '', 0),
(23, 26, 0, 1, '', '22065594d3059d9d1e420132e7573273.jpg', '', '', 0),
(24, 27, 0, 1, '', 'c3d704bed35738ee7bdde2126a75af67.jpg', '', '', 0),
(25, 28, 0, 1, '', 'adab088d9321689c1a1d10d02afc01b1.jpg', '', '', 0),
(26, 29, 0, 1, '', '23b4d1b249f01b022f7dcc4b3cb9427b.jpg', '', '', 0),
(27, 30, 0, 1, '', '9f15a428913b1ed2f4355e75ce88d802.jpg', '', '', 0),
(28, 31, 0, 1, '', '2f47599e479a8009aa4f4fda19f38db6.jpg', '', '', 0),
(29, 32, 0, 1, '', 'd07a4dadd975a9f29f13ad6e3e00d4ac.jpg', '', '', 0),
(30, 33, 0, 1, '', 'be436dec7f0adcfe61fff4787f764511.jpg', '', '', 0),
(31, 34, 0, 1, '', '09ae5ee06b6f83ae2469854df0d6a2ac.jpg', '', '', 0),
(32, 35, 0, 1, '', '0820a128b34c29c0d4992b6cb9d6e202.jpg', '', '', 0),
(33, 36, 0, 1, '', '9ece21706d6ca35e6ad85dcda4b06c72.jpg', '', '', 0),
(34, 37, 0, 1, '', '870bdf7b183f8eb9ad9e043585d7b3ca.jpg', '', '', 0),
(35, 1, 0, 1, '', '79b7f6a832d74156f1368734dbe88e32.jpg', '', '', 0),
(36, 2, 0, 1, '', '7a53689c005bc912e8c5c78fc7c909ff.jpg', '', '', 0),
(37, 3, 0, 1, '', '2c0003b1d1b26dce68e5902f6c371260.png', '', '', 0),
(38, 4, 0, 1, '', 'b66e8ef4f17e4213a6bc2739078200b3.png', '', '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `im_obras`
--

CREATE TABLE `im_obras` (
  `id` int(11) NOT NULL,
  `idcategoria` int(11) NOT NULL,
  `idcoleccion` int(11) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `nombre_espanol` varchar(255) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  `descripcion_espanol` text NOT NULL,
  `descripcion_breve` varchar(255) NOT NULL,
  `descripcion_breve_espanol` varchar(255) NOT NULL,
  `cantidad` decimal(16,2) NOT NULL,
  `precio` decimal(16,2) NOT NULL,
  `stock_min` decimal(16,2) NOT NULL,
  `stock_max` decimal(16,2) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0=activo; 1=inactivo',
  `modelo` varchar(255) NOT NULL,
  `marca` varchar(255) NOT NULL,
  `anio` varchar(255) NOT NULL,
  `visitas` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `destacado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `im_obras`
--

INSERT INTO `im_obras` (`id`, `idcategoria`, `idcoleccion`, `tags`, `nombre`, `nombre_espanol`, `codigo`, `descripcion`, `descripcion_espanol`, `descripcion_breve`, `descripcion_breve_espanol`, `cantidad`, `precio`, `stock_min`, `stock_max`, `status`, `modelo`, `marca`, `anio`, `visitas`, `idusuario`, `destacado`) VALUES
(3, 4, 0, 'impermeabilizacion-y-aislamiento', 'IMPERMEABILIZACION Y AISLAMIENTO', 'IMPERMEABILIZACION Y AISLAMIENTO', '00001', '<pre id="tw-target-text" class="tw-data-text vk_txt tw-ta tw-text-small" dir="ltr" style="text-align: left; height: 72px;" data-fulltext="" data-placeholder="Traducci&oacute;n"><span lang="en">IMPERMEABILIZACION AND THERMAL INSULATION POLYMER BASED ELASTOMERIC -</span></pre>', '<p>IMPERMEABILIZACION Y AISLAMIENTO TERMICO A BASE DE POLIMEROS ELASTOMERICOS -</p>', 'IMPERMEABILIZACION AND THERMAL INSULATION POLYMER BASED ELASTOMERIC -', 'IMPERMEABILIZACION Y AISLAMIENTO TERMICO A BASE DE POLIMEROS ELASTOMERICOS - ', '0.00', '0.00', '0.00', '0.00', 0, '0', '0', '0', 0, 2, 0),
(4, 3, 0, 'la-bufala-cava-cuarto', 'LA BUFALA - CAVA CUARTO', 'LA BUFALA - CAVA CUARTO', '00002', '<p>LA BUFALA - CAVA CUARTO</p>', '<p>LA BUFALA - CAVA CUARTO</p>', 'LA BUFALA - CAVA CUARTO', 'LA BUFALA - CAVA CUARTO', '0.00', '0.00', '0.00', '0.00', 0, '0', '0', '0', 0, 2, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `im_obras_categoria`
--

CREATE TABLE `im_obras_categoria` (
  `id` int(11) NOT NULL,
  `idpadre` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `nombre_espanol` varchar(255) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `descripcion_espanol` text NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0=activa; 1=inactiva'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `im_obras_categoria`
--

INSERT INTO `im_obras_categoria` (`id`, `idpadre`, `nombre`, `nombre_espanol`, `tags`, `descripcion`, `descripcion_espanol`, `imagen`, `status`) VALUES
(3, 0, 'Fourth cavas', 'Cavas Cuarto', 'fourth-cavas', 'Fourth cavas', 'Cavas Cuarto', '', 0),
(4, 0, 'Isolations', 'Aislamientos', 'isolations', 'isolations', 'Aislamientos', '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `im_obras_colecciones`
--

CREATE TABLE `im_obras_colecciones` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `nombre_espanol` varchar(255) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `descripcion_espanol` text NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0=activa; 1=inactiva'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `im_obras_galeria`
--

CREATE TABLE `im_obras_galeria` (
  `id` int(11) NOT NULL,
  `idobra` int(11) NOT NULL,
  `tipo` int(11) NOT NULL COMMENT '0=img; 1=video',
  `principal` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `archivo` varchar(255) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `status` int(11) NOT NULL COMMENT '0=activa; 1=inactiva'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `im_obras_galeria`
--

INSERT INTO `im_obras_galeria` (`id`, `idobra`, `tipo`, `principal`, `url`, `archivo`, `titulo`, `descripcion`, `status`) VALUES
(1, 1, 0, 1, '', 'bae192d78a24796f4f6dad8c978811bf.jpg', '', '', 0),
(2, 1, 0, 0, '', '7d6a2e6b37940e57867f3a9a60958f0b.jpg', '', '', 0),
(3, 1, 0, 0, '', '05eaed222f04bfdffcc91ce8a7da1318.jpg', '', '', 0),
(4, 1, 0, 0, '', '728846ed045445854a8274de87d00136.jpg', '', '', 0),
(5, 2, 0, 1, '', '6e77066e1f31208196e3875228707cf2.jpg', '', '', 0),
(6, 2, 0, 0, '', 'f2c9d633d8092963785206dad3da5bd4.jpg', '', '', 0),
(7, 2, 0, 0, '', '284852b496d0a62fcb5f154936fe7fdc.jpg', '', '', 0),
(8, 2, 0, 0, '', 'b4693cfffef763ad9a9e4df0de082012.jpg', '', '', 0),
(9, 2, 0, 0, '', '22e2d61b968f4752b226aa260813aba7.jpg', '', '', 0),
(10, 3, 0, 1, '', 'bde37196a73eadf33fdec6c17d60dd14.jpg', '', '', 0),
(11, 3, 0, 0, '', '2016e7f07e9f850515715eb8a9f713c8.jpg', '', '', 0),
(12, 3, 0, 0, '', '4add7a3d23a51215e80b8279035dd4a8.jpg', '', '', 0),
(13, 3, 0, 0, '', '0a92a61e27fd6e01b65f7480dff00495.jpg', '', '', 0),
(14, 4, 0, 1, '', '5480518569a7e53b4fbc3af5a45d1f31.jpg', '', '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `im_pedidolinea`
--

CREATE TABLE `im_pedidolinea` (
  `id` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `preciounitario` float NOT NULL,
  `cantidad` int(11) NOT NULL,
  `totalproducto` float NOT NULL,
  `idpedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `im_pedidolinea`
--

INSERT INTO `im_pedidolinea` (`id`, `idproducto`, `preciounitario`, `cantidad`, `totalproducto`, `idpedido`) VALUES
(1, 26, 4000, 3, 12000, 1),
(2, 33, 30000, 2, 60000, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `im_pedidos`
--

CREATE TABLE `im_pedidos` (
  `id` int(11) NOT NULL,
  `numeropedido` int(11) NOT NULL,
  `total` float NOT NULL,
  `iva` float NOT NULL,
  `grantotal` float NOT NULL,
  `estatus` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `fechacreacion` date NOT NULL,
  `metodo_pago` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `im_pedidos`
--

INSERT INTO `im_pedidos` (`id`, `numeropedido`, `total`, `iva`, `grantotal`, `estatus`, `idusuario`, `fechacreacion`, `metodo_pago`) VALUES
(1, 2, 50000, 50, 50000, 1, 1, '0000-00-00', 'paypal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `im_productos`
--

CREATE TABLE `im_productos` (
  `id` int(11) NOT NULL,
  `idcategoria` int(11) NOT NULL,
  `idcoleccion` int(11) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `nombre_espanol` varchar(255) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  `descripcion_espanol` text NOT NULL,
  `descripcion_breve` varchar(255) NOT NULL,
  `descripcion_breve_espanol` varchar(255) NOT NULL,
  `cantidad` decimal(16,2) NOT NULL,
  `precio` decimal(16,2) NOT NULL,
  `stock_min` decimal(16,2) NOT NULL,
  `stock_max` decimal(16,2) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0=activo; 1=inactivo',
  `modelo` varchar(255) NOT NULL,
  `marca` varchar(255) NOT NULL,
  `anio` varchar(255) NOT NULL,
  `visitas` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `destacado` int(11) NOT NULL,
  `precio_dolares` float NOT NULL,
  `talla` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `im_productos`
--

INSERT INTO `im_productos` (`id`, `idcategoria`, `idcoleccion`, `tags`, `nombre`, `nombre_espanol`, `codigo`, `descripcion`, `descripcion_espanol`, `descripcion_breve`, `descripcion_breve_espanol`, `cantidad`, `precio`, `stock_min`, `stock_max`, `status`, `modelo`, `marca`, `anio`, `visitas`, `idusuario`, `destacado`, `precio_dolares`, `talla`) VALUES
(26, 17, 1, 'shoes', 'Shoes', 'zapatos', '000-1', '<p><span id="result_box" class="short_text" lang="en"><span class="">Sports shoes</span></span></p>', '<p>Zapatos deportivos</p>', 'Sports shoes', 'Zapatos deportivos', '25.00', '20000.00', '10.00', '30.00', 0, 'Deportivos', 'Adidas', '2016', 0, 1, 1, 200, 0),
(27, 17, 2, 'shoes-4467', 'Shoes', 'zapatos', '000-2', '<p>Sport shoes</p>', '<p>Zapatos deportivos</p>', 'Sports shoes', 'Zapatos deportivos', '10.00', '3000.00', '12.00', '45.00', 0, 'Deportivos', 'Adidas', '2016', 0, 1, 1, 200, 0),
(28, 17, 2, 'shoes33', 'Shoes33', 'zapatos33', '000-23', '<p>Sport shoesss</p>', '<p>Zapatos deportivosss</p>', 'Sports shoess', 'Zapatos deportivoss', '11.00', '20000.00', '13.00', '46.00', 0, 'Deportivo', 'Adidass', '2017', 0, 1, 1, 300, 3),
(29, 17, 2, 'shoes-4467', 'Shoes4', 'zapatos3', '000-2', '<p>Sport shoes</p>', '<p>Zapatos deportivos</p>', 'Sports shoes', 'Zapatos deportivos', '10.00', '3000.00', '12.00', '45.00', 0, 'Deportivos', 'Adidas', '2016', 0, 1, 1, 200, 0),
(30, 17, 2, 'shoes-4467', 'Shoes5', 'zapatos3', '000-2', '<p>Sport shoes</p>', '<p>Zapatos deportivos</p>', 'Sports shoes', 'Zapatos deportivos', '10.00', '3000.00', '12.00', '45.00', 0, 'Deportivos', 'Adidas', '2016', 0, 1, 1, 200, 0),
(31, 17, 2, 'shoes-4467', 'Shoes6', 'zapatos3', '000-2', '<p>Sport shoes</p>', '<p>Zapatos deportivos</p>', 'Sports shoes', 'Zapatos deportivos', '10.00', '3000.00', '12.00', '45.00', 0, 'Deportivos', 'Adidas', '2016', 0, 1, 1, 200, 0),
(32, 17, 2, 'shoes-4467', 'Shoes7', 'zapatos3', '000-2', '<p>Sport shoes</p>', '<p>Zapatos deportivos</p>', 'Sports shoes', 'Zapatos deportivos', '10.00', '3000.00', '12.00', '45.00', 0, 'Deportivos', 'Adidas', '2016', 0, 1, 1, 200, 0),
(33, 17, 7, 'zapatos-de-vestir', 'Zapatos de vestir', 'Zapatos de vestir', '000-10', '<p>Zapatos de vestir</p>', '<p>Zapatos de vestir</p>', 'Zapatos de vestir', 'Zapatos de vestir', '50.00', '30000.00', '25.00', '100.00', 0, 'vestir', 'puma', '2016', 0, 1, 0, 200, 0),
(34, 17, 1, 'zapatos-de-prueba', 'Zapatos de prueba', 'Zapatos de prueba', '000-17', '<p>&nbsp;Zapatos de prueba</p>', '<p>&nbsp;Zapatos de prueba</p>', 'Zapatos de prueba', 'Zapatos de prueba', '58.00', '52000.00', '15.00', '70.00', 0, 'Deportivos', 'puma', '2016', 0, 1, 0, 200, 37);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `im_productos_categoria`
--

CREATE TABLE `im_productos_categoria` (
  `id` int(11) NOT NULL,
  `idpadre` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `nombre_espanol` varchar(255) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `descripcion_espanol` text NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0=activa; 1=inactiva'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `im_productos_categoria`
--

INSERT INTO `im_productos_categoria` (`id`, `idpadre`, `nombre`, `nombre_espanol`, `tags`, `descripcion`, `descripcion_espanol`, `imagen`, `status`) VALUES
(17, 0, 'MEN', 'Hombre', 'men', 'Men', 'Descripcion Hombre', '', 0),
(18, 0, 'WOMEN', 'Mujer', 'women', 'Women', 'Descripcion Mujer', '', 0),
(19, 0, 'HOME', 'Hogar', 'home', 'Home', 'Descripcion Hogar', '', 0),
(21, 17, 'Sports', 'Deportes', 'sports', 'sports', 'Descripcion  Deportes', '', 0),
(22, 21, 'Sports Nieto', 'Sports Nieto', 'sports-nieto', 'Sports Nieto', 'Descripcion Sports Nieto', '', 0),
(23, 21, 'Sports Nieto 2', 'Sports Nieto 2', 'sports-nieto-2', 'Sports Nieto 2', 'Descripcion  Sports Nieto 2', '', 0),
(24, 23, 'Sports Nieto 2.1', 'Sports Nieto 2.1', 'sports-Nieto-2.1', 'Sports Nieto 2.1', 'Descripcion  Sports Nieto 2.1', '', 0),
(25, 23, 'Sports Nieto 2.2', 'Sports Nieto 2.2', 'sports-nieto-2.2', 'Sports Nieto 2.2', ' Descripcion Sports Nieto 2.2', '', 0),
(26, 22, 'Sports Nieto 2.3', 'Sports Nieto 2.3', 'sports-nieto-2.3', 'Sports Nieto 2.3', 'Descripcion Sports Nieto 2.3', '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `im_productos_colecciones`
--

CREATE TABLE `im_productos_colecciones` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `nombre_espanol` varchar(255) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `descripcion_espanol` text NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0=activa; 1=inactiva'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `im_productos_colecciones`
--

INSERT INTO `im_productos_colecciones` (`id`, `nombre`, `nombre_espanol`, `tags`, `descripcion`, `descripcion_espanol`, `imagen`, `status`) VALUES
(1, 'Classic', 'Casico', 'classic', 'Classic', 'Casico', '92d4415205393e353c2f625cd463dd21.jpg', 0),
(2, 'Cute', 'Linda', 'cute', 'Cute', 'Linda', '028fdf001d3f0f83bf4463f179241975.jpg', 0),
(3, 'Devout', 'Devoto', 'devout', 'Devout', 'Devoto', '6f72dc1e18072b7c07a6690f88c9e73b.jpg', 0),
(4, 'Keys', 'Llaves', 'keys', 'Keys', 'Llaves', '002f9522afb54213df7be2b9f4e8a911.jpg', 0),
(5, 'Nature', 'Naturaleza', 'nature', 'Nature', 'Naturaleza', 'cb868fb00d32f993955bb6b806167c63.jpg', 0),
(6, 'Peace, Love & Luck', 'Paz, Amor y Suerte', 'peace-love-luck', 'Peace, Love & Luck', 'Paz, Amor y Suerte', 'b2b3b580eb61994f7325f13b05046d67.jpg', 0),
(7, 'Pearl', 'Perla', 'pearl', 'Pearl', 'Perla', 'd15c1446a28d5c2ad71d3bd20e2f4fe8.jpg', 0),
(8, 'The Edge', 'El Borde', 'the-edge', 'The Edge', 'El Borde', '8bd64b950c87fa1005edac2e33ad6590.jpg', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `im_productos_galeria`
--

CREATE TABLE `im_productos_galeria` (
  `id` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `tipo` int(11) NOT NULL COMMENT '0=img; 1=video',
  `principal` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `archivo` varchar(255) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `status` int(11) NOT NULL COMMENT '0=activa; 1=inactiva'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `im_productos_galeria`
--

INSERT INTO `im_productos_galeria` (`id`, `idproducto`, `tipo`, `principal`, `url`, `archivo`, `titulo`, `descripcion`, `status`) VALUES
(1, 1, 0, 1, '', 'fc9b344e949f86fe2524b4478c469935.jpg', '', '', 0),
(2, 2, 0, 1, '', 'd0dc74c3d101a4ff72a3a69d5da74c5d.jpg', '', '', 0),
(3, 3, 0, 1, '', '3bb82622b07b7a5c7b96886c6767f7a3.jpg', '', '', 0),
(4, 4, 0, 1, '', '9474664d52a82a0e9954385c68c8a4dc.jpg', '', '', 0),
(5, 5, 0, 1, '', '3b737b844d4d46df9257fb7291d68901.jpg', '', '', 0),
(6, 5, 0, 0, '', '8e12be45e6769f6388cb1e4629c7ee59.jpg', '', '', 0),
(7, 6, 0, 1, '', '1f61ca1d7e55563aa335f23716ae0131.jpg', '', '', 0),
(8, 7, 0, 1, '', 'cc9bf944cd85dcd9af4f971ef6b732bf.jpg', '', '', 0),
(9, 7, 0, 0, '', 'd17c8e72952064ec5e4a5c6cd3d150f0.jpg', '', '', 0),
(10, 8, 0, 1, '', '033a56a321c93c409f6680da2f0ec8e9.jpg', '', '', 0),
(11, 9, 0, 1, '', '6a0a173f5940b61e70acb6e9e94dd232.jpg', '', '', 0),
(12, 10, 0, 1, '', '8539c46df63cb070bdda7bceb766d473.jpg', '', '', 0),
(13, 10, 0, 0, '', '98b5a511d201b1ad8e0aacb0c862d5ac.jpg', '', '', 0),
(14, 11, 0, 1, '', '363f60b40cca0e90bcf007a5f756897d.jpg', '', '', 0),
(15, 11, 0, 0, '', 'c826fec81e95f04c84f6536c8f16ddfb.jpg', '', '', 0),
(16, 12, 0, 1, '', 'db9a2f299c208b13946fc1ad9391a5be.jpg', '', '', 0),
(17, 12, 0, 0, '', '2e24d206fc8bee6e2608fb9dfbd3c9f8.jpg', '', '', 0),
(18, 13, 0, 1, '', 'a4b16a5421c1ea58df8b12c705b1e715.jpg', '', '', 0),
(19, 13, 0, 0, '', '02a634ec413b7cfc3ce9fcc9a5af0c0b.jpg', '', '', 0),
(20, 14, 0, 1, '', '8162329d3a36ca35526f1df96e2fb567.jpg', '', '', 0),
(21, 14, 0, 0, '', 'c2b32efde35fed639da6e5a69faeb790.jpg', '', '', 0),
(22, 15, 0, 1, '', 'c29e3b1e8478824d6edeb882591fb83d.jpg', '', '', 0),
(23, 15, 0, 0, '', '2315d7126553e6175b6cd5145bf63a2e.jpg', '', '', 0),
(24, 16, 0, 1, '', '904234880c7be858b632276421104255.jpg', '', '', 0),
(25, 17, 0, 1, '', 'a548d5d4110ce7cae94dc23c04da7ce4.jpg', '', '', 0),
(26, 17, 0, 0, '', '71397a646314719409c953b4d4f6be8b.jpg', '', '', 0),
(27, 18, 0, 1, '', '18cc2c496546f7553e244fb0bff19106.jpg', '', '', 0),
(28, 18, 0, 0, '', 'c392595376b00b912296746ccf7f6cf9.jpg', '', '', 0),
(29, 19, 0, 1, '', '49d42bbcb4efb41957a13ca0fab9683c.jpg', '', '', 0),
(30, 19, 0, 0, '', 'ea7921aa4c9b2134d5545905eba810ca.jpg', '', '', 0),
(31, 20, 0, 1, '', '0e8e530a23c8d77facf99e26c29ae491.jpg', '', '', 0),
(32, 20, 0, 0, '', 'ae0cc5ac9ac55779c8255b360bbde9a7.jpg', '', '', 0),
(33, 22, 0, 0, '', '61eb9440b91316bcad73aa9666ed2f50.jpg', '', '', 0),
(34, 22, 0, 0, '', '19cddaba503bb492f1c652845e40bec3.jpg', '', '', 0),
(35, 22, 0, 0, '', 'c7548633adc77891ff2b0dcb7eac1698.jpg', '', '', 0),
(36, 22, 0, 0, '', '73fb4ff8b03e69e4e0ed73ccbfc5acfa.JPG', '', '', 0),
(37, 22, 0, 0, '', 'f6760fb1f623ebca889ea6e2bab5b6ae.jpg', '', '', 0),
(38, 22, 0, 0, '', 'c71a4e4a683fae8e3e2421511d262148.jpg', '', '', 0),
(39, 22, 0, 0, '', 'dbef0ac51e404eaa966e6f20de854533.jpg', '', '', 0),
(40, 22, 0, 0, '', 'a88ca448cb2a1b2a7a8c2a02ff748348.JPG', '', '', 0),
(41, 22, 0, 0, '', '43fe7a2ffaeed6e6dd708f19aeea6d96.jpg', '', '', 0),
(42, 22, 0, 0, '', 'f9e60d681340eef43e550b546ca13186.JPG', '', '', 0),
(43, 22, 0, 0, '', '3d23b2864ee092aa9a982d6bf05ff5dc.JPG', '', '', 0),
(44, 22, 0, 1, '', '3e7626fa443f8b8f8e1a73cca1620201.jpg', '', '', 0),
(45, 22, 0, 0, '', 'dff1c5a38390a541bbda06f6cf5ca63f.jpg', '', '', 0),
(46, 23, 0, 1, '', '751d713a95a09d78f4e729638507d227.JPG', '', '', 0),
(47, 23, 0, 0, '', '27bab8754acdb8b5be9a8402a2b0a5f0.jpg', '', '', 0),
(48, 23, 0, 0, '', '482a75ed0602a608f646f5026358bf63.jpg', '', '', 0),
(49, 23, 0, 0, '', 'c64c119bc74987f778b803e6c16af017.jpg', '', '', 0),
(50, 23, 0, 0, '', '475e50f7a8627e736c8033ca2bce9e1e.jpg', '', '', 0),
(51, 23, 0, 0, '', '378243e372c82a8e3d37dd8da910b39f.jpg', '', '', 0),
(52, 23, 0, 0, '', '3c51a8b749a0266ce40766e7f5df8879.jpg', '', '', 0),
(53, 23, 0, 0, '', '87e4dab2313e38e1fc226deca2b47e37.jpg', '', '', 0),
(54, 23, 0, 0, '', '037f18bdba063e43cf97d12a06cbb4ac.jpg', '', '', 0),
(55, 23, 0, 0, '', '003bfb467c5152af52c6629b480d3c41.jpg', '', '', 0),
(56, 23, 0, 0, '', 'e0c37d68205f4a83e21c000d2b8eee93.jpg', '', '', 0),
(57, 23, 0, 0, '', '4a12ced9eb921c8fa0ff0fbbdb6db3c4.jpg', '', '', 0),
(58, 24, 0, 1, '', '601d2a5f5d3fc70c1c5cda75b3e0fa0e.jpg', '', '', 0),
(59, 25, 0, 0, '', 'cadbbf47d344a445365537f5147d0881.jpg', '', '', 0),
(60, 25, 0, 1, '', 'c3f4c34458caae1b38fadf821ae00e65.jpg', '', '', 0),
(61, 25, 0, 0, '', '2915bba8b7f640a5fd0906c6cabb593d.jpg', '', '', 0),
(62, 25, 0, 0, '', '268d5cfbb9ad1585a32741c079e2f3cf.jpg', '', '', 0),
(63, 25, 0, 0, '', 'b95587ceb4fa7aa5223de663595c560a.jpg', '', '', 0),
(64, 25, 0, 0, '', '0be671d9e824adfdc54ab650b409ec0b.jpg', '', '', 0),
(65, 25, 0, 0, '', '366e1276467aaf9ebea683d290ea4bae.jpg', '', '', 0),
(66, 25, 0, 0, '', 'e00200e38eafbec0ee3df479e4cc2a0e.jpg', '', '', 0),
(67, 25, 0, 0, '', '0716fa05779fdc38379408a31b8fd95c.jpg', '', '', 0),
(68, 25, 0, 0, '', 'dc5560bb1f80188e129468043217c42f.jpg', '', '', 0),
(69, 26, 0, 1, '', 'ed8255a868a8775596d89351a41fa24d.jpg', '', '', 0),
(70, 27, 0, 1, '', 'c47dd2f06225d4ddc25588d542c41c09.jpg', '', '', 0),
(71, 33, 0, 1, '', '8374617dafe7db66572c79311a115f37.jpg', '', '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `im_publicidad`
--

CREATE TABLE `im_publicidad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `url` text NOT NULL,
  `nombre_cliente` varchar(255) NOT NULL,
  `telefono_cliente` varchar(255) NOT NULL,
  `archivo` varchar(255) NOT NULL,
  `tipo` int(11) NOT NULL COMMENT '0 = imagen; 1=flash',
  `posicion` int(11) NOT NULL COMMENT '0=centro; 1=izquierda; 2=derecha',
  `cantidad_impresiones` int(11) NOT NULL DEFAULT '0',
  `cantidad_clic` int(11) NOT NULL DEFAULT '0',
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `secciones` int(11) NOT NULL COMMENT '0 = todas; 1=home, 2=internas',
  `json_secciones` text NOT NULL,
  `status` int(11) NOT NULL,
  `impresiones` int(11) NOT NULL,
  `clic` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `im_publicidad`
--

INSERT INTO `im_publicidad` (`id`, `nombre`, `descripcion`, `url`, `nombre_cliente`, `telefono_cliente`, `archivo`, `tipo`, `posicion`, `cantidad_impresiones`, `cantidad_clic`, `fecha_inicio`, `fecha_fin`, `secciones`, `json_secciones`, `status`, `impresiones`, `clic`) VALUES
(16, 'Banner Sporthouse', 'Banner Principal de Sporthouse ', '', 'Sporthouse', '', '7aa7b7a36116cb2c143568ce271cf965.png', 0, 0, 0, 0, '2017-01-20', '0000-00-00', 1, '', 0, 29, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `im_publicidad_clic`
--

CREATE TABLE `im_publicidad_clic` (
  `id` int(11) NOT NULL,
  `idpublicidad` int(11) NOT NULL,
  `pais` varchar(255) NOT NULL,
  `anio` varchar(4) NOT NULL,
  `mes` varchar(2) NOT NULL,
  `dia` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `im_publicidad_clic`
--

INSERT INTO `im_publicidad_clic` (`id`, `idpublicidad`, `pais`, `anio`, `mes`, `dia`) VALUES
(1, 7, 'Venezuela', '2015', '06', ''),
(2, 7, 'Estados Unidos', '2015', '05', ''),
(3, 7, 'Venezuela', '2015', '06', ''),
(4, 7, 'Venezuela', '2015', '06', ''),
(5, 9, 'Reserved', '2015', '06', '10'),
(6, 11, 'Reserved', '2015', '06', '10'),
(7, 11, 'Reserved', '2015', '06', '10'),
(8, 15, '', '2016', '07', '25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `im_publicidad_impresiones`
--

CREATE TABLE `im_publicidad_impresiones` (
  `id` int(11) NOT NULL,
  `idpublicidad` int(11) NOT NULL,
  `pais` varchar(255) NOT NULL,
  `anio` varchar(4) NOT NULL,
  `mes` varchar(2) NOT NULL,
  `dia` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `im_publicidad_impresiones`
--

INSERT INTO `im_publicidad_impresiones` (`id`, `idpublicidad`, `pais`, `anio`, `mes`, `dia`) VALUES
(1, 7, 'Venezuela', '2015', '06', ''),
(2, 7, 'Estados Unidos', '2015', '05', ''),
(3, 7, 'Venezuela', '2015', '06', ''),
(4, 7, 'Venezuela', '2015', '06', ''),
(5, 9, 'Reserved', '2015', '06', '10'),
(6, 10, 'Reserved', '2015', '06', '10'),
(7, 9, 'Reserved', '2015', '06', '10'),
(8, 9, 'Reserved', '2015', '06', '10'),
(9, 9, 'Reserved', '2015', '06', '10'),
(10, 9, 'Reserved', '2015', '06', '10'),
(11, 9, 'Reserved', '2015', '06', '10'),
(12, 9, 'Reserved', '2015', '06', '10'),
(13, 9, 'Reserved', '2015', '06', '10'),
(14, 9, 'Reserved', '2015', '06', '10'),
(15, 9, 'Reserved', '2015', '06', '10'),
(16, 9, 'Reserved', '2015', '06', '10'),
(17, 9, 'Reserved', '2015', '06', '10'),
(18, 9, 'Reserved', '2015', '06', '10'),
(19, 9, 'Reserved', '2015', '06', '10'),
(20, 9, 'Reserved', '2015', '06', '10'),
(21, 9, 'Reserved', '2015', '06', '10'),
(22, 9, 'Reserved', '2015', '06', '10'),
(23, 9, 'Reserved', '2015', '06', '10'),
(24, 9, 'Reserved', '2015', '06', '10'),
(25, 9, 'Reserved', '2015', '06', '10'),
(26, 10, 'Reserved', '2015', '06', '10'),
(27, 9, 'Reserved', '2015', '06', '10'),
(28, 9, 'Reserved', '2015', '06', '10'),
(29, 10, 'Reserved', '2015', '06', '10'),
(30, 9, 'Reserved', '2015', '06', '10'),
(31, 9, 'Reserved', '2015', '06', '10'),
(32, 10, 'Reserved', '2015', '06', '10'),
(33, 9, 'Reserved', '2015', '06', '10'),
(34, 9, 'Reserved', '2015', '06', '10'),
(35, 11, 'Reserved', '2015', '06', '10'),
(36, 9, 'Reserved', '2015', '06', '10'),
(37, 9, 'Reserved', '2015', '06', '10'),
(38, 10, 'Reserved', '2015', '06', '10'),
(39, 11, 'Reserved', '2015', '06', '10'),
(40, 9, 'Reserved', '2015', '06', '10'),
(41, 9, 'Reserved', '2015', '06', '10'),
(42, 11, 'Reserved', '2015', '06', '10'),
(43, 10, 'Reserved', '2015', '06', '10'),
(44, 9, 'Reserved', '2015', '06', '10'),
(45, 9, 'Reserved', '2015', '06', '10'),
(46, 10, 'Reserved', '2015', '06', '10'),
(47, 11, 'Reserved', '2015', '06', '10'),
(48, 9, 'Reserved', '2015', '06', '10'),
(49, 9, 'Reserved', '2015', '06', '10'),
(50, 10, 'Reserved', '2015', '06', '10'),
(51, 11, 'Reserved', '2015', '06', '10'),
(52, 9, 'Reserved', '2015', '06', '10'),
(53, 9, 'Reserved', '2015', '06', '10'),
(54, 10, 'Reserved', '2015', '06', '10'),
(55, 10, 'Reserved', '2015', '06', '10'),
(56, 9, 'Reserved', '2015', '06', '10'),
(57, 9, 'Reserved', '2015', '06', '10'),
(58, 10, 'Reserved', '2015', '06', '10'),
(59, 11, 'Reserved', '2015', '06', '10'),
(60, 9, 'Reserved', '2015', '06', '10'),
(61, 9, 'Reserved', '2015', '06', '10'),
(62, 11, 'Reserved', '2015', '06', '10'),
(63, 10, 'Reserved', '2015', '06', '10'),
(64, 9, 'Reserved', '2015', '06', '10'),
(65, 9, 'Reserved', '2015', '06', '10'),
(66, 10, 'Reserved', '2015', '06', '10'),
(67, 10, 'Reserved', '2015', '06', '10'),
(68, 9, 'Reserved', '2015', '06', '10'),
(69, 9, 'Reserved', '2015', '06', '10'),
(70, 11, 'Reserved', '2015', '06', '10'),
(71, 11, 'Reserved', '2015', '06', '10'),
(72, 9, 'Reserved', '2015', '06', '10'),
(73, 9, 'Reserved', '2015', '06', '10'),
(74, 11, 'Reserved', '2015', '06', '10'),
(75, 11, 'Reserved', '2015', '06', '10'),
(76, 9, 'Reserved', '2015', '06', '10'),
(77, 9, 'Reserved', '2015', '06', '10'),
(78, 11, 'Reserved', '2015', '06', '10'),
(79, 11, 'Reserved', '2015', '06', '10'),
(80, 9, 'Reserved', '2015', '06', '10'),
(81, 9, 'Reserved', '2015', '06', '10'),
(82, 11, 'Reserved', '2015', '06', '10'),
(83, 11, 'Reserved', '2015', '06', '10'),
(84, 9, 'Reserved', '2015', '06', '10'),
(85, 9, 'Reserved', '2015', '06', '10'),
(86, 10, 'Reserved', '2015', '06', '10'),
(87, 11, 'Reserved', '2015', '06', '10'),
(88, 9, 'Reserved', '2015', '06', '10'),
(89, 9, 'Reserved', '2015', '06', '10'),
(90, 10, 'Reserved', '2015', '06', '10'),
(91, 11, 'Reserved', '2015', '06', '10'),
(92, 9, 'Reserved', '2015', '06', '10'),
(93, 11, 'Reserved', '2015', '06', '10'),
(94, 11, 'Reserved', '2015', '06', '10'),
(95, 9, 'Reserved', '2015', '06', '10'),
(96, 9, 'Reserved', '2015', '06', '10'),
(97, 10, 'Reserved', '2015', '06', '10'),
(98, 11, 'Reserved', '2015', '06', '10'),
(99, 9, 'Reserved', '2015', '06', '10'),
(100, 9, 'Reserved', '2015', '06', '10'),
(101, 10, 'Reserved', '2015', '06', '10'),
(102, 10, 'Reserved', '2015', '06', '10'),
(103, 9, 'Reserved', '2015', '06', '10'),
(104, 9, 'Reserved', '2015', '06', '10'),
(105, 11, 'Reserved', '2015', '06', '10'),
(106, 10, 'Reserved', '2015', '06', '10'),
(107, 9, 'Reserved', '2015', '06', '10'),
(108, 10, 'Reserved', '2015', '06', '10'),
(109, 11, 'Reserved', '2015', '06', '10'),
(110, 9, 'Reserved', '2015', '06', '10'),
(111, 10, 'Reserved', '2015', '06', '10'),
(112, 10, 'Reserved', '2015', '06', '10'),
(113, 9, 'Reserved', '2015', '06', '10'),
(114, 11, 'Reserved', '2015', '06', '10'),
(115, 10, 'Reserved', '2015', '06', '10'),
(116, 9, 'Reserved', '2015', '06', '10'),
(117, 10, 'Reserved', '2015', '06', '10'),
(118, 10, 'Reserved', '2015', '06', '10'),
(119, 9, 'Reserved', '2015', '06', '10'),
(120, 9, 'Reserved', '2015', '06', '10'),
(121, 11, 'Reserved', '2015', '06', '10'),
(122, 11, 'Reserved', '2015', '06', '10'),
(123, 9, 'Reserved', '2015', '06', '10'),
(124, 11, 'Reserved', '2015', '06', '10'),
(125, 11, 'Reserved', '2015', '06', '10'),
(126, 9, 'Reserved', '2015', '06', '10'),
(127, 11, 'Reserved', '2015', '06', '10'),
(128, 10, 'Reserved', '2015', '06', '10'),
(129, 9, 'Reserved', '2015', '06', '10'),
(130, 11, 'Reserved', '2015', '06', '10'),
(131, 11, 'Reserved', '2015', '06', '10'),
(132, 9, 'Reserved', '2015', '06', '10'),
(133, 11, 'Reserved', '2015', '06', '10'),
(134, 11, 'Reserved', '2015', '06', '10'),
(135, 9, 'Reserved', '2015', '06', '10'),
(136, 10, 'Reserved', '2015', '06', '10'),
(137, 11, 'Reserved', '2015', '06', '10'),
(138, 9, 'Reserved', '2015', '06', '10'),
(139, 9, 'Reserved', '2015', '06', '10'),
(140, 11, 'Reserved', '2015', '06', '10'),
(141, 10, 'Reserved', '2015', '06', '10'),
(142, 9, 'Reserved', '2015', '06', '10'),
(143, 11, 'Reserved', '2015', '06', '10'),
(144, 10, 'Reserved', '2015', '06', '10'),
(145, 9, 'Reserved', '2015', '06', '10'),
(146, 10, 'Reserved', '2015', '06', '10'),
(147, 11, 'Reserved', '2015', '06', '10'),
(148, 9, 'Reserved', '2015', '06', '10'),
(149, 11, 'Reserved', '2015', '06', '10'),
(150, 10, 'Reserved', '2015', '06', '10'),
(151, 9, 'Reserved', '2015', '06', '10'),
(152, 11, 'Reserved', '2015', '06', '10'),
(153, 11, 'Reserved', '2015', '06', '10'),
(154, 9, 'Reserved', '2015', '06', '10'),
(155, 11, 'Reserved', '2015', '06', '10'),
(156, 10, 'Reserved', '2015', '06', '10'),
(157, 9, 'Reserved', '2015', '06', '10'),
(158, 10, 'Reserved', '2015', '06', '10'),
(159, 10, 'Reserved', '2015', '06', '10'),
(160, 9, 'Reserved', '2015', '06', '10'),
(161, 11, 'Reserved', '2015', '06', '10'),
(162, 10, 'Reserved', '2015', '06', '10'),
(163, 9, 'Reserved', '2015', '06', '10'),
(164, 10, 'Reserved', '2015', '06', '10'),
(165, 11, 'Reserved', '2015', '06', '10'),
(166, 9, 'Reserved', '2015', '06', '10'),
(167, 11, 'Reserved', '2015', '06', '10'),
(168, 10, 'Reserved', '2015', '06', '10'),
(169, 9, 'Reserved', '2015', '06', '10'),
(170, 10, 'Reserved', '2015', '06', '10'),
(171, 10, 'Reserved', '2015', '06', '10'),
(172, 9, 'Reserved', '2015', '06', '10'),
(173, 11, 'Reserved', '2015', '06', '10'),
(174, 10, 'Reserved', '2015', '06', '10'),
(175, 9, 'Reserved', '2015', '06', '10'),
(176, 10, 'Reserved', '2015', '06', '10'),
(177, 11, 'Reserved', '2015', '06', '10'),
(178, 9, 'Reserved', '2015', '06', '10'),
(179, 10, 'Reserved', '2015', '06', '10'),
(180, 10, 'Reserved', '2015', '06', '10'),
(181, 9, 'Reserved', '2015', '06', '10'),
(182, 11, 'Reserved', '2015', '06', '10'),
(183, 11, 'Reserved', '2015', '06', '10'),
(184, 9, 'Reserved', '2015', '06', '10'),
(185, 11, 'Reserved', '2015', '06', '10'),
(186, 11, 'Reserved', '2015', '06', '10'),
(187, 9, 'Reserved', '2015', '06', '10'),
(188, 11, 'Reserved', '2015', '06', '10'),
(189, 10, 'Reserved', '2015', '06', '10'),
(190, 9, 'Reserved', '2015', '06', '10'),
(191, 10, 'Reserved', '2015', '06', '10'),
(192, 11, 'Reserved', '2015', '06', '10'),
(193, 9, 'Reserved', '2015', '06', '10'),
(194, 11, 'Reserved', '2015', '06', '10'),
(195, 11, 'Reserved', '2015', '06', '10'),
(196, 9, 'Reserved', '2015', '06', '10'),
(197, 10, 'Reserved', '2015', '06', '10'),
(198, 11, 'Reserved', '2015', '06', '10'),
(199, 9, 'Reserved', '2015', '06', '10'),
(200, 11, 'Reserved', '2015', '06', '10'),
(201, 11, 'Reserved', '2015', '06', '10'),
(202, 9, 'Reserved', '2015', '06', '10'),
(203, 10, 'Reserved', '2015', '06', '10'),
(204, 11, 'Reserved', '2015', '06', '10'),
(205, 9, 'Reserved', '2015', '06', '10'),
(206, 11, 'Reserved', '2015', '06', '10'),
(207, 11, 'Reserved', '2015', '06', '10'),
(208, 9, 'Reserved', '2015', '06', '10'),
(209, 11, 'Reserved', '2015', '06', '10'),
(210, 10, 'Reserved', '2015', '06', '10'),
(211, 9, 'Reserved', '2015', '06', '10'),
(212, 11, 'Reserved', '2015', '06', '10'),
(213, 10, 'Reserved', '2015', '06', '10'),
(214, 9, 'Reserved', '2015', '06', '10'),
(215, 10, 'Reserved', '2015', '06', '10'),
(216, 11, 'Reserved', '2015', '06', '10'),
(217, 9, 'Reserved', '2015', '06', '10'),
(218, 11, 'Reserved', '2015', '06', '10'),
(219, 10, 'Reserved', '2015', '06', '10'),
(220, 9, 'Reserved', '2015', '06', '10'),
(221, 11, 'Reserved', '2015', '06', '10'),
(222, 10, 'Reserved', '2015', '06', '10'),
(223, 9, 'Reserved', '2015', '06', '10'),
(224, 10, 'Reserved', '2015', '06', '10'),
(225, 11, 'Reserved', '2015', '06', '10'),
(226, 9, 'Reserved', '2015', '06', '10'),
(227, 10, 'Reserved', '2015', '06', '10'),
(228, 11, 'Reserved', '2015', '06', '10'),
(229, 9, 'Reserved', '2015', '06', '10'),
(230, 11, 'Reserved', '2015', '06', '10'),
(231, 11, 'Reserved', '2015', '06', '10'),
(232, 9, 'Reserved', '2015', '06', '10'),
(233, 11, 'Reserved', '2015', '06', '10'),
(234, 10, 'Reserved', '2015', '06', '10'),
(235, 9, 'Reserved', '2015', '06', '10'),
(236, 10, 'Reserved', '2015', '06', '10'),
(237, 11, 'Reserved', '2015', '06', '10'),
(238, 9, 'Reserved', '2015', '06', '10'),
(239, 10, 'Reserved', '2015', '06', '10'),
(240, 11, 'Reserved', '2015', '06', '10'),
(241, 9, 'Reserved', '2015', '06', '10'),
(242, 11, 'Reserved', '2015', '06', '10'),
(243, 11, 'Reserved', '2015', '06', '10'),
(244, 9, 'Reserved', '2015', '06', '10'),
(245, 10, 'Reserved', '2015', '06', '10'),
(246, 10, 'Reserved', '2015', '06', '10'),
(247, 9, 'Reserved', '2015', '06', '10'),
(248, 10, 'Reserved', '2015', '06', '10'),
(249, 11, 'Reserved', '2015', '06', '10'),
(250, 9, 'Reserved', '2015', '06', '10'),
(251, 11, 'Reserved', '2015', '06', '10'),
(252, 10, 'Reserved', '2015', '06', '10'),
(253, 9, 'Reserved', '2015', '06', '10'),
(254, 10, 'Reserved', '2015', '06', '10'),
(255, 11, 'Reserved', '2015', '06', '10'),
(256, 9, 'Reserved', '2015', '06', '10'),
(257, 10, 'Reserved', '2015', '06', '10'),
(258, 11, 'Reserved', '2015', '06', '10'),
(259, 9, 'Reserved', '2015', '06', '10'),
(260, 11, 'Reserved', '2015', '06', '10'),
(261, 11, 'Reserved', '2015', '06', '10'),
(262, 9, 'Reserved', '2015', '06', '10'),
(263, 11, 'Reserved', '2015', '06', '10'),
(264, 10, 'Reserved', '2015', '06', '10'),
(265, 9, 'Reserved', '2015', '06', '10'),
(266, 11, 'Reserved', '2015', '06', '10'),
(267, 10, 'Reserved', '2015', '06', '10'),
(268, 9, 'Reserved', '2015', '06', '10'),
(269, 10, 'Reserved', '2015', '06', '10'),
(270, 11, 'Reserved', '2015', '06', '10'),
(271, 9, 'Reserved', '2015', '06', '10'),
(272, 10, 'Reserved', '2015', '06', '10'),
(273, 10, 'Reserved', '2015', '06', '10'),
(274, 9, 'Reserved', '2015', '06', '10'),
(275, 11, 'Reserved', '2015', '06', '10'),
(276, 11, 'Reserved', '2015', '06', '10'),
(277, 9, 'Reserved', '2015', '06', '10'),
(278, 11, 'Reserved', '2015', '06', '10'),
(279, 10, 'Reserved', '2015', '06', '10'),
(280, 9, 'Reserved', '2015', '06', '10'),
(281, 10, 'Reserved', '2015', '06', '10'),
(282, 11, 'Reserved', '2015', '06', '10'),
(283, 9, 'Reserved', '2015', '06', '10'),
(284, 10, 'Reserved', '2015', '06', '10'),
(285, 10, 'Reserved', '2015', '06', '10'),
(286, 9, 'Reserved', '2015', '06', '10'),
(287, 10, 'Reserved', '2015', '06', '10'),
(288, 10, 'Reserved', '2015', '06', '10'),
(289, 9, 'Reserved', '2015', '06', '10'),
(290, 11, 'Reserved', '2015', '06', '10'),
(291, 10, 'Reserved', '2015', '06', '10'),
(292, 9, 'Reserved', '2015', '06', '10'),
(293, 10, 'Reserved', '2015', '06', '10'),
(294, 11, 'Reserved', '2015', '06', '10'),
(295, 9, 'Reserved', '2015', '06', '10'),
(296, 10, 'Reserved', '2015', '06', '10'),
(297, 11, 'Reserved', '2015', '06', '10'),
(298, 9, 'Reserved', '2015', '06', '10'),
(299, 10, 'Reserved', '2015', '06', '10'),
(300, 10, 'Reserved', '2015', '06', '10'),
(301, 9, 'Reserved', '2015', '06', '10'),
(302, 11, 'Reserved', '2015', '06', '10'),
(303, 10, 'Reserved', '2015', '06', '10'),
(304, 9, 'Reserved', '2015', '06', '10'),
(305, 11, 'Reserved', '2015', '06', '10'),
(306, 10, 'Reserved', '2015', '06', '10'),
(307, 9, 'Reserved', '2015', '06', '10'),
(308, 10, 'Reserved', '2015', '06', '10'),
(309, 11, 'Reserved', '2015', '06', '10'),
(310, 9, 'Reserved', '2015', '06', '10'),
(311, 11, 'Reserved', '2015', '06', '10'),
(312, 10, 'Reserved', '2015', '06', '10'),
(313, 9, 'Reserved', '2015', '06', '10'),
(314, 11, 'Reserved', '2015', '06', '10'),
(315, 10, 'Reserved', '2015', '06', '10'),
(316, 9, 'Reserved', '2015', '06', '10'),
(317, 11, 'Reserved', '2015', '06', '10'),
(318, 11, 'Reserved', '2015', '06', '10'),
(319, 9, 'Reserved', '2015', '06', '10'),
(320, 11, 'Reserved', '2015', '06', '10'),
(321, 10, 'Reserved', '2015', '06', '10'),
(322, 9, 'Reserved', '2015', '06', '10'),
(323, 11, 'Reserved', '2015', '06', '10'),
(324, 11, 'Reserved', '2015', '06', '10'),
(325, 9, 'Reserved', '2015', '06', '10'),
(326, 10, 'Reserved', '2015', '06', '10'),
(327, 11, 'Reserved', '2015', '06', '10'),
(328, 9, 'Reserved', '2015', '06', '10'),
(329, 10, 'Reserved', '2015', '06', '10'),
(330, 11, 'Reserved', '2015', '06', '10'),
(331, 9, 'Reserved', '2015', '06', '10'),
(332, 11, 'Reserved', '2015', '06', '10'),
(333, 11, 'Reserved', '2015', '06', '10'),
(334, 9, 'Reserved', '2015', '06', '10'),
(335, 11, 'Reserved', '2015', '06', '10'),
(336, 10, 'Reserved', '2015', '06', '10'),
(337, 9, 'Reserved', '2015', '06', '10'),
(338, 11, 'Reserved', '2015', '06', '10'),
(339, 10, 'Reserved', '2015', '06', '10'),
(340, 9, 'Reserved', '2015', '06', '10'),
(341, 10, 'Reserved', '2015', '06', '10'),
(342, 10, 'Reserved', '2015', '06', '10'),
(343, 9, 'Reserved', '2015', '06', '10'),
(344, 11, 'Reserved', '2015', '06', '10'),
(345, 11, 'Reserved', '2015', '06', '10'),
(346, 9, 'Reserved', '2015', '06', '10'),
(347, 11, 'Reserved', '2015', '06', '10'),
(348, 10, 'Reserved', '2015', '06', '10'),
(349, 9, 'Reserved', '2015', '06', '10'),
(350, 10, 'Reserved', '2015', '06', '10'),
(351, 11, 'Reserved', '2015', '06', '10'),
(352, 9, 'Reserved', '2015', '06', '10'),
(353, 10, 'Reserved', '2015', '06', '10'),
(354, 10, 'Reserved', '2015', '06', '10'),
(355, 9, 'Reserved', '2015', '06', '10'),
(356, 11, 'Reserved', '2015', '06', '10'),
(357, 10, 'Reserved', '2015', '06', '10'),
(358, 9, 'Reserved', '2015', '06', '10'),
(359, 10, 'Reserved', '2015', '06', '10'),
(360, 10, 'Reserved', '2015', '06', '10'),
(361, 9, 'Reserved', '2015', '06', '10'),
(362, 10, 'Reserved', '2015', '06', '10'),
(363, 10, 'Reserved', '2015', '06', '10'),
(364, 9, 'Reserved', '2015', '06', '10'),
(365, 10, 'Reserved', '2015', '06', '10'),
(366, 11, 'Reserved', '2015', '06', '10'),
(367, 9, 'Reserved', '2015', '06', '10'),
(368, 10, 'Reserved', '2015', '06', '10'),
(369, 10, 'Reserved', '2015', '06', '10'),
(370, 9, 'Reserved', '2015', '06', '10'),
(371, 11, 'Reserved', '2015', '06', '10'),
(372, 10, 'Reserved', '2015', '06', '10'),
(373, 9, 'Reserved', '2015', '06', '10'),
(374, 11, 'Reserved', '2015', '06', '10'),
(375, 10, 'Reserved', '2015', '06', '10'),
(376, 9, 'Reserved', '2015', '06', '10'),
(377, 10, 'Reserved', '2015', '06', '10'),
(378, 11, 'Reserved', '2015', '06', '10'),
(379, 9, 'Reserved', '2015', '06', '10'),
(380, 11, 'Reserved', '2015', '06', '10'),
(381, 10, 'Reserved', '2015', '06', '10'),
(382, 9, 'Reserved', '2015', '06', '10'),
(383, 11, 'Reserved', '2015', '06', '10'),
(384, 11, 'Reserved', '2015', '06', '10'),
(385, 9, 'Reserved', '2015', '06', '10'),
(386, 11, 'Reserved', '2015', '06', '10'),
(387, 10, 'Reserved', '2015', '06', '10'),
(388, 9, 'Reserved', '2015', '06', '10'),
(389, 10, 'Reserved', '2015', '06', '10'),
(390, 10, 'Reserved', '2015', '06', '10'),
(391, 9, 'Reserved', '2015', '06', '10'),
(392, 11, 'Reserved', '2015', '06', '10'),
(393, 11, 'Reserved', '2015', '06', '10'),
(394, 9, 'Reserved', '2015', '06', '10'),
(395, 10, 'Reserved', '2015', '06', '10'),
(396, 10, 'Reserved', '2015', '06', '10'),
(397, 9, 'Reserved', '2015', '06', '10'),
(398, 10, 'Reserved', '2015', '06', '10'),
(399, 10, 'Reserved', '2015', '06', '10'),
(400, 9, 'Reserved', '2015', '06', '10'),
(401, 11, 'Reserved', '2015', '06', '10'),
(402, 11, 'Reserved', '2015', '06', '10'),
(403, 9, 'Reserved', '2015', '06', '10'),
(404, 10, 'Reserved', '2015', '06', '10'),
(405, 11, 'Reserved', '2015', '06', '10'),
(406, 9, 'Reserved', '2015', '06', '10'),
(407, 11, 'Reserved', '2015', '06', '10'),
(408, 11, 'Reserved', '2015', '06', '10'),
(409, 9, 'Reserved', '2015', '06', '10'),
(410, 11, 'Reserved', '2015', '06', '10'),
(411, 11, 'Reserved', '2015', '06', '10'),
(412, 9, 'Reserved', '2015', '06', '10'),
(413, 11, 'Reserved', '2015', '06', '10'),
(414, 11, 'Reserved', '2015', '06', '10'),
(415, 9, 'Reserved', '2015', '06', '10'),
(416, 11, 'Reserved', '2015', '06', '10'),
(417, 10, 'Reserved', '2015', '06', '10'),
(418, 9, 'Reserved', '2015', '06', '10'),
(419, 11, 'Reserved', '2015', '06', '10'),
(420, 10, 'Reserved', '2015', '06', '10'),
(421, 9, 'Reserved', '2015', '06', '10'),
(422, 10, 'Reserved', '2015', '06', '10'),
(423, 10, 'Reserved', '2015', '06', '10'),
(424, 9, 'Reserved', '2015', '06', '10'),
(425, 10, 'Reserved', '2015', '06', '10'),
(426, 11, 'Reserved', '2015', '06', '10'),
(427, 9, 'Reserved', '2015', '06', '10'),
(428, 10, 'Reserved', '2015', '06', '10'),
(429, 10, 'Reserved', '2015', '06', '10'),
(430, 9, 'Reserved', '2015', '06', '10'),
(431, 10, 'Reserved', '2015', '06', '10'),
(432, 10, 'Reserved', '2015', '06', '10'),
(433, 9, 'Reserved', '2015', '06', '10'),
(434, 10, 'Reserved', '2015', '06', '10'),
(435, 10, 'Reserved', '2015', '06', '10'),
(436, 9, 'Reserved', '2015', '06', '10'),
(437, 10, 'Reserved', '2015', '06', '10'),
(438, 11, 'Reserved', '2015', '06', '10'),
(439, 9, 'Reserved', '2015', '06', '10'),
(440, 11, 'Reserved', '2015', '06', '10'),
(441, 10, 'Reserved', '2015', '06', '10'),
(442, 9, 'Reserved', '2015', '06', '10'),
(443, 11, 'Reserved', '2015', '06', '10'),
(444, 10, 'Reserved', '2015', '06', '10'),
(445, 9, 'Reserved', '2015', '06', '10'),
(446, 11, 'Reserved', '2015', '06', '10'),
(447, 11, 'Reserved', '2015', '06', '10'),
(448, 9, 'Reserved', '2015', '06', '10'),
(449, 10, 'Reserved', '2015', '06', '10'),
(450, 10, 'Reserved', '2015', '06', '10'),
(451, 9, 'Reserved', '2015', '06', '10'),
(452, 10, 'Reserved', '2015', '06', '10'),
(453, 10, 'Reserved', '2015', '06', '10'),
(454, 9, 'Reserved', '2015', '06', '10'),
(455, 11, 'Reserved', '2015', '06', '10'),
(456, 10, 'Reserved', '2015', '06', '10'),
(457, 9, 'Reserved', '2015', '06', '10'),
(458, 10, 'Reserved', '2015', '06', '10'),
(459, 11, 'Reserved', '2015', '06', '10'),
(460, 9, 'Reserved', '2015', '06', '10'),
(461, 11, 'Reserved', '2015', '06', '10'),
(462, 10, 'Reserved', '2015', '06', '10'),
(463, 9, 'Reserved', '2015', '06', '10'),
(464, 11, 'Reserved', '2015', '06', '10'),
(465, 11, 'Reserved', '2015', '06', '10'),
(466, 9, 'Reserved', '2015', '06', '10'),
(467, 10, 'Reserved', '2015', '06', '10'),
(468, 11, 'Reserved', '2015', '06', '10'),
(469, 9, 'Reserved', '2015', '06', '10'),
(470, 9, 'Reserved', '2015', '06', '10'),
(471, 10, 'Reserved', '2015', '06', '10'),
(472, 11, 'Reserved', '2015', '06', '10'),
(473, 9, 'Reserved', '2015', '06', '10'),
(474, 9, 'Reserved', '2015', '06', '10'),
(475, 11, 'Reserved', '2015', '06', '10'),
(476, 11, 'Reserved', '2015', '06', '10'),
(477, 9, 'Reserved', '2015', '06', '10'),
(478, 9, 'Reserved', '2015', '06', '10'),
(479, 10, 'Reserved', '2015', '06', '10'),
(480, 11, 'Reserved', '2015', '06', '10'),
(481, 9, 'Reserved', '2015', '06', '10'),
(482, 9, 'Reserved', '2015', '06', '10'),
(483, 10, 'Reserved', '2015', '06', '10'),
(484, 10, 'Reserved', '2015', '06', '10'),
(485, 9, 'Reserved', '2015', '06', '10'),
(486, 9, 'Reserved', '2015', '06', '10'),
(487, 10, 'Reserved', '2015', '06', '10'),
(488, 10, 'Reserved', '2015', '06', '10'),
(489, 9, 'Reserved', '2015', '06', '10'),
(490, 9, 'Reserved', '2015', '06', '10'),
(491, 11, 'Reserved', '2015', '06', '10'),
(492, 10, 'Reserved', '2015', '06', '10'),
(493, 9, 'Reserved', '2015', '06', '10'),
(494, 9, 'Reserved', '2015', '06', '10'),
(495, 11, 'Reserved', '2015', '06', '10'),
(496, 10, 'Reserved', '2015', '06', '10'),
(497, 9, 'Reserved', '2015', '06', '10'),
(498, 9, 'Reserved', '2015', '06', '10'),
(499, 11, 'Reserved', '2015', '06', '10'),
(500, 10, 'Reserved', '2015', '06', '10'),
(501, 9, 'Reserved', '2015', '06', '10'),
(502, 9, 'Reserved', '2015', '06', '10'),
(503, 11, 'Reserved', '2015', '06', '10'),
(504, 11, 'Reserved', '2015', '06', '10'),
(505, 9, 'Reserved', '2015', '06', '10'),
(506, 9, 'Reserved', '2015', '06', '10'),
(507, 10, 'Reserved', '2015', '06', '10'),
(508, 10, 'Reserved', '2015', '06', '10'),
(509, 9, 'Reserved', '2015', '06', '10'),
(510, 9, 'Reserved', '2015', '06', '10'),
(511, 11, 'Reserved', '2015', '06', '10'),
(512, 10, 'Reserved', '2015', '06', '10'),
(513, 9, 'Reserved', '2015', '06', '10'),
(514, 9, 'Reserved', '2015', '06', '10'),
(515, 10, 'Reserved', '2015', '06', '10'),
(516, 10, 'Reserved', '2015', '06', '10'),
(517, 9, 'Reserved', '2015', '06', '10'),
(518, 9, 'Reserved', '2015', '06', '10'),
(519, 10, 'Reserved', '2015', '06', '10'),
(520, 10, 'Reserved', '2015', '06', '10'),
(521, 9, 'Reserved', '2015', '06', '10'),
(522, 9, 'Reserved', '2015', '06', '10'),
(523, 10, 'Reserved', '2015', '06', '10'),
(524, 10, 'Reserved', '2015', '06', '10'),
(525, 9, 'Reserved', '2015', '06', '10'),
(526, 9, 'Reserved', '2015', '06', '10'),
(527, 11, 'Reserved', '2015', '06', '10'),
(528, 10, 'Reserved', '2015', '06', '10'),
(529, 9, 'Reserved', '2015', '06', '10'),
(530, 11, 'Reserved', '2015', '06', '10'),
(531, 11, 'Reserved', '2015', '06', '10'),
(532, 9, 'Reserved', '2015', '06', '10'),
(533, 9, 'Reserved', '2015', '06', '10'),
(534, 10, 'Reserved', '2015', '06', '10'),
(535, 10, 'Reserved', '2015', '06', '10'),
(536, 9, 'Reserved', '2015', '06', '10'),
(537, 9, 'Reserved', '2015', '06', '10'),
(538, 10, 'Reserved', '2015', '06', '10'),
(539, 10, 'Reserved', '2015', '06', '10'),
(540, 9, 'Reserved', '2015', '06', '10'),
(541, 9, 'Reserved', '2015', '06', '10'),
(542, 11, 'Reserved', '2015', '06', '10'),
(543, 10, 'Reserved', '2015', '06', '10'),
(544, 9, 'Reserved', '2015', '06', '10'),
(545, 9, 'Reserved', '2015', '06', '10'),
(546, 10, 'Reserved', '2015', '06', '10'),
(547, 11, 'Reserved', '2015', '06', '10'),
(548, 9, 'Reserved', '2015', '06', '10'),
(549, 11, 'Reserved', '2015', '06', '10'),
(550, 11, 'Reserved', '2015', '06', '10'),
(551, 9, 'Reserved', '2015', '06', '10'),
(552, 10, 'Reserved', '2015', '06', '10'),
(553, 11, 'Reserved', '2015', '06', '10'),
(554, 9, 'Reserved', '2015', '06', '10'),
(555, 11, 'Reserved', '2015', '06', '10'),
(556, 10, 'Reserved', '2015', '06', '10'),
(557, 9, 'Reserved', '2015', '06', '10'),
(558, 10, 'Reserved', '2015', '06', '10'),
(559, 11, 'Reserved', '2015', '06', '10'),
(560, 9, 'Reserved', '2015', '06', '10'),
(561, 10, 'Reserved', '2015', '06', '10'),
(562, 11, 'Reserved', '2015', '06', '10'),
(563, 9, 'Reserved', '2015', '06', '10'),
(564, 11, 'Reserved', '2015', '06', '10'),
(565, 11, 'Reserved', '2015', '06', '10'),
(566, 9, 'Reserved', '2015', '06', '10'),
(567, 10, 'Reserved', '2015', '06', '10'),
(568, 10, 'Reserved', '2015', '06', '10'),
(569, 9, 'Reserved', '2015', '06', '10'),
(570, 9, 'Reserved', '2015', '06', '10'),
(571, 11, 'Reserved', '2015', '06', '10'),
(572, 10, 'Reserved', '2015', '06', '10'),
(573, 9, 'Reserved', '2015', '06', '10'),
(574, 11, 'Reserved', '2015', '06', '10'),
(575, 11, 'Reserved', '2015', '06', '10'),
(576, 9, 'Reserved', '2015', '06', '10'),
(577, 10, 'Reserved', '2015', '06', '10'),
(578, 11, 'Reserved', '2015', '06', '10'),
(579, 9, 'Reserved', '2015', '06', '10'),
(580, 10, 'Reserved', '2015', '06', '10'),
(581, 10, 'Reserved', '2015', '06', '10'),
(582, 9, 'Reserved', '2015', '06', '10'),
(583, 10, 'Reserved', '2015', '06', '10'),
(584, 11, 'Reserved', '2015', '06', '10'),
(585, 9, 'Reserved', '2015', '06', '10'),
(586, 9, 'Reserved', '2015', '06', '10'),
(587, 11, 'Reserved', '2015', '06', '10'),
(588, 10, 'Reserved', '2015', '06', '10'),
(589, 9, 'Reserved', '2015', '06', '10'),
(590, 11, 'Reserved', '2015', '06', '10'),
(591, 11, 'Reserved', '2015', '06', '10'),
(592, 9, 'Reserved', '2015', '06', '10'),
(593, 10, 'Reserved', '2015', '06', '10'),
(594, 11, 'Reserved', '2015', '06', '10'),
(595, 9, 'Reserved', '2015', '06', '10'),
(596, 11, 'Reserved', '2015', '06', '10'),
(597, 11, 'Reserved', '2015', '06', '10'),
(598, 9, 'Reserved', '2015', '06', '10'),
(599, 10, 'Reserved', '2015', '06', '10'),
(600, 11, 'Reserved', '2015', '06', '10'),
(601, 9, 'Reserved', '2015', '06', '10'),
(602, 11, 'Reserved', '2015', '06', '10'),
(603, 11, 'Reserved', '2015', '06', '10'),
(604, 9, 'Reserved', '2015', '06', '10'),
(605, 10, 'Reserved', '2015', '06', '10'),
(606, 11, 'Reserved', '2015', '06', '10'),
(607, 9, 'Reserved', '2015', '06', '10'),
(608, 9, 'Reserved', '2015', '06', '10'),
(609, 10, 'Reserved', '2015', '06', '10'),
(610, 11, 'Reserved', '2015', '06', '10'),
(611, 9, 'Reserved', '2015', '06', '10'),
(612, 11, 'Reserved', '2015', '06', '10'),
(613, 10, 'Reserved', '2015', '06', '10'),
(614, 9, 'Reserved', '2015', '06', '10'),
(615, 10, 'Reserved', '2015', '06', '10'),
(616, 11, 'Reserved', '2015', '06', '10'),
(617, 9, 'Reserved', '2015', '06', '10'),
(618, 10, 'Reserved', '2015', '06', '10'),
(619, 11, 'Reserved', '2015', '06', '10'),
(620, 9, 'Reserved', '2015', '06', '10'),
(621, 10, 'Reserved', '2015', '06', '10'),
(622, 11, 'Reserved', '2015', '06', '10'),
(623, 9, 'Reserved', '2015', '06', '10'),
(624, 10, 'Reserved', '2015', '06', '10'),
(625, 11, 'Reserved', '2015', '06', '10'),
(626, 9, 'Reserved', '2015', '06', '10'),
(627, 10, 'Reserved', '2015', '06', '10'),
(628, 11, 'Reserved', '2015', '06', '10'),
(629, 9, 'Reserved', '2015', '06', '10'),
(630, 10, 'Reserved', '2015', '06', '10'),
(631, 10, 'Reserved', '2015', '06', '10'),
(632, 9, 'Reserved', '2015', '06', '10'),
(633, 10, 'Reserved', '2015', '06', '10'),
(634, 10, 'Reserved', '2015', '06', '10'),
(635, 9, 'Reserved', '2015', '06', '10'),
(636, 10, 'Reserved', '2015', '06', '10'),
(637, 10, 'Reserved', '2015', '06', '10'),
(638, 9, 'Reserved', '2015', '06', '10'),
(639, 10, 'Reserved', '2015', '06', '10'),
(640, 11, 'Reserved', '2015', '06', '10'),
(641, 9, 'Reserved', '2015', '06', '10'),
(642, 11, 'Reserved', '2015', '06', '10'),
(643, 11, 'Reserved', '2015', '06', '10'),
(644, 9, 'Reserved', '2015', '06', '10'),
(645, 11, 'Reserved', '2015', '06', '10'),
(646, 11, 'Reserved', '2015', '06', '10'),
(647, 9, 'Reserved', '2015', '06', '10'),
(648, 11, 'Reserved', '2015', '06', '10'),
(649, 11, 'Reserved', '2015', '06', '10'),
(650, 9, 'Reserved', '2015', '06', '10'),
(651, 11, 'Reserved', '2015', '06', '10'),
(652, 10, 'Reserved', '2015', '06', '10'),
(653, 9, 'Reserved', '2015', '06', '10'),
(654, 10, 'Reserved', '2015', '06', '10'),
(655, 9, 'Reserved', '2015', '06', '10'),
(656, 11, 'Reserved', '2015', '06', '10'),
(657, 10, 'Reserved', '2015', '06', '10'),
(658, 11, 'Reserved', '2015', '06', '10'),
(659, 9, 'Reserved', '2015', '06', '10'),
(660, 11, 'Reserved', '2015', '06', '10'),
(661, 11, 'Reserved', '2015', '06', '10'),
(662, 9, 'Reserved', '2015', '06', '10'),
(663, 11, 'Reserved', '2015', '06', '10'),
(664, 10, 'Reserved', '2015', '06', '10'),
(665, 9, 'Reserved', '2015', '06', '10'),
(666, 11, 'Reserved', '2015', '06', '10'),
(667, 10, 'Reserved', '2015', '06', '10'),
(668, 9, 'Reserved', '2015', '06', '10'),
(669, 10, 'Reserved', '2015', '06', '10'),
(670, 10, 'Reserved', '2015', '06', '10'),
(671, 9, 'Reserved', '2015', '06', '10'),
(672, 10, 'Reserved', '2015', '06', '10'),
(673, 10, 'Reserved', '2015', '06', '10'),
(674, 9, 'Reserved', '2015', '06', '10'),
(675, 11, 'Reserved', '2015', '06', '10'),
(676, 10, 'Reserved', '2015', '06', '10'),
(677, 9, 'Reserved', '2015', '06', '10'),
(678, 11, 'Reserved', '2015', '06', '10'),
(679, 10, 'Reserved', '2015', '06', '10'),
(680, 9, 'Reserved', '2015', '06', '10'),
(681, 10, 'Reserved', '2015', '06', '10'),
(682, 11, 'Reserved', '2015', '06', '10'),
(683, 9, 'Reserved', '2015', '06', '10'),
(684, 10, 'Reserved', '2015', '06', '10'),
(685, 11, 'Reserved', '2015', '06', '10'),
(686, 9, 'Reserved', '2015', '06', '10'),
(687, 10, 'Reserved', '2015', '06', '10'),
(688, 11, 'Reserved', '2015', '06', '10'),
(689, 9, 'Reserved', '2015', '06', '10'),
(690, 11, 'Reserved', '2015', '06', '10'),
(691, 10, 'Reserved', '2015', '06', '10'),
(692, 9, 'Reserved', '2015', '06', '10'),
(693, 11, 'Reserved', '2015', '06', '10'),
(694, 11, 'Reserved', '2015', '06', '10'),
(695, 9, 'Reserved', '2015', '06', '10'),
(696, 11, 'Reserved', '2015', '06', '10'),
(697, 9, 'Reserved', '2015', '06', '10'),
(698, 10, 'Reserved', '2015', '06', '10'),
(699, 11, 'Reserved', '2015', '06', '10'),
(700, 11, 'Reserved', '2015', '06', '10'),
(701, 9, 'Reserved', '2015', '06', '10'),
(702, 10, 'Reserved', '2015', '06', '10'),
(703, 11, 'Reserved', '2015', '06', '10'),
(704, 9, 'Reserved', '2015', '06', '10'),
(705, 10, 'Reserved', '2015', '06', '10'),
(706, 10, 'Reserved', '2015', '06', '10'),
(707, 9, 'Reserved', '2015', '06', '10'),
(708, 11, 'Reserved', '2015', '06', '10'),
(709, 11, 'Reserved', '2015', '06', '10'),
(710, 9, 'Reserved', '2015', '06', '10'),
(711, 11, 'Reserved', '2015', '06', '10'),
(712, 10, 'Reserved', '2015', '06', '10'),
(713, 9, 'Reserved', '2015', '06', '10'),
(714, 11, 'Reserved', '2015', '06', '10'),
(715, 10, 'Reserved', '2015', '06', '10'),
(716, 9, 'Reserved', '2015', '06', '10'),
(717, 11, 'Reserved', '2015', '06', '10'),
(718, 11, 'Reserved', '2015', '06', '10'),
(719, 9, 'Reserved', '2015', '06', '10'),
(720, 10, 'Reserved', '2015', '06', '10'),
(721, 11, 'Reserved', '2015', '06', '10'),
(722, 9, 'Reserved', '2015', '06', '10'),
(723, 11, 'Reserved', '2015', '06', '10'),
(724, 10, 'Reserved', '2015', '06', '10'),
(725, 9, 'Reserved', '2015', '06', '10'),
(726, 10, 'Reserved', '2015', '06', '10'),
(727, 11, 'Reserved', '2015', '06', '10'),
(728, 9, 'Reserved', '2015', '06', '10'),
(729, 11, 'Reserved', '2015', '06', '10'),
(730, 10, 'Reserved', '2015', '06', '10'),
(731, 9, 'Reserved', '2015', '06', '10'),
(732, 11, 'Reserved', '2015', '06', '10'),
(733, 10, 'Reserved', '2015', '06', '10'),
(734, 9, 'Reserved', '2015', '06', '10'),
(735, 10, 'Reserved', '2015', '06', '10'),
(736, 10, 'Reserved', '2015', '06', '10'),
(737, 9, 'Reserved', '2015', '06', '10'),
(738, 11, 'Reserved', '2015', '06', '10'),
(739, 11, 'Reserved', '2015', '06', '10'),
(740, 9, 'Reserved', '2015', '06', '10'),
(741, 10, 'Reserved', '2015', '06', '10'),
(742, 10, 'Reserved', '2015', '06', '10'),
(743, 9, 'Reserved', '2015', '06', '10'),
(744, 10, 'Reserved', '2015', '06', '10'),
(745, 11, 'Reserved', '2015', '06', '10'),
(746, 9, 'Reserved', '2015', '06', '10'),
(747, 11, 'Reserved', '2015', '06', '10'),
(748, 10, 'Reserved', '2015', '06', '10'),
(749, 9, 'Reserved', '2015', '06', '10'),
(750, 11, 'Reserved', '2015', '06', '10'),
(751, 10, 'Reserved', '2015', '06', '10'),
(752, 9, 'Reserved', '2015', '06', '10'),
(753, 10, 'Reserved', '2015', '06', '10'),
(754, 11, 'Reserved', '2015', '06', '10'),
(755, 9, 'Reserved', '2015', '06', '10'),
(756, 10, 'Reserved', '2015', '06', '10'),
(757, 11, 'Reserved', '2015', '06', '10'),
(758, 9, 'Reserved', '2015', '06', '10'),
(759, 11, 'Reserved', '2015', '06', '10'),
(760, 11, 'Reserved', '2015', '06', '10'),
(761, 9, 'Reserved', '2015', '06', '10'),
(762, 10, 'Reserved', '2015', '06', '10'),
(763, 11, 'Reserved', '2015', '06', '10'),
(764, 9, 'Reserved', '2015', '06', '10'),
(765, 10, 'Reserved', '2015', '06', '10'),
(766, 10, 'Reserved', '2015', '06', '10'),
(767, 9, 'Reserved', '2015', '06', '10'),
(768, 11, 'Reserved', '2015', '06', '10'),
(769, 11, 'Reserved', '2015', '06', '10'),
(770, 9, 'Reserved', '2015', '06', '10'),
(771, 11, 'Reserved', '2015', '06', '10'),
(772, 11, 'Reserved', '2015', '06', '10'),
(773, 9, 'Reserved', '2015', '06', '10'),
(774, 11, 'Reserved', '2015', '06', '10'),
(775, 10, 'Reserved', '2015', '06', '10'),
(776, 9, 'Reserved', '2015', '06', '10'),
(777, 10, 'Reserved', '2015', '06', '10'),
(778, 10, 'Reserved', '2015', '06', '10'),
(779, 9, 'Reserved', '2015', '06', '10'),
(780, 11, 'Reserved', '2015', '06', '10'),
(781, 10, 'Reserved', '2015', '06', '10'),
(782, 9, 'Reserved', '2015', '06', '10'),
(783, 10, 'Reserved', '2015', '06', '10'),
(784, 10, 'Reserved', '2015', '06', '10'),
(785, 9, 'Reserved', '2015', '06', '10'),
(786, 9, 'Reserved', '2015', '06', '10'),
(787, 11, 'Reserved', '2015', '06', '10'),
(788, 11, 'Reserved', '2015', '06', '10'),
(789, 11, 'Reserved', '2015', '06', '10'),
(790, 11, 'Reserved', '2015', '06', '10'),
(791, 9, 'Reserved', '2015', '06', '10'),
(792, 11, 'Reserved', '2015', '06', '10'),
(793, 10, 'Reserved', '2015', '06', '10'),
(794, 9, 'Reserved', '2015', '06', '10'),
(795, 10, 'Reserved', '2015', '06', '10'),
(796, 11, 'Reserved', '2015', '06', '10'),
(797, 9, 'Reserved', '2015', '06', '10'),
(798, 11, 'Reserved', '2015', '06', '10'),
(799, 11, 'Reserved', '2015', '06', '10'),
(800, 9, 'Reserved', '2015', '06', '10'),
(801, 11, 'Reserved', '2015', '06', '10'),
(802, 10, 'Reserved', '2015', '06', '10'),
(803, 9, 'Reserved', '2015', '06', '10'),
(804, 11, 'Reserved', '2015', '06', '10'),
(805, 10, 'Reserved', '2015', '06', '10'),
(806, 9, 'Reserved', '2015', '06', '10'),
(807, 9, 'Reserved', '2015', '06', '10'),
(808, 11, 'Reserved', '2015', '06', '10'),
(809, 10, 'Reserved', '2015', '06', '10'),
(810, 9, 'Reserved', '2015', '06', '10'),
(811, 10, 'Reserved', '2015', '06', '10'),
(812, 10, 'Reserved', '2015', '06', '10'),
(813, 9, 'Reserved', '2015', '06', '10'),
(814, 11, 'Reserved', '2015', '06', '10'),
(815, 11, 'Reserved', '2015', '06', '10'),
(816, 9, 'Reserved', '2015', '06', '10'),
(817, 11, 'Reserved', '2015', '06', '10'),
(818, 10, 'Reserved', '2015', '06', '10'),
(819, 9, 'Reserved', '2015', '06', '10'),
(820, 11, 'Reserved', '2015', '06', '10'),
(821, 10, 'Reserved', '2015', '06', '10'),
(822, 9, 'Reserved', '2015', '06', '10'),
(823, 11, 'Reserved', '2015', '06', '10'),
(824, 10, 'Reserved', '2015', '06', '10'),
(825, 9, 'Reserved', '2015', '06', '10'),
(826, 11, 'Reserved', '2015', '06', '10'),
(827, 10, 'Reserved', '2015', '06', '10'),
(828, 9, 'Reserved', '2015', '06', '10'),
(829, 10, 'Reserved', '2015', '06', '10'),
(830, 11, 'Reserved', '2015', '06', '10'),
(831, 9, 'Reserved', '2015', '06', '10'),
(832, 10, 'Reserved', '2015', '06', '10'),
(833, 11, 'Reserved', '2015', '06', '10'),
(834, 9, 'Reserved', '2015', '06', '10'),
(835, 9, 'Reserved', '2015', '06', '10'),
(836, 11, 'Reserved', '2015', '06', '10'),
(837, 11, 'Reserved', '2015', '06', '10'),
(838, 9, 'Reserved', '2015', '06', '10'),
(839, 10, 'Reserved', '2015', '06', '10'),
(840, 11, 'Reserved', '2015', '06', '10'),
(841, 9, 'Reserved', '2015', '06', '10'),
(842, 11, 'Reserved', '2015', '06', '10'),
(843, 11, 'Reserved', '2015', '06', '10'),
(844, 9, 'Reserved', '2015', '06', '10'),
(845, 11, 'Reserved', '2015', '06', '10'),
(846, 11, 'Reserved', '2015', '06', '10'),
(847, 9, 'Reserved', '2015', '06', '10'),
(848, 11, 'Reserved', '2015', '06', '10'),
(849, 10, 'Reserved', '2015', '06', '10'),
(850, 9, 'Reserved', '2015', '06', '10'),
(851, 10, 'Reserved', '2015', '06', '10'),
(852, 10, 'Reserved', '2015', '06', '10'),
(853, 9, 'Reserved', '2015', '06', '10'),
(854, 10, 'Reserved', '2015', '06', '10'),
(855, 11, 'Reserved', '2015', '06', '10'),
(856, 9, 'Reserved', '2015', '06', '10'),
(857, 11, 'Reserved', '2015', '06', '10'),
(858, 10, 'Reserved', '2015', '06', '10'),
(859, 9, 'Reserved', '2015', '06', '10'),
(860, 10, 'Reserved', '2015', '06', '10'),
(861, 10, 'Reserved', '2015', '06', '10'),
(862, 9, 'Reserved', '2015', '06', '10'),
(863, 10, 'Reserved', '2015', '06', '10'),
(864, 10, 'Reserved', '2015', '06', '10'),
(865, 9, 'Reserved', '2015', '06', '10'),
(866, 11, 'Reserved', '2015', '06', '10'),
(867, 10, 'Reserved', '2015', '06', '10'),
(868, 9, 'Reserved', '2015', '06', '10'),
(869, 10, 'Reserved', '2015', '06', '10'),
(870, 10, 'Reserved', '2015', '06', '10'),
(871, 9, 'Reserved', '2015', '06', '10'),
(872, 11, 'Reserved', '2015', '06', '10'),
(873, 10, 'Reserved', '2015', '06', '10'),
(874, 9, 'Reserved', '2015', '06', '10'),
(875, 10, 'Reserved', '2015', '06', '10'),
(876, 11, 'Reserved', '2015', '06', '10'),
(877, 9, 'Reserved', '2015', '06', '10'),
(878, 10, 'Reserved', '2015', '06', '10'),
(879, 10, 'Reserved', '2015', '06', '10'),
(880, 9, 'Reserved', '2015', '06', '10'),
(881, 10, 'Reserved', '2015', '06', '10'),
(882, 10, 'Reserved', '2015', '06', '10'),
(883, 9, 'Reserved', '2015', '06', '10'),
(884, 10, 'Reserved', '2015', '06', '10'),
(885, 10, 'Reserved', '2015', '06', '10'),
(886, 9, 'Reserved', '2015', '06', '10'),
(887, 10, 'Reserved', '2015', '06', '10'),
(888, 10, 'Reserved', '2015', '06', '10'),
(889, 9, 'Reserved', '2015', '06', '10'),
(890, 9, 'Reserved', '2015', '06', '10'),
(891, 10, 'Reserved', '2015', '06', '10'),
(892, 10, 'Reserved', '2015', '06', '10'),
(893, 9, 'Reserved', '2015', '06', '10'),
(894, 9, 'Reserved', '2015', '06', '10'),
(895, 11, 'Reserved', '2015', '06', '10'),
(896, 11, 'Reserved', '2015', '06', '10'),
(897, 9, 'Reserved', '2015', '06', '10'),
(898, 10, 'Reserved', '2015', '06', '10'),
(899, 11, 'Reserved', '2015', '06', '10'),
(900, 9, 'Reserved', '2015', '06', '10'),
(901, 9, 'Reserved', '2015', '06', '10'),
(902, 11, 'Reserved', '2015', '06', '10'),
(903, 10, 'Reserved', '2015', '06', '10'),
(904, 9, 'Reserved', '2015', '06', '10'),
(905, 11, 'Reserved', '2015', '06', '10'),
(906, 10, 'Reserved', '2015', '06', '10'),
(907, 9, 'Reserved', '2015', '06', '10'),
(908, 11, 'Reserved', '2015', '06', '10'),
(909, 10, 'Reserved', '2015', '06', '10'),
(910, 9, 'Reserved', '2015', '06', '10'),
(911, 10, 'Reserved', '2015', '06', '10'),
(912, 11, 'Reserved', '2015', '06', '10'),
(913, 9, 'Reserved', '2015', '06', '10'),
(914, 9, 'Reserved', '2015', '06', '10'),
(915, 11, 'Reserved', '2015', '06', '10'),
(916, 11, 'Reserved', '2015', '06', '10'),
(917, 9, 'Reserved', '2015', '06', '10'),
(918, 10, 'Reserved', '2015', '06', '10'),
(919, 10, 'Reserved', '2015', '06', '10'),
(920, 9, 'Reserved', '2015', '06', '10'),
(921, 10, 'Reserved', '2015', '06', '10'),
(922, 10, 'Reserved', '2015', '06', '10'),
(923, 9, 'Reserved', '2015', '06', '10'),
(924, 10, 'Reserved', '2015', '06', '10'),
(925, 11, 'Reserved', '2015', '06', '10'),
(926, 9, 'Reserved', '2015', '06', '10'),
(927, 10, 'Reserved', '2015', '06', '10'),
(928, 10, 'Reserved', '2015', '06', '10'),
(929, 9, 'Reserved', '2015', '06', '10'),
(930, 9, 'Reserved', '2015', '06', '10'),
(931, 11, 'Reserved', '2015', '06', '10'),
(932, 10, 'Reserved', '2015', '06', '10'),
(933, 9, 'Reserved', '2015', '06', '10'),
(934, 10, 'Reserved', '2015', '06', '10'),
(935, 11, 'Reserved', '2015', '06', '10'),
(936, 9, 'Reserved', '2015', '06', '10'),
(937, 9, 'Reserved', '2015', '06', '10'),
(938, 10, 'Reserved', '2015', '06', '10'),
(939, 11, 'Reserved', '2015', '06', '10'),
(940, 9, 'Reserved', '2015', '06', '10'),
(941, 10, 'Reserved', '2015', '06', '10'),
(942, 11, 'Reserved', '2015', '06', '10'),
(943, 9, 'Reserved', '2015', '06', '13'),
(944, 9, 'Reserved', '2015', '06', '13'),
(945, 10, 'Reserved', '2015', '06', '13'),
(946, 10, 'Reserved', '2015', '06', '13'),
(947, 9, 'Reserved', '2015', '06', '13'),
(948, 11, 'Reserved', '2015', '06', '13'),
(949, 11, 'Reserved', '2015', '06', '13'),
(950, 9, 'Reserved', '2015', '06', '13'),
(951, 10, 'Reserved', '2015', '06', '13'),
(952, 11, 'Reserved', '2015', '06', '13'),
(953, 9, 'Reserved', '2015', '06', '13'),
(954, 10, 'Reserved', '2015', '06', '13'),
(955, 10, 'Reserved', '2015', '06', '13'),
(956, 9, 'Reserved', '2015', '06', '13'),
(957, 11, 'Reserved', '2015', '06', '13'),
(958, 11, 'Reserved', '2015', '06', '13'),
(959, 9, 'Reserved', '2015', '06', '13'),
(960, 9, 'Reserved', '2015', '06', '13'),
(961, 11, 'Reserved', '2015', '06', '13'),
(962, 11, 'Reserved', '2015', '06', '13'),
(963, 9, 'Reserved', '2015', '06', '13'),
(964, 10, 'Reserved', '2015', '06', '13'),
(965, 11, 'Reserved', '2015', '06', '13'),
(966, 9, 'Reserved', '2015', '06', '13'),
(967, 11, 'Reserved', '2015', '06', '13'),
(968, 11, 'Reserved', '2015', '06', '13'),
(969, 9, 'Reserved', '2015', '06', '13'),
(970, 9, 'Reserved', '2015', '06', '13'),
(971, 9, 'Reserved', '2015', '06', '13'),
(972, 9, 'Reserved', '2015', '06', '13'),
(973, 9, 'Reserved', '2015', '06', '13'),
(974, 10, 'Reserved', '2015', '06', '13'),
(975, 11, 'Reserved', '2015', '06', '13'),
(976, 9, 'Reserved', '2015', '06', '13'),
(977, 11, 'Reserved', '2015', '06', '13'),
(978, 11, 'Reserved', '2015', '06', '13'),
(979, 9, 'Reserved', '2015', '06', '13'),
(980, 11, 'Reserved', '2015', '06', '13'),
(981, 11, 'Reserved', '2015', '06', '13'),
(982, 9, 'Reserved', '2015', '06', '13'),
(983, 11, 'Reserved', '2015', '06', '13'),
(984, 11, 'Reserved', '2015', '06', '13'),
(985, 9, 'Reserved', '2015', '06', '13'),
(986, 11, 'Reserved', '2015', '06', '13'),
(987, 11, 'Reserved', '2015', '06', '13'),
(988, 9, 'Reserved', '2015', '06', '13'),
(989, 10, 'Reserved', '2015', '06', '13'),
(990, 10, 'Reserved', '2015', '06', '13'),
(991, 9, 'Reserved', '2015', '06', '13'),
(992, 10, 'Reserved', '2015', '06', '13'),
(993, 11, 'Reserved', '2015', '06', '13'),
(994, 9, 'Reserved', '2015', '06', '13'),
(995, 10, 'Reserved', '2015', '06', '13'),
(996, 10, 'Reserved', '2015', '06', '13'),
(997, 9, 'Reserved', '2015', '06', '13'),
(998, 10, 'Reserved', '2015', '06', '13'),
(999, 10, 'Reserved', '2015', '06', '13'),
(1000, 9, 'Reserved', '2015', '06', '13'),
(1001, 11, 'Reserved', '2015', '06', '13'),
(1002, 11, 'Reserved', '2015', '06', '13'),
(1003, 9, 'Reserved', '2015', '06', '13'),
(1004, 9, 'Reserved', '2015', '06', '13'),
(1005, 11, 'Reserved', '2015', '06', '13'),
(1006, 11, 'Reserved', '2015', '06', '13'),
(1007, 9, 'Reserved', '2015', '06', '13'),
(1008, 9, 'Reserved', '2015', '06', '13'),
(1009, 9, 'Reserved', '2015', '06', '13'),
(1010, 11, 'Reserved', '2015', '06', '13'),
(1011, 10, 'Reserved', '2015', '06', '13'),
(1012, 9, 'Reserved', '2015', '06', '13'),
(1013, 11, 'Reserved', '2015', '06', '13'),
(1014, 10, 'Reserved', '2015', '06', '13'),
(1015, 9, 'Reserved', '2015', '06', '13'),
(1016, 10, 'Reserved', '2015', '06', '13'),
(1017, 10, 'Reserved', '2015', '06', '13'),
(1018, 9, 'Reserved', '2015', '06', '13'),
(1019, 11, 'Reserved', '2015', '06', '13'),
(1020, 11, 'Reserved', '2015', '06', '13'),
(1021, 9, 'Reserved', '2015', '06', '13'),
(1022, 11, 'Reserved', '2015', '06', '13'),
(1023, 10, 'Reserved', '2015', '06', '13'),
(1024, 9, 'Reserved', '2015', '06', '13'),
(1025, 11, 'Reserved', '2015', '06', '13'),
(1026, 11, 'Reserved', '2015', '06', '13'),
(1027, 9, 'Reserved', '2015', '06', '13'),
(1028, 10, 'Reserved', '2015', '06', '13'),
(1029, 11, 'Reserved', '2015', '06', '13'),
(1030, 9, 'Reserved', '2015', '06', '13'),
(1031, 9, 'Reserved', '2015', '06', '13'),
(1032, 9, 'Reserved', '2015', '06', '13'),
(1033, 9, 'Reserved', '2015', '06', '13'),
(1034, 9, 'Reserved', '2015', '06', '13'),
(1035, 9, 'Reserved', '2015', '06', '13'),
(1036, 9, 'Reserved', '2015', '06', '13'),
(1037, 9, 'Reserved', '2015', '06', '13'),
(1038, 9, 'Reserved', '2015', '06', '13'),
(1039, 9, 'Reserved', '2015', '06', '13'),
(1040, 9, 'Reserved', '2015', '06', '13'),
(1041, 9, 'Reserved', '2015', '06', '13'),
(1042, 9, 'Reserved', '2015', '06', '13'),
(1043, 9, 'Reserved', '2015', '06', '13'),
(1044, 9, 'Reserved', '2015', '06', '13'),
(1045, 9, 'Reserved', '2015', '06', '13'),
(1046, 9, 'Reserved', '2015', '06', '13'),
(1047, 9, 'Reserved', '2015', '06', '13'),
(1048, 9, 'Reserved', '2015', '06', '13'),
(1049, 9, 'Reserved', '2015', '06', '13'),
(1050, 9, 'Reserved', '2015', '06', '13'),
(1051, 9, 'Reserved', '2015', '06', '13'),
(1052, 9, 'Reserved', '2015', '06', '13'),
(1053, 9, 'Reserved', '2015', '06', '13'),
(1054, 9, 'Reserved', '2015', '06', '14'),
(1055, 9, 'Reserved', '2015', '06', '14'),
(1056, 11, 'Reserved', '2015', '06', '14'),
(1057, 11, 'Reserved', '2015', '06', '14'),
(1058, 9, 'Reserved', '2015', '06', '14'),
(1059, 9, 'Reserved', '2015', '06', '14'),
(1060, 9, 'Reserved', '2015', '06', '14'),
(1061, 9, 'Reserved', '2015', '06', '14'),
(1062, 9, 'Reserved', '2015', '06', '14'),
(1063, 9, 'Reserved', '2015', '06', '14'),
(1064, 9, 'Reserved', '2015', '06', '14'),
(1065, 9, 'Reserved', '2015', '06', '14'),
(1066, 9, 'Reserved', '2015', '06', '14'),
(1067, 9, 'Reserved', '2015', '06', '14'),
(1068, 9, 'Reserved', '2015', '06', '14'),
(1069, 11, 'Reserved', '2015', '06', '14'),
(1070, 11, 'Reserved', '2015', '06', '14'),
(1071, 9, 'Reserved', '2015', '06', '14'),
(1072, 9, 'Reserved', '2015', '06', '14'),
(1073, 9, 'Reserved', '2015', '06', '14'),
(1074, 11, 'Reserved', '2015', '06', '14'),
(1075, 11, 'Reserved', '2015', '06', '14'),
(1076, 9, 'Reserved', '2015', '06', '14'),
(1077, 9, 'Reserved', '2015', '06', '14'),
(1078, 9, 'Reserved', '2015', '06', '14'),
(1079, 10, 'Reserved', '2015', '06', '14'),
(1080, 10, 'Reserved', '2015', '06', '14'),
(1081, 9, 'Reserved', '2015', '06', '14'),
(1082, 9, 'Reserved', '2015', '06', '14'),
(1083, 9, 'Reserved', '2015', '06', '14'),
(1084, 10, 'Reserved', '2015', '06', '14'),
(1085, 10, 'Reserved', '2015', '06', '14'),
(1086, 9, 'Reserved', '2015', '06', '14'),
(1087, 9, 'Reserved', '2015', '06', '14'),
(1088, 10, 'Reserved', '2015', '06', '14'),
(1089, 11, 'Reserved', '2015', '06', '14'),
(1090, 9, 'Reserved', '2015', '06', '14'),
(1091, 9, 'Reserved', '2015', '06', '14'),
(1092, 10, 'Reserved', '2015', '06', '14'),
(1093, 11, 'Reserved', '2015', '06', '14'),
(1094, 9, 'Reserved', '2015', '06', '14'),
(1095, 9, 'Reserved', '2015', '06', '14'),
(1096, 10, 'Reserved', '2015', '06', '14'),
(1097, 10, 'Reserved', '2015', '06', '14'),
(1098, 9, 'Reserved', '2015', '06', '14'),
(1099, 9, 'Reserved', '2015', '06', '14'),
(1100, 10, 'Reserved', '2015', '06', '14'),
(1101, 11, 'Reserved', '2015', '06', '14'),
(1102, 9, 'Reserved', '2015', '06', '14'),
(1103, 9, 'Reserved', '2015', '06', '14'),
(1104, 9, 'Reserved', '2015', '06', '14'),
(1105, 11, 'Reserved', '2015', '06', '14'),
(1106, 11, 'Reserved', '2015', '06', '14'),
(1107, 9, 'Reserved', '2015', '06', '14'),
(1108, 9, 'Reserved', '2015', '06', '14'),
(1109, 11, 'Reserved', '2015', '06', '14'),
(1110, 11, 'Reserved', '2015', '06', '14'),
(1111, 9, 'Reserved', '2015', '06', '14'),
(1112, 9, 'Reserved', '2015', '06', '14'),
(1113, 9, 'Reserved', '2015', '06', '14'),
(1114, 11, 'Reserved', '2015', '06', '14'),
(1115, 10, 'Reserved', '2015', '06', '14'),
(1116, 9, 'Reserved', '2015', '06', '14'),
(1117, 9, 'Reserved', '2015', '06', '14'),
(1118, 9, 'Reserved', '2015', '06', '14'),
(1119, 10, 'Reserved', '2015', '06', '14'),
(1120, 10, 'Reserved', '2015', '06', '14'),
(1121, 9, 'Reserved', '2015', '06', '14'),
(1122, 9, 'Reserved', '2015', '06', '14'),
(1123, 9, 'Reserved', '2015', '06', '14'),
(1124, 11, 'Reserved', '2015', '06', '14'),
(1125, 10, 'Reserved', '2015', '06', '14'),
(1126, 9, 'Reserved', '2015', '06', '15'),
(1127, 9, 'Reserved', '2015', '06', '15'),
(1128, 9, 'Reserved', '2015', '06', '15'),
(1129, 10, 'Reserved', '2015', '06', '15'),
(1130, 11, 'Reserved', '2015', '06', '15'),
(1131, 9, 'Reserved', '2015', '06', '15'),
(1132, 9, 'Reserved', '2015', '06', '15'),
(1133, 11, 'Reserved', '2015', '06', '15'),
(1134, 10, 'Reserved', '2015', '06', '15'),
(1135, 12, 'Reserved', '2015', '10', '25'),
(1136, 12, 'Reserved', '2015', '10', '26'),
(1137, 12, 'Reserved', '2015', '10', '26'),
(1138, 12, 'Reserved', '2015', '10', '26'),
(1139, 12, 'Reserved', '2015', '10', '26'),
(1140, 12, 'Reserved', '2015', '10', '26'),
(1141, 12, 'Reserved', '2015', '10', '26'),
(1142, 12, 'Reserved', '2015', '10', '29'),
(1143, 12, 'Reserved', '2015', '11', '01'),
(1144, 12, 'Reserved', '2015', '11', '01'),
(1145, 12, 'Reserved', '2015', '11', '01'),
(1146, 12, 'Reserved', '2015', '11', '01'),
(1147, 12, 'Reserved', '2015', '11', '01'),
(1148, 12, 'Reserved', '2015', '11', '01'),
(1149, 12, 'Reserved', '2015', '11', '01'),
(1150, 12, 'Reserved', '2015', '11', '01'),
(1151, 12, 'Reserved', '2015', '11', '01'),
(1152, 12, 'Reserved', '2015', '11', '01'),
(1153, 12, 'Reserved', '2015', '11', '01'),
(1154, 12, 'Reserved', '2015', '11', '01'),
(1155, 12, 'Reserved', '2015', '11', '01'),
(1156, 12, 'Reserved', '2015', '11', '01'),
(1157, 12, 'Reserved', '2015', '11', '01'),
(1158, 12, 'Reserved', '2015', '11', '01'),
(1159, 12, 'Reserved', '2015', '11', '01'),
(1160, 12, 'Reserved', '2015', '11', '01'),
(1161, 12, 'Reserved', '2015', '11', '01'),
(1162, 12, 'Reserved', '2015', '11', '01'),
(1163, 12, 'Reserved', '2015', '11', '01'),
(1164, 12, 'Reserved', '2015', '11', '01'),
(1165, 12, 'Reserved', '2015', '11', '01'),
(1166, 12, 'Reserved', '2015', '11', '01'),
(1167, 12, 'Reserved', '2015', '11', '01'),
(1168, 12, 'Reserved', '2015', '11', '01'),
(1169, 12, 'Reserved', '2015', '11', '01'),
(1170, 12, 'Reserved', '2015', '11', '01'),
(1171, 12, 'Reserved', '2015', '11', '01'),
(1172, 12, 'Reserved', '2015', '11', '01'),
(1173, 12, 'Reserved', '2015', '11', '01'),
(1174, 12, 'Reserved', '2015', '11', '01'),
(1175, 12, 'Reserved', '2015', '11', '01'),
(1176, 12, 'Reserved', '2015', '11', '01'),
(1177, 12, 'Reserved', '2015', '11', '01'),
(1178, 12, 'Reserved', '2015', '11', '01'),
(1179, 12, 'Reserved', '2015', '11', '01'),
(1180, 12, 'Reserved', '2015', '11', '01'),
(1181, 12, 'Reserved', '2015', '11', '01'),
(1182, 12, 'Reserved', '2015', '11', '01'),
(1183, 12, 'Reserved', '2015', '11', '01'),
(1184, 12, 'Reserved', '2015', '11', '01'),
(1185, 12, 'Reserved', '2015', '11', '01'),
(1186, 12, 'Reserved', '2015', '11', '01'),
(1187, 12, 'Reserved', '2015', '11', '01'),
(1188, 12, 'Reserved', '2015', '11', '01'),
(1189, 12, 'Reserved', '2015', '11', '01'),
(1190, 12, 'Reserved', '2015', '11', '01'),
(1191, 12, 'Reserved', '2015', '11', '01'),
(1192, 12, 'Reserved', '2015', '11', '01'),
(1193, 12, 'Reserved', '2015', '11', '01'),
(1194, 12, 'Reserved', '2015', '11', '01'),
(1195, 12, 'Reserved', '2015', '11', '01'),
(1196, 12, 'Reserved', '2015', '11', '01'),
(1197, 12, 'Reserved', '2015', '11', '01'),
(1198, 12, 'Reserved', '2015', '11', '01'),
(1199, 12, 'Reserved', '2015', '11', '01'),
(1200, 12, 'Reserved', '2015', '11', '01'),
(1201, 12, 'Reserved', '2015', '11', '01'),
(1202, 12, 'Reserved', '2015', '11', '01'),
(1203, 12, 'Reserved', '2015', '11', '01'),
(1204, 12, 'Reserved', '2015', '11', '01'),
(1205, 12, 'Reserved', '2015', '11', '01'),
(1206, 12, 'Reserved', '2015', '11', '01'),
(1207, 12, 'Reserved', '2015', '11', '01'),
(1208, 12, 'Reserved', '2015', '11', '01'),
(1209, 12, 'Reserved', '2015', '11', '01'),
(1210, 12, 'Reserved', '2015', '11', '01'),
(1211, 12, 'Reserved', '2015', '11', '01'),
(1212, 12, 'Reserved', '2015', '11', '01'),
(1213, 12, 'Reserved', '2015', '11', '01'),
(1214, 12, 'Reserved', '2015', '11', '01'),
(1215, 12, 'Reserved', '2015', '11', '01'),
(1216, 12, 'Reserved', '2015', '11', '01'),
(1217, 12, 'Reserved', '2015', '11', '01'),
(1218, 12, 'Reserved', '2015', '11', '01'),
(1219, 12, 'Reserved', '2015', '11', '01'),
(1220, 12, 'Reserved', '2015', '11', '01'),
(1221, 12, 'Reserved', '2015', '11', '01'),
(1222, 12, 'Reserved', '2015', '11', '01'),
(1223, 12, 'Reserved', '2015', '11', '01'),
(1224, 12, 'Reserved', '2015', '11', '02'),
(1225, 12, 'Reserved', '2015', '11', '02');
INSERT INTO `im_publicidad_impresiones` (`id`, `idpublicidad`, `pais`, `anio`, `mes`, `dia`) VALUES
(1226, 12, 'Reserved', '2015', '11', '02'),
(1227, 12, 'Reserved', '2015', '11', '02'),
(1228, 12, 'Reserved', '2015', '11', '02'),
(1229, 12, 'Reserved', '2015', '11', '02'),
(1230, 12, 'Reserved', '2015', '11', '02'),
(1231, 12, 'Reserved', '2015', '11', '02'),
(1232, 12, 'Reserved', '2015', '11', '04'),
(1233, 12, 'Reserved', '2015', '11', '05'),
(1234, 12, 'Reserved', '2015', '11', '05'),
(1235, 12, 'Reserved', '2015', '11', '05'),
(1236, 12, 'Reserved', '2015', '11', '05'),
(1237, 12, 'Reserved', '2015', '11', '05'),
(1238, 12, 'Reserved', '2015', '11', '05'),
(1239, 12, 'Reserved', '2015', '11', '05'),
(1240, 12, 'Reserved', '2015', '11', '05'),
(1241, 12, 'Reserved', '2015', '11', '05'),
(1242, 12, 'Reserved', '2015', '11', '05'),
(1243, 12, 'Reserved', '2015', '11', '05'),
(1244, 12, 'Reserved', '2015', '11', '05'),
(1245, 12, 'Reserved', '2015', '11', '05'),
(1246, 12, 'Reserved', '2015', '11', '05'),
(1247, 12, 'Reserved', '2015', '11', '05'),
(1248, 12, 'Reserved', '2015', '11', '05'),
(1249, 12, 'Reserved', '2015', '11', '05'),
(1250, 12, 'Reserved', '2015', '11', '05'),
(1251, 12, 'Reserved', '2015', '11', '05'),
(1252, 12, 'Reserved', '2015', '11', '05'),
(1253, 12, 'Reserved', '2015', '11', '05'),
(1254, 12, 'Reserved', '2015', '11', '05'),
(1255, 12, 'Reserved', '2015', '11', '05'),
(1256, 12, 'Reserved', '2015', '11', '05'),
(1257, 12, 'Reserved', '2015', '11', '05'),
(1258, 12, 'Reserved', '2015', '11', '05'),
(1259, 12, 'Reserved', '2015', '11', '05'),
(1260, 12, 'Reserved', '2015', '11', '05'),
(1261, 12, 'Reserved', '2015', '11', '05'),
(1262, 12, 'Reserved', '2015', '11', '05'),
(1263, 12, 'Reserved', '2015', '11', '05'),
(1264, 12, 'Reserved', '2015', '11', '05'),
(1265, 12, 'Reserved', '2015', '11', '05'),
(1266, 12, 'Reserved', '2015', '11', '05'),
(1267, 12, 'Reserved', '2015', '11', '05'),
(1268, 12, 'Reserved', '2015', '11', '05'),
(1269, 12, 'Reserved', '2015', '11', '05'),
(1270, 12, 'Reserved', '2015', '11', '05'),
(1271, 12, 'Reserved', '2015', '11', '05'),
(1272, 12, 'Reserved', '2015', '11', '05'),
(1273, 12, 'Reserved', '2015', '11', '05'),
(1274, 12, 'Reserved', '2015', '11', '05'),
(1275, 12, 'Reserved', '2015', '11', '05'),
(1276, 12, 'Reserved', '2015', '11', '05'),
(1277, 12, 'Reserved', '2015', '11', '05'),
(1278, 12, 'Reserved', '2015', '11', '05'),
(1279, 12, 'Reserved', '2015', '11', '05'),
(1280, 12, 'Reserved', '2015', '11', '05'),
(1281, 12, 'Reserved', '2015', '11', '05'),
(1282, 12, 'Reserved', '2015', '11', '05'),
(1283, 12, 'Reserved', '2015', '11', '05'),
(1284, 12, 'Reserved', '2015', '11', '05'),
(1285, 12, 'Reserved', '2015', '11', '08'),
(1286, 12, 'Reserved', '2015', '11', '08'),
(1287, 12, 'Reserved', '2015', '11', '08'),
(1288, 12, 'Reserved', '2015', '11', '08'),
(1289, 12, 'Reserved', '2015', '11', '09'),
(1290, 12, 'Reserved', '2015', '11', '09'),
(1291, 12, 'Reserved', '2015', '11', '09'),
(1292, 12, 'Reserved', '2015', '11', '09'),
(1293, 12, 'Reserved', '2015', '11', '09'),
(1294, 12, 'Reserved', '2015', '11', '09'),
(1295, 12, 'Reserved', '2015', '11', '09'),
(1296, 12, 'Reserved', '2015', '11', '09'),
(1297, 12, 'Reserved', '2015', '11', '09'),
(1298, 12, 'Reserved', '2015', '11', '09'),
(1299, 12, 'Reserved', '2015', '11', '09'),
(1300, 12, 'Reserved', '2015', '11', '09'),
(1301, 12, 'Reserved', '2015', '11', '09'),
(1302, 12, 'Reserved', '2015', '11', '09'),
(1303, 12, 'Reserved', '2015', '11', '09'),
(1304, 12, 'Reserved', '2015', '11', '09'),
(1305, 12, 'Reserved', '2015', '11', '11'),
(1306, 12, 'Reserved', '2015', '11', '11'),
(1307, 12, 'Reserved', '2015', '11', '11'),
(1308, 12, 'Reserved', '2015', '11', '11'),
(1309, 12, 'Reserved', '2015', '11', '11'),
(1310, 12, 'Reserved', '2015', '11', '12'),
(1311, 12, 'Reserved', '2015', '11', '12'),
(1312, 12, 'Reserved', '2015', '11', '12'),
(1313, 12, 'Reserved', '2015', '11', '12'),
(1314, 12, 'Reserved', '2015', '11', '12'),
(1315, 12, 'Reserved', '2015', '11', '12'),
(1316, 12, 'Reserved', '2015', '11', '12'),
(1317, 12, 'Reserved', '2015', '11', '12'),
(1318, 12, 'Reserved', '2015', '11', '12'),
(1319, 12, 'Reserved', '2015', '11', '12'),
(1320, 12, 'Reserved', '2015', '11', '12'),
(1321, 12, 'Reserved', '2015', '11', '12'),
(1322, 12, 'Reserved', '2015', '11', '12'),
(1323, 12, 'Reserved', '2015', '11', '12'),
(1324, 12, 'Reserved', '2015', '11', '12'),
(1325, 12, 'Reserved', '2015', '11', '12'),
(1326, 12, 'Reserved', '2015', '11', '12'),
(1327, 12, 'Reserved', '2015', '11', '12'),
(1328, 12, 'Reserved', '2015', '11', '12'),
(1329, 12, 'Reserved', '2015', '11', '13'),
(1330, 12, 'Reserved', '2015', '11', '13'),
(1331, 12, 'Reserved', '2015', '11', '16'),
(1332, 12, 'Reserved', '2015', '11', '16'),
(1333, 12, 'Reserved', '2015', '11', '16'),
(1334, 12, 'Reserved', '2015', '11', '16'),
(1335, 12, 'Reserved', '2015', '11', '16'),
(1336, 12, 'Reserved', '2015', '11', '16'),
(1337, 12, 'Reserved', '2015', '12', '14'),
(1338, 12, 'Reserved', '2015', '12', '14'),
(1339, 12, 'Reserved', '2015', '12', '14'),
(1340, 12, 'Reserved', '2015', '12', '14'),
(1341, 12, 'Reserved', '2015', '12', '14'),
(1342, 12, 'Reserved', '2015', '12', '14'),
(1343, 12, 'Reserved', '2015', '12', '14'),
(1344, 12, 'Reserved', '2015', '12', '14'),
(1345, 12, 'Reserved', '2015', '12', '14'),
(1346, 12, 'Reserved', '2015', '12', '14'),
(1347, 12, 'Reserved', '2015', '12', '14'),
(1348, 12, 'Reserved', '2015', '12', '14'),
(1349, 12, 'Reserved', '2015', '12', '14'),
(1350, 12, 'Reserved', '2015', '12', '14'),
(1351, 12, 'Reserved', '2015', '12', '14'),
(1352, 12, 'Reserved', '2015', '12', '14'),
(1353, 12, 'Reserved', '2015', '12', '14'),
(1354, 12, 'Reserved', '2015', '12', '14'),
(1355, 12, 'Reserved', '2015', '12', '14'),
(1356, 12, 'Reserved', '2015', '12', '14'),
(1357, 12, 'Reserved', '2015', '12', '14'),
(1358, 12, 'Reserved', '2015', '12', '14'),
(1359, 12, 'Reserved', '2015', '12', '14'),
(1360, 12, 'Reserved', '2015', '12', '14'),
(1361, 12, 'Reserved', '2015', '12', '14'),
(1362, 12, 'Reserved', '2015', '12', '14'),
(1363, 12, 'Reserved', '2015', '12', '14'),
(1364, 12, 'Reserved', '2015', '12', '14'),
(1365, 12, 'Reserved', '2015', '12', '14'),
(1366, 12, 'Reserved', '2015', '12', '15'),
(1367, 12, 'Reserved', '2015', '12', '15'),
(1368, 12, 'Reserved', '2015', '12', '15'),
(1369, 12, 'Reserved', '2015', '12', '15'),
(1370, 12, 'Reserved', '2015', '12', '15'),
(1371, 12, 'Reserved', '2015', '12', '15'),
(1372, 12, 'Reserved', '2015', '12', '15'),
(1373, 12, 'Reserved', '2015', '12', '15'),
(1374, 12, 'Reserved', '2015', '12', '15'),
(1375, 12, 'Reserved', '2015', '12', '15'),
(1376, 12, 'Reserved', '2016', '01', '17'),
(1377, 12, 'Reserved', '2016', '01', '25'),
(1378, 12, 'Reserved', '2016', '01', '25'),
(1379, 15, '', '2016', '07', '21'),
(1380, 14, '', '2016', '07', '21'),
(1381, 13, '', '2016', '07', '21'),
(1382, 13, '', '2016', '07', '21'),
(1383, 15, '', '2016', '07', '21'),
(1384, 14, '', '2016', '07', '21'),
(1385, 14, '', '2016', '07', '21'),
(1386, 14, '', '2016', '07', '21'),
(1387, 13, '', '2016', '07', '21'),
(1388, 15, '', '2016', '07', '21'),
(1389, 15, '', '2016', '07', '21'),
(1390, 15, '', '2016', '07', '21'),
(1391, 15, '', '2016', '07', '21'),
(1392, 14, '', '2016', '07', '21'),
(1393, 13, '', '2016', '07', '21'),
(1394, 14, '', '2016', '07', '21'),
(1395, 14, '', '2016', '07', '21'),
(1396, 15, '', '2016', '07', '21'),
(1397, 13, '', '2016', '07', '21'),
(1398, 14, '', '2016', '07', '21'),
(1399, 13, '', '2016', '07', '21'),
(1400, 15, '', '2016', '07', '21'),
(1401, 13, '', '2016', '07', '21'),
(1402, 14, '', '2016', '07', '21'),
(1403, 14, '', '2016', '07', '21'),
(1404, 13, '', '2016', '07', '21'),
(1405, 15, '', '2016', '07', '21'),
(1406, 13, '', '2016', '07', '21'),
(1407, 14, '', '2016', '07', '21'),
(1408, 15, '', '2016', '07', '21'),
(1409, 14, '', '2016', '07', '21'),
(1410, 13, '', '2016', '07', '21'),
(1411, 15, '', '2016', '07', '21'),
(1412, 15, '', '2016', '07', '21'),
(1413, 14, '', '2016', '07', '21'),
(1414, 13, '', '2016', '07', '21'),
(1415, 13, '', '2016', '07', '21'),
(1416, 14, '', '2016', '07', '21'),
(1417, 15, '', '2016', '07', '21'),
(1418, 13, '', '2016', '07', '21'),
(1419, 15, '', '2016', '07', '21'),
(1420, 15, '', '2016', '07', '21'),
(1421, 14, '', '2016', '07', '21'),
(1422, 13, '', '2016', '07', '21'),
(1423, 14, '', '2016', '07', '21'),
(1424, 15, '', '2016', '07', '21'),
(1425, 13, '', '2016', '07', '21'),
(1426, 14, '', '2016', '07', '21'),
(1427, 15, '', '2016', '07', '21'),
(1428, 13, '', '2016', '07', '21'),
(1429, 14, '', '2016', '07', '21'),
(1430, 15, '', '2016', '07', '21'),
(1431, 13, '', '2016', '07', '21'),
(1432, 15, '', '2016', '07', '21'),
(1433, 13, '', '2016', '07', '21'),
(1434, 14, '', '2016', '07', '21'),
(1435, 15, '', '2016', '07', '21'),
(1436, 14, '', '2016', '07', '21'),
(1437, 13, '', '2016', '07', '21'),
(1438, 14, '', '2016', '07', '21'),
(1439, 15, '', '2016', '07', '21'),
(1440, 15, '', '2016', '07', '21'),
(1441, 14, '', '2016', '07', '21'),
(1442, 13, '', '2016', '07', '21'),
(1443, 15, '', '2016', '07', '21'),
(1444, 15, '', '2016', '07', '21'),
(1445, 13, '', '2016', '07', '21'),
(1446, 13, '', '2016', '07', '21'),
(1447, 15, '', '2016', '07', '21'),
(1448, 13, '', '2016', '07', '21'),
(1449, 14, '', '2016', '07', '21'),
(1450, 13, '', '2016', '07', '21'),
(1451, 15, '', '2016', '07', '21'),
(1452, 13, '', '2016', '07', '21'),
(1453, 14, '', '2016', '07', '21'),
(1454, 14, '', '2016', '07', '21'),
(1455, 15, '', '2016', '07', '21'),
(1456, 15, '', '2016', '07', '21'),
(1457, 14, '', '2016', '07', '21'),
(1458, 15, '', '2016', '07', '21'),
(1459, 14, '', '2016', '07', '21'),
(1460, 13, '', '2016', '07', '21'),
(1461, 15, '', '2016', '07', '21'),
(1462, 15, '', '2016', '07', '21'),
(1463, 13, '', '2016', '07', '21'),
(1464, 15, '', '2016', '07', '21'),
(1465, 14, '', '2016', '07', '21'),
(1466, 13, '', '2016', '07', '21'),
(1467, 15, '', '2016', '07', '21'),
(1468, 14, '', '2016', '07', '21'),
(1469, 15, '', '2016', '07', '21'),
(1470, 15, '', '2016', '07', '21'),
(1471, 13, '', '2016', '07', '21'),
(1472, 13, '', '2016', '07', '21'),
(1473, 15, '', '2016', '07', '21'),
(1474, 15, '', '2016', '07', '21'),
(1475, 13, '', '2016', '07', '21'),
(1476, 13, '', '2016', '07', '21'),
(1477, 15, '', '2016', '07', '21'),
(1478, 14, '', '2016', '07', '21'),
(1479, 13, '', '2016', '07', '21'),
(1480, 14, '', '2016', '07', '21'),
(1481, 15, '', '2016', '07', '21'),
(1482, 14, '', '2016', '07', '21'),
(1483, 13, '', '2016', '07', '21'),
(1484, 14, '', '2016', '07', '21'),
(1485, 13, '', '2016', '07', '21'),
(1486, 15, '', '2016', '07', '21'),
(1487, 13, '', '2016', '07', '21'),
(1488, 13, '', '2016', '07', '21'),
(1489, 15, '', '2016', '07', '21'),
(1490, 15, '', '2016', '07', '21'),
(1491, 14, '', '2016', '07', '21'),
(1492, 14, '', '2016', '07', '21'),
(1493, 13, '', '2016', '07', '21'),
(1494, 14, '', '2016', '07', '21'),
(1495, 13, '', '2016', '07', '21'),
(1496, 14, '', '2016', '07', '21'),
(1497, 13, '', '2016', '07', '21'),
(1498, 15, '', '2016', '07', '21'),
(1499, 14, '', '2016', '07', '21'),
(1500, 14, '', '2016', '07', '21'),
(1501, 15, '', '2016', '07', '21'),
(1502, 13, '', '2016', '07', '21'),
(1503, 15, '', '2016', '07', '21'),
(1504, 15, '', '2016', '07', '21'),
(1505, 13, '', '2016', '07', '21'),
(1506, 14, '', '2016', '07', '21'),
(1507, 13, '', '2016', '07', '21'),
(1508, 13, '', '2016', '07', '21'),
(1509, 14, '', '2016', '07', '21'),
(1510, 14, '', '2016', '07', '21'),
(1511, 15, '', '2016', '07', '21'),
(1512, 14, '', '2016', '07', '21'),
(1513, 13, '', '2016', '07', '21'),
(1514, 13, '', '2016', '07', '21'),
(1515, 15, '', '2016', '07', '21'),
(1516, 14, '', '2016', '07', '21'),
(1517, 13, '', '2016', '07', '21'),
(1518, 14, '', '2016', '07', '21'),
(1519, 15, '', '2016', '07', '21'),
(1520, 15, '', '2016', '07', '24'),
(1521, 13, '', '2016', '07', '24'),
(1522, 14, '', '2016', '07', '24'),
(1523, 15, '', '2016', '07', '24'),
(1524, 14, '', '2016', '07', '24'),
(1525, 13, '', '2016', '07', '24'),
(1526, 15, '', '2016', '07', '24'),
(1527, 13, '', '2016', '07', '24'),
(1528, 13, '', '2016', '07', '24'),
(1529, 15, '', '2016', '07', '24'),
(1530, 13, '', '2016', '07', '24'),
(1531, 15, '', '2016', '07', '24'),
(1532, 14, '', '2016', '07', '24'),
(1533, 13, '', '2016', '07', '24'),
(1534, 15, '', '2016', '07', '24'),
(1535, 13, '', '2016', '07', '24'),
(1536, 14, '', '2016', '07', '24'),
(1537, 15, '', '2016', '07', '24'),
(1538, 14, '', '2016', '07', '24'),
(1539, 13, '', '2016', '07', '24'),
(1540, 15, '', '2016', '07', '24'),
(1541, 13, '', '2016', '07', '24'),
(1542, 14, '', '2016', '07', '24'),
(1543, 13, '', '2016', '07', '24'),
(1544, 15, '', '2016', '07', '24'),
(1545, 13, '', '2016', '07', '24'),
(1546, 13, '', '2016', '07', '24'),
(1547, 14, '', '2016', '07', '24'),
(1548, 13, '', '2016', '07', '24'),
(1549, 15, '', '2016', '07', '24'),
(1550, 15, '', '2016', '07', '24'),
(1551, 14, '', '2016', '07', '24'),
(1552, 15, '', '2016', '07', '24'),
(1553, 14, '', '2016', '07', '24'),
(1554, 15, '', '2016', '07', '24'),
(1555, 13, '', '2016', '07', '24'),
(1556, 15, '', '2016', '07', '24'),
(1557, 14, '', '2016', '07', '24'),
(1558, 13, '', '2016', '07', '24'),
(1559, 15, '', '2016', '07', '24'),
(1560, 15, '', '2016', '07', '24'),
(1561, 13, '', '2016', '07', '24'),
(1562, 13, '', '2016', '07', '24'),
(1563, 15, '', '2016', '07', '24'),
(1564, 14, '', '2016', '07', '24'),
(1565, 15, '', '2016', '07', '24'),
(1566, 14, '', '2016', '07', '24'),
(1567, 13, '', '2016', '07', '24'),
(1568, 15, '', '2016', '07', '24'),
(1569, 14, '', '2016', '07', '24'),
(1570, 13, '', '2016', '07', '24'),
(1571, 13, '', '2016', '07', '24'),
(1572, 15, '', '2016', '07', '24'),
(1573, 15, '', '2016', '07', '24'),
(1574, 13, '', '2016', '07', '24'),
(1575, 15, '', '2016', '07', '24'),
(1576, 13, '', '2016', '07', '24'),
(1577, 13, '', '2016', '07', '24'),
(1578, 14, '', '2016', '07', '24'),
(1579, 15, '', '2016', '07', '24'),
(1580, 15, '', '2016', '07', '24'),
(1581, 14, '', '2016', '07', '24'),
(1582, 13, '', '2016', '07', '24'),
(1583, 13, '', '2016', '07', '24'),
(1584, 13, '', '2016', '07', '24'),
(1585, 14, '', '2016', '07', '24'),
(1586, 15, '', '2016', '07', '24'),
(1587, 14, '', '2016', '07', '24'),
(1588, 13, '', '2016', '07', '24'),
(1589, 13, '', '2016', '07', '24'),
(1590, 13, '', '2016', '07', '24'),
(1591, 15, '', '2016', '07', '24'),
(1592, 14, '', '2016', '07', '24'),
(1593, 14, '', '2016', '07', '24'),
(1594, 14, '', '2016', '07', '24'),
(1595, 14, '', '2016', '07', '24'),
(1596, 14, '', '2016', '07', '24'),
(1597, 13, '', '2016', '07', '24'),
(1598, 14, '', '2016', '07', '24'),
(1599, 14, '', '2016', '07', '24'),
(1600, 15, '', '2016', '07', '24'),
(1601, 15, '', '2016', '07', '24'),
(1602, 14, '', '2016', '07', '24'),
(1603, 13, '', '2016', '07', '24'),
(1604, 15, '', '2016', '07', '24'),
(1605, 13, '', '2016', '07', '24'),
(1606, 15, '', '2016', '07', '24'),
(1607, 15, '', '2016', '07', '24'),
(1608, 13, '', '2016', '07', '24'),
(1609, 14, '', '2016', '07', '24'),
(1610, 13, '', '2016', '07', '24'),
(1611, 14, '', '2016', '07', '24'),
(1612, 15, '', '2016', '07', '24'),
(1613, 13, '', '2016', '07', '24'),
(1614, 15, '', '2016', '07', '24'),
(1615, 13, '', '2016', '07', '24'),
(1616, 14, '', '2016', '07', '24'),
(1617, 14, '', '2016', '07', '24'),
(1618, 15, '', '2016', '07', '24'),
(1619, 13, '', '2016', '07', '24'),
(1620, 15, '', '2016', '07', '24'),
(1621, 14, '', '2016', '07', '24'),
(1622, 13, '', '2016', '07', '24'),
(1623, 13, '', '2016', '07', '24'),
(1624, 14, '', '2016', '07', '24'),
(1625, 13, '', '2016', '07', '24'),
(1626, 14, '', '2016', '07', '24'),
(1627, 15, '', '2016', '07', '24'),
(1628, 13, '', '2016', '07', '24'),
(1629, 13, '', '2016', '07', '24'),
(1630, 14, '', '2016', '07', '24'),
(1631, 13, '', '2016', '07', '24'),
(1632, 15, '', '2016', '07', '24'),
(1633, 14, '', '2016', '07', '24'),
(1634, 13, '', '2016', '07', '24'),
(1635, 15, '', '2016', '07', '24'),
(1636, 14, '', '2016', '07', '24'),
(1637, 14, '', '2016', '07', '25'),
(1638, 15, '', '2016', '07', '25'),
(1639, 13, '', '2016', '07', '25'),
(1640, 13, '', '2016', '07', '25'),
(1641, 14, '', '2016', '07', '25'),
(1642, 14, '', '2016', '07', '25'),
(1643, 13, '', '2016', '07', '25'),
(1644, 15, '', '2016', '07', '25'),
(1645, 14, '', '2016', '07', '25'),
(1646, 15, '', '2016', '07', '25'),
(1647, 15, '', '2016', '07', '25'),
(1648, 13, '', '2016', '07', '25'),
(1649, 13, '', '2016', '07', '25'),
(1650, 15, '', '2016', '07', '25'),
(1651, 14, '', '2016', '07', '25'),
(1652, 14, '', '2016', '07', '25'),
(1653, 13, '', '2016', '07', '25'),
(1654, 15, '', '2016', '07', '25'),
(1655, 14, '', '2016', '07', '25'),
(1656, 13, '', '2016', '07', '25'),
(1657, 15, '', '2016', '07', '25'),
(1658, 14, '', '2016', '07', '25'),
(1659, 13, '', '2016', '07', '25'),
(1660, 13, '', '2016', '07', '25'),
(1661, 14, '', '2016', '07', '25'),
(1662, 13, '', '2016', '07', '25'),
(1663, 14, '', '2016', '07', '25'),
(1664, 14, '', '2016', '07', '25'),
(1665, 15, '', '2016', '07', '25'),
(1666, 13, '', '2016', '07', '25'),
(1667, 14, '', '2016', '07', '25'),
(1668, 15, '', '2016', '07', '25'),
(1669, 13, '', '2016', '07', '25'),
(1670, 14, '', '2016', '07', '25'),
(1671, 15, '', '2016', '07', '25'),
(1672, 13, '', '2016', '07', '25'),
(1673, 13, '', '2016', '07', '25'),
(1674, 15, '', '2016', '07', '25'),
(1675, 14, '', '2016', '07', '25'),
(1676, 14, '', '2016', '07', '25'),
(1677, 13, '', '2016', '07', '25'),
(1678, 15, '', '2016', '07', '25'),
(1679, 14, '', '2016', '07', '25'),
(1680, 13, '', '2016', '07', '25'),
(1681, 15, '', '2016', '07', '25'),
(1682, 15, '', '2016', '07', '25'),
(1683, 14, '', '2016', '07', '25'),
(1684, 13, '', '2016', '07', '25'),
(1685, 13, '', '2016', '07', '25'),
(1686, 14, '', '2016', '07', '25'),
(1687, 13, '', '2016', '07', '25'),
(1688, 14, '', '2016', '07', '25'),
(1689, 14, '', '2016', '07', '25'),
(1690, 13, '', '2016', '07', '25'),
(1691, 15, '', '2016', '07', '25'),
(1692, 13, '', '2016', '07', '25'),
(1693, 13, '', '2016', '07', '25'),
(1694, 15, '', '2016', '07', '25'),
(1695, 14, '', '2016', '07', '25'),
(1696, 14, '', '2016', '07', '25'),
(1697, 13, '', '2016', '07', '25'),
(1698, 13, '', '2016', '07', '25'),
(1699, 14, '', '2016', '07', '25'),
(1700, 15, '', '2016', '07', '25'),
(1701, 14, '', '2016', '07', '25'),
(1702, 13, '', '2016', '07', '25'),
(1703, 15, '', '2016', '07', '25'),
(1704, 14, '', '2016', '07', '25'),
(1705, 15, '', '2016', '07', '25'),
(1706, 13, '', '2016', '07', '25'),
(1707, 15, '', '2016', '07', '25'),
(1708, 13, '', '2016', '07', '25'),
(1709, 14, '', '2016', '07', '25'),
(1710, 13, '', '2016', '07', '25'),
(1711, 14, '', '2016', '07', '25'),
(1712, 15, '', '2016', '07', '25'),
(1713, 14, '', '2016', '07', '25'),
(1714, 15, '', '2016', '07', '25'),
(1715, 13, '', '2016', '07', '25'),
(1716, 15, '', '2016', '07', '25'),
(1717, 13, '', '2016', '07', '25'),
(1718, 14, '', '2016', '07', '25'),
(1719, 15, '', '2016', '07', '25'),
(1720, 13, '', '2016', '07', '25'),
(1721, 14, '', '2016', '07', '25'),
(1722, 14, '', '2016', '07', '25'),
(1723, 13, '', '2016', '07', '25'),
(1724, 15, '', '2016', '07', '25'),
(1725, 13, '', '2016', '07', '25'),
(1726, 14, '', '2016', '07', '25'),
(1727, 15, '', '2016', '07', '25'),
(1728, 15, '', '2016', '07', '25'),
(1729, 14, '', '2016', '07', '25'),
(1730, 14, '', '2016', '07', '25'),
(1731, 15, '', '2016', '07', '25'),
(1732, 13, '', '2016', '07', '25'),
(1733, 15, '', '2016', '07', '25'),
(1734, 15, '', '2016', '07', '25'),
(1735, 13, '', '2016', '07', '25'),
(1736, 15, '', '2016', '07', '25'),
(1737, 13, '', '2016', '07', '25'),
(1738, 14, '', '2016', '07', '25'),
(1739, 15, '', '2016', '07', '25'),
(1740, 14, '', '2016', '07', '25'),
(1741, 13, '', '2016', '07', '25'),
(1742, 14, '', '2016', '08', '01'),
(1743, 13, '', '2016', '08', '01'),
(1744, 15, '', '2016', '08', '01'),
(1745, 15, '', '2016', '08', '01'),
(1746, 13, '', '2016', '08', '01'),
(1747, 14, '', '2016', '08', '01'),
(1748, 14, '', '2016', '08', '01'),
(1749, 15, '', '2016', '08', '01'),
(1750, 13, '', '2016', '08', '01'),
(1751, 14, '', '2016', '08', '01'),
(1752, 15, '', '2016', '08', '01'),
(1753, 13, '', '2016', '08', '01'),
(1754, 14, '', '2016', '08', '01'),
(1755, 14, '', '2016', '08', '01'),
(1756, 15, '', '2016', '08', '01'),
(1757, 15, '', '2016', '08', '01'),
(1758, 15, '', '2016', '08', '01'),
(1759, 13, '', '2016', '08', '01'),
(1760, 15, '', '2016', '08', '01'),
(1761, 13, '', '2016', '08', '01'),
(1762, 15, '', '2016', '08', '01'),
(1763, 13, '', '2016', '08', '01'),
(1764, 14, '', '2016', '08', '01'),
(1765, 14, '', '2016', '08', '01'),
(1766, 13, '', '2016', '08', '01'),
(1767, 13, '', '2016', '08', '01'),
(1768, 14, '', '2016', '08', '01'),
(1769, 14, '', '2016', '08', '01'),
(1770, 15, '', '2016', '08', '01'),
(1771, 13, '', '2016', '08', '01'),
(1772, 15, '', '2016', '08', '01'),
(1773, 13, '', '2016', '08', '01'),
(1774, 14, '', '2016', '08', '01'),
(1775, 14, '', '2016', '08', '01'),
(1776, 13, '', '2016', '08', '01'),
(1777, 15, '', '2016', '08', '01'),
(1778, 14, '', '2016', '08', '01'),
(1779, 15, '', '2016', '08', '01'),
(1780, 15, '', '2016', '08', '01'),
(1781, 14, '', '2016', '08', '01'),
(1782, 15, '', '2016', '08', '01'),
(1783, 15, '', '2016', '08', '01'),
(1784, 13, '', '2016', '08', '01'),
(1785, 13, '', '2016', '08', '01'),
(1786, 15, '', '2016', '08', '01'),
(1787, 13, '', '2016', '08', '01'),
(1788, 13, '', '2016', '08', '01'),
(1789, 14, '', '2016', '08', '01'),
(1790, 14, '', '2016', '08', '01'),
(1791, 14, '', '2016', '08', '01'),
(1792, 15, '', '2016', '08', '01'),
(1793, 13, '', '2016', '08', '01'),
(1794, 13, '', '2016', '08', '01'),
(1795, 15, '', '2016', '08', '01'),
(1796, 13, '', '2016', '08', '01'),
(1797, 15, '', '2016', '08', '01'),
(1798, 14, '', '2016', '08', '01'),
(1799, 14, '', '2016', '08', '01'),
(1800, 15, '', '2016', '08', '01'),
(1801, 14, '', '2016', '08', '01'),
(1802, 14, '', '2016', '08', '01'),
(1803, 15, '', '2016', '08', '01'),
(1804, 13, '', '2016', '08', '01'),
(1805, 15, '', '2016', '08', '01'),
(1806, 13, '', '2016', '08', '01'),
(1807, 15, '', '2016', '08', '01'),
(1808, 13, '', '2016', '08', '01'),
(1809, 15, '', '2016', '08', '01'),
(1810, 15, '', '2016', '08', '01'),
(1811, 15, '', '2016', '08', '01'),
(1812, 15, '', '2016', '08', '01'),
(1813, 15, '', '2016', '08', '01'),
(1814, 13, '', '2016', '08', '01'),
(1815, 13, '', '2016', '08', '01'),
(1816, 14, '', '2016', '08', '01'),
(1817, 14, '', '2016', '08', '01'),
(1818, 14, '', '2016', '08', '01'),
(1819, 15, '', '2016', '08', '01'),
(1820, 14, '', '2016', '08', '01'),
(1821, 13, '', '2016', '08', '01'),
(1822, 15, '', '2016', '08', '01'),
(1823, 14, '', '2016', '08', '01'),
(1824, 14, '', '2016', '08', '01'),
(1825, 13, '', '2016', '08', '01'),
(1826, 15, '', '2016', '08', '01'),
(1827, 14, '', '2016', '08', '01'),
(1828, 15, '', '2016', '08', '01'),
(1829, 15, '', '2016', '08', '01'),
(1830, 15, '', '2016', '08', '01'),
(1831, 14, '', '2016', '08', '01'),
(1832, 14, '', '2016', '08', '01'),
(1833, 15, '', '2016', '08', '01'),
(1834, 14, '', '2016', '08', '01'),
(1835, 13, '', '2016', '08', '01'),
(1836, 13, '', '2016', '08', '01'),
(1837, 13, '', '2016', '08', '01'),
(1838, 15, '', '2016', '08', '01'),
(1839, 14, '', '2016', '08', '01'),
(1840, 13, '', '2016', '08', '01'),
(1841, 14, '', '2016', '08', '01'),
(1842, 14, '', '2016', '08', '01'),
(1843, 14, '', '2016', '08', '01'),
(1844, 15, '', '2016', '08', '01'),
(1845, 13, '', '2016', '08', '01'),
(1846, 14, '', '2016', '08', '01'),
(1847, 14, '', '2016', '08', '01'),
(1848, 14, '', '2016', '08', '01'),
(1849, 14, '', '2016', '08', '01'),
(1850, 13, '', '2016', '08', '01'),
(1851, 13, '', '2016', '08', '01'),
(1852, 13, '', '2016', '08', '01'),
(1853, 13, '', '2016', '08', '01'),
(1854, 14, '', '2016', '08', '01'),
(1855, 15, '', '2016', '08', '01'),
(1856, 13, '', '2016', '08', '01'),
(1857, 13, '', '2016', '08', '01'),
(1858, 14, '', '2016', '08', '01'),
(1859, 14, '', '2016', '08', '01'),
(1860, 15, '', '2016', '08', '01'),
(1861, 13, '', '2016', '08', '01'),
(1862, 14, '', '2016', '08', '01'),
(1863, 14, '', '2016', '08', '01'),
(1864, 15, '', '2016', '08', '01'),
(1865, 13, '', '2016', '08', '01'),
(1866, 15, '', '2016', '08', '01'),
(1867, 15, '', '2016', '08', '01'),
(1868, 13, '', '2016', '08', '01'),
(1869, 14, '', '2016', '08', '01'),
(1870, 13, '', '2016', '08', '01'),
(1871, 14, '', '2016', '08', '01'),
(1872, 14, '', '2016', '08', '01'),
(1873, 13, '', '2016', '08', '01'),
(1874, 14, '', '2016', '08', '01'),
(1875, 13, '', '2016', '08', '01'),
(1876, 14, '', '2016', '08', '01'),
(1877, 13, '', '2016', '08', '01'),
(1878, 15, '', '2016', '08', '01'),
(1879, 13, '', '2016', '08', '01'),
(1880, 14, '', '2016', '08', '01'),
(1881, 13, '', '2016', '08', '01'),
(1882, 13, '', '2016', '08', '01'),
(1883, 15, '', '2016', '08', '01'),
(1884, 13, '', '2016', '08', '01'),
(1885, 14, '', '2016', '08', '01'),
(1886, 13, '', '2016', '08', '01'),
(1887, 13, '', '2016', '08', '01'),
(1888, 13, '', '2016', '08', '01'),
(1889, 15, '', '2016', '08', '01'),
(1890, 14, '', '2016', '08', '01'),
(1891, 15, '', '2016', '08', '01'),
(1892, 13, '', '2016', '08', '01'),
(1893, 13, '', '2016', '08', '01'),
(1894, 13, '', '2016', '08', '01'),
(1895, 13, '', '2016', '08', '01'),
(1896, 14, '', '2016', '08', '01'),
(1897, 14, '', '2016', '08', '01'),
(1898, 13, '', '2016', '08', '01'),
(1899, 15, '', '2016', '08', '01'),
(1900, 13, '', '2016', '08', '01'),
(1901, 14, '', '2016', '08', '01'),
(1902, 15, '', '2016', '08', '01'),
(1903, 15, '', '2016', '08', '01'),
(1904, 15, '', '2016', '08', '01'),
(1905, 13, '', '2016', '08', '01'),
(1906, 14, '', '2016', '08', '01'),
(1907, 15, '', '2016', '08', '01'),
(1908, 15, '', '2016', '08', '01'),
(1909, 14, '', '2016', '08', '01'),
(1910, 15, '', '2016', '08', '01'),
(1911, 15, '', '2016', '08', '01'),
(1912, 14, '', '2016', '08', '01'),
(1913, 15, '', '2016', '08', '01'),
(1914, 15, '', '2016', '08', '01'),
(1915, 13, '', '2016', '08', '01'),
(1916, 15, '', '2016', '08', '01'),
(1917, 14, '', '2016', '08', '01'),
(1918, 15, '', '2016', '08', '01'),
(1919, 13, '', '2016', '08', '01'),
(1920, 14, '', '2016', '08', '01'),
(1921, 15, '', '2016', '08', '01'),
(1922, 13, '', '2016', '08', '01'),
(1923, 14, '', '2016', '08', '01'),
(1924, 15, '', '2016', '08', '01'),
(1925, 14, '', '2016', '09', '04'),
(1926, 13, '', '2016', '09', '04'),
(1927, 15, '', '2016', '09', '04'),
(1928, 15, '', '2016', '09', '04'),
(1929, 14, '', '2016', '09', '04'),
(1930, 13, '', '2016', '09', '04'),
(1931, 14, '', '2016', '09', '04'),
(1932, 15, '', '2016', '09', '04'),
(1933, 13, '', '2016', '09', '04'),
(1934, 15, '', '2016', '09', '04'),
(1935, 14, '', '2016', '09', '04'),
(1936, 13, '', '2016', '09', '04'),
(1937, 15, '', '2016', '09', '04'),
(1938, 14, '', '2016', '09', '04'),
(1939, 13, '', '2016', '09', '04'),
(1940, 13, '', '2016', '09', '04'),
(1941, 14, '', '2016', '09', '04'),
(1942, 15, '', '2016', '09', '04'),
(1943, 15, '', '2016', '09', '04'),
(1944, 14, '', '2016', '09', '04'),
(1945, 13, '', '2016', '09', '04'),
(1946, 13, '', '2016', '09', '04'),
(1947, 14, '', '2016', '09', '04'),
(1948, 15, '', '2016', '09', '04'),
(1949, 14, '', '2016', '09', '04'),
(1950, 15, '', '2016', '09', '04'),
(1951, 13, '', '2016', '09', '04'),
(1952, 14, '', '2016', '09', '04'),
(1953, 13, '', '2016', '09', '04'),
(1954, 15, '', '2016', '09', '04'),
(1955, 14, '', '2016', '09', '04'),
(1956, 15, '', '2016', '09', '04'),
(1957, 13, '', '2016', '09', '04'),
(1958, 14, '', '2016', '09', '04'),
(1959, 13, '', '2016', '09', '04'),
(1960, 15, '', '2016', '09', '04'),
(1961, 14, '', '2016', '09', '04'),
(1962, 15, '', '2016', '09', '04'),
(1963, 13, '', '2016', '09', '04'),
(1964, 14, '', '2016', '09', '04'),
(1965, 15, '', '2016', '09', '04'),
(1966, 13, '', '2016', '09', '04'),
(1967, 15, '', '2016', '09', '04'),
(1968, 14, '', '2016', '09', '04'),
(1969, 13, '', '2016', '09', '04'),
(1970, 15, '', '2016', '09', '04'),
(1971, 13, '', '2016', '09', '04'),
(1972, 14, '', '2016', '09', '04'),
(1973, 14, '', '2016', '09', '04'),
(1974, 13, '', '2016', '09', '04'),
(1975, 15, '', '2016', '09', '04'),
(1976, 13, '', '2016', '09', '04'),
(1977, 14, '', '2016', '09', '04'),
(1978, 15, '', '2016', '09', '04'),
(1979, 15, '', '2016', '09', '04'),
(1980, 13, '', '2016', '09', '04'),
(1981, 14, '', '2016', '09', '04'),
(1982, 14, '', '2016', '09', '04'),
(1983, 15, '', '2016', '09', '04'),
(1984, 13, '', '2016', '09', '04'),
(1985, 13, '', '2016', '09', '05'),
(1986, 14, '', '2016', '09', '05'),
(1987, 15, '', '2016', '09', '05'),
(1988, 15, '', '2016', '09', '05'),
(1989, 13, '', '2016', '09', '05'),
(1990, 14, '', '2016', '09', '05'),
(1991, 15, '', '2016', '09', '05'),
(1992, 14, '', '2016', '09', '05'),
(1993, 13, '', '2016', '09', '05'),
(1994, 15, '', '2016', '09', '05'),
(1995, 14, '', '2016', '09', '05'),
(1996, 13, '', '2016', '09', '05'),
(1997, 15, '', '2016', '09', '05'),
(1998, 13, '', '2016', '09', '05'),
(1999, 14, '', '2016', '09', '05'),
(2000, 14, '', '2016', '09', '05'),
(2001, 15, '', '2016', '09', '05'),
(2002, 13, '', '2016', '09', '05'),
(2003, 14, '', '2016', '09', '05'),
(2004, 13, '', '2016', '09', '05'),
(2005, 15, '', '2016', '09', '05'),
(2006, 14, '', '2016', '09', '05'),
(2007, 15, '', '2016', '09', '05'),
(2008, 13, '', '2016', '09', '05'),
(2009, 14, '', '2016', '09', '05'),
(2010, 15, '', '2016', '09', '05'),
(2011, 13, '', '2016', '09', '05'),
(2012, 14, '', '2016', '09', '05'),
(2013, 15, '', '2016', '09', '05'),
(2014, 15, '', '2016', '09', '05'),
(2015, 13, '', '2016', '09', '05'),
(2016, 15, '', '2016', '09', '05'),
(2017, 15, '', '2016', '09', '05'),
(2018, 13, '', '2016', '09', '05'),
(2019, 13, '', '2016', '09', '05'),
(2020, 14, '', '2016', '09', '05'),
(2021, 13, '', '2016', '09', '05'),
(2022, 13, '', '2016', '09', '05'),
(2023, 14, '', '2016', '09', '05'),
(2024, 14, '', '2016', '09', '05'),
(2025, 14, '', '2016', '09', '05'),
(2026, 15, '', '2016', '09', '05'),
(2027, 13, '', '2016', '09', '05'),
(2028, 14, '', '2016', '09', '05'),
(2029, 15, '', '2016', '09', '05'),
(2030, 13, '', '2016', '09', '05'),
(2031, 15, '', '2016', '09', '05'),
(2032, 14, '', '2016', '09', '05'),
(2033, 14, '', '2016', '09', '05'),
(2034, 13, '', '2016', '09', '05'),
(2035, 15, '', '2016', '09', '05'),
(2036, 14, '', '2016', '09', '05'),
(2037, 13, '', '2016', '09', '05'),
(2038, 15, '', '2016', '09', '05'),
(2039, 15, '', '2016', '09', '05'),
(2040, 14, '', '2016', '09', '05'),
(2041, 13, '', '2016', '09', '05'),
(2042, 13, '', '2016', '09', '05'),
(2043, 15, '', '2016', '09', '05'),
(2044, 14, '', '2016', '09', '05'),
(2045, 15, '', '2016', '09', '05'),
(2046, 14, '', '2016', '09', '05'),
(2047, 13, '', '2016', '09', '05'),
(2048, 14, '', '2016', '09', '05'),
(2049, 15, '', '2016', '09', '05'),
(2050, 13, '', '2016', '09', '05'),
(2051, 15, '', '2016', '09', '05'),
(2052, 14, '', '2016', '09', '05'),
(2053, 13, '', '2016', '09', '05'),
(2054, 15, '', '2016', '09', '05'),
(2055, 14, '', '2016', '09', '05'),
(2056, 13, '', '2016', '09', '05'),
(2057, 15, '', '2016', '09', '05'),
(2058, 13, '', '2016', '09', '05'),
(2059, 14, '', '2016', '09', '05'),
(2060, 15, '', '2016', '09', '05'),
(2061, 14, '', '2016', '09', '05'),
(2062, 13, '', '2016', '09', '05'),
(2063, 14, '', '2016', '09', '05'),
(2064, 15, '', '2016', '09', '05'),
(2065, 13, '', '2016', '09', '05'),
(2066, 13, '', '2016', '09', '05'),
(2067, 15, '', '2016', '09', '05'),
(2068, 14, '', '2016', '09', '05'),
(2069, 14, '', '2016', '09', '05'),
(2070, 15, '', '2016', '09', '05'),
(2071, 13, '', '2016', '09', '05'),
(2072, 15, '', '2016', '09', '05'),
(2073, 14, '', '2016', '09', '05'),
(2074, 14, '', '2016', '09', '05'),
(2075, 13, '', '2016', '09', '05'),
(2076, 14, '', '2016', '09', '05'),
(2077, 13, '', '2016', '09', '05'),
(2078, 15, '', '2016', '09', '05'),
(2079, 15, '', '2016', '09', '05'),
(2080, 13, '', '2016', '09', '05'),
(2081, 14, '', '2016', '09', '25'),
(2082, 13, '', '2016', '09', '25'),
(2083, 15, '', '2016', '09', '25'),
(2084, 15, '', '2016', '10', '25'),
(2085, 13, '', '2016', '10', '25'),
(2086, 15, 'Reserved', '2017', '01', '20'),
(2087, 13, 'Reserved', '2017', '01', '20'),
(2088, 16, 'Reserved', '2017', '01', '20'),
(2089, 16, 'Reserved', '2017', '01', '20'),
(2090, 16, 'Reserved', '2017', '01', '20'),
(2091, 16, 'Reserved', '2017', '01', '20'),
(2092, 16, 'Reserved', '2017', '01', '20'),
(2093, 16, 'Reserved', '2017', '01', '20'),
(2094, 16, 'Reserved', '2017', '01', '20'),
(2095, 16, 'Reserved', '2017', '01', '20'),
(2096, 16, 'Reserved', '2017', '01', '20'),
(2097, 16, 'Reserved', '2017', '01', '20'),
(2098, 16, 'Reserved', '2017', '01', '20'),
(2099, 16, 'Reserved', '2017', '01', '20'),
(2100, 16, 'Reserved', '2017', '01', '20'),
(2101, 16, 'Reserved', '2017', '01', '20'),
(2102, 16, 'Reserved', '2017', '01', '20'),
(2103, 16, 'Reserved', '2017', '01', '20'),
(2104, 16, 'Reserved', '2017', '01', '20'),
(2105, 16, 'Reserved', '2017', '01', '20'),
(2106, 16, 'Reserved', '2017', '01', '20'),
(2107, 16, 'Reserved', '2017', '01', '20'),
(2108, 16, 'Reserved', '2017', '01', '20'),
(2109, 16, 'Reserved', '2017', '01', '20'),
(2110, 16, 'Reserved', '2017', '01', '20'),
(2111, 16, 'Reserved', '2017', '01', '20'),
(2112, 16, 'Reserved', '2017', '01', '29'),
(2113, 16, 'Reserved', '2017', '01', '29'),
(2114, 16, 'Reserved', '2017', '01', '31'),
(2115, 16, 'Reserved', '2017', '01', '31'),
(2116, 16, '', '2017', '02', '19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `im_sessions`
--

CREATE TABLE `im_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  `pais` varchar(255) NOT NULL,
  `referencia` varchar(255) NOT NULL,
  `navegador` varchar(255) NOT NULL,
  `plataforma` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `anio` varchar(4) NOT NULL,
  `mes` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `im_sessions`
--

INSERT INTO `im_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`, `pais`, `referencia`, `navegador`, `plataforma`, `mobile`, `anio`, `mes`) VALUES
('0f8996c06a7d3d15662821681da99477', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:49.0) Gecko/20100101 Firefox/49.0', 1477279295, 'a:18:{s:9:"user_data";s:0:"";s:10:"referencia";s:63:"http://localhost/omzconstrucciones/impanel/index.php/contenido/";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"10";s:9:"idusuario";s:1:"1";s:6:"nombre";s:10:"Jose Bello";s:5:"cargo";s:15:"Gerente General";s:5:"email";s:27:"joseeduardo.bello@gmail.com";s:8:"telefono";s:11:"04128658193";s:9:"direccion";s:9:"San Diego";s:6:"imagen";s:36:"b96c1b31d84900d4b33ad1f06d055125.jpg";s:7:"usuario";s:6:"jbello";s:6:"status";s:1:"0";s:4:"conf";a:30:{s:16:"meta_descripcion";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:10:"meta_clave";s:174:"construccion, construcciones, ccs, grupo, remodelación, casas, edificios, locales comerciales, cemento, cabillas, venezuela, caracas construccion en valencia, vidrios, acero";s:13:"email_empresa";s:27:"joseeduardo.bello@gmail.com";s:7:"url_web";s:32:"http://www.ccsconstrucciones.com";s:15:"noticias_pagina";s:2:"20";s:13:"key_recatpcha";s:40:"6Ldy4BwTAAAAAHV_vVmyfYXOMcbl1ZmhHTI79QnO";s:11:"api_twitter";s:488:"            <a class="twitter-timeline"  href="https://twitter.com/Planfuturoseg" data-widget-id="692717040994512896" data-width="430" height="350">Tweets por el @Planfuturoseg.</a>\r\n            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?''http'':''https'';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>";s:13:"api_analytics";s:0:"";s:9:"api_otros";s:741:"<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));</script>\r\n<div class="fb-page" data-href="https://www.facebook.com/hotelsalma/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/hotelsalma/"><a href="https://www.facebook.com/hotelsalma/">Hotel Salma Suites VIP, C.A</a></blockquote></div></div>";s:12:"url_facebook";s:39:"http://www.facebook.com/CCSCONSTRUCCION";s:11:"url_twitter";s:38:"http://www.twitter.com/CCSCONSTRUCCION";s:13:"url_instagram";s:40:"http://www.instagram.com/CCSCONSTRUCCION";s:10:"user_skype";s:28:"jose.eduardo.bello.otero....";s:12:"url_pinteres";s:0:"";s:14:"url_googleplus";s:0:"";s:12:"url_linkedin";s:0:"";s:16:"telefono_empresa";s:33:"+58 212.501.25.21 / 407-339-2216 ";s:17:"direccion_empresa";s:65:"Distrito Capital - Caracas / 981 E. ALTAMONTE SPRINGS,L 32701....";s:13:"api_googlemap";s:367:"<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d251097.9245946213!2d-67.03045464854458!3d10.468698840429772!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8c2a58adcd824807%3A0x93dd2eae0a998483!2sCaracas%2C+Distrito+Capital!5e0!3m2!1ses!2sve!4v1469423800981" width="100%" height="auto" frameborder="0" style="border:0" allowfullscreen></iframe>";s:9:"smtp_host";s:0:"";s:9:"smtp_port";s:0:"";s:9:"smtp_user";s:0:"";s:9:"smtp_pass";s:0:"";s:10:"email_from";s:0:"";s:11:"nombre_from";s:0:"";s:9:"copyright";s:28:"Copyrigth © 2016. FMB Group";s:10:"nombre_rss";s:9:"FMB Group";s:15:"descripcion_rss";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:19:"publicidad_noticias";s:1:"4";s:14:"simbolo_moneda";s:1:"0";}s:4:"mods";a:12:{i:0;a:5:{s:6:"nombre";s:18:"Centro de Mensajes";s:3:"url";s:9:"mensajes/";s:5:"icono";s:8:"envelope";s:8:"cantidad";s:2:"10";s:4:"tags";s:8:"contacto";}i:1;a:5:{s:6:"nombre";s:8:"Clientes";s:3:"url";s:9:"clientes/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"clientes";}i:2;a:5:{s:6:"nombre";s:11:"Colecciones";s:3:"url";s:12:"colecciones/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:11:"colecciones";}i:3;a:5:{s:6:"nombre";s:14:"Configuración";s:3:"url";s:14:"configuracion/";s:5:"icono";s:6:"wrench";s:8:"cantidad";s:1:"0";s:4:"tags";s:13:"configuracion";}i:4;a:5:{s:6:"nombre";s:14:"Gestor de Menu";s:3:"url";s:5:"menu/";s:5:"icono";s:9:"list-alt ";s:8:"cantidad";s:1:"0";s:4:"tags";s:4:"menu";}i:5;a:5:{s:6:"nombre";s:8:"Noticias";s:3:"url";s:9:"noticias/";s:5:"icono";s:5:"globe";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"noticias";}i:6;a:5:{s:6:"nombre";s:5:"Obras";s:3:"url";s:6:"obras/";s:5:"icono";s:8:"building";s:8:"cantidad";s:1:"0";s:4:"tags";s:5:"obras";}i:7;a:5:{s:6:"nombre";s:20:"Paginas de Contenido";s:3:"url";s:10:"contenido/";s:5:"icono";s:6:"file-o";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"contenido";}i:8;a:5:{s:6:"nombre";s:9:"Productos";s:3:"url";s:10:"productos/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"productos";}i:9;a:5:{s:6:"nombre";s:10:"Publicidad";s:3:"url";s:11:"publicidad/";s:5:"icono";s:20:"external-link-square";s:8:"cantidad";s:1:"0";s:4:"tags";s:10:"publicidad";}i:10;a:5:{s:6:"nombre";s:9:"Slideshow";s:3:"url";s:10:"slideshow/";s:5:"icono";s:13:"camera-retro ";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"slidehosw";}i:11;a:5:{s:6:"nombre";s:8:"Usuarios";s:3:"url";s:9:"usuarios/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"usuarios";}}}', '', 'http://localhost/omzconstrucciones/impanel/index.php/contenido/', 'Firefox', 'Unknown Windows OS', '', '2016', '10'),
('103a01344cef6da2b7a77667758be6d9', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', 1487945770, 'a:18:{s:9:"user_data";s:0:"";s:10:"referencia";s:0:"";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2017";s:3:"mes";s:2:"02";s:9:"idusuario";s:1:"1";s:6:"nombre";s:10:"Jose Bello";s:5:"cargo";s:15:"Gerente General";s:5:"email";s:27:"joseeduardo.bello@gmail.com";s:8:"telefono";s:11:"04128658193";s:9:"direccion";s:9:"San Diego";s:6:"imagen";s:36:"b96c1b31d84900d4b33ad1f06d055125.jpg";s:7:"usuario";s:6:"jbello";s:6:"status";s:1:"0";s:4:"conf";a:30:{s:16:"meta_descripcion";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:10:"meta_clave";s:174:"construccion, construcciones, ccs, grupo, remodelación, casas, edificios, locales comerciales, cemento, cabillas, venezuela, caracas construccion en valencia, vidrios, acero";s:13:"email_empresa";s:27:"joseeduardo.bello@gmail.com";s:7:"url_web";s:32:"http://www.ccsconstrucciones.com";s:15:"noticias_pagina";s:2:"20";s:13:"key_recatpcha";s:40:"6Ldy4BwTAAAAAHV_vVmyfYXOMcbl1ZmhHTI79QnO";s:11:"api_twitter";s:488:"            <a class="twitter-timeline"  href="https://twitter.com/Planfuturoseg" data-widget-id="692717040994512896" data-width="430" height="350">Tweets por el @Planfuturoseg.</a>\r\n            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?''http'':''https'';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>";s:13:"api_analytics";s:0:"";s:9:"api_otros";s:741:"<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));</script>\r\n<div class="fb-page" data-href="https://www.facebook.com/hotelsalma/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/hotelsalma/"><a href="https://www.facebook.com/hotelsalma/">Hotel Salma Suites VIP, C.A</a></blockquote></div></div>";s:12:"url_facebook";s:39:"http://www.facebook.com/omzconstruccion";s:11:"url_twitter";s:38:"http://www.twitter.com/omzconstruccion";s:13:"url_instagram";s:40:"http://www.instagram.com/omzconstruccion";s:10:"user_skype";s:0:"";s:12:"url_pinteres";s:0:"";s:14:"url_googleplus";s:0:"";s:12:"url_linkedin";s:0:"";s:16:"telefono_empresa";s:33:"+58 212.501.25.21 / 407-339-2216 ";s:17:"direccion_empresa";s:65:"Distrito Capital - Caracas / 981 E. ALTAMONTE SPRINGS,L 32701....";s:13:"api_googlemap";s:367:"<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d251097.9245946213!2d-67.03045464854458!3d10.468698840429772!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8c2a58adcd824807%3A0x93dd2eae0a998483!2sCaracas%2C+Distrito+Capital!5e0!3m2!1ses!2sve!4v1469423800981" width="100%" height="auto" frameborder="0" style="border:0" allowfullscreen></iframe>";s:9:"smtp_host";s:0:"";s:9:"smtp_port";s:0:"";s:9:"smtp_user";s:0:"";s:9:"smtp_pass";s:0:"";s:10:"email_from";s:0:"";s:11:"nombre_from";s:0:"";s:9:"copyright";s:50:" © Copiright OMZ Construcciones RIF: J-29741518-1";s:10:"nombre_rss";s:9:"FMB Group";s:15:"descripcion_rss";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:19:"publicidad_noticias";s:1:"4";s:14:"simbolo_moneda";s:1:"0";}s:4:"mods";a:15:{i:0;a:5:{s:6:"nombre";s:18:"Centro de Mensajes";s:3:"url";s:9:"mensajes/";s:5:"icono";s:8:"envelope";s:8:"cantidad";s:2:"10";s:4:"tags";s:8:"contacto";}i:1;a:5:{s:6:"nombre";s:8:"Clientes";s:3:"url";s:9:"clientes/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"clientes";}i:2;a:5:{s:6:"nombre";s:11:"Comentarios";s:3:"url";s:12:"comentarios/";s:5:"icono";s:8:"comments";s:8:"cantidad";s:3:"134";s:4:"tags";s:11:"comentarios";}i:3;a:5:{s:6:"nombre";s:14:"Configuración";s:3:"url";s:14:"configuracion/";s:5:"icono";s:6:"wrench";s:8:"cantidad";s:1:"0";s:4:"tags";s:13:"configuracion";}i:4;a:5:{s:6:"nombre";s:7:"Eventos";s:3:"url";s:8:"eventos/";s:5:"icono";s:5:"globe";s:8:"cantidad";s:1:"0";s:4:"tags";s:7:"eventos";}i:5;a:5:{s:6:"nombre";s:8:"Galerias";s:3:"url";s:8:"galeria/";s:5:"icono";s:4:"film";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"galerias";}i:6;a:5:{s:6:"nombre";s:14:"Gestor de Menu";s:3:"url";s:5:"menu/";s:5:"icono";s:9:"list-alt ";s:8:"cantidad";s:1:"0";s:4:"tags";s:4:"menu";}i:7;a:5:{s:6:"nombre";s:8:"Noticias";s:3:"url";s:9:"noticias/";s:5:"icono";s:5:"globe";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"noticias";}i:8;a:5:{s:6:"nombre";s:20:"Paginas de Contenido";s:3:"url";s:10:"contenido/";s:5:"icono";s:6:"file-o";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"contenido";}i:9;a:5:{s:6:"nombre";s:7:"Pedidos";s:3:"url";s:8:"pedidos/";s:5:"icono";s:14:"shopping-cart ";s:8:"cantidad";s:1:"2";s:4:"tags";s:7:"pedidos";}i:10;a:5:{s:6:"nombre";s:22:"Preguntas y Respuestas";s:3:"url";s:10:"preguntas/";s:5:"icono";s:7:"comment";s:8:"cantidad";s:2:"20";s:4:"tags";s:9:"preguntas";}i:11;a:5:{s:6:"nombre";s:9:"Productos";s:3:"url";s:10:"productos/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"productos";}i:12;a:5:{s:6:"nombre";s:10:"Publicidad";s:3:"url";s:11:"publicidad/";s:5:"icono";s:20:"external-link-square";s:8:"cantidad";s:1:"0";s:4:"tags";s:10:"publicidad";}i:13;a:5:{s:6:"nombre";s:9:"Slideshow";s:3:"url";s:10:"slideshow/";s:5:"icono";s:13:"camera-retro ";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"slidehosw";}i:14;a:5:{s:6:"nombre";s:8:"Usuarios";s:3:"url";s:9:"usuarios/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"usuarios";}}}', '', '', 'Firefox', 'Unknown Windows OS', '', '2017', '02'),
('147f9d708b186f684d8cd45c9a65ce71', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1484870062, '', '', 'http://adidas.pro/impanel/index.php/contenido/', 'Firefox', 'Unknown Windows OS', '', '2017', '01'),
('14966be48e3ec3f267e84d0b6e9e1b66', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', 1487332761, 'a:18:{s:9:"user_data";s:0:"";s:10:"referencia";s:0:"";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2017";s:3:"mes";s:2:"02";s:9:"idusuario";s:1:"1";s:6:"nombre";s:10:"Jose Bello";s:5:"cargo";s:15:"Gerente General";s:5:"email";s:27:"joseeduardo.bello@gmail.com";s:8:"telefono";s:11:"04128658193";s:9:"direccion";s:9:"San Diego";s:6:"imagen";s:36:"b96c1b31d84900d4b33ad1f06d055125.jpg";s:7:"usuario";s:6:"jbello";s:6:"status";s:1:"0";s:4:"conf";a:30:{s:16:"meta_descripcion";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:10:"meta_clave";s:174:"construccion, construcciones, ccs, grupo, remodelación, casas, edificios, locales comerciales, cemento, cabillas, venezuela, caracas construccion en valencia, vidrios, acero";s:13:"email_empresa";s:27:"joseeduardo.bello@gmail.com";s:7:"url_web";s:32:"http://www.ccsconstrucciones.com";s:15:"noticias_pagina";s:2:"20";s:13:"key_recatpcha";s:40:"6Ldy4BwTAAAAAHV_vVmyfYXOMcbl1ZmhHTI79QnO";s:11:"api_twitter";s:488:"            <a class="twitter-timeline"  href="https://twitter.com/Planfuturoseg" data-widget-id="692717040994512896" data-width="430" height="350">Tweets por el @Planfuturoseg.</a>\r\n            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?''http'':''https'';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>";s:13:"api_analytics";s:0:"";s:9:"api_otros";s:741:"<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));</script>\r\n<div class="fb-page" data-href="https://www.facebook.com/hotelsalma/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/hotelsalma/"><a href="https://www.facebook.com/hotelsalma/">Hotel Salma Suites VIP, C.A</a></blockquote></div></div>";s:12:"url_facebook";s:39:"http://www.facebook.com/omzconstruccion";s:11:"url_twitter";s:38:"http://www.twitter.com/omzconstruccion";s:13:"url_instagram";s:40:"http://www.instagram.com/omzconstruccion";s:10:"user_skype";s:0:"";s:12:"url_pinteres";s:0:"";s:14:"url_googleplus";s:0:"";s:12:"url_linkedin";s:0:"";s:16:"telefono_empresa";s:33:"+58 212.501.25.21 / 407-339-2216 ";s:17:"direccion_empresa";s:65:"Distrito Capital - Caracas / 981 E. ALTAMONTE SPRINGS,L 32701....";s:13:"api_googlemap";s:367:"<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d251097.9245946213!2d-67.03045464854458!3d10.468698840429772!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8c2a58adcd824807%3A0x93dd2eae0a998483!2sCaracas%2C+Distrito+Capital!5e0!3m2!1ses!2sve!4v1469423800981" width="100%" height="auto" frameborder="0" style="border:0" allowfullscreen></iframe>";s:9:"smtp_host";s:0:"";s:9:"smtp_port";s:0:"";s:9:"smtp_user";s:0:"";s:9:"smtp_pass";s:0:"";s:10:"email_from";s:0:"";s:11:"nombre_from";s:0:"";s:9:"copyright";s:50:" © Copiright OMZ Construcciones RIF: J-29741518-1";s:10:"nombre_rss";s:9:"FMB Group";s:15:"descripcion_rss";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:19:"publicidad_noticias";s:1:"4";s:14:"simbolo_moneda";s:1:"0";}s:4:"mods";a:12:{i:0;a:5:{s:6:"nombre";s:18:"Centro de Mensajes";s:3:"url";s:9:"mensajes/";s:5:"icono";s:8:"envelope";s:8:"cantidad";s:2:"10";s:4:"tags";s:8:"contacto";}i:1;a:5:{s:6:"nombre";s:8:"Clientes";s:3:"url";s:9:"clientes/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"clientes";}i:2;a:5:{s:6:"nombre";s:11:"Colecciones";s:3:"url";s:12:"colecciones/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:11:"colecciones";}i:3;a:5:{s:6:"nombre";s:14:"Configuración";s:3:"url";s:8:"ajustes/";s:5:"icono";s:6:"wrench";s:8:"cantidad";s:1:"0";s:4:"tags";s:13:"configuracion";}i:4;a:5:{s:6:"nombre";s:14:"Gestor de Menu";s:3:"url";s:5:"menu/";s:5:"icono";s:9:"list-alt ";s:8:"cantidad";s:1:"0";s:4:"tags";s:4:"menu";}i:5;a:5:{s:6:"nombre";s:8:"Noticias";s:3:"url";s:9:"noticias/";s:5:"icono";s:5:"globe";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"noticias";}i:6;a:5:{s:6:"nombre";s:5:"Obras";s:3:"url";s:6:"obras/";s:5:"icono";s:8:"building";s:8:"cantidad";s:1:"0";s:4:"tags";s:5:"obras";}i:7;a:5:{s:6:"nombre";s:20:"Paginas de Contenido";s:3:"url";s:10:"contenido/";s:5:"icono";s:6:"file-o";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"contenido";}i:8;a:5:{s:6:"nombre";s:9:"Productos";s:3:"url";s:10:"productos/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"productos";}i:9;a:5:{s:6:"nombre";s:10:"Publicidad";s:3:"url";s:11:"publicidad/";s:5:"icono";s:20:"external-link-square";s:8:"cantidad";s:1:"0";s:4:"tags";s:10:"publicidad";}i:10;a:5:{s:6:"nombre";s:9:"Slideshow";s:3:"url";s:10:"slideshow/";s:5:"icono";s:13:"camera-retro ";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"slidehosw";}i:11;a:5:{s:6:"nombre";s:8:"Usuarios";s:3:"url";s:9:"usuarios/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"usuarios";}}}', '', '', 'Firefox', 'Unknown Windows OS', '', '2017', '02'),
('18cc8be64d03ef66ebeb63d59c9637a8', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0', 1469412928, 'a:18:{s:9:"user_data";s:0:"";s:10:"referencia";s:64:"http://localhost/ccsconstrucciones/impanel/index.php/escritorio/";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"07";s:9:"idusuario";s:1:"1";s:6:"nombre";s:10:"Jose Bello";s:5:"cargo";s:15:"Gerente General";s:5:"email";s:27:"joseeduardo.bello@gmail.com";s:8:"telefono";s:11:"04128658193";s:9:"direccion";s:9:"San Diego";s:6:"imagen";s:36:"b96c1b31d84900d4b33ad1f06d055125.jpg";s:7:"usuario";s:6:"jbello";s:6:"status";s:1:"0";s:4:"conf";a:30:{s:16:"meta_descripcion";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:10:"meta_clave";s:160:"construccion, construcciones, fmb, grupo, remodelación, casas, edificios, locales comerciales, cemento, cabillas, venezuela, valencia, construccion en valencia";s:13:"email_empresa";s:27:"joseeduardo.bello@gmail.com";s:7:"url_web";s:26:"http://www.fmbgroup.com.ve";s:15:"noticias_pagina";s:2:"20";s:13:"key_recatpcha";s:40:"6Ldy4BwTAAAAAHV_vVmyfYXOMcbl1ZmhHTI79QnO";s:11:"api_twitter";s:488:"            <a class="twitter-timeline"  href="https://twitter.com/Planfuturoseg" data-widget-id="692717040994512896" data-width="430" height="350">Tweets por el @Planfuturoseg.</a>\r\n            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?''http'':''https'';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>";s:13:"api_analytics";s:0:"";s:9:"api_otros";s:741:"<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));</script>\r\n<div class="fb-page" data-href="https://www.facebook.com/hotelsalma/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/hotelsalma/"><a href="https://www.facebook.com/hotelsalma/">Hotel Salma Suites VIP, C.A</a></blockquote></div></div>";s:12:"url_facebook";s:32:"http://www.facebook.com/fmbgroup";s:11:"url_twitter";s:31:"http://www.twitter.com/fmbgroup";s:13:"url_instagram";s:33:"http://www.instagram.com/fmbgroup";s:10:"user_skype";s:0:"";s:12:"url_pinteres";s:0:"";s:14:"url_googleplus";s:0:"";s:12:"url_linkedin";s:0:"";s:16:"telefono_empresa";s:33:"58-241 8221106 -8216283 - 8223863";s:17:"direccion_empresa";s:31:"Valencia - Carabobo - Venezuela";s:13:"api_googlemap";s:388:"<iframe width="100%" height="215" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com.au/maps?f=q&source=s_q&hl=en&geocode=&q=Dhaka,+Dhaka+Division,+Bangladesh&aq=0&oq=dhaka+ban&sll=40.714353,-74.005973&sspn=0.836898,1.815491&ie=UTF8&hq=&hnear=Dhaka+Division,+Bangladesh&t=m&ll=24.542126,90.293884&spn=0.124922,0.411301&z=8&output=embed"></iframe>";s:9:"smtp_host";s:0:"";s:9:"smtp_port";s:0:"";s:9:"smtp_user";s:0:"";s:9:"smtp_pass";s:0:"";s:10:"email_from";s:0:"";s:11:"nombre_from";s:0:"";s:9:"copyright";s:28:"Copyrigth © 2016. FMB Group";s:10:"nombre_rss";s:9:"FMB Group";s:15:"descripcion_rss";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:19:"publicidad_noticias";s:1:"4";s:14:"simbolo_moneda";s:1:"$";}s:4:"mods";a:12:{i:0;a:5:{s:6:"nombre";s:18:"Centro de Mensajes";s:3:"url";s:9:"mensajes/";s:5:"icono";s:8:"envelope";s:8:"cantidad";s:2:"10";s:4:"tags";s:8:"contacto";}i:1;a:5:{s:6:"nombre";s:8:"Clientes";s:3:"url";s:9:"clientes/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"clientes";}i:2;a:5:{s:6:"nombre";s:11:"Colecciones";s:3:"url";s:12:"colecciones/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:11:"colecciones";}i:3;a:5:{s:6:"nombre";s:14:"Configuración";s:3:"url";s:14:"configuracion/";s:5:"icono";s:6:"wrench";s:8:"cantidad";s:1:"0";s:4:"tags";s:13:"configuracion";}i:4;a:5:{s:6:"nombre";s:14:"Gestor de Menu";s:3:"url";s:5:"menu/";s:5:"icono";s:9:"list-alt ";s:8:"cantidad";s:1:"0";s:4:"tags";s:4:"menu";}i:5;a:5:{s:6:"nombre";s:8:"Noticias";s:3:"url";s:9:"noticias/";s:5:"icono";s:5:"globe";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"noticias";}i:6;a:5:{s:6:"nombre";s:5:"Obras";s:3:"url";s:6:"obras/";s:5:"icono";s:8:"building";s:8:"cantidad";s:1:"0";s:4:"tags";s:5:"obras";}i:7;a:5:{s:6:"nombre";s:20:"Paginas de Contenido";s:3:"url";s:10:"contenido/";s:5:"icono";s:6:"file-o";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"contenido";}i:8;a:5:{s:6:"nombre";s:9:"Productos";s:3:"url";s:10:"productos/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"productos";}i:9;a:5:{s:6:"nombre";s:10:"Publicidad";s:3:"url";s:11:"publicidad/";s:5:"icono";s:20:"external-link-square";s:8:"cantidad";s:1:"0";s:4:"tags";s:10:"publicidad";}i:10;a:5:{s:6:"nombre";s:9:"Slideshow";s:3:"url";s:10:"slideshow/";s:5:"icono";s:13:"camera-retro ";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"slidehosw";}i:11;a:5:{s:6:"nombre";s:8:"Usuarios";s:3:"url";s:9:"usuarios/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"usuarios";}}}', '', 'http://localhost/ccsconstrucciones/impanel/index.php/escritorio/', 'Firefox', 'Unknown Windows OS', '', '2016', '07'),
('1a3a63755faa310c8bc674a5a4b5fce1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', 1468050124, '', '', 'http://localhost/soluplasticinternacional/impanel/index.php/configuracion/update', 'Firefox', 'Unknown Windows OS', '', '2016', '07'),
('1a6a0aec119c22ebf16a21592ffc3877', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 1472437512, 'a:18:{s:9:"user_data";s:0:"";s:10:"referencia";s:0:"";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"08";s:9:"idusuario";s:1:"1";s:6:"nombre";s:10:"Jose Bello";s:5:"cargo";s:15:"Gerente General";s:5:"email";s:27:"joseeduardo.bello@gmail.com";s:8:"telefono";s:11:"04128658193";s:9:"direccion";s:9:"San Diego";s:6:"imagen";s:36:"b96c1b31d84900d4b33ad1f06d055125.jpg";s:7:"usuario";s:6:"jbello";s:6:"status";s:1:"0";s:4:"conf";a:30:{s:16:"meta_descripcion";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:10:"meta_clave";s:174:"construccion, construcciones, ccs, grupo, remodelación, casas, edificios, locales comerciales, cemento, cabillas, venezuela, caracas construccion en valencia, vidrios, acero";s:13:"email_empresa";s:27:"joseeduardo.bello@gmail.com";s:7:"url_web";s:32:"http://www.ccsconstrucciones.com";s:15:"noticias_pagina";s:2:"20";s:13:"key_recatpcha";s:40:"6Ldy4BwTAAAAAHV_vVmyfYXOMcbl1ZmhHTI79QnO";s:11:"api_twitter";s:488:"            <a class="twitter-timeline"  href="https://twitter.com/Planfuturoseg" data-widget-id="692717040994512896" data-width="430" height="350">Tweets por el @Planfuturoseg.</a>\r\n            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?''http'':''https'';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>";s:13:"api_analytics";s:0:"";s:9:"api_otros";s:741:"<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));</script>\r\n<div class="fb-page" data-href="https://www.facebook.com/hotelsalma/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/hotelsalma/"><a href="https://www.facebook.com/hotelsalma/">Hotel Salma Suites VIP, C.A</a></blockquote></div></div>";s:12:"url_facebook";s:39:"http://www.facebook.com/CCSCONSTRUCCION";s:11:"url_twitter";s:38:"http://www.twitter.com/CCSCONSTRUCCION";s:13:"url_instagram";s:40:"http://www.instagram.com/CCSCONSTRUCCION";s:10:"user_skype";s:0:"";s:12:"url_pinteres";s:0:"";s:14:"url_googleplus";s:0:"";s:12:"url_linkedin";s:0:"";s:16:"telefono_empresa";s:33:"+58 212.501.25.21 / 407-339-2216 ";s:17:"direccion_empresa";s:61:"Distrito Capital - Caracas / 981 E. ALTAMONTE SPRINGS,L 32701";s:13:"api_googlemap";s:367:"<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d251097.9245946213!2d-67.03045464854458!3d10.468698840429772!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8c2a58adcd824807%3A0x93dd2eae0a998483!2sCaracas%2C+Distrito+Capital!5e0!3m2!1ses!2sve!4v1469423800981" width="100%" height="auto" frameborder="0" style="border:0" allowfullscreen></iframe>";s:9:"smtp_host";s:0:"";s:9:"smtp_port";s:0:"";s:9:"smtp_user";s:0:"";s:9:"smtp_pass";s:0:"";s:10:"email_from";s:0:"";s:11:"nombre_from";s:0:"";s:9:"copyright";s:28:"Copyrigth © 2016. FMB Group";s:10:"nombre_rss";s:9:"FMB Group";s:15:"descripcion_rss";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:19:"publicidad_noticias";s:1:"4";s:14:"simbolo_moneda";s:2:"Bs";}s:4:"mods";a:12:{i:0;a:5:{s:6:"nombre";s:18:"Centro de Mensajes";s:3:"url";s:9:"mensajes/";s:5:"icono";s:8:"envelope";s:8:"cantidad";s:2:"10";s:4:"tags";s:8:"contacto";}i:1;a:5:{s:6:"nombre";s:8:"Clientes";s:3:"url";s:9:"clientes/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"clientes";}i:2;a:5:{s:6:"nombre";s:11:"Colecciones";s:3:"url";s:12:"colecciones/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:11:"colecciones";}i:3;a:5:{s:6:"nombre";s:14:"Configuración";s:3:"url";s:14:"configuracion/";s:5:"icono";s:6:"wrench";s:8:"cantidad";s:1:"0";s:4:"tags";s:13:"configuracion";}i:4;a:5:{s:6:"nombre";s:14:"Gestor de Menu";s:3:"url";s:5:"menu/";s:5:"icono";s:9:"list-alt ";s:8:"cantidad";s:1:"0";s:4:"tags";s:4:"menu";}i:5;a:5:{s:6:"nombre";s:8:"Noticias";s:3:"url";s:9:"noticias/";s:5:"icono";s:5:"globe";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"noticias";}i:6;a:5:{s:6:"nombre";s:5:"Obras";s:3:"url";s:6:"obras/";s:5:"icono";s:8:"building";s:8:"cantidad";s:1:"0";s:4:"tags";s:5:"obras";}i:7;a:5:{s:6:"nombre";s:20:"Paginas de Contenido";s:3:"url";s:10:"contenido/";s:5:"icono";s:6:"file-o";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"contenido";}i:8;a:5:{s:6:"nombre";s:9:"Productos";s:3:"url";s:10:"productos/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"productos";}i:9;a:5:{s:6:"nombre";s:10:"Publicidad";s:3:"url";s:11:"publicidad/";s:5:"icono";s:20:"external-link-square";s:8:"cantidad";s:1:"0";s:4:"tags";s:10:"publicidad";}i:10;a:5:{s:6:"nombre";s:9:"Slideshow";s:3:"url";s:10:"slideshow/";s:5:"icono";s:13:"camera-retro ";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"slidehosw";}i:11;a:5:{s:6:"nombre";s:8:"Usuarios";s:3:"url";s:9:"usuarios/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"usuarios";}}}', '', '', 'Firefox', 'Unknown Windows OS', '', '2016', '08'),
('1b0b05bdc5cb0cc6001f4513532b8e46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', 1467601347, 'a:18:{s:9:"user_data";s:0:"";s:10:"referencia";s:0:"";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"07";s:9:"idusuario";s:1:"1";s:6:"nombre";s:10:"Jose Bello";s:5:"cargo";s:15:"Gerente General";s:5:"email";s:27:"joseeduardo.bello@gmail.com";s:8:"telefono";s:11:"04128658193";s:9:"direccion";s:9:"San Diego";s:6:"imagen";s:36:"b96c1b31d84900d4b33ad1f06d055125.jpg";s:7:"usuario";s:6:"jbello";s:6:"status";s:1:"0";s:4:"conf";a:29:{s:16:"meta_descripcion";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:10:"meta_clave";s:160:"construccion, construcciones, fmb, grupo, remodelación, casas, edificios, locales comerciales, cemento, cabillas, venezuela, valencia, construccion en valencia";s:13:"email_empresa";s:24:"contacto@fmbgroup.com.ve";s:7:"url_web";s:26:"http://www.fmbgroup.com.ve";s:15:"noticias_pagina";s:2:"20";s:13:"key_recatpcha";s:40:"6Ldy4BwTAAAAAHV_vVmyfYXOMcbl1ZmhHTI79QnO";s:11:"api_twitter";s:488:"            <a class="twitter-timeline"  href="https://twitter.com/Planfuturoseg" data-widget-id="692717040994512896" data-width="500" height="500">Tweets por el @Planfuturoseg.</a>\r\n            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?''http'':''https'';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>";s:13:"api_analytics";s:0:"";s:9:"api_otros";s:741:"<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));</script>\r\n<div class="fb-page" data-href="https://www.facebook.com/hotelsalma/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/hotelsalma/"><a href="https://www.facebook.com/hotelsalma/">Hotel Salma Suites VIP, C.A</a></blockquote></div></div>";s:12:"url_facebook";s:32:"http://www.facebook.com/fmbgroup";s:11:"url_twitter";s:31:"http://www.twitter.com/fmbgroup";s:13:"url_instagram";s:33:"http://www.instagram.com/fmbgroup";s:10:"user_skype";s:0:"";s:12:"url_pinteres";s:0:"";s:14:"url_googleplus";s:0:"";s:12:"url_linkedin";s:0:"";s:16:"telefono_empresa";s:33:"58-241 8221106 -8216283 - 8223863";s:17:"direccion_empresa";s:31:"Valencia - Carabobo - Venezuela";s:13:"api_googlemap";s:0:"";s:9:"smtp_host";s:0:"";s:9:"smtp_port";s:0:"";s:9:"smtp_user";s:0:"";s:9:"smtp_pass";s:0:"";s:10:"email_from";s:0:"";s:11:"nombre_from";s:0:"";s:9:"copyright";s:28:"Copyrigth © 2016. FMB Group";s:10:"nombre_rss";s:9:"FMB Group";s:15:"descripcion_rss";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:19:"publicidad_noticias";s:1:"4";}s:4:"mods";a:11:{i:0;a:5:{s:6:"nombre";s:18:"Centro de Mensajes";s:3:"url";s:9:"mensajes/";s:5:"icono";s:8:"envelope";s:8:"cantidad";s:2:"10";s:4:"tags";s:8:"contacto";}i:1;a:5:{s:6:"nombre";s:8:"Clientes";s:3:"url";s:9:"clientes/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"clientes";}i:2;a:5:{s:6:"nombre";s:11:"Colecciones";s:3:"url";s:12:"colecciones/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:11:"colecciones";}i:3;a:5:{s:6:"nombre";s:14:"Configuración";s:3:"url";s:14:"configuracion/";s:5:"icono";s:6:"wrench";s:8:"cantidad";s:1:"0";s:4:"tags";s:13:"configuracion";}i:4;a:5:{s:6:"nombre";s:14:"Gestor de Menu";s:3:"url";s:5:"menu/";s:5:"icono";s:9:"list-alt ";s:8:"cantidad";s:1:"0";s:4:"tags";s:4:"menu";}i:5;a:5:{s:6:"nombre";s:8:"Noticias";s:3:"url";s:9:"noticias/";s:5:"icono";s:5:"globe";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"noticias";}i:6;a:5:{s:6:"nombre";s:20:"Paginas de Contenido";s:3:"url";s:10:"contenido/";s:5:"icono";s:6:"file-o";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"contenido";}i:7;a:5:{s:6:"nombre";s:9:"Productos";s:3:"url";s:10:"productos/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"productos";}i:8;a:5:{s:6:"nombre";s:10:"Publicidad";s:3:"url";s:11:"publicidad/";s:5:"icono";s:20:"external-link-square";s:8:"cantidad";s:1:"0";s:4:"tags";s:10:"publicidad";}i:9;a:5:{s:6:"nombre";s:9:"Slideshow";s:3:"url";s:10:"slideshow/";s:5:"icono";s:13:"camera-retro ";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"slidehosw";}i:10;a:5:{s:6:"nombre";s:8:"Usuarios";s:3:"url";s:9:"usuarios/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"usuarios";}}}', '', '', 'Firefox', 'Unknown Windows OS', '', '2016', '07'),
('1b5e63d52e4288034a48b79cabb0c668', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0', 1469408021, '', '', 'http://localhost/ccsconstrucciones/impanel/index.php/productos/lista_productos/14', 'Firefox', 'Unknown Windows OS', '', '2016', '07'),
('21ef78bd62668c10084577a4b91d09c9', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0', 1469071650, 'a:18:{s:9:"user_data";s:0:"";s:10:"referencia";s:0:"";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"07";s:9:"idusuario";s:1:"1";s:6:"nombre";s:10:"Jose Bello";s:5:"cargo";s:15:"Gerente General";s:5:"email";s:27:"joseeduardo.bello@gmail.com";s:8:"telefono";s:11:"04128658193";s:9:"direccion";s:9:"San Diego";s:6:"imagen";s:36:"b96c1b31d84900d4b33ad1f06d055125.jpg";s:7:"usuario";s:6:"jbello";s:6:"status";s:1:"0";s:4:"conf";a:30:{s:16:"meta_descripcion";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:10:"meta_clave";s:160:"construccion, construcciones, fmb, grupo, remodelación, casas, edificios, locales comerciales, cemento, cabillas, venezuela, valencia, construccion en valencia";s:13:"email_empresa";s:27:"joseeduardo.bello@gmail.com";s:7:"url_web";s:26:"http://www.fmbgroup.com.ve";s:15:"noticias_pagina";s:2:"20";s:13:"key_recatpcha";s:40:"6Ldy4BwTAAAAAHV_vVmyfYXOMcbl1ZmhHTI79QnO";s:11:"api_twitter";s:488:"            <a class="twitter-timeline"  href="https://twitter.com/Planfuturoseg" data-widget-id="692717040994512896" data-width="430" height="350">Tweets por el @Planfuturoseg.</a>\r\n            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?''http'':''https'';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>";s:13:"api_analytics";s:0:"";s:9:"api_otros";s:741:"<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));</script>\r\n<div class="fb-page" data-href="https://www.facebook.com/hotelsalma/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/hotelsalma/"><a href="https://www.facebook.com/hotelsalma/">Hotel Salma Suites VIP, C.A</a></blockquote></div></div>";s:12:"url_facebook";s:32:"http://www.facebook.com/fmbgroup";s:11:"url_twitter";s:31:"http://www.twitter.com/fmbgroup";s:13:"url_instagram";s:33:"http://www.instagram.com/fmbgroup";s:10:"user_skype";s:0:"";s:12:"url_pinteres";s:0:"";s:14:"url_googleplus";s:0:"";s:12:"url_linkedin";s:0:"";s:16:"telefono_empresa";s:33:"58-241 8221106 -8216283 - 8223863";s:17:"direccion_empresa";s:31:"Valencia - Carabobo - Venezuela";s:13:"api_googlemap";s:388:"<iframe width="100%" height="215" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com.au/maps?f=q&source=s_q&hl=en&geocode=&q=Dhaka,+Dhaka+Division,+Bangladesh&aq=0&oq=dhaka+ban&sll=40.714353,-74.005973&sspn=0.836898,1.815491&ie=UTF8&hq=&hnear=Dhaka+Division,+Bangladesh&t=m&ll=24.542126,90.293884&spn=0.124922,0.411301&z=8&output=embed"></iframe>";s:9:"smtp_host";s:0:"";s:9:"smtp_port";s:0:"";s:9:"smtp_user";s:0:"";s:9:"smtp_pass";s:0:"";s:10:"email_from";s:0:"";s:11:"nombre_from";s:0:"";s:9:"copyright";s:28:"Copyrigth © 2016. FMB Group";s:10:"nombre_rss";s:9:"FMB Group";s:15:"descripcion_rss";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:19:"publicidad_noticias";s:1:"4";s:14:"simbolo_moneda";s:1:"$";}s:4:"mods";a:11:{i:0;a:5:{s:6:"nombre";s:18:"Centro de Mensajes";s:3:"url";s:9:"mensajes/";s:5:"icono";s:8:"envelope";s:8:"cantidad";s:2:"10";s:4:"tags";s:8:"contacto";}i:1;a:5:{s:6:"nombre";s:8:"Clientes";s:3:"url";s:9:"clientes/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"clientes";}i:2;a:5:{s:6:"nombre";s:11:"Colecciones";s:3:"url";s:12:"colecciones/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:11:"colecciones";}i:3;a:5:{s:6:"nombre";s:14:"Configuración";s:3:"url";s:14:"configuracion/";s:5:"icono";s:6:"wrench";s:8:"cantidad";s:1:"0";s:4:"tags";s:13:"configuracion";}i:4;a:5:{s:6:"nombre";s:14:"Gestor de Menu";s:3:"url";s:5:"menu/";s:5:"icono";s:9:"list-alt ";s:8:"cantidad";s:1:"0";s:4:"tags";s:4:"menu";}i:5;a:5:{s:6:"nombre";s:8:"Noticias";s:3:"url";s:9:"noticias/";s:5:"icono";s:5:"globe";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"noticias";}i:6;a:5:{s:6:"nombre";s:20:"Paginas de Contenido";s:3:"url";s:10:"contenido/";s:5:"icono";s:6:"file-o";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"contenido";}i:7;a:5:{s:6:"nombre";s:9:"Productos";s:3:"url";s:10:"productos/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"productos";}i:8;a:5:{s:6:"nombre";s:10:"Publicidad";s:3:"url";s:11:"publicidad/";s:5:"icono";s:20:"external-link-square";s:8:"cantidad";s:1:"0";s:4:"tags";s:10:"publicidad";}i:9;a:5:{s:6:"nombre";s:9:"Slideshow";s:3:"url";s:10:"slideshow/";s:5:"icono";s:13:"camera-retro ";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"slidehosw";}i:10;a:5:{s:6:"nombre";s:8:"Usuarios";s:3:"url";s:9:"usuarios/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"usuarios";}}}', '', '', 'Firefox', 'Unknown Windows OS', '', '2016', '07'),
('22cde2623d54033a03ef3ff7e3c8dab4', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', 1487333026, 'a:18:{s:9:"user_data";s:0:"";s:10:"referencia";s:62:"http://localhost:8080/sporthouse/impanel/index.php/escritorio/";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2017";s:3:"mes";s:2:"02";s:9:"idusuario";s:1:"1";s:6:"nombre";s:10:"Jose Bello";s:5:"cargo";s:15:"Gerente General";s:5:"email";s:27:"joseeduardo.bello@gmail.com";s:8:"telefono";s:11:"04128658193";s:9:"direccion";s:9:"San Diego";s:6:"imagen";s:36:"b96c1b31d84900d4b33ad1f06d055125.jpg";s:7:"usuario";s:6:"jbello";s:6:"status";s:1:"0";s:4:"conf";a:30:{s:16:"meta_descripcion";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:10:"meta_clave";s:174:"construccion, construcciones, ccs, grupo, remodelación, casas, edificios, locales comerciales, cemento, cabillas, venezuela, caracas construccion en valencia, vidrios, acero";s:13:"email_empresa";s:27:"joseeduardo.bello@gmail.com";s:7:"url_web";s:32:"http://www.ccsconstrucciones.com";s:15:"noticias_pagina";s:2:"20";s:13:"key_recatpcha";s:40:"6Ldy4BwTAAAAAHV_vVmyfYXOMcbl1ZmhHTI79QnO";s:11:"api_twitter";s:488:"            <a class="twitter-timeline"  href="https://twitter.com/Planfuturoseg" data-widget-id="692717040994512896" data-width="430" height="350">Tweets por el @Planfuturoseg.</a>\r\n            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?''http'':''https'';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>";s:13:"api_analytics";s:0:"";s:9:"api_otros";s:741:"<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));</script>\r\n<div class="fb-page" data-href="https://www.facebook.com/hotelsalma/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/hotelsalma/"><a href="https://www.facebook.com/hotelsalma/">Hotel Salma Suites VIP, C.A</a></blockquote></div></div>";s:12:"url_facebook";s:39:"http://www.facebook.com/omzconstruccion";s:11:"url_twitter";s:38:"http://www.twitter.com/omzconstruccion";s:13:"url_instagram";s:40:"http://www.instagram.com/omzconstruccion";s:10:"user_skype";s:0:"";s:12:"url_pinteres";s:0:"";s:14:"url_googleplus";s:0:"";s:12:"url_linkedin";s:0:"";s:16:"telefono_empresa";s:33:"+58 212.501.25.21 / 407-339-2216 ";s:17:"direccion_empresa";s:65:"Distrito Capital - Caracas / 981 E. ALTAMONTE SPRINGS,L 32701....";s:13:"api_googlemap";s:367:"<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d251097.9245946213!2d-67.03045464854458!3d10.468698840429772!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8c2a58adcd824807%3A0x93dd2eae0a998483!2sCaracas%2C+Distrito+Capital!5e0!3m2!1ses!2sve!4v1469423800981" width="100%" height="auto" frameborder="0" style="border:0" allowfullscreen></iframe>";s:9:"smtp_host";s:0:"";s:9:"smtp_port";s:0:"";s:9:"smtp_user";s:0:"";s:9:"smtp_pass";s:0:"";s:10:"email_from";s:0:"";s:11:"nombre_from";s:0:"";s:9:"copyright";s:50:" © Copiright OMZ Construcciones RIF: J-29741518-1";s:10:"nombre_rss";s:9:"FMB Group";s:15:"descripcion_rss";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:19:"publicidad_noticias";s:1:"4";s:14:"simbolo_moneda";s:1:"0";}s:4:"mods";a:12:{i:0;a:5:{s:6:"nombre";s:18:"Centro de Mensajes";s:3:"url";s:9:"mensajes/";s:5:"icono";s:8:"envelope";s:8:"cantidad";s:2:"10";s:4:"tags";s:8:"contacto";}i:1;a:5:{s:6:"nombre";s:8:"Clientes";s:3:"url";s:9:"clientes/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"clientes";}i:2;a:5:{s:6:"nombre";s:14:"Configuración";s:3:"url";s:14:"configuracion/";s:5:"icono";s:6:"wrench";s:8:"cantidad";s:1:"0";s:4:"tags";s:13:"configuracion";}i:3;a:5:{s:6:"nombre";s:7:"Eventos";s:3:"url";s:8:"eventos/";s:5:"icono";s:5:"globe";s:8:"cantidad";s:1:"0";s:4:"tags";s:7:"eventos";}i:4;a:5:{s:6:"nombre";s:14:"Gestor de Menu";s:3:"url";s:5:"menu/";s:5:"icono";s:9:"list-alt ";s:8:"cantidad";s:1:"0";s:4:"tags";s:4:"menu";}i:5;a:5:{s:6:"nombre";s:8:"Noticias";s:3:"url";s:9:"noticias/";s:5:"icono";s:5:"globe";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"noticias";}i:6;a:5:{s:6:"nombre";s:20:"Paginas de Contenido";s:3:"url";s:10:"contenido/";s:5:"icono";s:6:"file-o";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"contenido";}i:7;a:5:{s:6:"nombre";s:9:"Productos";s:3:"url";s:10:"productos/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"productos";}i:8;a:5:{s:6:"nombre";s:10:"Publicidad";s:3:"url";s:11:"publicidad/";s:5:"icono";s:20:"external-link-square";s:8:"cantidad";s:1:"0";s:4:"tags";s:10:"publicidad";}i:9;a:5:{s:6:"nombre";s:9:"Slideshow";s:3:"url";s:10:"slideshow/";s:5:"icono";s:13:"camera-retro ";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"slidehosw";}i:10;a:5:{s:6:"nombre";s:10:"Testimonio";s:3:"url";s:11:"testimonio/";s:5:"icono";s:4:"book";s:8:"cantidad";s:1:"0";s:4:"tags";s:10:"testimonio";}i:11;a:5:{s:6:"nombre";s:8:"Usuarios";s:3:"url";s:9:"usuarios/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"usuarios";}}}', '', 'http://localhost:8080/sporthouse/impanel/index.php/escritorio/', 'Firefox', 'Unknown Windows OS', '', '2017', '02');
INSERT INTO `im_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`, `pais`, `referencia`, `navegador`, `plataforma`, `mobile`, `anio`, `mes`) VALUES
('27703cbc3d6346f9035582b0b4d2617c', '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:51.0) Gecko/20100101 Firefox/51.0', 1487469461, 'a:18:{s:9:"user_data";s:0:"";s:10:"referencia";s:0:"";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2017";s:3:"mes";s:2:"02";s:9:"idusuario";s:1:"1";s:6:"nombre";s:10:"Jose Bello";s:5:"cargo";s:15:"Gerente General";s:5:"email";s:27:"joseeduardo.bello@gmail.com";s:8:"telefono";s:11:"04128658193";s:9:"direccion";s:9:"San Diego";s:6:"imagen";s:36:"b96c1b31d84900d4b33ad1f06d055125.jpg";s:7:"usuario";s:6:"jbello";s:6:"status";s:1:"0";s:4:"conf";a:30:{s:16:"meta_descripcion";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:10:"meta_clave";s:174:"construccion, construcciones, ccs, grupo, remodelación, casas, edificios, locales comerciales, cemento, cabillas, venezuela, caracas construccion en valencia, vidrios, acero";s:13:"email_empresa";s:27:"joseeduardo.bello@gmail.com";s:7:"url_web";s:32:"http://www.ccsconstrucciones.com";s:15:"noticias_pagina";s:2:"20";s:13:"key_recatpcha";s:40:"6Ldy4BwTAAAAAHV_vVmyfYXOMcbl1ZmhHTI79QnO";s:11:"api_twitter";s:488:"            <a class="twitter-timeline"  href="https://twitter.com/Planfuturoseg" data-widget-id="692717040994512896" data-width="430" height="350">Tweets por el @Planfuturoseg.</a>\r\n            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?''http'':''https'';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>";s:13:"api_analytics";s:0:"";s:9:"api_otros";s:741:"<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));</script>\r\n<div class="fb-page" data-href="https://www.facebook.com/hotelsalma/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/hotelsalma/"><a href="https://www.facebook.com/hotelsalma/">Hotel Salma Suites VIP, C.A</a></blockquote></div></div>";s:12:"url_facebook";s:39:"http://www.facebook.com/omzconstruccion";s:11:"url_twitter";s:38:"http://www.twitter.com/omzconstruccion";s:13:"url_instagram";s:40:"http://www.instagram.com/omzconstruccion";s:10:"user_skype";s:0:"";s:12:"url_pinteres";s:0:"";s:14:"url_googleplus";s:0:"";s:12:"url_linkedin";s:0:"";s:16:"telefono_empresa";s:33:"+58 212.501.25.21 / 407-339-2216 ";s:17:"direccion_empresa";s:65:"Distrito Capital - Caracas / 981 E. ALTAMONTE SPRINGS,L 32701....";s:13:"api_googlemap";s:367:"<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d251097.9245946213!2d-67.03045464854458!3d10.468698840429772!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8c2a58adcd824807%3A0x93dd2eae0a998483!2sCaracas%2C+Distrito+Capital!5e0!3m2!1ses!2sve!4v1469423800981" width="100%" height="auto" frameborder="0" style="border:0" allowfullscreen></iframe>";s:9:"smtp_host";s:0:"";s:9:"smtp_port";s:0:"";s:9:"smtp_user";s:0:"";s:9:"smtp_pass";s:0:"";s:10:"email_from";s:0:"";s:11:"nombre_from";s:0:"";s:9:"copyright";s:50:" © Copiright OMZ Construcciones RIF: J-29741518-1";s:10:"nombre_rss";s:9:"FMB Group";s:15:"descripcion_rss";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:19:"publicidad_noticias";s:1:"4";s:14:"simbolo_moneda";s:1:"0";}s:4:"mods";a:15:{i:0;a:5:{s:6:"nombre";s:18:"Centro de Mensajes";s:3:"url";s:9:"mensajes/";s:5:"icono";s:8:"envelope";s:8:"cantidad";s:2:"10";s:4:"tags";s:8:"contacto";}i:1;a:5:{s:6:"nombre";s:8:"Clientes";s:3:"url";s:9:"clientes/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"clientes";}i:2;a:5:{s:6:"nombre";s:11:"Comentarios";s:3:"url";s:12:"comentarios/";s:5:"icono";s:8:"comments";s:8:"cantidad";s:3:"134";s:4:"tags";s:11:"comentarios";}i:3;a:5:{s:6:"nombre";s:14:"Configuración";s:3:"url";s:14:"configuracion/";s:5:"icono";s:6:"wrench";s:8:"cantidad";s:1:"0";s:4:"tags";s:13:"configuracion";}i:4;a:5:{s:6:"nombre";s:7:"Eventos";s:3:"url";s:8:"eventos/";s:5:"icono";s:5:"globe";s:8:"cantidad";s:1:"0";s:4:"tags";s:7:"eventos";}i:5;a:5:{s:6:"nombre";s:8:"Galerias";s:3:"url";s:8:"galeria/";s:5:"icono";s:4:"film";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"galerias";}i:6;a:5:{s:6:"nombre";s:14:"Gestor de Menu";s:3:"url";s:5:"menu/";s:5:"icono";s:9:"list-alt ";s:8:"cantidad";s:1:"0";s:4:"tags";s:4:"menu";}i:7;a:5:{s:6:"nombre";s:8:"Noticias";s:3:"url";s:9:"noticias/";s:5:"icono";s:5:"globe";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"noticias";}i:8;a:5:{s:6:"nombre";s:20:"Paginas de Contenido";s:3:"url";s:10:"contenido/";s:5:"icono";s:6:"file-o";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"contenido";}i:9;a:5:{s:6:"nombre";s:7:"Pedidos";s:3:"url";s:8:"pedidos/";s:5:"icono";s:14:"shopping-cart ";s:8:"cantidad";s:1:"2";s:4:"tags";s:7:"pedidos";}i:10;a:5:{s:6:"nombre";s:22:"Preguntas y Respuestas";s:3:"url";s:10:"preguntas/";s:5:"icono";s:7:"comment";s:8:"cantidad";s:2:"20";s:4:"tags";s:9:"preguntas";}i:11;a:5:{s:6:"nombre";s:9:"Productos";s:3:"url";s:10:"productos/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"productos";}i:12;a:5:{s:6:"nombre";s:10:"Publicidad";s:3:"url";s:11:"publicidad/";s:5:"icono";s:20:"external-link-square";s:8:"cantidad";s:1:"0";s:4:"tags";s:10:"publicidad";}i:13;a:5:{s:6:"nombre";s:9:"Slideshow";s:3:"url";s:10:"slideshow/";s:5:"icono";s:13:"camera-retro ";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"slidehosw";}i:14;a:5:{s:6:"nombre";s:8:"Usuarios";s:3:"url";s:9:"usuarios/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"usuarios";}}}', '', '', 'Firefox', 'Unknown Windows OS', '', '2017', '02'),
('27f6ad947a5eb257e84f86984ae54601', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1481493422, 'a:18:{s:9:"user_data";s:0:"";s:10:"referencia";s:0:"";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"12";s:9:"idusuario";s:1:"1";s:6:"nombre";s:10:"Jose Bello";s:5:"cargo";s:15:"Gerente General";s:5:"email";s:27:"joseeduardo.bello@gmail.com";s:8:"telefono";s:11:"04128658193";s:9:"direccion";s:9:"San Diego";s:6:"imagen";s:36:"b96c1b31d84900d4b33ad1f06d055125.jpg";s:7:"usuario";s:6:"jbello";s:6:"status";s:1:"0";s:4:"conf";a:30:{s:16:"meta_descripcion";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:10:"meta_clave";s:174:"construccion, construcciones, ccs, grupo, remodelación, casas, edificios, locales comerciales, cemento, cabillas, venezuela, caracas construccion en valencia, vidrios, acero";s:13:"email_empresa";s:27:"joseeduardo.bello@gmail.com";s:7:"url_web";s:32:"http://www.ccsconstrucciones.com";s:15:"noticias_pagina";s:2:"20";s:13:"key_recatpcha";s:40:"6Ldy4BwTAAAAAHV_vVmyfYXOMcbl1ZmhHTI79QnO";s:11:"api_twitter";s:488:"            <a class="twitter-timeline"  href="https://twitter.com/Planfuturoseg" data-widget-id="692717040994512896" data-width="430" height="350">Tweets por el @Planfuturoseg.</a>\r\n            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?''http'':''https'';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>";s:13:"api_analytics";s:0:"";s:9:"api_otros";s:741:"<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));</script>\r\n<div class="fb-page" data-href="https://www.facebook.com/hotelsalma/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/hotelsalma/"><a href="https://www.facebook.com/hotelsalma/">Hotel Salma Suites VIP, C.A</a></blockquote></div></div>";s:12:"url_facebook";s:39:"http://www.facebook.com/omzconstruccion";s:11:"url_twitter";s:38:"http://www.twitter.com/omzconstruccion";s:13:"url_instagram";s:40:"http://www.instagram.com/omzconstruccion";s:10:"user_skype";s:0:"";s:12:"url_pinteres";s:0:"";s:14:"url_googleplus";s:0:"";s:12:"url_linkedin";s:0:"";s:16:"telefono_empresa";s:33:"+58 212.501.25.21 / 407-339-2216 ";s:17:"direccion_empresa";s:65:"Distrito Capital - Caracas / 981 E. ALTAMONTE SPRINGS,L 32701....";s:13:"api_googlemap";s:367:"<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d251097.9245946213!2d-67.03045464854458!3d10.468698840429772!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8c2a58adcd824807%3A0x93dd2eae0a998483!2sCaracas%2C+Distrito+Capital!5e0!3m2!1ses!2sve!4v1469423800981" width="100%" height="auto" frameborder="0" style="border:0" allowfullscreen></iframe>";s:9:"smtp_host";s:0:"";s:9:"smtp_port";s:0:"";s:9:"smtp_user";s:0:"";s:9:"smtp_pass";s:0:"";s:10:"email_from";s:0:"";s:11:"nombre_from";s:0:"";s:9:"copyright";s:50:" © Copiright OMZ Construcciones RIF: J-29741518-1";s:10:"nombre_rss";s:9:"FMB Group";s:15:"descripcion_rss";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:19:"publicidad_noticias";s:1:"4";s:14:"simbolo_moneda";s:1:"0";}s:4:"mods";a:12:{i:0;a:5:{s:6:"nombre";s:18:"Centro de Mensajes";s:3:"url";s:9:"mensajes/";s:5:"icono";s:8:"envelope";s:8:"cantidad";s:2:"10";s:4:"tags";s:8:"contacto";}i:1;a:5:{s:6:"nombre";s:8:"Clientes";s:3:"url";s:9:"clientes/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"clientes";}i:2;a:5:{s:6:"nombre";s:11:"Colecciones";s:3:"url";s:12:"colecciones/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:11:"colecciones";}i:3;a:5:{s:6:"nombre";s:14:"Configuración";s:3:"url";s:8:"ajustes/";s:5:"icono";s:6:"wrench";s:8:"cantidad";s:1:"0";s:4:"tags";s:13:"configuracion";}i:4;a:5:{s:6:"nombre";s:14:"Gestor de Menu";s:3:"url";s:5:"menu/";s:5:"icono";s:9:"list-alt ";s:8:"cantidad";s:1:"0";s:4:"tags";s:4:"menu";}i:5;a:5:{s:6:"nombre";s:8:"Noticias";s:3:"url";s:9:"noticias/";s:5:"icono";s:5:"globe";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"noticias";}i:6;a:5:{s:6:"nombre";s:5:"Obras";s:3:"url";s:6:"obras/";s:5:"icono";s:8:"building";s:8:"cantidad";s:1:"0";s:4:"tags";s:5:"obras";}i:7;a:5:{s:6:"nombre";s:20:"Paginas de Contenido";s:3:"url";s:10:"contenido/";s:5:"icono";s:6:"file-o";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"contenido";}i:8;a:5:{s:6:"nombre";s:9:"Productos";s:3:"url";s:10:"productos/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"productos";}i:9;a:5:{s:6:"nombre";s:10:"Publicidad";s:3:"url";s:11:"publicidad/";s:5:"icono";s:20:"external-link-square";s:8:"cantidad";s:1:"0";s:4:"tags";s:10:"publicidad";}i:10;a:5:{s:6:"nombre";s:9:"Slideshow";s:3:"url";s:10:"slideshow/";s:5:"icono";s:13:"camera-retro ";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"slidehosw";}i:11;a:5:{s:6:"nombre";s:8:"Usuarios";s:3:"url";s:9:"usuarios/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"usuarios";}}}', '', '', 'Firefox', 'Unknown Windows OS', '', '2016', '12'),
('337af4aa6beff459a4fd1ac422ab0886', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1482095405, 'a:18:{s:9:"user_data";s:0:"";s:10:"referencia";s:0:"";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"12";s:9:"idusuario";s:1:"1";s:6:"nombre";s:10:"Jose Bello";s:5:"cargo";s:15:"Gerente General";s:5:"email";s:27:"joseeduardo.bello@gmail.com";s:8:"telefono";s:11:"04128658193";s:9:"direccion";s:9:"San Diego";s:6:"imagen";s:36:"b96c1b31d84900d4b33ad1f06d055125.jpg";s:7:"usuario";s:6:"jbello";s:6:"status";s:1:"0";s:4:"conf";a:30:{s:16:"meta_descripcion";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:10:"meta_clave";s:174:"construccion, construcciones, ccs, grupo, remodelación, casas, edificios, locales comerciales, cemento, cabillas, venezuela, caracas construccion en valencia, vidrios, acero";s:13:"email_empresa";s:27:"joseeduardo.bello@gmail.com";s:7:"url_web";s:32:"http://www.ccsconstrucciones.com";s:15:"noticias_pagina";s:2:"20";s:13:"key_recatpcha";s:40:"6Ldy4BwTAAAAAHV_vVmyfYXOMcbl1ZmhHTI79QnO";s:11:"api_twitter";s:488:"            <a class="twitter-timeline"  href="https://twitter.com/Planfuturoseg" data-widget-id="692717040994512896" data-width="430" height="350">Tweets por el @Planfuturoseg.</a>\r\n            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?''http'':''https'';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>";s:13:"api_analytics";s:0:"";s:9:"api_otros";s:741:"<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));</script>\r\n<div class="fb-page" data-href="https://www.facebook.com/hotelsalma/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/hotelsalma/"><a href="https://www.facebook.com/hotelsalma/">Hotel Salma Suites VIP, C.A</a></blockquote></div></div>";s:12:"url_facebook";s:39:"http://www.facebook.com/omzconstruccion";s:11:"url_twitter";s:38:"http://www.twitter.com/omzconstruccion";s:13:"url_instagram";s:40:"http://www.instagram.com/omzconstruccion";s:10:"user_skype";s:0:"";s:12:"url_pinteres";s:0:"";s:14:"url_googleplus";s:0:"";s:12:"url_linkedin";s:0:"";s:16:"telefono_empresa";s:33:"+58 212.501.25.21 / 407-339-2216 ";s:17:"direccion_empresa";s:65:"Distrito Capital - Caracas / 981 E. ALTAMONTE SPRINGS,L 32701....";s:13:"api_googlemap";s:367:"<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d251097.9245946213!2d-67.03045464854458!3d10.468698840429772!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8c2a58adcd824807%3A0x93dd2eae0a998483!2sCaracas%2C+Distrito+Capital!5e0!3m2!1ses!2sve!4v1469423800981" width="100%" height="auto" frameborder="0" style="border:0" allowfullscreen></iframe>";s:9:"smtp_host";s:0:"";s:9:"smtp_port";s:0:"";s:9:"smtp_user";s:0:"";s:9:"smtp_pass";s:0:"";s:10:"email_from";s:0:"";s:11:"nombre_from";s:0:"";s:9:"copyright";s:50:" © Copiright OMZ Construcciones RIF: J-29741518-1";s:10:"nombre_rss";s:9:"FMB Group";s:15:"descripcion_rss";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:19:"publicidad_noticias";s:1:"4";s:14:"simbolo_moneda";s:1:"0";}s:4:"mods";a:12:{i:0;a:5:{s:6:"nombre";s:18:"Centro de Mensajes";s:3:"url";s:9:"mensajes/";s:5:"icono";s:8:"envelope";s:8:"cantidad";s:2:"10";s:4:"tags";s:8:"contacto";}i:1;a:5:{s:6:"nombre";s:8:"Clientes";s:3:"url";s:9:"clientes/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"clientes";}i:2;a:5:{s:6:"nombre";s:11:"Colecciones";s:3:"url";s:12:"colecciones/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:11:"colecciones";}i:3;a:5:{s:6:"nombre";s:14:"Configuración";s:3:"url";s:8:"ajustes/";s:5:"icono";s:6:"wrench";s:8:"cantidad";s:1:"0";s:4:"tags";s:13:"configuracion";}i:4;a:5:{s:6:"nombre";s:14:"Gestor de Menu";s:3:"url";s:5:"menu/";s:5:"icono";s:9:"list-alt ";s:8:"cantidad";s:1:"0";s:4:"tags";s:4:"menu";}i:5;a:5:{s:6:"nombre";s:8:"Noticias";s:3:"url";s:9:"noticias/";s:5:"icono";s:5:"globe";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"noticias";}i:6;a:5:{s:6:"nombre";s:5:"Obras";s:3:"url";s:6:"obras/";s:5:"icono";s:8:"building";s:8:"cantidad";s:1:"0";s:4:"tags";s:5:"obras";}i:7;a:5:{s:6:"nombre";s:20:"Paginas de Contenido";s:3:"url";s:10:"contenido/";s:5:"icono";s:6:"file-o";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"contenido";}i:8;a:5:{s:6:"nombre";s:9:"Productos";s:3:"url";s:10:"productos/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"productos";}i:9;a:5:{s:6:"nombre";s:10:"Publicidad";s:3:"url";s:11:"publicidad/";s:5:"icono";s:20:"external-link-square";s:8:"cantidad";s:1:"0";s:4:"tags";s:10:"publicidad";}i:10;a:5:{s:6:"nombre";s:9:"Slideshow";s:3:"url";s:10:"slideshow/";s:5:"icono";s:13:"camera-retro ";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"slidehosw";}i:11;a:5:{s:6:"nombre";s:8:"Usuarios";s:3:"url";s:9:"usuarios/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"usuarios";}}}', '', '', 'Firefox', 'Unknown Windows OS', '', '2016', '12'),
('36cd5e1de65745945ea90fa3d46b910b', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1481580003, 'a:18:{s:9:"user_data";s:0:"";s:10:"referencia";s:0:"";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"12";s:9:"idusuario";s:1:"1";s:6:"nombre";s:10:"Jose Bello";s:5:"cargo";s:15:"Gerente General";s:5:"email";s:27:"joseeduardo.bello@gmail.com";s:8:"telefono";s:11:"04128658193";s:9:"direccion";s:9:"San Diego";s:6:"imagen";s:36:"b96c1b31d84900d4b33ad1f06d055125.jpg";s:7:"usuario";s:6:"jbello";s:6:"status";s:1:"0";s:4:"conf";a:30:{s:16:"meta_descripcion";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:10:"meta_clave";s:174:"construccion, construcciones, ccs, grupo, remodelación, casas, edificios, locales comerciales, cemento, cabillas, venezuela, caracas construccion en valencia, vidrios, acero";s:13:"email_empresa";s:27:"joseeduardo.bello@gmail.com";s:7:"url_web";s:32:"http://www.ccsconstrucciones.com";s:15:"noticias_pagina";s:2:"20";s:13:"key_recatpcha";s:40:"6Ldy4BwTAAAAAHV_vVmyfYXOMcbl1ZmhHTI79QnO";s:11:"api_twitter";s:488:"            <a class="twitter-timeline"  href="https://twitter.com/Planfuturoseg" data-widget-id="692717040994512896" data-width="430" height="350">Tweets por el @Planfuturoseg.</a>\r\n            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?''http'':''https'';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>";s:13:"api_analytics";s:0:"";s:9:"api_otros";s:741:"<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));</script>\r\n<div class="fb-page" data-href="https://www.facebook.com/hotelsalma/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/hotelsalma/"><a href="https://www.facebook.com/hotelsalma/">Hotel Salma Suites VIP, C.A</a></blockquote></div></div>";s:12:"url_facebook";s:39:"http://www.facebook.com/omzconstruccion";s:11:"url_twitter";s:38:"http://www.twitter.com/omzconstruccion";s:13:"url_instagram";s:40:"http://www.instagram.com/omzconstruccion";s:10:"user_skype";s:0:"";s:12:"url_pinteres";s:0:"";s:14:"url_googleplus";s:0:"";s:12:"url_linkedin";s:0:"";s:16:"telefono_empresa";s:33:"+58 212.501.25.21 / 407-339-2216 ";s:17:"direccion_empresa";s:65:"Distrito Capital - Caracas / 981 E. ALTAMONTE SPRINGS,L 32701....";s:13:"api_googlemap";s:367:"<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d251097.9245946213!2d-67.03045464854458!3d10.468698840429772!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8c2a58adcd824807%3A0x93dd2eae0a998483!2sCaracas%2C+Distrito+Capital!5e0!3m2!1ses!2sve!4v1469423800981" width="100%" height="auto" frameborder="0" style="border:0" allowfullscreen></iframe>";s:9:"smtp_host";s:0:"";s:9:"smtp_port";s:0:"";s:9:"smtp_user";s:0:"";s:9:"smtp_pass";s:0:"";s:10:"email_from";s:0:"";s:11:"nombre_from";s:0:"";s:9:"copyright";s:50:" © Copiright OMZ Construcciones RIF: J-29741518-1";s:10:"nombre_rss";s:9:"FMB Group";s:15:"descripcion_rss";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:19:"publicidad_noticias";s:1:"4";s:14:"simbolo_moneda";s:1:"0";}s:4:"mods";a:12:{i:0;a:5:{s:6:"nombre";s:18:"Centro de Mensajes";s:3:"url";s:9:"mensajes/";s:5:"icono";s:8:"envelope";s:8:"cantidad";s:2:"10";s:4:"tags";s:8:"contacto";}i:1;a:5:{s:6:"nombre";s:8:"Clientes";s:3:"url";s:9:"clientes/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"clientes";}i:2;a:5:{s:6:"nombre";s:11:"Colecciones";s:3:"url";s:12:"colecciones/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:11:"colecciones";}i:3;a:5:{s:6:"nombre";s:14:"Configuración";s:3:"url";s:8:"ajustes/";s:5:"icono";s:6:"wrench";s:8:"cantidad";s:1:"0";s:4:"tags";s:13:"configuracion";}i:4;a:5:{s:6:"nombre";s:14:"Gestor de Menu";s:3:"url";s:5:"menu/";s:5:"icono";s:9:"list-alt ";s:8:"cantidad";s:1:"0";s:4:"tags";s:4:"menu";}i:5;a:5:{s:6:"nombre";s:8:"Noticias";s:3:"url";s:9:"noticias/";s:5:"icono";s:5:"globe";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"noticias";}i:6;a:5:{s:6:"nombre";s:5:"Obras";s:3:"url";s:6:"obras/";s:5:"icono";s:8:"building";s:8:"cantidad";s:1:"0";s:4:"tags";s:5:"obras";}i:7;a:5:{s:6:"nombre";s:20:"Paginas de Contenido";s:3:"url";s:10:"contenido/";s:5:"icono";s:6:"file-o";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"contenido";}i:8;a:5:{s:6:"nombre";s:9:"Productos";s:3:"url";s:10:"productos/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"productos";}i:9;a:5:{s:6:"nombre";s:10:"Publicidad";s:3:"url";s:11:"publicidad/";s:5:"icono";s:20:"external-link-square";s:8:"cantidad";s:1:"0";s:4:"tags";s:10:"publicidad";}i:10;a:5:{s:6:"nombre";s:9:"Slideshow";s:3:"url";s:10:"slideshow/";s:5:"icono";s:13:"camera-retro ";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"slidehosw";}i:11;a:5:{s:6:"nombre";s:8:"Usuarios";s:3:"url";s:9:"usuarios/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"usuarios";}}}', '', '', 'Firefox', 'Unknown Windows OS', '', '2016', '12'),
('4bcb5e3c8ccf70d4b80f86fba6e60608', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0', 1469370622, 'a:18:{s:9:"user_data";s:0:"";s:10:"referencia";s:64:"http://localhost/ccsconstrucciones/impanel/index.php/escritorio/";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"07";s:9:"idusuario";s:1:"1";s:6:"nombre";s:10:"Jose Bello";s:5:"cargo";s:15:"Gerente General";s:5:"email";s:27:"joseeduardo.bello@gmail.com";s:8:"telefono";s:11:"04128658193";s:9:"direccion";s:9:"San Diego";s:6:"imagen";s:36:"b96c1b31d84900d4b33ad1f06d055125.jpg";s:7:"usuario";s:6:"jbello";s:6:"status";s:1:"0";s:4:"conf";a:30:{s:16:"meta_descripcion";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:10:"meta_clave";s:160:"construccion, construcciones, fmb, grupo, remodelación, casas, edificios, locales comerciales, cemento, cabillas, venezuela, valencia, construccion en valencia";s:13:"email_empresa";s:27:"joseeduardo.bello@gmail.com";s:7:"url_web";s:26:"http://www.fmbgroup.com.ve";s:15:"noticias_pagina";s:2:"20";s:13:"key_recatpcha";s:40:"6Ldy4BwTAAAAAHV_vVmyfYXOMcbl1ZmhHTI79QnO";s:11:"api_twitter";s:488:"            <a class="twitter-timeline"  href="https://twitter.com/Planfuturoseg" data-widget-id="692717040994512896" data-width="430" height="350">Tweets por el @Planfuturoseg.</a>\r\n            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?''http'':''https'';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>";s:13:"api_analytics";s:0:"";s:9:"api_otros";s:741:"<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));</script>\r\n<div class="fb-page" data-href="https://www.facebook.com/hotelsalma/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/hotelsalma/"><a href="https://www.facebook.com/hotelsalma/">Hotel Salma Suites VIP, C.A</a></blockquote></div></div>";s:12:"url_facebook";s:32:"http://www.facebook.com/fmbgroup";s:11:"url_twitter";s:31:"http://www.twitter.com/fmbgroup";s:13:"url_instagram";s:33:"http://www.instagram.com/fmbgroup";s:10:"user_skype";s:0:"";s:12:"url_pinteres";s:0:"";s:14:"url_googleplus";s:0:"";s:12:"url_linkedin";s:0:"";s:16:"telefono_empresa";s:33:"58-241 8221106 -8216283 - 8223863";s:17:"direccion_empresa";s:31:"Valencia - Carabobo - Venezuela";s:13:"api_googlemap";s:388:"<iframe width="100%" height="215" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com.au/maps?f=q&source=s_q&hl=en&geocode=&q=Dhaka,+Dhaka+Division,+Bangladesh&aq=0&oq=dhaka+ban&sll=40.714353,-74.005973&sspn=0.836898,1.815491&ie=UTF8&hq=&hnear=Dhaka+Division,+Bangladesh&t=m&ll=24.542126,90.293884&spn=0.124922,0.411301&z=8&output=embed"></iframe>";s:9:"smtp_host";s:0:"";s:9:"smtp_port";s:0:"";s:9:"smtp_user";s:0:"";s:9:"smtp_pass";s:0:"";s:10:"email_from";s:0:"";s:11:"nombre_from";s:0:"";s:9:"copyright";s:28:"Copyrigth © 2016. FMB Group";s:10:"nombre_rss";s:9:"FMB Group";s:15:"descripcion_rss";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:19:"publicidad_noticias";s:1:"4";s:14:"simbolo_moneda";s:1:"$";}s:4:"mods";a:11:{i:0;a:5:{s:6:"nombre";s:18:"Centro de Mensajes";s:3:"url";s:9:"mensajes/";s:5:"icono";s:8:"envelope";s:8:"cantidad";s:2:"10";s:4:"tags";s:8:"contacto";}i:1;a:5:{s:6:"nombre";s:8:"Clientes";s:3:"url";s:9:"clientes/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"clientes";}i:2;a:5:{s:6:"nombre";s:11:"Colecciones";s:3:"url";s:12:"colecciones/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:11:"colecciones";}i:3;a:5:{s:6:"nombre";s:14:"Configuración";s:3:"url";s:14:"configuracion/";s:5:"icono";s:6:"wrench";s:8:"cantidad";s:1:"0";s:4:"tags";s:13:"configuracion";}i:4;a:5:{s:6:"nombre";s:14:"Gestor de Menu";s:3:"url";s:5:"menu/";s:5:"icono";s:9:"list-alt ";s:8:"cantidad";s:1:"0";s:4:"tags";s:4:"menu";}i:5;a:5:{s:6:"nombre";s:8:"Noticias";s:3:"url";s:9:"noticias/";s:5:"icono";s:5:"globe";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"noticias";}i:6;a:5:{s:6:"nombre";s:20:"Paginas de Contenido";s:3:"url";s:10:"contenido/";s:5:"icono";s:6:"file-o";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"contenido";}i:7;a:5:{s:6:"nombre";s:9:"Productos";s:3:"url";s:10:"productos/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"productos";}i:8;a:5:{s:6:"nombre";s:10:"Publicidad";s:3:"url";s:11:"publicidad/";s:5:"icono";s:20:"external-link-square";s:8:"cantidad";s:1:"0";s:4:"tags";s:10:"publicidad";}i:9;a:5:{s:6:"nombre";s:9:"Slideshow";s:3:"url";s:10:"slideshow/";s:5:"icono";s:13:"camera-retro ";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"slidehosw";}i:10;a:5:{s:6:"nombre";s:8:"Usuarios";s:3:"url";s:9:"usuarios/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"usuarios";}}}', '', 'http://localhost/ccsconstrucciones/impanel/index.php/escritorio/', 'Firefox', 'Unknown Windows OS', '', '2016', '07'),
('4d1fd03dd3ae57d9093ca2c8d0cfe8e2', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', 1481418124, 'a:18:{s:9:"user_data";s:0:"";s:10:"referencia";s:61:"http://localhost/www/sporthouse/impanel/index.php/escritorio/";s:9:"navegador";s:6:"Chrome";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"12";s:9:"idusuario";s:1:"1";s:6:"nombre";s:10:"Jose Bello";s:5:"cargo";s:15:"Gerente General";s:5:"email";s:27:"joseeduardo.bello@gmail.com";s:8:"telefono";s:11:"04128658193";s:9:"direccion";s:9:"San Diego";s:6:"imagen";s:36:"b96c1b31d84900d4b33ad1f06d055125.jpg";s:7:"usuario";s:6:"jbello";s:6:"status";s:1:"0";s:4:"conf";a:30:{s:16:"meta_descripcion";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:10:"meta_clave";s:174:"construccion, construcciones, ccs, grupo, remodelación, casas, edificios, locales comerciales, cemento, cabillas, venezuela, caracas construccion en valencia, vidrios, acero";s:13:"email_empresa";s:27:"joseeduardo.bello@gmail.com";s:7:"url_web";s:32:"http://www.ccsconstrucciones.com";s:15:"noticias_pagina";s:2:"20";s:13:"key_recatpcha";s:40:"6Ldy4BwTAAAAAHV_vVmyfYXOMcbl1ZmhHTI79QnO";s:11:"api_twitter";s:488:"            <a class="twitter-timeline"  href="https://twitter.com/Planfuturoseg" data-widget-id="692717040994512896" data-width="430" height="350">Tweets por el @Planfuturoseg.</a>\r\n            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?''http'':''https'';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>";s:13:"api_analytics";s:0:"";s:9:"api_otros";s:741:"<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));</script>\r\n<div class="fb-page" data-href="https://www.facebook.com/hotelsalma/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/hotelsalma/"><a href="https://www.facebook.com/hotelsalma/">Hotel Salma Suites VIP, C.A</a></blockquote></div></div>";s:12:"url_facebook";s:39:"http://www.facebook.com/omzconstruccion";s:11:"url_twitter";s:38:"http://www.twitter.com/omzconstruccion";s:13:"url_instagram";s:40:"http://www.instagram.com/omzconstruccion";s:10:"user_skype";s:0:"";s:12:"url_pinteres";s:0:"";s:14:"url_googleplus";s:0:"";s:12:"url_linkedin";s:0:"";s:16:"telefono_empresa";s:33:"+58 212.501.25.21 / 407-339-2216 ";s:17:"direccion_empresa";s:65:"Distrito Capital - Caracas / 981 E. ALTAMONTE SPRINGS,L 32701....";s:13:"api_googlemap";s:367:"<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d251097.9245946213!2d-67.03045464854458!3d10.468698840429772!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8c2a58adcd824807%3A0x93dd2eae0a998483!2sCaracas%2C+Distrito+Capital!5e0!3m2!1ses!2sve!4v1469423800981" width="100%" height="auto" frameborder="0" style="border:0" allowfullscreen></iframe>";s:9:"smtp_host";s:0:"";s:9:"smtp_port";s:0:"";s:9:"smtp_user";s:0:"";s:9:"smtp_pass";s:0:"";s:10:"email_from";s:0:"";s:11:"nombre_from";s:0:"";s:9:"copyright";s:50:" © Copiright OMZ Construcciones RIF: J-29741518-1";s:10:"nombre_rss";s:9:"FMB Group";s:15:"descripcion_rss";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:19:"publicidad_noticias";s:1:"4";s:14:"simbolo_moneda";s:1:"0";}s:4:"mods";a:12:{i:0;a:5:{s:6:"nombre";s:18:"Centro de Mensajes";s:3:"url";s:9:"mensajes/";s:5:"icono";s:8:"envelope";s:8:"cantidad";s:2:"10";s:4:"tags";s:8:"contacto";}i:1;a:5:{s:6:"nombre";s:8:"Clientes";s:3:"url";s:9:"clientes/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"clientes";}i:2;a:5:{s:6:"nombre";s:11:"Colecciones";s:3:"url";s:12:"colecciones/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:11:"colecciones";}i:3;a:5:{s:6:"nombre";s:14:"Configuración";s:3:"url";s:8:"ajustes/";s:5:"icono";s:6:"wrench";s:8:"cantidad";s:1:"0";s:4:"tags";s:13:"configuracion";}i:4;a:5:{s:6:"nombre";s:14:"Gestor de Menu";s:3:"url";s:5:"menu/";s:5:"icono";s:9:"list-alt ";s:8:"cantidad";s:1:"0";s:4:"tags";s:4:"menu";}i:5;a:5:{s:6:"nombre";s:8:"Noticias";s:3:"url";s:9:"noticias/";s:5:"icono";s:5:"globe";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"noticias";}i:6;a:5:{s:6:"nombre";s:5:"Obras";s:3:"url";s:6:"obras/";s:5:"icono";s:8:"building";s:8:"cantidad";s:1:"0";s:4:"tags";s:5:"obras";}i:7;a:5:{s:6:"nombre";s:20:"Paginas de Contenido";s:3:"url";s:10:"contenido/";s:5:"icono";s:6:"file-o";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"contenido";}i:8;a:5:{s:6:"nombre";s:9:"Productos";s:3:"url";s:10:"productos/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"productos";}i:9;a:5:{s:6:"nombre";s:10:"Publicidad";s:3:"url";s:11:"publicidad/";s:5:"icono";s:20:"external-link-square";s:8:"cantidad";s:1:"0";s:4:"tags";s:10:"publicidad";}i:10;a:5:{s:6:"nombre";s:9:"Slideshow";s:3:"url";s:10:"slideshow/";s:5:"icono";s:13:"camera-retro ";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"slidehosw";}i:11;a:5:{s:6:"nombre";s:8:"Usuarios";s:3:"url";s:9:"usuarios/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"usuarios";}}}', '', 'http://localhost/www/sporthouse/impanel/index.php/escritorio/', 'Chrome', 'Unknown Windows OS', '', '2016', '12'),
('5dcf6c90d492f3c4db0b2c69b98f2794', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 1473031205, 'a:18:{s:9:"user_data";s:0:"";s:10:"referencia";s:0:"";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"09";s:9:"idusuario";s:1:"1";s:6:"nombre";s:10:"Jose Bello";s:5:"cargo";s:15:"Gerente General";s:5:"email";s:27:"joseeduardo.bello@gmail.com";s:8:"telefono";s:11:"04128658193";s:9:"direccion";s:9:"San Diego";s:6:"imagen";s:36:"b96c1b31d84900d4b33ad1f06d055125.jpg";s:7:"usuario";s:6:"jbello";s:6:"status";s:1:"0";s:4:"conf";a:30:{s:16:"meta_descripcion";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:10:"meta_clave";s:174:"construccion, construcciones, ccs, grupo, remodelación, casas, edificios, locales comerciales, cemento, cabillas, venezuela, caracas construccion en valencia, vidrios, acero";s:13:"email_empresa";s:27:"joseeduardo.bello@gmail.com";s:7:"url_web";s:32:"http://www.ccsconstrucciones.com";s:15:"noticias_pagina";s:2:"20";s:13:"key_recatpcha";s:40:"6Ldy4BwTAAAAAHV_vVmyfYXOMcbl1ZmhHTI79QnO";s:11:"api_twitter";s:488:"            <a class="twitter-timeline"  href="https://twitter.com/Planfuturoseg" data-widget-id="692717040994512896" data-width="430" height="350">Tweets por el @Planfuturoseg.</a>\r\n            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?''http'':''https'';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>";s:13:"api_analytics";s:0:"";s:9:"api_otros";s:741:"<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));</script>\r\n<div class="fb-page" data-href="https://www.facebook.com/hotelsalma/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/hotelsalma/"><a href="https://www.facebook.com/hotelsalma/">Hotel Salma Suites VIP, C.A</a></blockquote></div></div>";s:12:"url_facebook";s:39:"http://www.facebook.com/CCSCONSTRUCCION";s:11:"url_twitter";s:38:"http://www.twitter.com/CCSCONSTRUCCION";s:13:"url_instagram";s:40:"http://www.instagram.com/CCSCONSTRUCCION";s:10:"user_skype";s:28:"jose.eduardo.bello.otero....";s:12:"url_pinteres";s:0:"";s:14:"url_googleplus";s:0:"";s:12:"url_linkedin";s:0:"";s:16:"telefono_empresa";s:33:"+58 212.501.25.21 / 407-339-2216 ";s:17:"direccion_empresa";s:65:"Distrito Capital - Caracas / 981 E. ALTAMONTE SPRINGS,L 32701....";s:13:"api_googlemap";s:367:"<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d251097.9245946213!2d-67.03045464854458!3d10.468698840429772!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8c2a58adcd824807%3A0x93dd2eae0a998483!2sCaracas%2C+Distrito+Capital!5e0!3m2!1ses!2sve!4v1469423800981" width="100%" height="auto" frameborder="0" style="border:0" allowfullscreen></iframe>";s:9:"smtp_host";s:0:"";s:9:"smtp_port";s:0:"";s:9:"smtp_user";s:0:"";s:9:"smtp_pass";s:0:"";s:10:"email_from";s:0:"";s:11:"nombre_from";s:0:"";s:9:"copyright";s:28:"Copyrigth © 2016. FMB Group";s:10:"nombre_rss";s:9:"FMB Group";s:15:"descripcion_rss";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:19:"publicidad_noticias";s:1:"4";s:14:"simbolo_moneda";s:1:"0";}s:4:"mods";a:12:{i:0;a:5:{s:6:"nombre";s:18:"Centro de Mensajes";s:3:"url";s:9:"mensajes/";s:5:"icono";s:8:"envelope";s:8:"cantidad";s:2:"10";s:4:"tags";s:8:"contacto";}i:1;a:5:{s:6:"nombre";s:8:"Clientes";s:3:"url";s:9:"clientes/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"clientes";}i:2;a:5:{s:6:"nombre";s:11:"Colecciones";s:3:"url";s:12:"colecciones/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:11:"colecciones";}i:3;a:5:{s:6:"nombre";s:14:"Configuración";s:3:"url";s:14:"configuracion/";s:5:"icono";s:6:"wrench";s:8:"cantidad";s:1:"0";s:4:"tags";s:13:"configuracion";}i:4;a:5:{s:6:"nombre";s:14:"Gestor de Menu";s:3:"url";s:5:"menu/";s:5:"icono";s:9:"list-alt ";s:8:"cantidad";s:1:"0";s:4:"tags";s:4:"menu";}i:5;a:5:{s:6:"nombre";s:8:"Noticias";s:3:"url";s:9:"noticias/";s:5:"icono";s:5:"globe";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"noticias";}i:6;a:5:{s:6:"nombre";s:5:"Obras";s:3:"url";s:6:"obras/";s:5:"icono";s:8:"building";s:8:"cantidad";s:1:"0";s:4:"tags";s:5:"obras";}i:7;a:5:{s:6:"nombre";s:20:"Paginas de Contenido";s:3:"url";s:10:"contenido/";s:5:"icono";s:6:"file-o";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"contenido";}i:8;a:5:{s:6:"nombre";s:9:"Productos";s:3:"url";s:10:"productos/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"productos";}i:9;a:5:{s:6:"nombre";s:10:"Publicidad";s:3:"url";s:11:"publicidad/";s:5:"icono";s:20:"external-link-square";s:8:"cantidad";s:1:"0";s:4:"tags";s:10:"publicidad";}i:10;a:5:{s:6:"nombre";s:9:"Slideshow";s:3:"url";s:10:"slideshow/";s:5:"icono";s:13:"camera-retro ";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"slidehosw";}i:11;a:5:{s:6:"nombre";s:8:"Usuarios";s:3:"url";s:9:"usuarios/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"usuarios";}}}', '', '', 'Firefox', 'Unknown Windows OS', '', '2016', '09'),
('6357d559aa1e9e47b156704fde33b306', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1485721182, 'a:18:{s:9:"user_data";s:0:"";s:10:"referencia";s:0:"";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2017";s:3:"mes";s:2:"01";s:9:"idusuario";s:1:"1";s:6:"nombre";s:10:"Jose Bello";s:5:"cargo";s:15:"Gerente General";s:5:"email";s:27:"joseeduardo.bello@gmail.com";s:8:"telefono";s:11:"04128658193";s:9:"direccion";s:9:"San Diego";s:6:"imagen";s:36:"b96c1b31d84900d4b33ad1f06d055125.jpg";s:7:"usuario";s:6:"jbello";s:6:"status";s:1:"0";s:4:"conf";a:30:{s:16:"meta_descripcion";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:10:"meta_clave";s:174:"construccion, construcciones, ccs, grupo, remodelación, casas, edificios, locales comerciales, cemento, cabillas, venezuela, caracas construccion en valencia, vidrios, acero";s:13:"email_empresa";s:27:"joseeduardo.bello@gmail.com";s:7:"url_web";s:32:"http://www.ccsconstrucciones.com";s:15:"noticias_pagina";s:2:"20";s:13:"key_recatpcha";s:40:"6Ldy4BwTAAAAAHV_vVmyfYXOMcbl1ZmhHTI79QnO";s:11:"api_twitter";s:488:"            <a class="twitter-timeline"  href="https://twitter.com/Planfuturoseg" data-widget-id="692717040994512896" data-width="430" height="350">Tweets por el @Planfuturoseg.</a>\r\n            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?''http'':''https'';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>";s:13:"api_analytics";s:0:"";s:9:"api_otros";s:741:"<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));</script>\r\n<div class="fb-page" data-href="https://www.facebook.com/hotelsalma/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/hotelsalma/"><a href="https://www.facebook.com/hotelsalma/">Hotel Salma Suites VIP, C.A</a></blockquote></div></div>";s:12:"url_facebook";s:39:"http://www.facebook.com/omzconstruccion";s:11:"url_twitter";s:38:"http://www.twitter.com/omzconstruccion";s:13:"url_instagram";s:40:"http://www.instagram.com/omzconstruccion";s:10:"user_skype";s:0:"";s:12:"url_pinteres";s:0:"";s:14:"url_googleplus";s:0:"";s:12:"url_linkedin";s:0:"";s:16:"telefono_empresa";s:33:"+58 212.501.25.21 / 407-339-2216 ";s:17:"direccion_empresa";s:65:"Distrito Capital - Caracas / 981 E. ALTAMONTE SPRINGS,L 32701....";s:13:"api_googlemap";s:367:"<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d251097.9245946213!2d-67.03045464854458!3d10.468698840429772!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8c2a58adcd824807%3A0x93dd2eae0a998483!2sCaracas%2C+Distrito+Capital!5e0!3m2!1ses!2sve!4v1469423800981" width="100%" height="auto" frameborder="0" style="border:0" allowfullscreen></iframe>";s:9:"smtp_host";s:0:"";s:9:"smtp_port";s:0:"";s:9:"smtp_user";s:0:"";s:9:"smtp_pass";s:0:"";s:10:"email_from";s:0:"";s:11:"nombre_from";s:0:"";s:9:"copyright";s:50:" © Copiright OMZ Construcciones RIF: J-29741518-1";s:10:"nombre_rss";s:9:"FMB Group";s:15:"descripcion_rss";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:19:"publicidad_noticias";s:1:"4";s:14:"simbolo_moneda";s:1:"0";}s:4:"mods";a:12:{i:0;a:5:{s:6:"nombre";s:18:"Centro de Mensajes";s:3:"url";s:9:"mensajes/";s:5:"icono";s:8:"envelope";s:8:"cantidad";s:2:"10";s:4:"tags";s:8:"contacto";}i:1;a:5:{s:6:"nombre";s:8:"Clientes";s:3:"url";s:9:"clientes/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"clientes";}i:2;a:5:{s:6:"nombre";s:11:"Colecciones";s:3:"url";s:12:"colecciones/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:11:"colecciones";}i:3;a:5:{s:6:"nombre";s:14:"Configuración";s:3:"url";s:8:"ajustes/";s:5:"icono";s:6:"wrench";s:8:"cantidad";s:1:"0";s:4:"tags";s:13:"configuracion";}i:4;a:5:{s:6:"nombre";s:14:"Gestor de Menu";s:3:"url";s:5:"menu/";s:5:"icono";s:9:"list-alt ";s:8:"cantidad";s:1:"0";s:4:"tags";s:4:"menu";}i:5;a:5:{s:6:"nombre";s:8:"Noticias";s:3:"url";s:9:"noticias/";s:5:"icono";s:5:"globe";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"noticias";}i:6;a:5:{s:6:"nombre";s:5:"Obras";s:3:"url";s:6:"obras/";s:5:"icono";s:8:"building";s:8:"cantidad";s:1:"0";s:4:"tags";s:5:"obras";}i:7;a:5:{s:6:"nombre";s:20:"Paginas de Contenido";s:3:"url";s:10:"contenido/";s:5:"icono";s:6:"file-o";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"contenido";}i:8;a:5:{s:6:"nombre";s:9:"Productos";s:3:"url";s:10:"productos/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"productos";}i:9;a:5:{s:6:"nombre";s:10:"Publicidad";s:3:"url";s:11:"publicidad/";s:5:"icono";s:20:"external-link-square";s:8:"cantidad";s:1:"0";s:4:"tags";s:10:"publicidad";}i:10;a:5:{s:6:"nombre";s:9:"Slideshow";s:3:"url";s:10:"slideshow/";s:5:"icono";s:13:"camera-retro ";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"slidehosw";}i:11;a:5:{s:6:"nombre";s:8:"Usuarios";s:3:"url";s:9:"usuarios/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"usuarios";}}}', '', '', 'Firefox', 'Unknown Windows OS', '', '2017', '01');
INSERT INTO `im_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`, `pais`, `referencia`, `navegador`, `plataforma`, `mobile`, `anio`, `mes`) VALUES
('6374e0430c5f61393cebfaba53feb5e7', '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:51.0) Gecko/20100101 Firefox/51.0', 1487504879, 'a:11:{s:9:"idusuario";s:1:"1";s:6:"nombre";s:10:"Jose Bello";s:5:"cargo";s:15:"Gerente General";s:5:"email";s:27:"joseeduardo.bello@gmail.com";s:8:"telefono";s:11:"04128658193";s:9:"direccion";s:9:"San Diego";s:6:"imagen";s:36:"b96c1b31d84900d4b33ad1f06d055125.jpg";s:7:"usuario";s:6:"jbello";s:6:"status";s:1:"0";s:4:"conf";a:30:{s:16:"meta_descripcion";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:10:"meta_clave";s:174:"construccion, construcciones, ccs, grupo, remodelación, casas, edificios, locales comerciales, cemento, cabillas, venezuela, caracas construccion en valencia, vidrios, acero";s:13:"email_empresa";s:27:"joseeduardo.bello@gmail.com";s:7:"url_web";s:32:"http://www.ccsconstrucciones.com";s:15:"noticias_pagina";s:2:"20";s:13:"key_recatpcha";s:40:"6Ldy4BwTAAAAAHV_vVmyfYXOMcbl1ZmhHTI79QnO";s:11:"api_twitter";s:488:"            <a class="twitter-timeline"  href="https://twitter.com/Planfuturoseg" data-widget-id="692717040994512896" data-width="430" height="350">Tweets por el @Planfuturoseg.</a>\r\n            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?''http'':''https'';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>";s:13:"api_analytics";s:0:"";s:9:"api_otros";s:741:"<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));</script>\r\n<div class="fb-page" data-href="https://www.facebook.com/hotelsalma/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/hotelsalma/"><a href="https://www.facebook.com/hotelsalma/">Hotel Salma Suites VIP, C.A</a></blockquote></div></div>";s:12:"url_facebook";s:39:"http://www.facebook.com/omzconstruccion";s:11:"url_twitter";s:38:"http://www.twitter.com/omzconstruccion";s:13:"url_instagram";s:40:"http://www.instagram.com/omzconstruccion";s:10:"user_skype";s:0:"";s:12:"url_pinteres";s:0:"";s:14:"url_googleplus";s:0:"";s:12:"url_linkedin";s:0:"";s:16:"telefono_empresa";s:33:"+58 212.501.25.21 / 407-339-2216 ";s:17:"direccion_empresa";s:65:"Distrito Capital - Caracas / 981 E. ALTAMONTE SPRINGS,L 32701....";s:13:"api_googlemap";s:367:"<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d251097.9245946213!2d-67.03045464854458!3d10.468698840429772!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8c2a58adcd824807%3A0x93dd2eae0a998483!2sCaracas%2C+Distrito+Capital!5e0!3m2!1ses!2sve!4v1469423800981" width="100%" height="auto" frameborder="0" style="border:0" allowfullscreen></iframe>";s:9:"smtp_host";s:0:"";s:9:"smtp_port";s:0:"";s:9:"smtp_user";s:0:"";s:9:"smtp_pass";s:0:"";s:10:"email_from";s:0:"";s:11:"nombre_from";s:0:"";s:9:"copyright";s:50:" © Copiright OMZ Construcciones RIF: J-29741518-1";s:10:"nombre_rss";s:9:"FMB Group";s:15:"descripcion_rss";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:19:"publicidad_noticias";s:1:"4";s:14:"simbolo_moneda";s:1:"0";}s:4:"mods";a:15:{i:0;a:5:{s:6:"nombre";s:18:"Centro de Mensajes";s:3:"url";s:9:"mensajes/";s:5:"icono";s:8:"envelope";s:8:"cantidad";s:2:"10";s:4:"tags";s:8:"contacto";}i:1;a:5:{s:6:"nombre";s:8:"Clientes";s:3:"url";s:9:"clientes/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"clientes";}i:2;a:5:{s:6:"nombre";s:11:"Comentarios";s:3:"url";s:12:"comentarios/";s:5:"icono";s:8:"comments";s:8:"cantidad";s:3:"134";s:4:"tags";s:11:"comentarios";}i:3;a:5:{s:6:"nombre";s:14:"Configuración";s:3:"url";s:14:"configuracion/";s:5:"icono";s:6:"wrench";s:8:"cantidad";s:1:"0";s:4:"tags";s:13:"configuracion";}i:4;a:5:{s:6:"nombre";s:7:"Eventos";s:3:"url";s:8:"eventos/";s:5:"icono";s:5:"globe";s:8:"cantidad";s:1:"0";s:4:"tags";s:7:"eventos";}i:5;a:5:{s:6:"nombre";s:8:"Galerias";s:3:"url";s:8:"galeria/";s:5:"icono";s:4:"film";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"galerias";}i:6;a:5:{s:6:"nombre";s:14:"Gestor de Menu";s:3:"url";s:5:"menu/";s:5:"icono";s:9:"list-alt ";s:8:"cantidad";s:1:"0";s:4:"tags";s:4:"menu";}i:7;a:5:{s:6:"nombre";s:8:"Noticias";s:3:"url";s:9:"noticias/";s:5:"icono";s:5:"globe";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"noticias";}i:8;a:5:{s:6:"nombre";s:20:"Paginas de Contenido";s:3:"url";s:10:"contenido/";s:5:"icono";s:6:"file-o";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"contenido";}i:9;a:5:{s:6:"nombre";s:7:"Pedidos";s:3:"url";s:8:"pedidos/";s:5:"icono";s:14:"shopping-cart ";s:8:"cantidad";s:1:"2";s:4:"tags";s:7:"pedidos";}i:10;a:5:{s:6:"nombre";s:22:"Preguntas y Respuestas";s:3:"url";s:10:"preguntas/";s:5:"icono";s:7:"comment";s:8:"cantidad";s:2:"20";s:4:"tags";s:9:"preguntas";}i:11;a:5:{s:6:"nombre";s:9:"Productos";s:3:"url";s:10:"productos/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"productos";}i:12;a:5:{s:6:"nombre";s:10:"Publicidad";s:3:"url";s:11:"publicidad/";s:5:"icono";s:20:"external-link-square";s:8:"cantidad";s:1:"0";s:4:"tags";s:10:"publicidad";}i:13;a:5:{s:6:"nombre";s:9:"Slideshow";s:3:"url";s:10:"slideshow/";s:5:"icono";s:13:"camera-retro ";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"slidehosw";}i:14;a:5:{s:6:"nombre";s:8:"Usuarios";s:3:"url";s:9:"usuarios/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"usuarios";}}}', '', '', 'Firefox', 'Unknown Windows OS', '', '2017', '02'),
('6d8e553f54b4636710ef0e1bc92cf715', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', 1481411840, 'a:18:{s:9:"user_data";s:0:"";s:10:"referencia";s:0:"";s:9:"navegador";s:6:"Chrome";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"12";s:9:"idusuario";s:1:"1";s:6:"nombre";s:10:"Jose Bello";s:5:"cargo";s:15:"Gerente General";s:5:"email";s:27:"joseeduardo.bello@gmail.com";s:8:"telefono";s:11:"04128658193";s:9:"direccion";s:9:"San Diego";s:6:"imagen";s:36:"b96c1b31d84900d4b33ad1f06d055125.jpg";s:7:"usuario";s:6:"jbello";s:6:"status";s:1:"0";s:4:"conf";a:30:{s:16:"meta_descripcion";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:10:"meta_clave";s:174:"construccion, construcciones, ccs, grupo, remodelación, casas, edificios, locales comerciales, cemento, cabillas, venezuela, caracas construccion en valencia, vidrios, acero";s:13:"email_empresa";s:27:"joseeduardo.bello@gmail.com";s:7:"url_web";s:32:"http://www.ccsconstrucciones.com";s:15:"noticias_pagina";s:2:"20";s:13:"key_recatpcha";s:40:"6Ldy4BwTAAAAAHV_vVmyfYXOMcbl1ZmhHTI79QnO";s:11:"api_twitter";s:488:"            <a class="twitter-timeline"  href="https://twitter.com/Planfuturoseg" data-widget-id="692717040994512896" data-width="430" height="350">Tweets por el @Planfuturoseg.</a>\r\n            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?''http'':''https'';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>";s:13:"api_analytics";s:0:"";s:9:"api_otros";s:741:"<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));</script>\r\n<div class="fb-page" data-href="https://www.facebook.com/hotelsalma/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/hotelsalma/"><a href="https://www.facebook.com/hotelsalma/">Hotel Salma Suites VIP, C.A</a></blockquote></div></div>";s:12:"url_facebook";s:39:"http://www.facebook.com/omzconstruccion";s:11:"url_twitter";s:38:"http://www.twitter.com/omzconstruccion";s:13:"url_instagram";s:40:"http://www.instagram.com/omzconstruccion";s:10:"user_skype";s:0:"";s:12:"url_pinteres";s:0:"";s:14:"url_googleplus";s:0:"";s:12:"url_linkedin";s:0:"";s:16:"telefono_empresa";s:33:"+58 212.501.25.21 / 407-339-2216 ";s:17:"direccion_empresa";s:65:"Distrito Capital - Caracas / 981 E. ALTAMONTE SPRINGS,L 32701....";s:13:"api_googlemap";s:367:"<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d251097.9245946213!2d-67.03045464854458!3d10.468698840429772!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8c2a58adcd824807%3A0x93dd2eae0a998483!2sCaracas%2C+Distrito+Capital!5e0!3m2!1ses!2sve!4v1469423800981" width="100%" height="auto" frameborder="0" style="border:0" allowfullscreen></iframe>";s:9:"smtp_host";s:0:"";s:9:"smtp_port";s:0:"";s:9:"smtp_user";s:0:"";s:9:"smtp_pass";s:0:"";s:10:"email_from";s:0:"";s:11:"nombre_from";s:0:"";s:9:"copyright";s:50:" © Copiright OMZ Construcciones RIF: J-29741518-1";s:10:"nombre_rss";s:9:"FMB Group";s:15:"descripcion_rss";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:19:"publicidad_noticias";s:1:"4";s:14:"simbolo_moneda";s:1:"0";}s:4:"mods";a:12:{i:0;a:5:{s:6:"nombre";s:18:"Centro de Mensajes";s:3:"url";s:9:"mensajes/";s:5:"icono";s:8:"envelope";s:8:"cantidad";s:2:"10";s:4:"tags";s:8:"contacto";}i:1;a:5:{s:6:"nombre";s:8:"Clientes";s:3:"url";s:9:"clientes/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"clientes";}i:2;a:5:{s:6:"nombre";s:11:"Colecciones";s:3:"url";s:12:"colecciones/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:11:"colecciones";}i:3;a:5:{s:6:"nombre";s:14:"Configuración";s:3:"url";s:8:"ajustes/";s:5:"icono";s:6:"wrench";s:8:"cantidad";s:1:"0";s:4:"tags";s:13:"configuracion";}i:4;a:5:{s:6:"nombre";s:14:"Gestor de Menu";s:3:"url";s:5:"menu/";s:5:"icono";s:9:"list-alt ";s:8:"cantidad";s:1:"0";s:4:"tags";s:4:"menu";}i:5;a:5:{s:6:"nombre";s:8:"Noticias";s:3:"url";s:9:"noticias/";s:5:"icono";s:5:"globe";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"noticias";}i:6;a:5:{s:6:"nombre";s:5:"Obras";s:3:"url";s:6:"obras/";s:5:"icono";s:8:"building";s:8:"cantidad";s:1:"0";s:4:"tags";s:5:"obras";}i:7;a:5:{s:6:"nombre";s:20:"Paginas de Contenido";s:3:"url";s:10:"contenido/";s:5:"icono";s:6:"file-o";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"contenido";}i:8;a:5:{s:6:"nombre";s:9:"Productos";s:3:"url";s:10:"productos/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"productos";}i:9;a:5:{s:6:"nombre";s:10:"Publicidad";s:3:"url";s:11:"publicidad/";s:5:"icono";s:20:"external-link-square";s:8:"cantidad";s:1:"0";s:4:"tags";s:10:"publicidad";}i:10;a:5:{s:6:"nombre";s:9:"Slideshow";s:3:"url";s:10:"slideshow/";s:5:"icono";s:13:"camera-retro ";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"slidehosw";}i:11;a:5:{s:6:"nombre";s:8:"Usuarios";s:3:"url";s:9:"usuarios/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"usuarios";}}}', '', '', 'Chrome', 'Unknown Windows OS', '', '2016', '12'),
('733dc3641ccbe9d478bac8299d5d494d', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:49.0) Gecko/20100101 Firefox/49.0', 1477238410, 'a:18:{s:9:"user_data";s:0:"";s:10:"referencia";s:0:"";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"10";s:9:"idusuario";s:1:"1";s:6:"nombre";s:10:"Jose Bello";s:5:"cargo";s:15:"Gerente General";s:5:"email";s:27:"joseeduardo.bello@gmail.com";s:8:"telefono";s:11:"04128658193";s:9:"direccion";s:9:"San Diego";s:6:"imagen";s:36:"b96c1b31d84900d4b33ad1f06d055125.jpg";s:7:"usuario";s:6:"jbello";s:6:"status";s:1:"0";s:4:"conf";a:30:{s:16:"meta_descripcion";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:10:"meta_clave";s:174:"construccion, construcciones, ccs, grupo, remodelación, casas, edificios, locales comerciales, cemento, cabillas, venezuela, caracas construccion en valencia, vidrios, acero";s:13:"email_empresa";s:27:"joseeduardo.bello@gmail.com";s:7:"url_web";s:32:"http://www.ccsconstrucciones.com";s:15:"noticias_pagina";s:2:"20";s:13:"key_recatpcha";s:40:"6Ldy4BwTAAAAAHV_vVmyfYXOMcbl1ZmhHTI79QnO";s:11:"api_twitter";s:488:"            <a class="twitter-timeline"  href="https://twitter.com/Planfuturoseg" data-widget-id="692717040994512896" data-width="430" height="350">Tweets por el @Planfuturoseg.</a>\r\n            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?''http'':''https'';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>";s:13:"api_analytics";s:0:"";s:9:"api_otros";s:741:"<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));</script>\r\n<div class="fb-page" data-href="https://www.facebook.com/hotelsalma/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/hotelsalma/"><a href="https://www.facebook.com/hotelsalma/">Hotel Salma Suites VIP, C.A</a></blockquote></div></div>";s:12:"url_facebook";s:39:"http://www.facebook.com/CCSCONSTRUCCION";s:11:"url_twitter";s:38:"http://www.twitter.com/CCSCONSTRUCCION";s:13:"url_instagram";s:40:"http://www.instagram.com/CCSCONSTRUCCION";s:10:"user_skype";s:28:"jose.eduardo.bello.otero....";s:12:"url_pinteres";s:0:"";s:14:"url_googleplus";s:0:"";s:12:"url_linkedin";s:0:"";s:16:"telefono_empresa";s:33:"+58 212.501.25.21 / 407-339-2216 ";s:17:"direccion_empresa";s:65:"Distrito Capital - Caracas / 981 E. ALTAMONTE SPRINGS,L 32701....";s:13:"api_googlemap";s:367:"<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d251097.9245946213!2d-67.03045464854458!3d10.468698840429772!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8c2a58adcd824807%3A0x93dd2eae0a998483!2sCaracas%2C+Distrito+Capital!5e0!3m2!1ses!2sve!4v1469423800981" width="100%" height="auto" frameborder="0" style="border:0" allowfullscreen></iframe>";s:9:"smtp_host";s:0:"";s:9:"smtp_port";s:0:"";s:9:"smtp_user";s:0:"";s:9:"smtp_pass";s:0:"";s:10:"email_from";s:0:"";s:11:"nombre_from";s:0:"";s:9:"copyright";s:28:"Copyrigth © 2016. FMB Group";s:10:"nombre_rss";s:9:"FMB Group";s:15:"descripcion_rss";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:19:"publicidad_noticias";s:1:"4";s:14:"simbolo_moneda";s:1:"0";}s:4:"mods";a:12:{i:0;a:5:{s:6:"nombre";s:18:"Centro de Mensajes";s:3:"url";s:9:"mensajes/";s:5:"icono";s:8:"envelope";s:8:"cantidad";s:2:"10";s:4:"tags";s:8:"contacto";}i:1;a:5:{s:6:"nombre";s:8:"Clientes";s:3:"url";s:9:"clientes/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"clientes";}i:2;a:5:{s:6:"nombre";s:11:"Colecciones";s:3:"url";s:12:"colecciones/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:11:"colecciones";}i:3;a:5:{s:6:"nombre";s:14:"Configuración";s:3:"url";s:14:"configuracion/";s:5:"icono";s:6:"wrench";s:8:"cantidad";s:1:"0";s:4:"tags";s:13:"configuracion";}i:4;a:5:{s:6:"nombre";s:14:"Gestor de Menu";s:3:"url";s:5:"menu/";s:5:"icono";s:9:"list-alt ";s:8:"cantidad";s:1:"0";s:4:"tags";s:4:"menu";}i:5;a:5:{s:6:"nombre";s:8:"Noticias";s:3:"url";s:9:"noticias/";s:5:"icono";s:5:"globe";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"noticias";}i:6;a:5:{s:6:"nombre";s:5:"Obras";s:3:"url";s:6:"obras/";s:5:"icono";s:8:"building";s:8:"cantidad";s:1:"0";s:4:"tags";s:5:"obras";}i:7;a:5:{s:6:"nombre";s:20:"Paginas de Contenido";s:3:"url";s:10:"contenido/";s:5:"icono";s:6:"file-o";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"contenido";}i:8;a:5:{s:6:"nombre";s:9:"Productos";s:3:"url";s:10:"productos/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"productos";}i:9;a:5:{s:6:"nombre";s:10:"Publicidad";s:3:"url";s:11:"publicidad/";s:5:"icono";s:20:"external-link-square";s:8:"cantidad";s:1:"0";s:4:"tags";s:10:"publicidad";}i:10;a:5:{s:6:"nombre";s:9:"Slideshow";s:3:"url";s:10:"slideshow/";s:5:"icono";s:13:"camera-retro ";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"slidehosw";}i:11;a:5:{s:6:"nombre";s:8:"Usuarios";s:3:"url";s:9:"usuarios/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"usuarios";}}}', '', '', 'Firefox', 'Unknown Windows OS', '', '2016', '10'),
('779036da8b09560c8badbcb49d05b22a', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1481482110, '', '', 'http://localhost/www/sporthouse/impanel/index.php/slideshow/', 'Firefox', 'Unknown Windows OS', '', '2016', '12'),
('7aa0131369aae480d6e9e02aefca01bf', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:49.0) Gecko/20100101 Firefox/49.0', 1477278620, '', '', 'http://localhost/omzconstrucciones/impanel/index.php/contenido/', 'Firefox', 'Unknown Windows OS', '', '2016', '10'),
('82c003868a8c6de19685144132677ed2', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', 1487332873, 'a:18:{s:9:"user_data";s:0:"";s:10:"referencia";s:58:"http://localhost:8080/sporthouse/impanel/index.php/pedidos";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2017";s:3:"mes";s:2:"02";s:9:"idusuario";s:1:"1";s:6:"nombre";s:10:"Jose Bello";s:5:"cargo";s:15:"Gerente General";s:5:"email";s:27:"joseeduardo.bello@gmail.com";s:8:"telefono";s:11:"04128658193";s:9:"direccion";s:9:"San Diego";s:6:"imagen";s:36:"b96c1b31d84900d4b33ad1f06d055125.jpg";s:7:"usuario";s:6:"jbello";s:6:"status";s:1:"0";s:4:"conf";a:30:{s:16:"meta_descripcion";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:10:"meta_clave";s:174:"construccion, construcciones, ccs, grupo, remodelación, casas, edificios, locales comerciales, cemento, cabillas, venezuela, caracas construccion en valencia, vidrios, acero";s:13:"email_empresa";s:27:"joseeduardo.bello@gmail.com";s:7:"url_web";s:32:"http://www.ccsconstrucciones.com";s:15:"noticias_pagina";s:2:"20";s:13:"key_recatpcha";s:40:"6Ldy4BwTAAAAAHV_vVmyfYXOMcbl1ZmhHTI79QnO";s:11:"api_twitter";s:488:"            <a class="twitter-timeline"  href="https://twitter.com/Planfuturoseg" data-widget-id="692717040994512896" data-width="430" height="350">Tweets por el @Planfuturoseg.</a>\r\n            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?''http'':''https'';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>";s:13:"api_analytics";s:0:"";s:9:"api_otros";s:741:"<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));</script>\r\n<div class="fb-page" data-href="https://www.facebook.com/hotelsalma/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/hotelsalma/"><a href="https://www.facebook.com/hotelsalma/">Hotel Salma Suites VIP, C.A</a></blockquote></div></div>";s:12:"url_facebook";s:39:"http://www.facebook.com/omzconstruccion";s:11:"url_twitter";s:38:"http://www.twitter.com/omzconstruccion";s:13:"url_instagram";s:40:"http://www.instagram.com/omzconstruccion";s:10:"user_skype";s:0:"";s:12:"url_pinteres";s:0:"";s:14:"url_googleplus";s:0:"";s:12:"url_linkedin";s:0:"";s:16:"telefono_empresa";s:33:"+58 212.501.25.21 / 407-339-2216 ";s:17:"direccion_empresa";s:65:"Distrito Capital - Caracas / 981 E. ALTAMONTE SPRINGS,L 32701....";s:13:"api_googlemap";s:367:"<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d251097.9245946213!2d-67.03045464854458!3d10.468698840429772!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8c2a58adcd824807%3A0x93dd2eae0a998483!2sCaracas%2C+Distrito+Capital!5e0!3m2!1ses!2sve!4v1469423800981" width="100%" height="auto" frameborder="0" style="border:0" allowfullscreen></iframe>";s:9:"smtp_host";s:0:"";s:9:"smtp_port";s:0:"";s:9:"smtp_user";s:0:"";s:9:"smtp_pass";s:0:"";s:10:"email_from";s:0:"";s:11:"nombre_from";s:0:"";s:9:"copyright";s:50:" © Copiright OMZ Construcciones RIF: J-29741518-1";s:10:"nombre_rss";s:9:"FMB Group";s:15:"descripcion_rss";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:19:"publicidad_noticias";s:1:"4";s:14:"simbolo_moneda";s:1:"0";}s:4:"mods";a:12:{i:0;a:5:{s:6:"nombre";s:18:"Centro de Mensajes";s:3:"url";s:9:"mensajes/";s:5:"icono";s:8:"envelope";s:8:"cantidad";s:2:"10";s:4:"tags";s:8:"contacto";}i:1;a:5:{s:6:"nombre";s:8:"Clientes";s:3:"url";s:9:"clientes/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"clientes";}i:2;a:5:{s:6:"nombre";s:11:"Colecciones";s:3:"url";s:12:"colecciones/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:11:"colecciones";}i:3;a:5:{s:6:"nombre";s:14:"Configuración";s:3:"url";s:8:"ajustes/";s:5:"icono";s:6:"wrench";s:8:"cantidad";s:1:"0";s:4:"tags";s:13:"configuracion";}i:4;a:5:{s:6:"nombre";s:14:"Gestor de Menu";s:3:"url";s:5:"menu/";s:5:"icono";s:9:"list-alt ";s:8:"cantidad";s:1:"0";s:4:"tags";s:4:"menu";}i:5;a:5:{s:6:"nombre";s:8:"Noticias";s:3:"url";s:9:"noticias/";s:5:"icono";s:5:"globe";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"noticias";}i:6;a:5:{s:6:"nombre";s:5:"Obras";s:3:"url";s:6:"obras/";s:5:"icono";s:8:"building";s:8:"cantidad";s:1:"0";s:4:"tags";s:5:"obras";}i:7;a:5:{s:6:"nombre";s:20:"Paginas de Contenido";s:3:"url";s:10:"contenido/";s:5:"icono";s:6:"file-o";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"contenido";}i:8;a:5:{s:6:"nombre";s:9:"Productos";s:3:"url";s:10:"productos/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"productos";}i:9;a:5:{s:6:"nombre";s:10:"Publicidad";s:3:"url";s:11:"publicidad/";s:5:"icono";s:20:"external-link-square";s:8:"cantidad";s:1:"0";s:4:"tags";s:10:"publicidad";}i:10;a:5:{s:6:"nombre";s:9:"Slideshow";s:3:"url";s:10:"slideshow/";s:5:"icono";s:13:"camera-retro ";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"slidehosw";}i:11;a:5:{s:6:"nombre";s:8:"Usuarios";s:3:"url";s:9:"usuarios/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"usuarios";}}}', '', 'http://localhost:8080/sporthouse/impanel/index.php/pedidos', 'Firefox', 'Unknown Windows OS', '', '2017', '02'),
('846710c867e898089bd65ce23faca78f', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:49.0) Gecko/20100101 Firefox/49.0', 1477286320, 'a:18:{s:9:"user_data";s:0:"";s:10:"referencia";s:63:"http://localhost/omzconstrucciones/impanel/index.php/contenido/";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"10";s:9:"idusuario";s:1:"1";s:6:"nombre";s:10:"Jose Bello";s:5:"cargo";s:15:"Gerente General";s:5:"email";s:27:"joseeduardo.bello@gmail.com";s:8:"telefono";s:11:"04128658193";s:9:"direccion";s:9:"San Diego";s:6:"imagen";s:36:"b96c1b31d84900d4b33ad1f06d055125.jpg";s:7:"usuario";s:6:"jbello";s:6:"status";s:1:"0";s:4:"conf";a:30:{s:16:"meta_descripcion";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:10:"meta_clave";s:174:"construccion, construcciones, ccs, grupo, remodelación, casas, edificios, locales comerciales, cemento, cabillas, venezuela, caracas construccion en valencia, vidrios, acero";s:13:"email_empresa";s:27:"joseeduardo.bello@gmail.com";s:7:"url_web";s:32:"http://www.ccsconstrucciones.com";s:15:"noticias_pagina";s:2:"20";s:13:"key_recatpcha";s:40:"6Ldy4BwTAAAAAHV_vVmyfYXOMcbl1ZmhHTI79QnO";s:11:"api_twitter";s:488:"            <a class="twitter-timeline"  href="https://twitter.com/Planfuturoseg" data-widget-id="692717040994512896" data-width="430" height="350">Tweets por el @Planfuturoseg.</a>\r\n            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?''http'':''https'';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>";s:13:"api_analytics";s:0:"";s:9:"api_otros";s:741:"<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));</script>\r\n<div class="fb-page" data-href="https://www.facebook.com/hotelsalma/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/hotelsalma/"><a href="https://www.facebook.com/hotelsalma/">Hotel Salma Suites VIP, C.A</a></blockquote></div></div>";s:12:"url_facebook";s:39:"http://www.facebook.com/CCSCONSTRUCCION";s:11:"url_twitter";s:38:"http://www.twitter.com/CCSCONSTRUCCION";s:13:"url_instagram";s:40:"http://www.instagram.com/CCSCONSTRUCCION";s:10:"user_skype";s:28:"jose.eduardo.bello.otero....";s:12:"url_pinteres";s:0:"";s:14:"url_googleplus";s:0:"";s:12:"url_linkedin";s:0:"";s:16:"telefono_empresa";s:33:"+58 212.501.25.21 / 407-339-2216 ";s:17:"direccion_empresa";s:65:"Distrito Capital - Caracas / 981 E. ALTAMONTE SPRINGS,L 32701....";s:13:"api_googlemap";s:367:"<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d251097.9245946213!2d-67.03045464854458!3d10.468698840429772!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8c2a58adcd824807%3A0x93dd2eae0a998483!2sCaracas%2C+Distrito+Capital!5e0!3m2!1ses!2sve!4v1469423800981" width="100%" height="auto" frameborder="0" style="border:0" allowfullscreen></iframe>";s:9:"smtp_host";s:0:"";s:9:"smtp_port";s:0:"";s:9:"smtp_user";s:0:"";s:9:"smtp_pass";s:0:"";s:10:"email_from";s:0:"";s:11:"nombre_from";s:0:"";s:9:"copyright";s:28:"Copyrigth © 2016. FMB Group";s:10:"nombre_rss";s:9:"FMB Group";s:15:"descripcion_rss";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:19:"publicidad_noticias";s:1:"4";s:14:"simbolo_moneda";s:1:"0";}s:4:"mods";a:12:{i:0;a:5:{s:6:"nombre";s:18:"Centro de Mensajes";s:3:"url";s:9:"mensajes/";s:5:"icono";s:8:"envelope";s:8:"cantidad";s:2:"10";s:4:"tags";s:8:"contacto";}i:1;a:5:{s:6:"nombre";s:8:"Clientes";s:3:"url";s:9:"clientes/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"clientes";}i:2;a:5:{s:6:"nombre";s:11:"Colecciones";s:3:"url";s:12:"colecciones/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:11:"colecciones";}i:3;a:5:{s:6:"nombre";s:14:"Configuración";s:3:"url";s:8:"ajustes/";s:5:"icono";s:6:"wrench";s:8:"cantidad";s:1:"0";s:4:"tags";s:13:"configuracion";}i:4;a:5:{s:6:"nombre";s:14:"Gestor de Menu";s:3:"url";s:5:"menu/";s:5:"icono";s:9:"list-alt ";s:8:"cantidad";s:1:"0";s:4:"tags";s:4:"menu";}i:5;a:5:{s:6:"nombre";s:8:"Noticias";s:3:"url";s:9:"noticias/";s:5:"icono";s:5:"globe";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"noticias";}i:6;a:5:{s:6:"nombre";s:5:"Obras";s:3:"url";s:6:"obras/";s:5:"icono";s:8:"building";s:8:"cantidad";s:1:"0";s:4:"tags";s:5:"obras";}i:7;a:5:{s:6:"nombre";s:20:"Paginas de Contenido";s:3:"url";s:10:"contenido/";s:5:"icono";s:6:"file-o";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"contenido";}i:8;a:5:{s:6:"nombre";s:9:"Productos";s:3:"url";s:10:"productos/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"productos";}i:9;a:5:{s:6:"nombre";s:10:"Publicidad";s:3:"url";s:11:"publicidad/";s:5:"icono";s:20:"external-link-square";s:8:"cantidad";s:1:"0";s:4:"tags";s:10:"publicidad";}i:10;a:5:{s:6:"nombre";s:9:"Slideshow";s:3:"url";s:10:"slideshow/";s:5:"icono";s:13:"camera-retro ";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"slidehosw";}i:11;a:5:{s:6:"nombre";s:8:"Usuarios";s:3:"url";s:9:"usuarios/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"usuarios";}}}', '', 'http://localhost/omzconstrucciones/impanel/index.php/contenido/', 'Firefox', 'Unknown Windows OS', '', '2016', '10'),
('85804b2a1086c7f4d20a6bd55dfb8658', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', 1487333116, 'a:18:{s:9:"user_data";s:0:"";s:10:"referencia";s:62:"http://localhost:8080/sporthouse/impanel/index.php/escritorio/";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2017";s:3:"mes";s:2:"02";s:9:"idusuario";s:1:"1";s:6:"nombre";s:10:"Jose Bello";s:5:"cargo";s:15:"Gerente General";s:5:"email";s:27:"joseeduardo.bello@gmail.com";s:8:"telefono";s:11:"04128658193";s:9:"direccion";s:9:"San Diego";s:6:"imagen";s:36:"b96c1b31d84900d4b33ad1f06d055125.jpg";s:7:"usuario";s:6:"jbello";s:6:"status";s:1:"0";s:4:"conf";a:30:{s:16:"meta_descripcion";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:10:"meta_clave";s:174:"construccion, construcciones, ccs, grupo, remodelación, casas, edificios, locales comerciales, cemento, cabillas, venezuela, caracas construccion en valencia, vidrios, acero";s:13:"email_empresa";s:27:"joseeduardo.bello@gmail.com";s:7:"url_web";s:32:"http://www.ccsconstrucciones.com";s:15:"noticias_pagina";s:2:"20";s:13:"key_recatpcha";s:40:"6Ldy4BwTAAAAAHV_vVmyfYXOMcbl1ZmhHTI79QnO";s:11:"api_twitter";s:488:"            <a class="twitter-timeline"  href="https://twitter.com/Planfuturoseg" data-widget-id="692717040994512896" data-width="430" height="350">Tweets por el @Planfuturoseg.</a>\r\n            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?''http'':''https'';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>";s:13:"api_analytics";s:0:"";s:9:"api_otros";s:741:"<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));</script>\r\n<div class="fb-page" data-href="https://www.facebook.com/hotelsalma/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/hotelsalma/"><a href="https://www.facebook.com/hotelsalma/">Hotel Salma Suites VIP, C.A</a></blockquote></div></div>";s:12:"url_facebook";s:39:"http://www.facebook.com/omzconstruccion";s:11:"url_twitter";s:38:"http://www.twitter.com/omzconstruccion";s:13:"url_instagram";s:40:"http://www.instagram.com/omzconstruccion";s:10:"user_skype";s:0:"";s:12:"url_pinteres";s:0:"";s:14:"url_googleplus";s:0:"";s:12:"url_linkedin";s:0:"";s:16:"telefono_empresa";s:33:"+58 212.501.25.21 / 407-339-2216 ";s:17:"direccion_empresa";s:65:"Distrito Capital - Caracas / 981 E. ALTAMONTE SPRINGS,L 32701....";s:13:"api_googlemap";s:367:"<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d251097.9245946213!2d-67.03045464854458!3d10.468698840429772!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8c2a58adcd824807%3A0x93dd2eae0a998483!2sCaracas%2C+Distrito+Capital!5e0!3m2!1ses!2sve!4v1469423800981" width="100%" height="auto" frameborder="0" style="border:0" allowfullscreen></iframe>";s:9:"smtp_host";s:0:"";s:9:"smtp_port";s:0:"";s:9:"smtp_user";s:0:"";s:9:"smtp_pass";s:0:"";s:10:"email_from";s:0:"";s:11:"nombre_from";s:0:"";s:9:"copyright";s:50:" © Copiright OMZ Construcciones RIF: J-29741518-1";s:10:"nombre_rss";s:9:"FMB Group";s:15:"descripcion_rss";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:19:"publicidad_noticias";s:1:"4";s:14:"simbolo_moneda";s:1:"0";}s:4:"mods";a:15:{i:0;a:5:{s:6:"nombre";s:18:"Centro de Mensajes";s:3:"url";s:9:"mensajes/";s:5:"icono";s:8:"envelope";s:8:"cantidad";s:2:"10";s:4:"tags";s:8:"contacto";}i:1;a:5:{s:6:"nombre";s:8:"Clientes";s:3:"url";s:9:"clientes/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"clientes";}i:2;a:5:{s:6:"nombre";s:11:"Comentarios";s:3:"url";s:12:"comentarios/";s:5:"icono";s:8:"comments";s:8:"cantidad";s:3:"134";s:4:"tags";s:11:"comentarios";}i:3;a:5:{s:6:"nombre";s:14:"Configuración";s:3:"url";s:14:"configuracion/";s:5:"icono";s:6:"wrench";s:8:"cantidad";s:1:"0";s:4:"tags";s:13:"configuracion";}i:4;a:5:{s:6:"nombre";s:7:"Eventos";s:3:"url";s:8:"eventos/";s:5:"icono";s:5:"globe";s:8:"cantidad";s:1:"0";s:4:"tags";s:7:"eventos";}i:5;a:5:{s:6:"nombre";s:8:"Galerias";s:3:"url";s:8:"galeria/";s:5:"icono";s:4:"film";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"galerias";}i:6;a:5:{s:6:"nombre";s:14:"Gestor de Menu";s:3:"url";s:5:"menu/";s:5:"icono";s:9:"list-alt ";s:8:"cantidad";s:1:"0";s:4:"tags";s:4:"menu";}i:7;a:5:{s:6:"nombre";s:8:"Noticias";s:3:"url";s:9:"noticias/";s:5:"icono";s:5:"globe";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"noticias";}i:8;a:5:{s:6:"nombre";s:20:"Paginas de Contenido";s:3:"url";s:10:"contenido/";s:5:"icono";s:6:"file-o";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"contenido";}i:9;a:5:{s:6:"nombre";s:7:"Pedidos";s:3:"url";s:8:"pedidos/";s:5:"icono";s:14:"shopping-cart ";s:8:"cantidad";s:1:"2";s:4:"tags";s:7:"pedidos";}i:10;a:5:{s:6:"nombre";s:22:"Preguntas y Respuestas";s:3:"url";s:10:"preguntas/";s:5:"icono";s:7:"comment";s:8:"cantidad";s:2:"20";s:4:"tags";s:9:"preguntas";}i:11;a:5:{s:6:"nombre";s:9:"Productos";s:3:"url";s:10:"productos/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"productos";}i:12;a:5:{s:6:"nombre";s:10:"Publicidad";s:3:"url";s:11:"publicidad/";s:5:"icono";s:20:"external-link-square";s:8:"cantidad";s:1:"0";s:4:"tags";s:10:"publicidad";}i:13;a:5:{s:6:"nombre";s:9:"Slideshow";s:3:"url";s:10:"slideshow/";s:5:"icono";s:13:"camera-retro ";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"slidehosw";}i:14;a:5:{s:6:"nombre";s:8:"Usuarios";s:3:"url";s:9:"usuarios/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"usuarios";}}}', '', 'http://localhost:8080/sporthouse/impanel/index.php/escritorio/', 'Firefox', 'Unknown Windows OS', '', '2017', '02'),
('86742a8a8133673faf85f971c9c44016', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', 1467619599, 'a:18:{s:9:"user_data";s:0:"";s:10:"referencia";s:74:"http://localhost/soluplasticinternacional/impanel/index.php/configuracion/";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"07";s:9:"idusuario";s:1:"1";s:6:"nombre";s:10:"Jose Bello";s:5:"cargo";s:15:"Gerente General";s:5:"email";s:27:"joseeduardo.bello@gmail.com";s:8:"telefono";s:11:"04128658193";s:9:"direccion";s:9:"San Diego";s:6:"imagen";s:36:"b96c1b31d84900d4b33ad1f06d055125.jpg";s:7:"usuario";s:6:"jbello";s:6:"status";s:1:"0";s:4:"conf";a:29:{s:16:"meta_descripcion";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:10:"meta_clave";s:160:"construccion, construcciones, fmb, grupo, remodelación, casas, edificios, locales comerciales, cemento, cabillas, venezuela, valencia, construccion en valencia";s:13:"email_empresa";s:24:"contacto@fmbgroup.com.ve";s:7:"url_web";s:26:"http://www.fmbgroup.com.ve";s:15:"noticias_pagina";s:2:"20";s:13:"key_recatpcha";s:40:"6Ldy4BwTAAAAAHV_vVmyfYXOMcbl1ZmhHTI79QnO";s:11:"api_twitter";s:488:"            <a class="twitter-timeline"  href="https://twitter.com/Planfuturoseg" data-widget-id="692717040994512896" data-width="500" height="500">Tweets por el @Planfuturoseg.</a>\r\n            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?''http'':''https'';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>";s:13:"api_analytics";s:0:"";s:9:"api_otros";s:741:"<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));</script>\r\n<div class="fb-page" data-href="https://www.facebook.com/hotelsalma/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/hotelsalma/"><a href="https://www.facebook.com/hotelsalma/">Hotel Salma Suites VIP, C.A</a></blockquote></div></div>";s:12:"url_facebook";s:32:"http://www.facebook.com/fmbgroup";s:11:"url_twitter";s:31:"http://www.twitter.com/fmbgroup";s:13:"url_instagram";s:33:"http://www.instagram.com/fmbgroup";s:10:"user_skype";s:0:"";s:12:"url_pinteres";s:0:"";s:14:"url_googleplus";s:0:"";s:12:"url_linkedin";s:0:"";s:16:"telefono_empresa";s:33:"58-241 8221106 -8216283 - 8223863";s:17:"direccion_empresa";s:31:"Valencia - Carabobo - Venezuela";s:13:"api_googlemap";s:0:"";s:9:"smtp_host";s:0:"";s:9:"smtp_port";s:0:"";s:9:"smtp_user";s:0:"";s:9:"smtp_pass";s:0:"";s:10:"email_from";s:0:"";s:11:"nombre_from";s:0:"";s:9:"copyright";s:28:"Copyrigth © 2016. FMB Group";s:10:"nombre_rss";s:9:"FMB Group";s:15:"descripcion_rss";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:19:"publicidad_noticias";s:1:"4";}s:4:"mods";a:11:{i:0;a:5:{s:6:"nombre";s:18:"Centro de Mensajes";s:3:"url";s:9:"mensajes/";s:5:"icono";s:8:"envelope";s:8:"cantidad";s:2:"10";s:4:"tags";s:8:"contacto";}i:1;a:5:{s:6:"nombre";s:8:"Clientes";s:3:"url";s:9:"clientes/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"clientes";}i:2;a:5:{s:6:"nombre";s:11:"Colecciones";s:3:"url";s:12:"colecciones/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:11:"colecciones";}i:3;a:5:{s:6:"nombre";s:14:"Configuración";s:3:"url";s:14:"configuracion/";s:5:"icono";s:6:"wrench";s:8:"cantidad";s:1:"0";s:4:"tags";s:13:"configuracion";}i:4;a:5:{s:6:"nombre";s:14:"Gestor de Menu";s:3:"url";s:5:"menu/";s:5:"icono";s:9:"list-alt ";s:8:"cantidad";s:1:"0";s:4:"tags";s:4:"menu";}i:5;a:5:{s:6:"nombre";s:8:"Noticias";s:3:"url";s:9:"noticias/";s:5:"icono";s:5:"globe";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"noticias";}i:6;a:5:{s:6:"nombre";s:20:"Paginas de Contenido";s:3:"url";s:10:"contenido/";s:5:"icono";s:6:"file-o";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"contenido";}i:7;a:5:{s:6:"nombre";s:9:"Productos";s:3:"url";s:10:"productos/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"productos";}i:8;a:5:{s:6:"nombre";s:10:"Publicidad";s:3:"url";s:11:"publicidad/";s:5:"icono";s:20:"external-link-square";s:8:"cantidad";s:1:"0";s:4:"tags";s:10:"publicidad";}i:9;a:5:{s:6:"nombre";s:9:"Slideshow";s:3:"url";s:10:"slideshow/";s:5:"icono";s:13:"camera-retro ";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"slidehosw";}i:10;a:5:{s:6:"nombre";s:8:"Usuarios";s:3:"url";s:9:"usuarios/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"usuarios";}}}', '', 'http://localhost/soluplasticinternacional/impanel/index.php/configuracion/', 'Firefox', 'Unknown Windows OS', '', '2016', '07'),
('86bd7946e69129fc53279ee755b7b77e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', 1467874386, 'a:18:{s:9:"user_data";s:0:"";s:10:"referencia";s:80:"http://localhost/soluplasticinternacional/impanel/index.php/productos/galeria/13";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"07";s:9:"idusuario";s:1:"1";s:6:"nombre";s:10:"Jose Bello";s:5:"cargo";s:15:"Gerente General";s:5:"email";s:27:"joseeduardo.bello@gmail.com";s:8:"telefono";s:11:"04128658193";s:9:"direccion";s:9:"San Diego";s:6:"imagen";s:36:"b96c1b31d84900d4b33ad1f06d055125.jpg";s:7:"usuario";s:6:"jbello";s:6:"status";s:1:"0";s:4:"conf";a:29:{s:16:"meta_descripcion";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:10:"meta_clave";s:160:"construccion, construcciones, fmb, grupo, remodelación, casas, edificios, locales comerciales, cemento, cabillas, venezuela, valencia, construccion en valencia";s:13:"email_empresa";s:24:"contacto@fmbgroup.com.ve";s:7:"url_web";s:26:"http://www.fmbgroup.com.ve";s:15:"noticias_pagina";s:2:"20";s:13:"key_recatpcha";s:40:"6Ldy4BwTAAAAAHV_vVmyfYXOMcbl1ZmhHTI79QnO";s:11:"api_twitter";s:488:"            <a class="twitter-timeline"  href="https://twitter.com/Planfuturoseg" data-widget-id="692717040994512896" data-width="430" height="350">Tweets por el @Planfuturoseg.</a>\r\n            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?''http'':''https'';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>";s:13:"api_analytics";s:0:"";s:9:"api_otros";s:741:"<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));</script>\r\n<div class="fb-page" data-href="https://www.facebook.com/hotelsalma/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/hotelsalma/"><a href="https://www.facebook.com/hotelsalma/">Hotel Salma Suites VIP, C.A</a></blockquote></div></div>";s:12:"url_facebook";s:32:"http://www.facebook.com/fmbgroup";s:11:"url_twitter";s:31:"http://www.twitter.com/fmbgroup";s:13:"url_instagram";s:33:"http://www.instagram.com/fmbgroup";s:10:"user_skype";s:0:"";s:12:"url_pinteres";s:0:"";s:14:"url_googleplus";s:0:"";s:12:"url_linkedin";s:0:"";s:16:"telefono_empresa";s:33:"58-241 8221106 -8216283 - 8223863";s:17:"direccion_empresa";s:31:"Valencia - Carabobo - Venezuela";s:13:"api_googlemap";s:452:"<iframe width="100%" height="215" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com.au/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Dhaka,+Dhaka+Division,+Bangladesh&amp;aq=0&amp;oq=dhaka+ban&amp;sll=40.714353,-74.005973&amp;sspn=0.836898,1.815491&amp;ie=UTF8&amp;hq=&amp;hnear=Dhaka+Division,+Bangladesh&amp;t=m&amp;ll=24.542126,90.293884&amp;spn=0.124922,0.411301&amp;z=8&amp;output=embed"></iframe>";s:9:"smtp_host";s:0:"";s:9:"smtp_port";s:0:"";s:9:"smtp_user";s:0:"";s:9:"smtp_pass";s:0:"";s:10:"email_from";s:0:"";s:11:"nombre_from";s:0:"";s:9:"copyright";s:28:"Copyrigth © 2016. FMB Group";s:10:"nombre_rss";s:9:"FMB Group";s:15:"descripcion_rss";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:19:"publicidad_noticias";s:1:"4";}s:4:"mods";a:11:{i:0;a:5:{s:6:"nombre";s:18:"Centro de Mensajes";s:3:"url";s:9:"mensajes/";s:5:"icono";s:8:"envelope";s:8:"cantidad";s:2:"10";s:4:"tags";s:8:"contacto";}i:1;a:5:{s:6:"nombre";s:8:"Clientes";s:3:"url";s:9:"clientes/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"clientes";}i:2;a:5:{s:6:"nombre";s:11:"Colecciones";s:3:"url";s:12:"colecciones/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:11:"colecciones";}i:3;a:5:{s:6:"nombre";s:14:"Configuración";s:3:"url";s:14:"configuracion/";s:5:"icono";s:6:"wrench";s:8:"cantidad";s:1:"0";s:4:"tags";s:13:"configuracion";}i:4;a:5:{s:6:"nombre";s:14:"Gestor de Menu";s:3:"url";s:5:"menu/";s:5:"icono";s:9:"list-alt ";s:8:"cantidad";s:1:"0";s:4:"tags";s:4:"menu";}i:5;a:5:{s:6:"nombre";s:8:"Noticias";s:3:"url";s:9:"noticias/";s:5:"icono";s:5:"globe";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"noticias";}i:6;a:5:{s:6:"nombre";s:20:"Paginas de Contenido";s:3:"url";s:10:"contenido/";s:5:"icono";s:6:"file-o";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"contenido";}i:7;a:5:{s:6:"nombre";s:9:"Productos";s:3:"url";s:10:"productos/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"productos";}i:8;a:5:{s:6:"nombre";s:10:"Publicidad";s:3:"url";s:11:"publicidad/";s:5:"icono";s:20:"external-link-square";s:8:"cantidad";s:1:"0";s:4:"tags";s:10:"publicidad";}i:9;a:5:{s:6:"nombre";s:9:"Slideshow";s:3:"url";s:10:"slideshow/";s:5:"icono";s:13:"camera-retro ";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"slidehosw";}i:10;a:5:{s:6:"nombre";s:8:"Usuarios";s:3:"url";s:9:"usuarios/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"usuarios";}}}', '', 'http://localhost/soluplasticinternacional/impanel/index.php/productos/galeria/13', 'Firefox', 'Unknown Windows OS', '', '2016', '07');
INSERT INTO `im_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`, `pais`, `referencia`, `navegador`, `plataforma`, `mobile`, `anio`, `mes`) VALUES
('8bd7d150e6b52006299af62ce09708bb', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1482080224, 'a:18:{s:9:"user_data";s:0:"";s:10:"referencia";s:0:"";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"12";s:9:"idusuario";s:1:"1";s:6:"nombre";s:10:"Jose Bello";s:5:"cargo";s:15:"Gerente General";s:5:"email";s:27:"joseeduardo.bello@gmail.com";s:8:"telefono";s:11:"04128658193";s:9:"direccion";s:9:"San Diego";s:6:"imagen";s:36:"b96c1b31d84900d4b33ad1f06d055125.jpg";s:7:"usuario";s:6:"jbello";s:6:"status";s:1:"0";s:4:"conf";a:30:{s:16:"meta_descripcion";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:10:"meta_clave";s:174:"construccion, construcciones, ccs, grupo, remodelación, casas, edificios, locales comerciales, cemento, cabillas, venezuela, caracas construccion en valencia, vidrios, acero";s:13:"email_empresa";s:27:"joseeduardo.bello@gmail.com";s:7:"url_web";s:32:"http://www.ccsconstrucciones.com";s:15:"noticias_pagina";s:2:"20";s:13:"key_recatpcha";s:40:"6Ldy4BwTAAAAAHV_vVmyfYXOMcbl1ZmhHTI79QnO";s:11:"api_twitter";s:488:"            <a class="twitter-timeline"  href="https://twitter.com/Planfuturoseg" data-widget-id="692717040994512896" data-width="430" height="350">Tweets por el @Planfuturoseg.</a>\r\n            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?''http'':''https'';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>";s:13:"api_analytics";s:0:"";s:9:"api_otros";s:741:"<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));</script>\r\n<div class="fb-page" data-href="https://www.facebook.com/hotelsalma/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/hotelsalma/"><a href="https://www.facebook.com/hotelsalma/">Hotel Salma Suites VIP, C.A</a></blockquote></div></div>";s:12:"url_facebook";s:39:"http://www.facebook.com/omzconstruccion";s:11:"url_twitter";s:38:"http://www.twitter.com/omzconstruccion";s:13:"url_instagram";s:40:"http://www.instagram.com/omzconstruccion";s:10:"user_skype";s:0:"";s:12:"url_pinteres";s:0:"";s:14:"url_googleplus";s:0:"";s:12:"url_linkedin";s:0:"";s:16:"telefono_empresa";s:33:"+58 212.501.25.21 / 407-339-2216 ";s:17:"direccion_empresa";s:65:"Distrito Capital - Caracas / 981 E. ALTAMONTE SPRINGS,L 32701....";s:13:"api_googlemap";s:367:"<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d251097.9245946213!2d-67.03045464854458!3d10.468698840429772!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8c2a58adcd824807%3A0x93dd2eae0a998483!2sCaracas%2C+Distrito+Capital!5e0!3m2!1ses!2sve!4v1469423800981" width="100%" height="auto" frameborder="0" style="border:0" allowfullscreen></iframe>";s:9:"smtp_host";s:0:"";s:9:"smtp_port";s:0:"";s:9:"smtp_user";s:0:"";s:9:"smtp_pass";s:0:"";s:10:"email_from";s:0:"";s:11:"nombre_from";s:0:"";s:9:"copyright";s:50:" © Copiright OMZ Construcciones RIF: J-29741518-1";s:10:"nombre_rss";s:9:"FMB Group";s:15:"descripcion_rss";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:19:"publicidad_noticias";s:1:"4";s:14:"simbolo_moneda";s:1:"0";}s:4:"mods";a:12:{i:0;a:5:{s:6:"nombre";s:18:"Centro de Mensajes";s:3:"url";s:9:"mensajes/";s:5:"icono";s:8:"envelope";s:8:"cantidad";s:2:"10";s:4:"tags";s:8:"contacto";}i:1;a:5:{s:6:"nombre";s:8:"Clientes";s:3:"url";s:9:"clientes/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"clientes";}i:2;a:5:{s:6:"nombre";s:11:"Colecciones";s:3:"url";s:12:"colecciones/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:11:"colecciones";}i:3;a:5:{s:6:"nombre";s:14:"Configuración";s:3:"url";s:8:"ajustes/";s:5:"icono";s:6:"wrench";s:8:"cantidad";s:1:"0";s:4:"tags";s:13:"configuracion";}i:4;a:5:{s:6:"nombre";s:14:"Gestor de Menu";s:3:"url";s:5:"menu/";s:5:"icono";s:9:"list-alt ";s:8:"cantidad";s:1:"0";s:4:"tags";s:4:"menu";}i:5;a:5:{s:6:"nombre";s:8:"Noticias";s:3:"url";s:9:"noticias/";s:5:"icono";s:5:"globe";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"noticias";}i:6;a:5:{s:6:"nombre";s:5:"Obras";s:3:"url";s:6:"obras/";s:5:"icono";s:8:"building";s:8:"cantidad";s:1:"0";s:4:"tags";s:5:"obras";}i:7;a:5:{s:6:"nombre";s:20:"Paginas de Contenido";s:3:"url";s:10:"contenido/";s:5:"icono";s:6:"file-o";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"contenido";}i:8;a:5:{s:6:"nombre";s:9:"Productos";s:3:"url";s:10:"productos/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"productos";}i:9;a:5:{s:6:"nombre";s:10:"Publicidad";s:3:"url";s:11:"publicidad/";s:5:"icono";s:20:"external-link-square";s:8:"cantidad";s:1:"0";s:4:"tags";s:10:"publicidad";}i:10;a:5:{s:6:"nombre";s:9:"Slideshow";s:3:"url";s:10:"slideshow/";s:5:"icono";s:13:"camera-retro ";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"slidehosw";}i:11;a:5:{s:6:"nombre";s:8:"Usuarios";s:3:"url";s:9:"usuarios/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"usuarios";}}}', '', '', 'Firefox', 'Unknown Windows OS', '', '2016', '12'),
('8d36315085a514f0bd702ab626838117', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', 1487333116, '', '', 'http://localhost:8080/sporthouse/impanel/index.php/escritorio/', 'Firefox', 'Unknown Windows OS', '', '2017', '02'),
('984105900578402af4378e528f923607', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 1473016732, 'a:18:{s:9:"user_data";s:0:"";s:10:"referencia";s:0:"";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"09";s:9:"idusuario";s:1:"1";s:6:"nombre";s:10:"Jose Bello";s:5:"cargo";s:15:"Gerente General";s:5:"email";s:27:"joseeduardo.bello@gmail.com";s:8:"telefono";s:11:"04128658193";s:9:"direccion";s:9:"San Diego";s:6:"imagen";s:36:"b96c1b31d84900d4b33ad1f06d055125.jpg";s:7:"usuario";s:6:"jbello";s:6:"status";s:1:"0";s:4:"conf";a:30:{s:16:"meta_descripcion";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:10:"meta_clave";s:174:"construccion, construcciones, ccs, grupo, remodelación, casas, edificios, locales comerciales, cemento, cabillas, venezuela, caracas construccion en valencia, vidrios, acero";s:13:"email_empresa";s:27:"joseeduardo.bello@gmail.com";s:7:"url_web";s:32:"http://www.ccsconstrucciones.com";s:15:"noticias_pagina";s:2:"20";s:13:"key_recatpcha";s:40:"6Ldy4BwTAAAAAHV_vVmyfYXOMcbl1ZmhHTI79QnO";s:11:"api_twitter";s:488:"            <a class="twitter-timeline"  href="https://twitter.com/Planfuturoseg" data-widget-id="692717040994512896" data-width="430" height="350">Tweets por el @Planfuturoseg.</a>\r\n            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?''http'':''https'';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>";s:13:"api_analytics";s:0:"";s:9:"api_otros";s:741:"<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));</script>\r\n<div class="fb-page" data-href="https://www.facebook.com/hotelsalma/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/hotelsalma/"><a href="https://www.facebook.com/hotelsalma/">Hotel Salma Suites VIP, C.A</a></blockquote></div></div>";s:12:"url_facebook";s:39:"http://www.facebook.com/CCSCONSTRUCCION";s:11:"url_twitter";s:38:"http://www.twitter.com/CCSCONSTRUCCION";s:13:"url_instagram";s:40:"http://www.instagram.com/CCSCONSTRUCCION";s:10:"user_skype";s:28:"jose.eduardo.bello.otero....";s:12:"url_pinteres";s:0:"";s:14:"url_googleplus";s:0:"";s:12:"url_linkedin";s:0:"";s:16:"telefono_empresa";s:33:"+58 212.501.25.21 / 407-339-2216 ";s:17:"direccion_empresa";s:61:"Distrito Capital - Caracas / 981 E. ALTAMONTE SPRINGS,L 32701";s:13:"api_googlemap";s:367:"<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d251097.9245946213!2d-67.03045464854458!3d10.468698840429772!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8c2a58adcd824807%3A0x93dd2eae0a998483!2sCaracas%2C+Distrito+Capital!5e0!3m2!1ses!2sve!4v1469423800981" width="100%" height="auto" frameborder="0" style="border:0" allowfullscreen></iframe>";s:9:"smtp_host";s:0:"";s:9:"smtp_port";s:0:"";s:9:"smtp_user";s:0:"";s:9:"smtp_pass";s:0:"";s:10:"email_from";s:0:"";s:11:"nombre_from";s:0:"";s:9:"copyright";s:28:"Copyrigth © 2016. FMB Group";s:10:"nombre_rss";s:9:"FMB Group";s:15:"descripcion_rss";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:19:"publicidad_noticias";s:1:"4";s:14:"simbolo_moneda";s:1:"0";}s:4:"mods";a:12:{i:0;a:5:{s:6:"nombre";s:18:"Centro de Mensajes";s:3:"url";s:9:"mensajes/";s:5:"icono";s:8:"envelope";s:8:"cantidad";s:2:"10";s:4:"tags";s:8:"contacto";}i:1;a:5:{s:6:"nombre";s:8:"Clientes";s:3:"url";s:9:"clientes/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"clientes";}i:2;a:5:{s:6:"nombre";s:11:"Colecciones";s:3:"url";s:12:"colecciones/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:11:"colecciones";}i:3;a:5:{s:6:"nombre";s:14:"Configuración";s:3:"url";s:14:"configuracion/";s:5:"icono";s:6:"wrench";s:8:"cantidad";s:1:"0";s:4:"tags";s:13:"configuracion";}i:4;a:5:{s:6:"nombre";s:14:"Gestor de Menu";s:3:"url";s:5:"menu/";s:5:"icono";s:9:"list-alt ";s:8:"cantidad";s:1:"0";s:4:"tags";s:4:"menu";}i:5;a:5:{s:6:"nombre";s:8:"Noticias";s:3:"url";s:9:"noticias/";s:5:"icono";s:5:"globe";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"noticias";}i:6;a:5:{s:6:"nombre";s:5:"Obras";s:3:"url";s:6:"obras/";s:5:"icono";s:8:"building";s:8:"cantidad";s:1:"0";s:4:"tags";s:5:"obras";}i:7;a:5:{s:6:"nombre";s:20:"Paginas de Contenido";s:3:"url";s:10:"contenido/";s:5:"icono";s:6:"file-o";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"contenido";}i:8;a:5:{s:6:"nombre";s:9:"Productos";s:3:"url";s:10:"productos/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"productos";}i:9;a:5:{s:6:"nombre";s:10:"Publicidad";s:3:"url";s:11:"publicidad/";s:5:"icono";s:20:"external-link-square";s:8:"cantidad";s:1:"0";s:4:"tags";s:10:"publicidad";}i:10;a:5:{s:6:"nombre";s:9:"Slideshow";s:3:"url";s:10:"slideshow/";s:5:"icono";s:13:"camera-retro ";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"slidehosw";}i:11;a:5:{s:6:"nombre";s:8:"Usuarios";s:3:"url";s:9:"usuarios/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"usuarios";}}}', '', '', 'Firefox', 'Unknown Windows OS', '', '2016', '09'),
('9e54ebe6838ecd0e5af2291ef1f89356', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1481482110, '', '', '', 'Firefox', 'Unknown Windows OS', '', '2016', '12'),
('9f5a8af4c7507213b06a4ec11448faa5', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:49.0) Gecko/20100101 Firefox/49.0', 1477268329, 'a:18:{s:9:"user_data";s:0:"";s:10:"referencia";s:63:"http://localhost/omzconstrucciones/impanel/index.php/contenido/";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"10";s:9:"idusuario";s:1:"1";s:6:"nombre";s:10:"Jose Bello";s:5:"cargo";s:15:"Gerente General";s:5:"email";s:27:"joseeduardo.bello@gmail.com";s:8:"telefono";s:11:"04128658193";s:9:"direccion";s:9:"San Diego";s:6:"imagen";s:36:"b96c1b31d84900d4b33ad1f06d055125.jpg";s:7:"usuario";s:6:"jbello";s:6:"status";s:1:"0";s:4:"conf";a:30:{s:16:"meta_descripcion";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:10:"meta_clave";s:174:"construccion, construcciones, ccs, grupo, remodelación, casas, edificios, locales comerciales, cemento, cabillas, venezuela, caracas construccion en valencia, vidrios, acero";s:13:"email_empresa";s:27:"joseeduardo.bello@gmail.com";s:7:"url_web";s:32:"http://www.ccsconstrucciones.com";s:15:"noticias_pagina";s:2:"20";s:13:"key_recatpcha";s:40:"6Ldy4BwTAAAAAHV_vVmyfYXOMcbl1ZmhHTI79QnO";s:11:"api_twitter";s:488:"            <a class="twitter-timeline"  href="https://twitter.com/Planfuturoseg" data-widget-id="692717040994512896" data-width="430" height="350">Tweets por el @Planfuturoseg.</a>\r\n            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?''http'':''https'';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>";s:13:"api_analytics";s:0:"";s:9:"api_otros";s:741:"<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));</script>\r\n<div class="fb-page" data-href="https://www.facebook.com/hotelsalma/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/hotelsalma/"><a href="https://www.facebook.com/hotelsalma/">Hotel Salma Suites VIP, C.A</a></blockquote></div></div>";s:12:"url_facebook";s:39:"http://www.facebook.com/CCSCONSTRUCCION";s:11:"url_twitter";s:38:"http://www.twitter.com/CCSCONSTRUCCION";s:13:"url_instagram";s:40:"http://www.instagram.com/CCSCONSTRUCCION";s:10:"user_skype";s:28:"jose.eduardo.bello.otero....";s:12:"url_pinteres";s:0:"";s:14:"url_googleplus";s:0:"";s:12:"url_linkedin";s:0:"";s:16:"telefono_empresa";s:33:"+58 212.501.25.21 / 407-339-2216 ";s:17:"direccion_empresa";s:65:"Distrito Capital - Caracas / 981 E. ALTAMONTE SPRINGS,L 32701....";s:13:"api_googlemap";s:367:"<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d251097.9245946213!2d-67.03045464854458!3d10.468698840429772!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8c2a58adcd824807%3A0x93dd2eae0a998483!2sCaracas%2C+Distrito+Capital!5e0!3m2!1ses!2sve!4v1469423800981" width="100%" height="auto" frameborder="0" style="border:0" allowfullscreen></iframe>";s:9:"smtp_host";s:0:"";s:9:"smtp_port";s:0:"";s:9:"smtp_user";s:0:"";s:9:"smtp_pass";s:0:"";s:10:"email_from";s:0:"";s:11:"nombre_from";s:0:"";s:9:"copyright";s:28:"Copyrigth © 2016. FMB Group";s:10:"nombre_rss";s:9:"FMB Group";s:15:"descripcion_rss";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:19:"publicidad_noticias";s:1:"4";s:14:"simbolo_moneda";s:1:"0";}s:4:"mods";a:12:{i:0;a:5:{s:6:"nombre";s:18:"Centro de Mensajes";s:3:"url";s:9:"mensajes/";s:5:"icono";s:8:"envelope";s:8:"cantidad";s:2:"10";s:4:"tags";s:8:"contacto";}i:1;a:5:{s:6:"nombre";s:8:"Clientes";s:3:"url";s:9:"clientes/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"clientes";}i:2;a:5:{s:6:"nombre";s:11:"Colecciones";s:3:"url";s:12:"colecciones/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:11:"colecciones";}i:3;a:5:{s:6:"nombre";s:14:"Configuración";s:3:"url";s:14:"configuracion/";s:5:"icono";s:6:"wrench";s:8:"cantidad";s:1:"0";s:4:"tags";s:13:"configuracion";}i:4;a:5:{s:6:"nombre";s:14:"Gestor de Menu";s:3:"url";s:5:"menu/";s:5:"icono";s:9:"list-alt ";s:8:"cantidad";s:1:"0";s:4:"tags";s:4:"menu";}i:5;a:5:{s:6:"nombre";s:8:"Noticias";s:3:"url";s:9:"noticias/";s:5:"icono";s:5:"globe";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"noticias";}i:6;a:5:{s:6:"nombre";s:5:"Obras";s:3:"url";s:6:"obras/";s:5:"icono";s:8:"building";s:8:"cantidad";s:1:"0";s:4:"tags";s:5:"obras";}i:7;a:5:{s:6:"nombre";s:20:"Paginas de Contenido";s:3:"url";s:10:"contenido/";s:5:"icono";s:6:"file-o";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"contenido";}i:8;a:5:{s:6:"nombre";s:9:"Productos";s:3:"url";s:10:"productos/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"productos";}i:9;a:5:{s:6:"nombre";s:10:"Publicidad";s:3:"url";s:11:"publicidad/";s:5:"icono";s:20:"external-link-square";s:8:"cantidad";s:1:"0";s:4:"tags";s:10:"publicidad";}i:10;a:5:{s:6:"nombre";s:9:"Slideshow";s:3:"url";s:10:"slideshow/";s:5:"icono";s:13:"camera-retro ";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"slidehosw";}i:11;a:5:{s:6:"nombre";s:8:"Usuarios";s:3:"url";s:9:"usuarios/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"usuarios";}}}', '', 'http://localhost/omzconstrucciones/impanel/index.php/contenido/', 'Firefox', 'Unknown Windows OS', '', '2016', '10'),
('9fa72ce235ba1b30661d622898917c06', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0', 1469408021, 'a:18:{s:9:"user_data";s:0:"";s:10:"referencia";s:81:"http://localhost/ccsconstrucciones/impanel/index.php/productos/lista_productos/14";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"07";s:9:"idusuario";s:1:"1";s:6:"nombre";s:10:"Jose Bello";s:5:"cargo";s:15:"Gerente General";s:5:"email";s:27:"joseeduardo.bello@gmail.com";s:8:"telefono";s:11:"04128658193";s:9:"direccion";s:9:"San Diego";s:6:"imagen";s:36:"b96c1b31d84900d4b33ad1f06d055125.jpg";s:7:"usuario";s:6:"jbello";s:6:"status";s:1:"0";s:4:"conf";a:30:{s:16:"meta_descripcion";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:10:"meta_clave";s:160:"construccion, construcciones, fmb, grupo, remodelación, casas, edificios, locales comerciales, cemento, cabillas, venezuela, valencia, construccion en valencia";s:13:"email_empresa";s:27:"joseeduardo.bello@gmail.com";s:7:"url_web";s:26:"http://www.fmbgroup.com.ve";s:15:"noticias_pagina";s:2:"20";s:13:"key_recatpcha";s:40:"6Ldy4BwTAAAAAHV_vVmyfYXOMcbl1ZmhHTI79QnO";s:11:"api_twitter";s:488:"            <a class="twitter-timeline"  href="https://twitter.com/Planfuturoseg" data-widget-id="692717040994512896" data-width="430" height="350">Tweets por el @Planfuturoseg.</a>\r\n            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?''http'':''https'';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>";s:13:"api_analytics";s:0:"";s:9:"api_otros";s:741:"<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));</script>\r\n<div class="fb-page" data-href="https://www.facebook.com/hotelsalma/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/hotelsalma/"><a href="https://www.facebook.com/hotelsalma/">Hotel Salma Suites VIP, C.A</a></blockquote></div></div>";s:12:"url_facebook";s:32:"http://www.facebook.com/fmbgroup";s:11:"url_twitter";s:31:"http://www.twitter.com/fmbgroup";s:13:"url_instagram";s:33:"http://www.instagram.com/fmbgroup";s:10:"user_skype";s:0:"";s:12:"url_pinteres";s:0:"";s:14:"url_googleplus";s:0:"";s:12:"url_linkedin";s:0:"";s:16:"telefono_empresa";s:33:"58-241 8221106 -8216283 - 8223863";s:17:"direccion_empresa";s:31:"Valencia - Carabobo - Venezuela";s:13:"api_googlemap";s:388:"<iframe width="100%" height="215" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com.au/maps?f=q&source=s_q&hl=en&geocode=&q=Dhaka,+Dhaka+Division,+Bangladesh&aq=0&oq=dhaka+ban&sll=40.714353,-74.005973&sspn=0.836898,1.815491&ie=UTF8&hq=&hnear=Dhaka+Division,+Bangladesh&t=m&ll=24.542126,90.293884&spn=0.124922,0.411301&z=8&output=embed"></iframe>";s:9:"smtp_host";s:0:"";s:9:"smtp_port";s:0:"";s:9:"smtp_user";s:0:"";s:9:"smtp_pass";s:0:"";s:10:"email_from";s:0:"";s:11:"nombre_from";s:0:"";s:9:"copyright";s:28:"Copyrigth © 2016. FMB Group";s:10:"nombre_rss";s:9:"FMB Group";s:15:"descripcion_rss";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:19:"publicidad_noticias";s:1:"4";s:14:"simbolo_moneda";s:1:"$";}s:4:"mods";a:11:{i:0;a:5:{s:6:"nombre";s:18:"Centro de Mensajes";s:3:"url";s:9:"mensajes/";s:5:"icono";s:8:"envelope";s:8:"cantidad";s:2:"10";s:4:"tags";s:8:"contacto";}i:1;a:5:{s:6:"nombre";s:8:"Clientes";s:3:"url";s:9:"clientes/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"clientes";}i:2;a:5:{s:6:"nombre";s:11:"Colecciones";s:3:"url";s:12:"colecciones/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:11:"colecciones";}i:3;a:5:{s:6:"nombre";s:14:"Configuración";s:3:"url";s:14:"configuracion/";s:5:"icono";s:6:"wrench";s:8:"cantidad";s:1:"0";s:4:"tags";s:13:"configuracion";}i:4;a:5:{s:6:"nombre";s:14:"Gestor de Menu";s:3:"url";s:5:"menu/";s:5:"icono";s:9:"list-alt ";s:8:"cantidad";s:1:"0";s:4:"tags";s:4:"menu";}i:5;a:5:{s:6:"nombre";s:8:"Noticias";s:3:"url";s:9:"noticias/";s:5:"icono";s:5:"globe";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"noticias";}i:6;a:5:{s:6:"nombre";s:20:"Paginas de Contenido";s:3:"url";s:10:"contenido/";s:5:"icono";s:6:"file-o";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"contenido";}i:7;a:5:{s:6:"nombre";s:9:"Productos";s:3:"url";s:10:"productos/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"productos";}i:8;a:5:{s:6:"nombre";s:10:"Publicidad";s:3:"url";s:11:"publicidad/";s:5:"icono";s:20:"external-link-square";s:8:"cantidad";s:1:"0";s:4:"tags";s:10:"publicidad";}i:9;a:5:{s:6:"nombre";s:9:"Slideshow";s:3:"url";s:10:"slideshow/";s:5:"icono";s:13:"camera-retro ";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"slidehosw";}i:10;a:5:{s:6:"nombre";s:8:"Usuarios";s:3:"url";s:9:"usuarios/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"usuarios";}}}', '', 'http://localhost/ccsconstrucciones/impanel/index.php/productos/lista_productos/14', 'Firefox', 'Unknown Windows OS', '', '2016', '07'),
('a09280d9f511d2fc4123d03cf15f116c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', 1467609750, '', '', 'http://localhost/soluplasticinternacional/impanel/index.php/contenido/', 'Firefox', 'Unknown Windows OS', '', '2016', '07'),
('a7daddbe753506fdd62e27fabae1f0da', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', 1468050066, 'a:18:{s:9:"user_data";s:0:"";s:10:"referencia";s:71:"http://localhost/soluplasticinternacional/impanel/index.php/escritorio/";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"07";s:9:"idusuario";s:1:"2";s:6:"nombre";s:25:"Administrador del SIstema";s:5:"cargo";s:19:"Gerente de Sistemas";s:5:"email";s:24:"sistemas@fmbgroup.com.ve";s:8:"telefono";s:1:"0";s:9:"direccion";s:8:"Valencia";s:6:"imagen";s:0:"";s:7:"usuario";s:13:"administrador";s:6:"status";s:1:"0";s:4:"conf";a:30:{s:16:"meta_descripcion";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:10:"meta_clave";s:160:"construccion, construcciones, fmb, grupo, remodelación, casas, edificios, locales comerciales, cemento, cabillas, venezuela, valencia, construccion en valencia";s:13:"email_empresa";s:27:"joseeduardo.bello@gmail.com";s:7:"url_web";s:26:"http://www.fmbgroup.com.ve";s:15:"noticias_pagina";s:2:"20";s:13:"key_recatpcha";s:40:"6Ldy4BwTAAAAAHV_vVmyfYXOMcbl1ZmhHTI79QnO";s:11:"api_twitter";s:488:"            <a class="twitter-timeline"  href="https://twitter.com/Planfuturoseg" data-widget-id="692717040994512896" data-width="430" height="350">Tweets por el @Planfuturoseg.</a>\r\n            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?''http'':''https'';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>";s:13:"api_analytics";s:0:"";s:9:"api_otros";s:741:"<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));</script>\r\n<div class="fb-page" data-href="https://www.facebook.com/hotelsalma/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/hotelsalma/"><a href="https://www.facebook.com/hotelsalma/">Hotel Salma Suites VIP, C.A</a></blockquote></div></div>";s:12:"url_facebook";s:32:"http://www.facebook.com/fmbgroup";s:11:"url_twitter";s:31:"http://www.twitter.com/fmbgroup";s:13:"url_instagram";s:33:"http://www.instagram.com/fmbgroup";s:10:"user_skype";s:0:"";s:12:"url_pinteres";s:0:"";s:14:"url_googleplus";s:0:"";s:12:"url_linkedin";s:0:"";s:16:"telefono_empresa";s:33:"58-241 8221106 -8216283 - 8223863";s:17:"direccion_empresa";s:31:"Valencia - Carabobo - Venezuela";s:13:"api_googlemap";s:452:"<iframe width="100%" height="215" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com.au/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Dhaka,+Dhaka+Division,+Bangladesh&amp;aq=0&amp;oq=dhaka+ban&amp;sll=40.714353,-74.005973&amp;sspn=0.836898,1.815491&amp;ie=UTF8&amp;hq=&amp;hnear=Dhaka+Division,+Bangladesh&amp;t=m&amp;ll=24.542126,90.293884&amp;spn=0.124922,0.411301&amp;z=8&amp;output=embed"></iframe>";s:9:"smtp_host";s:0:"";s:9:"smtp_port";s:0:"";s:9:"smtp_user";s:0:"";s:9:"smtp_pass";s:0:"";s:10:"email_from";s:0:"";s:11:"nombre_from";s:0:"";s:9:"copyright";s:28:"Copyrigth © 2016. FMB Group";s:10:"nombre_rss";s:9:"FMB Group";s:15:"descripcion_rss";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:19:"publicidad_noticias";s:1:"4";s:14:"simbolo_moneda";s:1:"$";}s:4:"mods";a:6:{i:0;a:5:{s:6:"nombre";s:18:"Centro de Mensajes";s:3:"url";s:9:"mensajes/";s:5:"icono";s:8:"envelope";s:8:"cantidad";s:2:"10";s:4:"tags";s:8:"contacto";}i:1;a:5:{s:6:"nombre";s:14:"Configuración";s:3:"url";s:14:"configuracion/";s:5:"icono";s:6:"wrench";s:8:"cantidad";s:1:"0";s:4:"tags";s:13:"configuracion";}i:2;a:5:{s:6:"nombre";s:20:"Paginas de Contenido";s:3:"url";s:10:"contenido/";s:5:"icono";s:6:"file-o";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"contenido";}i:3;a:5:{s:6:"nombre";s:9:"Productos";s:3:"url";s:10:"productos/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"productos";}i:4;a:5:{s:6:"nombre";s:9:"Slideshow";s:3:"url";s:10:"slideshow/";s:5:"icono";s:13:"camera-retro ";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"slidehosw";}i:5;a:5:{s:6:"nombre";s:8:"Usuarios";s:3:"url";s:9:"usuarios/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"usuarios";}}}', '', 'http://localhost/soluplasticinternacional/impanel/index.php/escritorio/', 'Firefox', 'Unknown Windows OS', '', '2016', '07'),
('ac07f19f404a8beb0654a72ddd328ff9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', 1467874386, '', '', 'http://localhost/soluplasticinternacional/impanel/index.php/productos/galeria/20', 'Firefox', 'Unknown Windows OS', '', '2016', '07'),
('b03cdc680c90a853619e3cdc7b960a86', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', 1467801877, 'a:18:{s:9:"user_data";s:0:"";s:10:"referencia";s:79:"http://localhost/soluplasticinternacional/impanel/index.php/productos/galeria/3";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"07";s:9:"idusuario";s:1:"1";s:6:"nombre";s:10:"Jose Bello";s:5:"cargo";s:15:"Gerente General";s:5:"email";s:27:"joseeduardo.bello@gmail.com";s:8:"telefono";s:11:"04128658193";s:9:"direccion";s:9:"San Diego";s:6:"imagen";s:36:"b96c1b31d84900d4b33ad1f06d055125.jpg";s:7:"usuario";s:6:"jbello";s:6:"status";s:1:"0";s:4:"conf";a:29:{s:16:"meta_descripcion";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:10:"meta_clave";s:160:"construccion, construcciones, fmb, grupo, remodelación, casas, edificios, locales comerciales, cemento, cabillas, venezuela, valencia, construccion en valencia";s:13:"email_empresa";s:24:"contacto@fmbgroup.com.ve";s:7:"url_web";s:26:"http://www.fmbgroup.com.ve";s:15:"noticias_pagina";s:2:"20";s:13:"key_recatpcha";s:40:"6Ldy4BwTAAAAAHV_vVmyfYXOMcbl1ZmhHTI79QnO";s:11:"api_twitter";s:488:"            <a class="twitter-timeline"  href="https://twitter.com/Planfuturoseg" data-widget-id="692717040994512896" data-width="430" height="350">Tweets por el @Planfuturoseg.</a>\r\n            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?''http'':''https'';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>";s:13:"api_analytics";s:0:"";s:9:"api_otros";s:741:"<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));</script>\r\n<div class="fb-page" data-href="https://www.facebook.com/hotelsalma/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/hotelsalma/"><a href="https://www.facebook.com/hotelsalma/">Hotel Salma Suites VIP, C.A</a></blockquote></div></div>";s:12:"url_facebook";s:32:"http://www.facebook.com/fmbgroup";s:11:"url_twitter";s:31:"http://www.twitter.com/fmbgroup";s:13:"url_instagram";s:33:"http://www.instagram.com/fmbgroup";s:10:"user_skype";s:0:"";s:12:"url_pinteres";s:0:"";s:14:"url_googleplus";s:0:"";s:12:"url_linkedin";s:0:"";s:16:"telefono_empresa";s:33:"58-241 8221106 -8216283 - 8223863";s:17:"direccion_empresa";s:31:"Valencia - Carabobo - Venezuela";s:13:"api_googlemap";s:452:"<iframe width="100%" height="215" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com.au/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Dhaka,+Dhaka+Division,+Bangladesh&amp;aq=0&amp;oq=dhaka+ban&amp;sll=40.714353,-74.005973&amp;sspn=0.836898,1.815491&amp;ie=UTF8&amp;hq=&amp;hnear=Dhaka+Division,+Bangladesh&amp;t=m&amp;ll=24.542126,90.293884&amp;spn=0.124922,0.411301&amp;z=8&amp;output=embed"></iframe>";s:9:"smtp_host";s:0:"";s:9:"smtp_port";s:0:"";s:9:"smtp_user";s:0:"";s:9:"smtp_pass";s:0:"";s:10:"email_from";s:0:"";s:11:"nombre_from";s:0:"";s:9:"copyright";s:28:"Copyrigth © 2016. FMB Group";s:10:"nombre_rss";s:9:"FMB Group";s:15:"descripcion_rss";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:19:"publicidad_noticias";s:1:"4";}s:4:"mods";a:11:{i:0;a:5:{s:6:"nombre";s:18:"Centro de Mensajes";s:3:"url";s:9:"mensajes/";s:5:"icono";s:8:"envelope";s:8:"cantidad";s:2:"10";s:4:"tags";s:8:"contacto";}i:1;a:5:{s:6:"nombre";s:8:"Clientes";s:3:"url";s:9:"clientes/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"clientes";}i:2;a:5:{s:6:"nombre";s:11:"Colecciones";s:3:"url";s:12:"colecciones/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:11:"colecciones";}i:3;a:5:{s:6:"nombre";s:14:"Configuración";s:3:"url";s:14:"configuracion/";s:5:"icono";s:6:"wrench";s:8:"cantidad";s:1:"0";s:4:"tags";s:13:"configuracion";}i:4;a:5:{s:6:"nombre";s:14:"Gestor de Menu";s:3:"url";s:5:"menu/";s:5:"icono";s:9:"list-alt ";s:8:"cantidad";s:1:"0";s:4:"tags";s:4:"menu";}i:5;a:5:{s:6:"nombre";s:8:"Noticias";s:3:"url";s:9:"noticias/";s:5:"icono";s:5:"globe";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"noticias";}i:6;a:5:{s:6:"nombre";s:20:"Paginas de Contenido";s:3:"url";s:10:"contenido/";s:5:"icono";s:6:"file-o";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"contenido";}i:7;a:5:{s:6:"nombre";s:9:"Productos";s:3:"url";s:10:"productos/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"productos";}i:8;a:5:{s:6:"nombre";s:10:"Publicidad";s:3:"url";s:11:"publicidad/";s:5:"icono";s:20:"external-link-square";s:8:"cantidad";s:1:"0";s:4:"tags";s:10:"publicidad";}i:9;a:5:{s:6:"nombre";s:9:"Slideshow";s:3:"url";s:10:"slideshow/";s:5:"icono";s:13:"camera-retro ";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"slidehosw";}i:10;a:5:{s:6:"nombre";s:8:"Usuarios";s:3:"url";s:9:"usuarios/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"usuarios";}}}', '', 'http://localhost/soluplasticinternacional/impanel/index.php/productos/galeria/3', 'Firefox', 'Unknown Windows OS', '', '2016', '07'),
('b4e543f58d5e1b28b980c49f0b3ec968', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', 1467873351, 'a:18:{s:9:"user_data";s:0:"";s:10:"referencia";s:0:"";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"07";s:9:"idusuario";s:1:"1";s:6:"nombre";s:10:"Jose Bello";s:5:"cargo";s:15:"Gerente General";s:5:"email";s:27:"joseeduardo.bello@gmail.com";s:8:"telefono";s:11:"04128658193";s:9:"direccion";s:9:"San Diego";s:6:"imagen";s:36:"b96c1b31d84900d4b33ad1f06d055125.jpg";s:7:"usuario";s:6:"jbello";s:6:"status";s:1:"0";s:4:"conf";a:29:{s:16:"meta_descripcion";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:10:"meta_clave";s:160:"construccion, construcciones, fmb, grupo, remodelación, casas, edificios, locales comerciales, cemento, cabillas, venezuela, valencia, construccion en valencia";s:13:"email_empresa";s:24:"contacto@fmbgroup.com.ve";s:7:"url_web";s:26:"http://www.fmbgroup.com.ve";s:15:"noticias_pagina";s:2:"20";s:13:"key_recatpcha";s:40:"6Ldy4BwTAAAAAHV_vVmyfYXOMcbl1ZmhHTI79QnO";s:11:"api_twitter";s:488:"            <a class="twitter-timeline"  href="https://twitter.com/Planfuturoseg" data-widget-id="692717040994512896" data-width="430" height="350">Tweets por el @Planfuturoseg.</a>\r\n            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?''http'':''https'';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>";s:13:"api_analytics";s:0:"";s:9:"api_otros";s:741:"<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));</script>\r\n<div class="fb-page" data-href="https://www.facebook.com/hotelsalma/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/hotelsalma/"><a href="https://www.facebook.com/hotelsalma/">Hotel Salma Suites VIP, C.A</a></blockquote></div></div>";s:12:"url_facebook";s:32:"http://www.facebook.com/fmbgroup";s:11:"url_twitter";s:31:"http://www.twitter.com/fmbgroup";s:13:"url_instagram";s:33:"http://www.instagram.com/fmbgroup";s:10:"user_skype";s:0:"";s:12:"url_pinteres";s:0:"";s:14:"url_googleplus";s:0:"";s:12:"url_linkedin";s:0:"";s:16:"telefono_empresa";s:33:"58-241 8221106 -8216283 - 8223863";s:17:"direccion_empresa";s:31:"Valencia - Carabobo - Venezuela";s:13:"api_googlemap";s:452:"<iframe width="100%" height="215" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com.au/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Dhaka,+Dhaka+Division,+Bangladesh&amp;aq=0&amp;oq=dhaka+ban&amp;sll=40.714353,-74.005973&amp;sspn=0.836898,1.815491&amp;ie=UTF8&amp;hq=&amp;hnear=Dhaka+Division,+Bangladesh&amp;t=m&amp;ll=24.542126,90.293884&amp;spn=0.124922,0.411301&amp;z=8&amp;output=embed"></iframe>";s:9:"smtp_host";s:0:"";s:9:"smtp_port";s:0:"";s:9:"smtp_user";s:0:"";s:9:"smtp_pass";s:0:"";s:10:"email_from";s:0:"";s:11:"nombre_from";s:0:"";s:9:"copyright";s:28:"Copyrigth © 2016. FMB Group";s:10:"nombre_rss";s:9:"FMB Group";s:15:"descripcion_rss";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:19:"publicidad_noticias";s:1:"4";}s:4:"mods";a:11:{i:0;a:5:{s:6:"nombre";s:18:"Centro de Mensajes";s:3:"url";s:9:"mensajes/";s:5:"icono";s:8:"envelope";s:8:"cantidad";s:2:"10";s:4:"tags";s:8:"contacto";}i:1;a:5:{s:6:"nombre";s:8:"Clientes";s:3:"url";s:9:"clientes/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"clientes";}i:2;a:5:{s:6:"nombre";s:11:"Colecciones";s:3:"url";s:12:"colecciones/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:11:"colecciones";}i:3;a:5:{s:6:"nombre";s:14:"Configuración";s:3:"url";s:14:"configuracion/";s:5:"icono";s:6:"wrench";s:8:"cantidad";s:1:"0";s:4:"tags";s:13:"configuracion";}i:4;a:5:{s:6:"nombre";s:14:"Gestor de Menu";s:3:"url";s:5:"menu/";s:5:"icono";s:9:"list-alt ";s:8:"cantidad";s:1:"0";s:4:"tags";s:4:"menu";}i:5;a:5:{s:6:"nombre";s:8:"Noticias";s:3:"url";s:9:"noticias/";s:5:"icono";s:5:"globe";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"noticias";}i:6;a:5:{s:6:"nombre";s:20:"Paginas de Contenido";s:3:"url";s:10:"contenido/";s:5:"icono";s:6:"file-o";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"contenido";}i:7;a:5:{s:6:"nombre";s:9:"Productos";s:3:"url";s:10:"productos/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"productos";}i:8;a:5:{s:6:"nombre";s:10:"Publicidad";s:3:"url";s:11:"publicidad/";s:5:"icono";s:20:"external-link-square";s:8:"cantidad";s:1:"0";s:4:"tags";s:10:"publicidad";}i:9;a:5:{s:6:"nombre";s:9:"Slideshow";s:3:"url";s:10:"slideshow/";s:5:"icono";s:13:"camera-retro ";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"slidehosw";}i:10;a:5:{s:6:"nombre";s:8:"Usuarios";s:3:"url";s:9:"usuarios/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"usuarios";}}}', '', '', 'Firefox', 'Unknown Windows OS', '', '2016', '07'),
('b6ccd059e098c45a3221ad16d1dad6fe', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', 1467876641, 'a:18:{s:9:"user_data";s:0:"";s:10:"referencia";s:69:"http://localhost/soluplasticinternacional/impanel/index.php/productos";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"07";s:9:"idusuario";s:1:"1";s:6:"nombre";s:10:"Jose Bello";s:5:"cargo";s:15:"Gerente General";s:5:"email";s:27:"joseeduardo.bello@gmail.com";s:8:"telefono";s:11:"04128658193";s:9:"direccion";s:9:"San Diego";s:6:"imagen";s:36:"b96c1b31d84900d4b33ad1f06d055125.jpg";s:7:"usuario";s:6:"jbello";s:6:"status";s:1:"0";s:4:"conf";a:29:{s:16:"meta_descripcion";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:10:"meta_clave";s:160:"construccion, construcciones, fmb, grupo, remodelación, casas, edificios, locales comerciales, cemento, cabillas, venezuela, valencia, construccion en valencia";s:13:"email_empresa";s:24:"contacto@fmbgroup.com.ve";s:7:"url_web";s:26:"http://www.fmbgroup.com.ve";s:15:"noticias_pagina";s:2:"20";s:13:"key_recatpcha";s:40:"6Ldy4BwTAAAAAHV_vVmyfYXOMcbl1ZmhHTI79QnO";s:11:"api_twitter";s:488:"            <a class="twitter-timeline"  href="https://twitter.com/Planfuturoseg" data-widget-id="692717040994512896" data-width="430" height="350">Tweets por el @Planfuturoseg.</a>\r\n            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?''http'':''https'';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>";s:13:"api_analytics";s:0:"";s:9:"api_otros";s:741:"<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));</script>\r\n<div class="fb-page" data-href="https://www.facebook.com/hotelsalma/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/hotelsalma/"><a href="https://www.facebook.com/hotelsalma/">Hotel Salma Suites VIP, C.A</a></blockquote></div></div>";s:12:"url_facebook";s:32:"http://www.facebook.com/fmbgroup";s:11:"url_twitter";s:31:"http://www.twitter.com/fmbgroup";s:13:"url_instagram";s:33:"http://www.instagram.com/fmbgroup";s:10:"user_skype";s:0:"";s:12:"url_pinteres";s:0:"";s:14:"url_googleplus";s:0:"";s:12:"url_linkedin";s:0:"";s:16:"telefono_empresa";s:33:"58-241 8221106 -8216283 - 8223863";s:17:"direccion_empresa";s:31:"Valencia - Carabobo - Venezuela";s:13:"api_googlemap";s:452:"<iframe width="100%" height="215" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com.au/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Dhaka,+Dhaka+Division,+Bangladesh&amp;aq=0&amp;oq=dhaka+ban&amp;sll=40.714353,-74.005973&amp;sspn=0.836898,1.815491&amp;ie=UTF8&amp;hq=&amp;hnear=Dhaka+Division,+Bangladesh&amp;t=m&amp;ll=24.542126,90.293884&amp;spn=0.124922,0.411301&amp;z=8&amp;output=embed"></iframe>";s:9:"smtp_host";s:0:"";s:9:"smtp_port";s:0:"";s:9:"smtp_user";s:0:"";s:9:"smtp_pass";s:0:"";s:10:"email_from";s:0:"";s:11:"nombre_from";s:0:"";s:9:"copyright";s:28:"Copyrigth © 2016. FMB Group";s:10:"nombre_rss";s:9:"FMB Group";s:15:"descripcion_rss";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:19:"publicidad_noticias";s:1:"4";}s:4:"mods";a:11:{i:0;a:5:{s:6:"nombre";s:18:"Centro de Mensajes";s:3:"url";s:9:"mensajes/";s:5:"icono";s:8:"envelope";s:8:"cantidad";s:2:"10";s:4:"tags";s:8:"contacto";}i:1;a:5:{s:6:"nombre";s:8:"Clientes";s:3:"url";s:9:"clientes/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"clientes";}i:2;a:5:{s:6:"nombre";s:11:"Colecciones";s:3:"url";s:12:"colecciones/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:11:"colecciones";}i:3;a:5:{s:6:"nombre";s:14:"Configuración";s:3:"url";s:14:"configuracion/";s:5:"icono";s:6:"wrench";s:8:"cantidad";s:1:"0";s:4:"tags";s:13:"configuracion";}i:4;a:5:{s:6:"nombre";s:14:"Gestor de Menu";s:3:"url";s:5:"menu/";s:5:"icono";s:9:"list-alt ";s:8:"cantidad";s:1:"0";s:4:"tags";s:4:"menu";}i:5;a:5:{s:6:"nombre";s:8:"Noticias";s:3:"url";s:9:"noticias/";s:5:"icono";s:5:"globe";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"noticias";}i:6;a:5:{s:6:"nombre";s:20:"Paginas de Contenido";s:3:"url";s:10:"contenido/";s:5:"icono";s:6:"file-o";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"contenido";}i:7;a:5:{s:6:"nombre";s:9:"Productos";s:3:"url";s:10:"productos/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"productos";}i:8;a:5:{s:6:"nombre";s:10:"Publicidad";s:3:"url";s:11:"publicidad/";s:5:"icono";s:20:"external-link-square";s:8:"cantidad";s:1:"0";s:4:"tags";s:10:"publicidad";}i:9;a:5:{s:6:"nombre";s:9:"Slideshow";s:3:"url";s:10:"slideshow/";s:5:"icono";s:13:"camera-retro ";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"slidehosw";}i:10;a:5:{s:6:"nombre";s:8:"Usuarios";s:3:"url";s:9:"usuarios/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"usuarios";}}}', '', 'http://localhost/soluplasticinternacional/impanel/index.php/productos', 'Firefox', 'Unknown Windows OS', '', '2016', '07');
INSERT INTO `im_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`, `pais`, `referencia`, `navegador`, `plataforma`, `mobile`, `anio`, `mes`) VALUES
('ba1ecc6b10a9aebbb18c08a99ae1d2a5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', 1468049956, 'a:18:{s:9:"user_data";s:0:"";s:10:"referencia";s:71:"http://localhost/soluplasticinternacional/impanel/index.php/escritorio/";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"07";s:9:"idusuario";s:1:"2";s:6:"nombre";s:25:"Administrador del SIstema";s:5:"cargo";s:19:"Gerente de Sistemas";s:5:"email";s:24:"sistemas@fmbgroup.com.ve";s:8:"telefono";s:1:"0";s:9:"direccion";s:8:"Valencia";s:6:"imagen";s:0:"";s:7:"usuario";s:13:"administrador";s:6:"status";s:1:"0";s:4:"conf";a:30:{s:16:"meta_descripcion";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:10:"meta_clave";s:160:"construccion, construcciones, fmb, grupo, remodelación, casas, edificios, locales comerciales, cemento, cabillas, venezuela, valencia, construccion en valencia";s:13:"email_empresa";s:27:"joseeduardo.bello@gmail.com";s:7:"url_web";s:26:"http://www.fmbgroup.com.ve";s:15:"noticias_pagina";s:2:"20";s:13:"key_recatpcha";s:40:"6Ldy4BwTAAAAAHV_vVmyfYXOMcbl1ZmhHTI79QnO";s:11:"api_twitter";s:488:"            <a class="twitter-timeline"  href="https://twitter.com/Planfuturoseg" data-widget-id="692717040994512896" data-width="430" height="350">Tweets por el @Planfuturoseg.</a>\r\n            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?''http'':''https'';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>";s:13:"api_analytics";s:0:"";s:9:"api_otros";s:741:"<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));</script>\r\n<div class="fb-page" data-href="https://www.facebook.com/hotelsalma/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/hotelsalma/"><a href="https://www.facebook.com/hotelsalma/">Hotel Salma Suites VIP, C.A</a></blockquote></div></div>";s:12:"url_facebook";s:32:"http://www.facebook.com/fmbgroup";s:11:"url_twitter";s:31:"http://www.twitter.com/fmbgroup";s:13:"url_instagram";s:33:"http://www.instagram.com/fmbgroup";s:10:"user_skype";s:0:"";s:12:"url_pinteres";s:0:"";s:14:"url_googleplus";s:0:"";s:12:"url_linkedin";s:0:"";s:16:"telefono_empresa";s:33:"58-241 8221106 -8216283 - 8223863";s:17:"direccion_empresa";s:31:"Valencia - Carabobo - Venezuela";s:13:"api_googlemap";s:452:"<iframe width="100%" height="215" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com.au/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Dhaka,+Dhaka+Division,+Bangladesh&amp;aq=0&amp;oq=dhaka+ban&amp;sll=40.714353,-74.005973&amp;sspn=0.836898,1.815491&amp;ie=UTF8&amp;hq=&amp;hnear=Dhaka+Division,+Bangladesh&amp;t=m&amp;ll=24.542126,90.293884&amp;spn=0.124922,0.411301&amp;z=8&amp;output=embed"></iframe>";s:9:"smtp_host";s:0:"";s:9:"smtp_port";s:0:"";s:9:"smtp_user";s:0:"";s:9:"smtp_pass";s:0:"";s:10:"email_from";s:0:"";s:11:"nombre_from";s:0:"";s:9:"copyright";s:28:"Copyrigth © 2016. FMB Group";s:10:"nombre_rss";s:9:"FMB Group";s:15:"descripcion_rss";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:19:"publicidad_noticias";s:1:"4";s:14:"simbolo_moneda";s:1:"$";}s:4:"mods";a:6:{i:0;a:5:{s:6:"nombre";s:18:"Centro de Mensajes";s:3:"url";s:9:"mensajes/";s:5:"icono";s:8:"envelope";s:8:"cantidad";s:2:"10";s:4:"tags";s:8:"contacto";}i:1;a:5:{s:6:"nombre";s:14:"Configuración";s:3:"url";s:14:"configuracion/";s:5:"icono";s:6:"wrench";s:8:"cantidad";s:1:"0";s:4:"tags";s:13:"configuracion";}i:2;a:5:{s:6:"nombre";s:20:"Paginas de Contenido";s:3:"url";s:10:"contenido/";s:5:"icono";s:6:"file-o";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"contenido";}i:3;a:5:{s:6:"nombre";s:9:"Productos";s:3:"url";s:10:"productos/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"productos";}i:4;a:5:{s:6:"nombre";s:9:"Slideshow";s:3:"url";s:10:"slideshow/";s:5:"icono";s:13:"camera-retro ";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"slidehosw";}i:5;a:5:{s:6:"nombre";s:8:"Usuarios";s:3:"url";s:9:"usuarios/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"usuarios";}}}', '', 'http://localhost/soluplasticinternacional/impanel/index.php/escritorio/', 'Firefox', 'Unknown Windows OS', '', '2016', '07'),
('bf2b2ce0b56d64746531567ab4d11809', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1481468630, 'a:18:{s:9:"user_data";s:0:"";s:10:"referencia";s:0:"";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"12";s:9:"idusuario";s:1:"1";s:6:"nombre";s:10:"Jose Bello";s:5:"cargo";s:15:"Gerente General";s:5:"email";s:27:"joseeduardo.bello@gmail.com";s:8:"telefono";s:11:"04128658193";s:9:"direccion";s:9:"San Diego";s:6:"imagen";s:36:"b96c1b31d84900d4b33ad1f06d055125.jpg";s:7:"usuario";s:6:"jbello";s:6:"status";s:1:"0";s:4:"conf";a:30:{s:16:"meta_descripcion";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:10:"meta_clave";s:174:"construccion, construcciones, ccs, grupo, remodelación, casas, edificios, locales comerciales, cemento, cabillas, venezuela, caracas construccion en valencia, vidrios, acero";s:13:"email_empresa";s:27:"joseeduardo.bello@gmail.com";s:7:"url_web";s:32:"http://www.ccsconstrucciones.com";s:15:"noticias_pagina";s:2:"20";s:13:"key_recatpcha";s:40:"6Ldy4BwTAAAAAHV_vVmyfYXOMcbl1ZmhHTI79QnO";s:11:"api_twitter";s:488:"            <a class="twitter-timeline"  href="https://twitter.com/Planfuturoseg" data-widget-id="692717040994512896" data-width="430" height="350">Tweets por el @Planfuturoseg.</a>\r\n            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?''http'':''https'';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>";s:13:"api_analytics";s:0:"";s:9:"api_otros";s:741:"<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));</script>\r\n<div class="fb-page" data-href="https://www.facebook.com/hotelsalma/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/hotelsalma/"><a href="https://www.facebook.com/hotelsalma/">Hotel Salma Suites VIP, C.A</a></blockquote></div></div>";s:12:"url_facebook";s:39:"http://www.facebook.com/omzconstruccion";s:11:"url_twitter";s:38:"http://www.twitter.com/omzconstruccion";s:13:"url_instagram";s:40:"http://www.instagram.com/omzconstruccion";s:10:"user_skype";s:0:"";s:12:"url_pinteres";s:0:"";s:14:"url_googleplus";s:0:"";s:12:"url_linkedin";s:0:"";s:16:"telefono_empresa";s:33:"+58 212.501.25.21 / 407-339-2216 ";s:17:"direccion_empresa";s:65:"Distrito Capital - Caracas / 981 E. ALTAMONTE SPRINGS,L 32701....";s:13:"api_googlemap";s:367:"<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d251097.9245946213!2d-67.03045464854458!3d10.468698840429772!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8c2a58adcd824807%3A0x93dd2eae0a998483!2sCaracas%2C+Distrito+Capital!5e0!3m2!1ses!2sve!4v1469423800981" width="100%" height="auto" frameborder="0" style="border:0" allowfullscreen></iframe>";s:9:"smtp_host";s:0:"";s:9:"smtp_port";s:0:"";s:9:"smtp_user";s:0:"";s:9:"smtp_pass";s:0:"";s:10:"email_from";s:0:"";s:11:"nombre_from";s:0:"";s:9:"copyright";s:50:" © Copiright OMZ Construcciones RIF: J-29741518-1";s:10:"nombre_rss";s:9:"FMB Group";s:15:"descripcion_rss";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:19:"publicidad_noticias";s:1:"4";s:14:"simbolo_moneda";s:1:"0";}s:4:"mods";a:12:{i:0;a:5:{s:6:"nombre";s:18:"Centro de Mensajes";s:3:"url";s:9:"mensajes/";s:5:"icono";s:8:"envelope";s:8:"cantidad";s:2:"10";s:4:"tags";s:8:"contacto";}i:1;a:5:{s:6:"nombre";s:8:"Clientes";s:3:"url";s:9:"clientes/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"clientes";}i:2;a:5:{s:6:"nombre";s:11:"Colecciones";s:3:"url";s:12:"colecciones/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:11:"colecciones";}i:3;a:5:{s:6:"nombre";s:14:"Configuración";s:3:"url";s:8:"ajustes/";s:5:"icono";s:6:"wrench";s:8:"cantidad";s:1:"0";s:4:"tags";s:13:"configuracion";}i:4;a:5:{s:6:"nombre";s:14:"Gestor de Menu";s:3:"url";s:5:"menu/";s:5:"icono";s:9:"list-alt ";s:8:"cantidad";s:1:"0";s:4:"tags";s:4:"menu";}i:5;a:5:{s:6:"nombre";s:8:"Noticias";s:3:"url";s:9:"noticias/";s:5:"icono";s:5:"globe";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"noticias";}i:6;a:5:{s:6:"nombre";s:5:"Obras";s:3:"url";s:6:"obras/";s:5:"icono";s:8:"building";s:8:"cantidad";s:1:"0";s:4:"tags";s:5:"obras";}i:7;a:5:{s:6:"nombre";s:20:"Paginas de Contenido";s:3:"url";s:10:"contenido/";s:5:"icono";s:6:"file-o";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"contenido";}i:8;a:5:{s:6:"nombre";s:9:"Productos";s:3:"url";s:10:"productos/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"productos";}i:9;a:5:{s:6:"nombre";s:10:"Publicidad";s:3:"url";s:11:"publicidad/";s:5:"icono";s:20:"external-link-square";s:8:"cantidad";s:1:"0";s:4:"tags";s:10:"publicidad";}i:10;a:5:{s:6:"nombre";s:9:"Slideshow";s:3:"url";s:10:"slideshow/";s:5:"icono";s:13:"camera-retro ";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"slidehosw";}i:11;a:5:{s:6:"nombre";s:8:"Usuarios";s:3:"url";s:9:"usuarios/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"usuarios";}}}', '', '', 'Firefox', 'Unknown Windows OS', '', '2016', '12'),
('c06938d60d5574e7baf3497a62e6e6af', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:49.0) Gecko/20100101 Firefox/49.0', 1477268324, '', '', 'http://localhost/omzconstrucciones/impanel/index.php/contenido/', 'Firefox', 'Unknown Windows OS', '', '2016', '10'),
('cc2883677a5160f99d9da07a585e63e5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', 1467776161, '', '', 'http://localhost/soluplasticinternacional/impanel/index.php/productos/galeria/3', 'Firefox', 'Unknown Windows OS', '', '2016', '07'),
('e2501bd3a30106b0882d0657bc62661d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1484874317, 'a:18:{s:9:"user_data";s:0:"";s:10:"referencia";s:46:"http://adidas.pro/impanel/index.php/contenido/";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2017";s:3:"mes";s:2:"01";s:9:"idusuario";s:1:"1";s:6:"nombre";s:10:"Jose Bello";s:5:"cargo";s:15:"Gerente General";s:5:"email";s:27:"joseeduardo.bello@gmail.com";s:8:"telefono";s:11:"04128658193";s:9:"direccion";s:9:"San Diego";s:6:"imagen";s:36:"b96c1b31d84900d4b33ad1f06d055125.jpg";s:7:"usuario";s:6:"jbello";s:6:"status";s:1:"0";s:4:"conf";a:30:{s:16:"meta_descripcion";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:10:"meta_clave";s:174:"construccion, construcciones, ccs, grupo, remodelación, casas, edificios, locales comerciales, cemento, cabillas, venezuela, caracas construccion en valencia, vidrios, acero";s:13:"email_empresa";s:27:"joseeduardo.bello@gmail.com";s:7:"url_web";s:32:"http://www.ccsconstrucciones.com";s:15:"noticias_pagina";s:2:"20";s:13:"key_recatpcha";s:40:"6Ldy4BwTAAAAAHV_vVmyfYXOMcbl1ZmhHTI79QnO";s:11:"api_twitter";s:488:"            <a class="twitter-timeline"  href="https://twitter.com/Planfuturoseg" data-widget-id="692717040994512896" data-width="430" height="350">Tweets por el @Planfuturoseg.</a>\r\n            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?''http'':''https'';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>";s:13:"api_analytics";s:0:"";s:9:"api_otros";s:741:"<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));</script>\r\n<div class="fb-page" data-href="https://www.facebook.com/hotelsalma/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/hotelsalma/"><a href="https://www.facebook.com/hotelsalma/">Hotel Salma Suites VIP, C.A</a></blockquote></div></div>";s:12:"url_facebook";s:39:"http://www.facebook.com/omzconstruccion";s:11:"url_twitter";s:38:"http://www.twitter.com/omzconstruccion";s:13:"url_instagram";s:40:"http://www.instagram.com/omzconstruccion";s:10:"user_skype";s:0:"";s:12:"url_pinteres";s:0:"";s:14:"url_googleplus";s:0:"";s:12:"url_linkedin";s:0:"";s:16:"telefono_empresa";s:33:"+58 212.501.25.21 / 407-339-2216 ";s:17:"direccion_empresa";s:65:"Distrito Capital - Caracas / 981 E. ALTAMONTE SPRINGS,L 32701....";s:13:"api_googlemap";s:367:"<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d251097.9245946213!2d-67.03045464854458!3d10.468698840429772!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8c2a58adcd824807%3A0x93dd2eae0a998483!2sCaracas%2C+Distrito+Capital!5e0!3m2!1ses!2sve!4v1469423800981" width="100%" height="auto" frameborder="0" style="border:0" allowfullscreen></iframe>";s:9:"smtp_host";s:0:"";s:9:"smtp_port";s:0:"";s:9:"smtp_user";s:0:"";s:9:"smtp_pass";s:0:"";s:10:"email_from";s:0:"";s:11:"nombre_from";s:0:"";s:9:"copyright";s:50:" © Copiright OMZ Construcciones RIF: J-29741518-1";s:10:"nombre_rss";s:9:"FMB Group";s:15:"descripcion_rss";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:19:"publicidad_noticias";s:1:"4";s:14:"simbolo_moneda";s:1:"0";}s:4:"mods";a:12:{i:0;a:5:{s:6:"nombre";s:18:"Centro de Mensajes";s:3:"url";s:9:"mensajes/";s:5:"icono";s:8:"envelope";s:8:"cantidad";s:2:"10";s:4:"tags";s:8:"contacto";}i:1;a:5:{s:6:"nombre";s:8:"Clientes";s:3:"url";s:9:"clientes/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"clientes";}i:2;a:5:{s:6:"nombre";s:11:"Colecciones";s:3:"url";s:12:"colecciones/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:11:"colecciones";}i:3;a:5:{s:6:"nombre";s:14:"Configuración";s:3:"url";s:8:"ajustes/";s:5:"icono";s:6:"wrench";s:8:"cantidad";s:1:"0";s:4:"tags";s:13:"configuracion";}i:4;a:5:{s:6:"nombre";s:14:"Gestor de Menu";s:3:"url";s:5:"menu/";s:5:"icono";s:9:"list-alt ";s:8:"cantidad";s:1:"0";s:4:"tags";s:4:"menu";}i:5;a:5:{s:6:"nombre";s:8:"Noticias";s:3:"url";s:9:"noticias/";s:5:"icono";s:5:"globe";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"noticias";}i:6;a:5:{s:6:"nombre";s:5:"Obras";s:3:"url";s:6:"obras/";s:5:"icono";s:8:"building";s:8:"cantidad";s:1:"0";s:4:"tags";s:5:"obras";}i:7;a:5:{s:6:"nombre";s:20:"Paginas de Contenido";s:3:"url";s:10:"contenido/";s:5:"icono";s:6:"file-o";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"contenido";}i:8;a:5:{s:6:"nombre";s:9:"Productos";s:3:"url";s:10:"productos/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"productos";}i:9;a:5:{s:6:"nombre";s:10:"Publicidad";s:3:"url";s:11:"publicidad/";s:5:"icono";s:20:"external-link-square";s:8:"cantidad";s:1:"0";s:4:"tags";s:10:"publicidad";}i:10;a:5:{s:6:"nombre";s:9:"Slideshow";s:3:"url";s:10:"slideshow/";s:5:"icono";s:13:"camera-retro ";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"slidehosw";}i:11;a:5:{s:6:"nombre";s:8:"Usuarios";s:3:"url";s:9:"usuarios/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"usuarios";}}}', '', 'http://adidas.pro/impanel/index.php/contenido/', 'Firefox', 'Unknown Windows OS', '', '2017', '01'),
('ec5c13bcdba3594e532025bc1bde4913', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0', 1469417809, 'a:18:{s:9:"user_data";s:0:"";s:10:"referencia";s:62:"http://localhost/ccsconstrucciones/impanel/index.php/usuarios/";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"07";s:9:"idusuario";s:1:"2";s:6:"nombre";s:25:"Administrador del SIstema";s:5:"cargo";s:19:"Gerente de Sistemas";s:5:"email";s:27:"omzconstrucciones@gmail.com";s:8:"telefono";s:1:"0";s:9:"direccion";s:7:"Caracas";s:6:"imagen";s:0:"";s:7:"usuario";s:13:"administrador";s:6:"status";s:1:"0";s:4:"conf";a:30:{s:16:"meta_descripcion";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:10:"meta_clave";s:160:"construccion, construcciones, fmb, grupo, remodelación, casas, edificios, locales comerciales, cemento, cabillas, venezuela, valencia, construccion en valencia";s:13:"email_empresa";s:27:"joseeduardo.bello@gmail.com";s:7:"url_web";s:26:"http://www.fmbgroup.com.ve";s:15:"noticias_pagina";s:2:"20";s:13:"key_recatpcha";s:40:"6Ldy4BwTAAAAAHV_vVmyfYXOMcbl1ZmhHTI79QnO";s:11:"api_twitter";s:488:"            <a class="twitter-timeline"  href="https://twitter.com/Planfuturoseg" data-widget-id="692717040994512896" data-width="430" height="350">Tweets por el @Planfuturoseg.</a>\r\n            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?''http'':''https'';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>";s:13:"api_analytics";s:0:"";s:9:"api_otros";s:741:"<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));</script>\r\n<div class="fb-page" data-href="https://www.facebook.com/hotelsalma/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/hotelsalma/"><a href="https://www.facebook.com/hotelsalma/">Hotel Salma Suites VIP, C.A</a></blockquote></div></div>";s:12:"url_facebook";s:32:"http://www.facebook.com/fmbgroup";s:11:"url_twitter";s:31:"http://www.twitter.com/fmbgroup";s:13:"url_instagram";s:33:"http://www.instagram.com/fmbgroup";s:10:"user_skype";s:0:"";s:12:"url_pinteres";s:0:"";s:14:"url_googleplus";s:0:"";s:12:"url_linkedin";s:0:"";s:16:"telefono_empresa";s:33:"58-241 8221106 -8216283 - 8223863";s:17:"direccion_empresa";s:31:"Valencia - Carabobo - Venezuela";s:13:"api_googlemap";s:388:"<iframe width="100%" height="215" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com.au/maps?f=q&source=s_q&hl=en&geocode=&q=Dhaka,+Dhaka+Division,+Bangladesh&aq=0&oq=dhaka+ban&sll=40.714353,-74.005973&sspn=0.836898,1.815491&ie=UTF8&hq=&hnear=Dhaka+Division,+Bangladesh&t=m&ll=24.542126,90.293884&spn=0.124922,0.411301&z=8&output=embed"></iframe>";s:9:"smtp_host";s:0:"";s:9:"smtp_port";s:0:"";s:9:"smtp_user";s:0:"";s:9:"smtp_pass";s:0:"";s:10:"email_from";s:0:"";s:11:"nombre_from";s:0:"";s:9:"copyright";s:28:"Copyrigth © 2016. FMB Group";s:10:"nombre_rss";s:9:"FMB Group";s:15:"descripcion_rss";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:19:"publicidad_noticias";s:1:"4";s:14:"simbolo_moneda";s:1:"$";}s:4:"mods";a:6:{i:0;a:5:{s:6:"nombre";s:14:"Configuración";s:3:"url";s:14:"configuracion/";s:5:"icono";s:6:"wrench";s:8:"cantidad";s:1:"0";s:4:"tags";s:13:"configuracion";}i:1;a:5:{s:6:"nombre";s:5:"Obras";s:3:"url";s:6:"obras/";s:5:"icono";s:8:"building";s:8:"cantidad";s:1:"0";s:4:"tags";s:5:"obras";}i:2;a:5:{s:6:"nombre";s:20:"Paginas de Contenido";s:3:"url";s:10:"contenido/";s:5:"icono";s:6:"file-o";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"contenido";}i:3;a:5:{s:6:"nombre";s:9:"Productos";s:3:"url";s:10:"productos/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"productos";}i:4;a:5:{s:6:"nombre";s:9:"Slideshow";s:3:"url";s:10:"slideshow/";s:5:"icono";s:13:"camera-retro ";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"slidehosw";}i:5;a:5:{s:6:"nombre";s:8:"Usuarios";s:3:"url";s:9:"usuarios/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"usuarios";}}}', '', 'http://localhost/ccsconstrucciones/impanel/index.php/usuarios/', 'Firefox', 'Unknown Windows OS', '', '2016', '07'),
('edcbddee90dd5b8d3820e4af692bae50', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0', 1469370611, '', '', 'http://localhost/ccsconstrucciones/impanel/index.php/publicidad/', 'Firefox', 'Unknown Windows OS', '', '2016', '07'),
('f48298d941b223f247417e3548caec23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1484869966, 'a:18:{s:9:"user_data";s:0:"";s:10:"referencia";s:0:"";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2017";s:3:"mes";s:2:"01";s:9:"idusuario";s:1:"1";s:6:"nombre";s:10:"Jose Bello";s:5:"cargo";s:15:"Gerente General";s:5:"email";s:27:"joseeduardo.bello@gmail.com";s:8:"telefono";s:11:"04128658193";s:9:"direccion";s:9:"San Diego";s:6:"imagen";s:36:"b96c1b31d84900d4b33ad1f06d055125.jpg";s:7:"usuario";s:6:"jbello";s:6:"status";s:1:"0";s:4:"conf";a:30:{s:16:"meta_descripcion";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:10:"meta_clave";s:174:"construccion, construcciones, ccs, grupo, remodelación, casas, edificios, locales comerciales, cemento, cabillas, venezuela, caracas construccion en valencia, vidrios, acero";s:13:"email_empresa";s:27:"joseeduardo.bello@gmail.com";s:7:"url_web";s:32:"http://www.ccsconstrucciones.com";s:15:"noticias_pagina";s:2:"20";s:13:"key_recatpcha";s:40:"6Ldy4BwTAAAAAHV_vVmyfYXOMcbl1ZmhHTI79QnO";s:11:"api_twitter";s:488:"            <a class="twitter-timeline"  href="https://twitter.com/Planfuturoseg" data-widget-id="692717040994512896" data-width="430" height="350">Tweets por el @Planfuturoseg.</a>\r\n            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?''http'':''https'';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>";s:13:"api_analytics";s:0:"";s:9:"api_otros";s:741:"<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));</script>\r\n<div class="fb-page" data-href="https://www.facebook.com/hotelsalma/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/hotelsalma/"><a href="https://www.facebook.com/hotelsalma/">Hotel Salma Suites VIP, C.A</a></blockquote></div></div>";s:12:"url_facebook";s:39:"http://www.facebook.com/omzconstruccion";s:11:"url_twitter";s:38:"http://www.twitter.com/omzconstruccion";s:13:"url_instagram";s:40:"http://www.instagram.com/omzconstruccion";s:10:"user_skype";s:0:"";s:12:"url_pinteres";s:0:"";s:14:"url_googleplus";s:0:"";s:12:"url_linkedin";s:0:"";s:16:"telefono_empresa";s:33:"+58 212.501.25.21 / 407-339-2216 ";s:17:"direccion_empresa";s:65:"Distrito Capital - Caracas / 981 E. ALTAMONTE SPRINGS,L 32701....";s:13:"api_googlemap";s:367:"<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d251097.9245946213!2d-67.03045464854458!3d10.468698840429772!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8c2a58adcd824807%3A0x93dd2eae0a998483!2sCaracas%2C+Distrito+Capital!5e0!3m2!1ses!2sve!4v1469423800981" width="100%" height="auto" frameborder="0" style="border:0" allowfullscreen></iframe>";s:9:"smtp_host";s:0:"";s:9:"smtp_port";s:0:"";s:9:"smtp_user";s:0:"";s:9:"smtp_pass";s:0:"";s:10:"email_from";s:0:"";s:11:"nombre_from";s:0:"";s:9:"copyright";s:50:" © Copiright OMZ Construcciones RIF: J-29741518-1";s:10:"nombre_rss";s:9:"FMB Group";s:15:"descripcion_rss";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:19:"publicidad_noticias";s:1:"4";s:14:"simbolo_moneda";s:1:"0";}s:4:"mods";a:12:{i:0;a:5:{s:6:"nombre";s:18:"Centro de Mensajes";s:3:"url";s:9:"mensajes/";s:5:"icono";s:8:"envelope";s:8:"cantidad";s:2:"10";s:4:"tags";s:8:"contacto";}i:1;a:5:{s:6:"nombre";s:8:"Clientes";s:3:"url";s:9:"clientes/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"clientes";}i:2;a:5:{s:6:"nombre";s:11:"Colecciones";s:3:"url";s:12:"colecciones/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:11:"colecciones";}i:3;a:5:{s:6:"nombre";s:14:"Configuración";s:3:"url";s:8:"ajustes/";s:5:"icono";s:6:"wrench";s:8:"cantidad";s:1:"0";s:4:"tags";s:13:"configuracion";}i:4;a:5:{s:6:"nombre";s:14:"Gestor de Menu";s:3:"url";s:5:"menu/";s:5:"icono";s:9:"list-alt ";s:8:"cantidad";s:1:"0";s:4:"tags";s:4:"menu";}i:5;a:5:{s:6:"nombre";s:8:"Noticias";s:3:"url";s:9:"noticias/";s:5:"icono";s:5:"globe";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"noticias";}i:6;a:5:{s:6:"nombre";s:5:"Obras";s:3:"url";s:6:"obras/";s:5:"icono";s:8:"building";s:8:"cantidad";s:1:"0";s:4:"tags";s:5:"obras";}i:7;a:5:{s:6:"nombre";s:20:"Paginas de Contenido";s:3:"url";s:10:"contenido/";s:5:"icono";s:6:"file-o";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"contenido";}i:8;a:5:{s:6:"nombre";s:9:"Productos";s:3:"url";s:10:"productos/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"productos";}i:9;a:5:{s:6:"nombre";s:10:"Publicidad";s:3:"url";s:11:"publicidad/";s:5:"icono";s:20:"external-link-square";s:8:"cantidad";s:1:"0";s:4:"tags";s:10:"publicidad";}i:10;a:5:{s:6:"nombre";s:9:"Slideshow";s:3:"url";s:10:"slideshow/";s:5:"icono";s:13:"camera-retro ";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"slidehosw";}i:11;a:5:{s:6:"nombre";s:8:"Usuarios";s:3:"url";s:9:"usuarios/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"usuarios";}}}', '', '', 'Firefox', 'Unknown Windows OS', '', '2017', '01'),
('f9afa699d3298574957170110239b047', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', 1468049934, 'a:11:{s:9:"idusuario";s:1:"1";s:6:"nombre";s:10:"Jose Bello";s:5:"cargo";s:15:"Gerente General";s:5:"email";s:27:"joseeduardo.bello@gmail.com";s:8:"telefono";s:11:"04128658193";s:9:"direccion";s:9:"San Diego";s:6:"imagen";s:36:"b96c1b31d84900d4b33ad1f06d055125.jpg";s:7:"usuario";s:6:"jbello";s:6:"status";s:1:"0";s:4:"conf";a:30:{s:16:"meta_descripcion";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:10:"meta_clave";s:160:"construccion, construcciones, fmb, grupo, remodelación, casas, edificios, locales comerciales, cemento, cabillas, venezuela, valencia, construccion en valencia";s:13:"email_empresa";s:27:"joseeduardo.bello@gmail.com";s:7:"url_web";s:26:"http://www.fmbgroup.com.ve";s:15:"noticias_pagina";s:2:"20";s:13:"key_recatpcha";s:40:"6Ldy4BwTAAAAAHV_vVmyfYXOMcbl1ZmhHTI79QnO";s:11:"api_twitter";s:488:"            <a class="twitter-timeline"  href="https://twitter.com/Planfuturoseg" data-widget-id="692717040994512896" data-width="430" height="350">Tweets por el @Planfuturoseg.</a>\r\n            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?''http'':''https'';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>";s:13:"api_analytics";s:0:"";s:9:"api_otros";s:741:"<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.5";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));</script>\r\n<div class="fb-page" data-href="https://www.facebook.com/hotelsalma/" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/hotelsalma/"><a href="https://www.facebook.com/hotelsalma/">Hotel Salma Suites VIP, C.A</a></blockquote></div></div>";s:12:"url_facebook";s:32:"http://www.facebook.com/fmbgroup";s:11:"url_twitter";s:31:"http://www.twitter.com/fmbgroup";s:13:"url_instagram";s:33:"http://www.instagram.com/fmbgroup";s:10:"user_skype";s:0:"";s:12:"url_pinteres";s:0:"";s:14:"url_googleplus";s:0:"";s:12:"url_linkedin";s:0:"";s:16:"telefono_empresa";s:33:"58-241 8221106 -8216283 - 8223863";s:17:"direccion_empresa";s:31:"Valencia - Carabobo - Venezuela";s:13:"api_googlemap";s:452:"<iframe width="100%" height="215" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com.au/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Dhaka,+Dhaka+Division,+Bangladesh&amp;aq=0&amp;oq=dhaka+ban&amp;sll=40.714353,-74.005973&amp;sspn=0.836898,1.815491&amp;ie=UTF8&amp;hq=&amp;hnear=Dhaka+Division,+Bangladesh&amp;t=m&amp;ll=24.542126,90.293884&amp;spn=0.124922,0.411301&amp;z=8&amp;output=embed"></iframe>";s:9:"smtp_host";s:0:"";s:9:"smtp_port";s:0:"";s:9:"smtp_user";s:0:"";s:9:"smtp_pass";s:0:"";s:10:"email_from";s:0:"";s:11:"nombre_from";s:0:"";s:9:"copyright";s:28:"Copyrigth © 2016. FMB Group";s:10:"nombre_rss";s:9:"FMB Group";s:15:"descripcion_rss";s:132:"Empresa lider en construcción en venezuela, todo en construcción, remodelación, edificios, casas, locales comerciales y mucho mas";s:19:"publicidad_noticias";s:1:"4";s:14:"simbolo_moneda";s:1:"$";}s:4:"mods";a:11:{i:0;a:5:{s:6:"nombre";s:18:"Centro de Mensajes";s:3:"url";s:9:"mensajes/";s:5:"icono";s:8:"envelope";s:8:"cantidad";s:2:"10";s:4:"tags";s:8:"contacto";}i:1;a:5:{s:6:"nombre";s:8:"Clientes";s:3:"url";s:9:"clientes/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"clientes";}i:2;a:5:{s:6:"nombre";s:11:"Colecciones";s:3:"url";s:12:"colecciones/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:11:"colecciones";}i:3;a:5:{s:6:"nombre";s:14:"Configuración";s:3:"url";s:14:"configuracion/";s:5:"icono";s:6:"wrench";s:8:"cantidad";s:1:"0";s:4:"tags";s:13:"configuracion";}i:4;a:5:{s:6:"nombre";s:14:"Gestor de Menu";s:3:"url";s:5:"menu/";s:5:"icono";s:9:"list-alt ";s:8:"cantidad";s:1:"0";s:4:"tags";s:4:"menu";}i:5;a:5:{s:6:"nombre";s:8:"Noticias";s:3:"url";s:9:"noticias/";s:5:"icono";s:5:"globe";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"noticias";}i:6;a:5:{s:6:"nombre";s:20:"Paginas de Contenido";s:3:"url";s:10:"contenido/";s:5:"icono";s:6:"file-o";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"contenido";}i:7;a:5:{s:6:"nombre";s:9:"Productos";s:3:"url";s:10:"productos/";s:5:"icono";s:7:"barcode";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"productos";}i:8;a:5:{s:6:"nombre";s:10:"Publicidad";s:3:"url";s:11:"publicidad/";s:5:"icono";s:20:"external-link-square";s:8:"cantidad";s:1:"0";s:4:"tags";s:10:"publicidad";}i:9;a:5:{s:6:"nombre";s:9:"Slideshow";s:3:"url";s:10:"slideshow/";s:5:"icono";s:13:"camera-retro ";s:8:"cantidad";s:1:"0";s:4:"tags";s:9:"slidehosw";}i:10;a:5:{s:6:"nombre";s:8:"Usuarios";s:3:"url";s:9:"usuarios/";s:5:"icono";s:4:"user";s:8:"cantidad";s:1:"0";s:4:"tags";s:8:"usuarios";}}}', '', 'http://localhost/soluplasticinternacional/impanel/index.php/contenido/', 'Firefox', 'Unknown Windows OS', '', '2016', '07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `im_sessions_web`
--

CREATE TABLE `im_sessions_web` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  `pais` varchar(255) NOT NULL,
  `referencia` varchar(255) NOT NULL,
  `navegador` varchar(255) NOT NULL,
  `plataforma` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `anio` varchar(4) NOT NULL,
  `mes` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `im_sessions_web`
--

INSERT INTO `im_sessions_web` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`, `pais`, `referencia`, `navegador`, `plataforma`, `mobile`, `anio`, `mes`) VALUES
('04b32a2adcd19559e1ad007532f4ef4f', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1481466976, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:0:"";s:10:"referencia";s:40:"http://localhost/www/sporthouse/register";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"12";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:4:"home";}', '', 'http://localhost/www/sporthouse/register', 'Firefox', 'Unknown Windows OS', '', '2016', '12'),
('09d6fd984d89d42b8b5d5867c58bd5ac', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1481469418, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:0:"";s:10:"referencia";s:40:"http://localhost/www/sporthouse/register";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"12";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:4:"home";}', '', 'http://localhost/www/sporthouse/register', 'Firefox', 'Unknown Windows OS', '', '2016', '12'),
('0af9028d018ce183643ae15909c53aa8', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', 1480980998, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:0:"";s:10:"referencia";s:32:"http://localhost/www/sporthouse/";s:9:"navegador";s:6:"Chrome";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"12";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:4:"home";}', '', 'http://localhost/www/sporthouse/', 'Chrome', 'Unknown Windows OS', '', '2016', '12'),
('0efb9853c75bfd6d3baa069162bd2a50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1482105195, '', 'Reserved', 'http://adidas.pro/register', 'Firefox', 'Unknown Windows OS', '', '2016', '12'),
('1747ed51cd52d0b55d6b4cfceff6dcab', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1484522379, '', 'Reserved', 'http://adidas.pro/login', 'Firefox', 'Unknown Windows OS', '', '2017', '01'),
('197991652793db787dbcb3cbc77e98fa', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0', 1469416241, 'a:9:{s:9:"user_data";s:0:"";s:4:"pais";s:0:"";s:10:"referencia";s:0:"";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"07";s:11:"menu_active";s:8:"products";}', '', '', 'Firefox', 'Unknown Windows OS', '', '2016', '07'),
('19fb828f6a0c45e84155310f7a090914', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1484524819, 'a:17:{s:9:"user_data";s:0:"";s:4:"pais";s:3:"VLA";s:10:"referencia";s:47:"http://adidas.pro/carrito/AgregarProducto/shoes";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2017";s:3:"mes";s:2:"01";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:10:"cotizacion";s:9:"idcliente";s:2:"15";s:6:"nombre";s:17:"Rosbely Hernandez";s:6:"estado";s:8:"Carabobo";s:8:"telefono";s:11:"04124666804";s:5:"email";s:20:"rosbelyh22@gmail.com";s:9:"direccion";s:55:"Calle el Totumo, Urb los Cardones. Municipio Libertador";}', 'Reserved', 'http://adidas.pro/carrito/AgregarProducto/shoes', 'Firefox', 'Unknown Windows OS', '', '2017', '01'),
('1baacbd7b045827ae0df6885702bb797', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', 1467599787, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:8:"Reserved";s:10:"referencia";s:0:"";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"07";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:4:"home";}', 'Reserved', '', 'Firefox', 'Unknown Windows OS', '', '2016', '07'),
('1ded3e748cb4475b26aef5b0993bc063', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', 1484498800, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:8:"Reserved";s:10:"referencia";s:0:"";s:9:"navegador";s:6:"Chrome";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2017";s:3:"mes";s:2:"01";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:10:"cotizacion";}', 'Reserved', '', 'Chrome', 'Unknown Windows OS', '', '2017', '01'),
('2238cc350f87d6cb4a9b314c64f35fd5', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', 1470016766, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:0:"";s:10:"referencia";s:0:"";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"08";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:4:"home";}', '', '', 'Firefox', 'Unknown Windows OS', '', '2016', '08'),
('2b5a32286791e966945a63eb50ec0efa', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1484777837, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:8:"Reserved";s:10:"referencia";s:0:"";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2017";s:3:"mes";s:2:"01";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:4:"home";}', 'Reserved', '', 'Firefox', 'Unknown Windows OS', '', '2017', '01'),
('3917c8a878d3d4a4f31f2d90ece51a39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1485722810, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:8:"Reserved";s:10:"referencia";s:28:"http://localhost/sporthouse/";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2017";s:3:"mes";s:2:"01";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:4:"home";}', 'Reserved', 'http://localhost/sporthouse/', 'Firefox', 'Unknown Windows OS', '', '2017', '01'),
('3e169d8fa569fac90bca374adb726de0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', 1484498766, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:8:"Reserved";s:10:"referencia";s:0:"";s:9:"navegador";s:6:"Chrome";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2017";s:3:"mes";s:2:"01";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:4:"home";}', 'Reserved', '', 'Chrome', 'Unknown Windows OS', '', '2017', '01'),
('40cc00559598419d251d22e007b2ed4a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1484524941, 'a:17:{s:9:"user_data";s:0:"";s:4:"pais";s:3:"VLA";s:10:"referencia";s:23:"http://adidas.pro/login";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2017";s:3:"mes";s:2:"01";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:4:"home";s:9:"idcliente";s:2:"15";s:6:"nombre";s:17:"Rosbely Hernandez";s:6:"estado";s:8:"Carabobo";s:8:"telefono";s:11:"04124666804";s:5:"email";s:20:"rosbelyh22@gmail.com";s:9:"direccion";s:55:"Calle el Totumo, Urb los Cardones. Municipio Libertador";}', 'Reserved', 'http://adidas.pro/login', 'Firefox', 'Unknown Windows OS', '', '2017', '01'),
('44fb11c0f9e0007293363246e0327705', '192.168.1.105', 'Mozilla/5.0 (Linux; Android 5.0.2; BLU VIVO AIR LTE Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.278', 1477284899, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:8:"Reserved";s:10:"referencia";s:0:"";s:9:"navegador";s:6:"Chrome";s:10:"plataforma";s:5:"Linux";s:6:"mobile";s:14:"Generic Mobile";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"10";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:5:"obras";}', 'Reserved', '', 'Chrome', 'Linux', 'Generic Mobile', '2016', '10'),
('4dc7a6090d8e96aae0e44c05d3106663', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1484522382, 'a:17:{s:9:"user_data";s:0:"";s:4:"pais";s:3:"VLA";s:10:"referencia";s:23:"http://adidas.pro/login";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2017";s:3:"mes";s:2:"01";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:10:"cotizacion";s:9:"idcliente";s:2:"15";s:6:"nombre";s:17:"Rosbely Hernandez";s:6:"estado";s:8:"Carabobo";s:8:"telefono";s:11:"04124666804";s:5:"email";s:20:"rosbelyh22@gmail.com";s:9:"direccion";s:55:"Calle el Totumo, Urb los Cardones. Municipio Libertador";}', 'Reserved', 'http://adidas.pro/login', 'Firefox', 'Unknown Windows OS', '', '2017', '01'),
('51550bb6c3e8061a4596cc44567dce5e', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 1474811342, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:0:"";s:10:"referencia";s:0:"";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"09";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:4:"home";}', '', '', 'Firefox', 'Unknown Windows OS', '', '2016', '09'),
('52a84c04f44ea29d248fb23606949d0e', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1481484030, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:0:"";s:10:"referencia";s:36:"http://localhost/www/sporthouse/home";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"12";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:4:"home";}', '', 'http://localhost/www/sporthouse/home', 'Firefox', 'Unknown Windows OS', '', '2016', '12'),
('53f956c6f5685cc5d811df11cc2e89a1', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', 1481419119, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:0:"";s:10:"referencia";s:0:"";s:9:"navegador";s:6:"Chrome";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"12";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:4:"home";}', '', '', 'Chrome', 'Unknown Windows OS', '', '2016', '12'),
('591420189af9aefd2aab005827e6d59d', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0', 1469051294, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:0:"";s:10:"referencia";s:42:"http://localhost/ccsconstrucciones/contact";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"07";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:4:"home";}', '', 'http://localhost/ccsconstrucciones/contact', 'Firefox', 'Unknown Windows OS', '', '2016', '07'),
('5a8c8f629c33d1e2f2b451826a8d6934', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', 1480978565, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:0:"";s:10:"referencia";s:0:"";s:9:"navegador";s:6:"Chrome";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"12";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:4:"home";}', '', '', 'Chrome', 'Unknown Windows OS', '', '2016', '12'),
('5f1aa9fc25dd284a60136679ea051e77', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1481489216, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:0:"";s:10:"referencia";s:0:"";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"12";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:4:"home";}', '', '', 'Firefox', 'Unknown Windows OS', '', '2016', '12'),
('6193060a4280bfbf62ec71b1a50d2ec9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1484253675, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:8:"Reserved";s:10:"referencia";s:52:"http://adidas.pro/carrito/AgregarProducto/shoes-4467";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2017";s:3:"mes";s:2:"01";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:10:"cotizacion";}', 'Reserved', 'http://adidas.pro/carrito/AgregarProducto/shoes-4467', 'Firefox', 'Unknown Windows OS', '', '2017', '01'),
('6297634c3b350d4f73d4bc916d6e92d6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1482009613, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:8:"Reserved";s:10:"referencia";s:0:"";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"12";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:4:"home";}', 'Reserved', '', 'Firefox', 'Unknown Windows OS', '', '2016', '12'),
('62b6293c6b62b3a3f6f371dc59223a6c', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', 1481408900, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:0:"";s:10:"referencia";s:0:"";s:9:"navegador";s:6:"Chrome";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"12";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:4:"home";}', '', '', 'Chrome', 'Unknown Windows OS', '', '2016', '12'),
('758e7f4d7828bf6d647261486cece982', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1484523579, 'a:17:{s:9:"user_data";s:0:"";s:4:"pais";s:3:"VLA";s:10:"referencia";s:23:"http://adidas.pro/login";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2017";s:3:"mes";s:2:"01";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:10:"cotizacion";s:9:"idcliente";s:2:"15";s:6:"nombre";s:17:"Rosbely Hernandez";s:6:"estado";s:8:"Carabobo";s:8:"telefono";s:11:"04124666804";s:5:"email";s:20:"rosbelyh22@gmail.com";s:9:"direccion";s:55:"Calle el Totumo, Urb los Cardones. Municipio Libertador";}', 'Reserved', 'http://adidas.pro/login', 'Firefox', 'Unknown Windows OS', '', '2017', '01'),
('75bdaf7a3d3b445d08d6de105a835913', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1484522158, '', 'Reserved', 'http://adidas.pro/login', 'Firefox', 'Unknown Windows OS', '', '2017', '01'),
('7e99a3552450a4eb2d69058499a540f9', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1481578028, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:0:"";s:10:"referencia";s:21:"http://localhost/www/";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"12";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:4:"home";}', '', 'http://localhost/www/', 'Firefox', 'Unknown Windows OS', '', '2016', '12'),
('8675743da090a4e5d1750c8810de9370', '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:51.0) Gecko/20100101 Firefox/51.0', 1487467467, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:0:"";s:10:"referencia";s:0:"";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2017";s:3:"mes";s:2:"02";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:4:"home";}', '', '', 'Firefox', 'Unknown Windows OS', '', '2017', '02'),
('885a7fb4b08c99ac5971ae63ad439e98', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', 1467789603, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:8:"Reserved";s:10:"referencia";s:49:"http://localhost/soluplasticinternacional/contact";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"07";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:4:"home";}', 'Reserved', 'http://localhost/soluplasticinternacional/contact', 'Firefox', 'Unknown Windows OS', '', '2016', '07'),
('8fbba53fc39366f0050bd7e552122d4f', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', 1480983902, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:0:"";s:10:"referencia";s:32:"http://localhost/www/sporthouse/";s:9:"navegador";s:6:"Chrome";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"12";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:4:"home";}', '', 'http://localhost/www/sporthouse/', 'Chrome', 'Unknown Windows OS', '', '2016', '12'),
('922b56a0730e8cda2cbbad022d3a233c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1484354292, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:8:"Reserved";s:10:"referencia";s:52:"http://adidas.pro/carrito/AgregarProducto/shoes-4467";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2017";s:3:"mes";s:2:"01";s:11:"menu_active";s:10:"cotizacion";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";}', 'Reserved', 'http://adidas.pro/carrito/AgregarProducto/shoes-4467', 'Firefox', 'Unknown Windows OS', '', '2017', '01'),
('92ba6c221ebe7b72de1f190334c467c9', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1481463011, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:0:"";s:10:"referencia";s:21:"http://localhost/www/";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"12";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:4:"home";}', '', 'http://localhost/www/', 'Firefox', 'Unknown Windows OS', '', '2016', '12'),
('92ce2656238986a97073e65d017bed80', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1481583136, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:0:"";s:10:"referencia";s:37:"http://localhost/www/sporthouse/login";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"12";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:4:"home";}', '', 'http://localhost/www/sporthouse/login', 'Firefox', 'Unknown Windows OS', '', '2016', '12'),
('9301530de4ea7d12bb02b71fc2c0c639', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 1473001356, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:0:"";s:10:"referencia";s:0:"";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"09";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:5:"obras";}', '', '', 'Firefox', 'Unknown Windows OS', '', '2016', '09'),
('98dcb54cd8f01e1c375ed9197f6eae20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1483632935, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:8:"Reserved";s:10:"referencia";s:0:"";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2017";s:3:"mes";s:2:"01";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:4:"home";}', 'Reserved', '', 'Firefox', 'Unknown Windows OS', '', '2017', '01'),
('98f05cd7e85b6349bb73a6d319b933fa', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1484525088, 'a:17:{s:9:"user_data";s:0:"";s:4:"pais";s:3:"VLA";s:10:"referencia";s:23:"http://adidas.pro/login";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2017";s:3:"mes";s:2:"01";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:4:"home";s:9:"idcliente";s:2:"15";s:6:"nombre";s:17:"Rosbely Hernandez";s:6:"estado";s:8:"Carabobo";s:8:"telefono";s:11:"04124666804";s:5:"email";s:20:"rosbelyh22@gmail.com";s:9:"direccion";s:55:"Calle el Totumo, Urb los Cardones. Municipio Libertador";}', 'Reserved', 'http://adidas.pro/login', 'Firefox', 'Unknown Windows OS', '', '2017', '01'),
('9b7ef4b879022caa01f829c45d8b56fe', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1481493878, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:0:"";s:10:"referencia";s:40:"http://localhost/www/sporthouse/checkout";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"12";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:4:"home";}', '', 'http://localhost/www/sporthouse/checkout', 'Firefox', 'Unknown Windows OS', '', '2016', '12'),
('a772528f6e23f79672d248c1238a654b', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:49.0) Gecko/20100101 Firefox/49.0', 1477384125, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:0:"";s:10:"referencia";s:0:"";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"10";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:4:"home";}', '', '', 'Firefox', 'Unknown Windows OS', '', '2016', '10'),
('a89b7487758d668f9264c826cc292b5b', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1481576362, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:0:"";s:10:"referencia";s:21:"http://localhost/www/";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"12";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:4:"home";}', '', 'http://localhost/www/', 'Firefox', 'Unknown Windows OS', '', '2016', '12'),
('a9a7e1c19b9df7a2b2131b1df5e6d852', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0', 1469368467, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:0:"";s:10:"referencia";s:104:"http://localhost/ccsconstrucciones/carrito/AgregarProducto/bucket-1056-qts-or-10-lts-with-plastic-handle";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"07";s:11:"menu_active";s:4:"home";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";}', '', 'http://localhost/ccsconstrucciones/carrito/AgregarProducto/bucket-1056-qts-or-10-lts-with-plastic-handle', 'Firefox', 'Unknown Windows OS', '', '2016', '07'),
('bab583a0edc64182b30d9c2ea1be91e4', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', 1481412251, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:0:"";s:10:"referencia";s:32:"http://localhost/www/sporthouse/";s:9:"navegador";s:6:"Chrome";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"12";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:4:"home";}', '', 'http://localhost/www/sporthouse/', 'Chrome', 'Unknown Windows OS', '', '2016', '12'),
('bd56c09b97cef2794b13a3bf4e014d5e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1483632936, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:8:"Reserved";s:10:"referencia";s:0:"";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2017";s:3:"mes";s:2:"01";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:8:"products";}', 'Reserved', '', 'Firefox', 'Unknown Windows OS', '', '2017', '01'),
('c10a7b5eff5856c4530902557babb030', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', 1468045587, 'a:9:{s:9:"user_data";s:0:"";s:4:"pais";s:8:"Reserved";s:10:"referencia";s:46:"http://localhost/soluplasticinternacional/home";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"07";s:11:"menu_active";s:7:"contact";}', 'Reserved', 'http://localhost/soluplasticinternacional/home', 'Firefox', 'Unknown Windows OS', '', '2016', '07'),
('c6724dce7f6907d7a6baa3c9387cc468', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1481484266, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:0:"";s:10:"referencia";s:36:"http://localhost/www/sporthouse/home";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"12";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:4:"home";}', '', 'http://localhost/www/sporthouse/home', 'Firefox', 'Unknown Windows OS', '', '2016', '12'),
('c9d2f5e70f3a735ab02675664c6e44c5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1482001496, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:8:"Reserved";s:10:"referencia";s:0:"";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"12";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:4:"home";}', 'Reserved', '', 'Firefox', 'Unknown Windows OS', '', '2016', '12'),
('cf4d3d3405ad56cc7b2f2a27662af135', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1482002292, 'a:17:{s:9:"user_data";s:0:"";s:4:"pais";s:3:"VLA";s:10:"referencia";s:0:"";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"12";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:4:"home";s:9:"idcliente";s:2:"15";s:6:"nombre";s:17:"Rosbely Hernandez";s:6:"estado";s:8:"Carabobo";s:8:"telefono";s:11:"04124666804";s:5:"email";s:20:"rosbelyh22@gmail.com";s:9:"direccion";s:55:"Calle el Totumo, Urb los Cardones. Municipio Libertador";}', 'Reserved', '', 'Firefox', 'Unknown Windows OS', '', '2016', '12'),
('d0b67e204cd5a6e210a3e97afe84127a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1484088207, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:8:"Reserved";s:10:"referencia";s:0:"";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2017";s:3:"mes";s:2:"01";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:10:"cotizacion";}', 'Reserved', '', 'Firefox', 'Unknown Windows OS', '', '2017', '01'),
('d88bbfa97456a407400eaf36ca505444', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1484483683, 'a:17:{s:9:"user_data";s:0:"";s:4:"pais";s:3:"VLA";s:10:"referencia";s:22:"http://adidas.pro/home";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2017";s:3:"mes";s:2:"01";s:11:"menu_active";s:10:"cotizacion";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:9:"idcliente";s:2:"15";s:6:"nombre";s:17:"Rosbely Hernandez";s:6:"estado";s:8:"Carabobo";s:8:"telefono";s:11:"04124666804";s:5:"email";s:20:"rosbelyh22@gmail.com";s:9:"direccion";s:55:"Calle el Totumo, Urb los Cardones. Municipio Libertador";}', 'Reserved', 'http://adidas.pro/home', 'Firefox', 'Unknown Windows OS', '', '2017', '01'),
('daf4bb83f78393af3c945db474009d05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1485721074, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:8:"Reserved";s:10:"referencia";s:0:"";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2017";s:3:"mes";s:2:"01";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:4:"home";}', 'Reserved', '', 'Firefox', 'Unknown Windows OS', '', '2017', '01'),
('db0b5e769b9489b8dffc9d27882ac43e', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1481485899, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:0:"";s:10:"referencia";s:40:"http://localhost/www/sporthouse/checkout";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"12";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:4:"home";}', '', 'http://localhost/www/sporthouse/checkout', 'Firefox', 'Unknown Windows OS', '', '2016', '12'),
('dc2c5185a33602f434251c3042692f05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1484354294, '', 'Reserved', 'http://adidas.pro/carrito/AgregarProducto/shoes-4467', 'Firefox', 'Unknown Windows OS', '', '2017', '01'),
('dd8fc1f77161635d0adb6a69bbb1b8db', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', 1481672520, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:8:"Reserved";s:10:"referencia";s:0:"";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"12";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:4:"home";}', 'Reserved', '', 'Firefox', 'Unknown Windows OS', '', '2016', '12'),
('e5c70e9b5a51c5c1074284fe056f8d1c', '192.168.1.136', 'Mozilla/5.0 (Linux; Android 5.0.2; BLU VIVO AIR LTE Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.284', 1477455472, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:8:"Reserved";s:10:"referencia";s:0:"";s:9:"navegador";s:6:"Chrome";s:10:"plataforma";s:5:"Linux";s:6:"mobile";s:14:"Generic Mobile";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"10";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:5:"obras";}', 'Reserved', '', 'Chrome', 'Linux', 'Generic Mobile', '2016', '10'),
('ea691f32fb0a9393873728ab565194bf', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', 1472002212, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:0:"";s:10:"referencia";s:0:"";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"08";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:4:"home";}', '', '', 'Firefox', 'Unknown Windows OS', '', '2016', '08'),
('ecf374b285ebca6f19578d8099c4b5aa', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 1472432530, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:0:"";s:10:"referencia";s:0:"";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"08";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:4:"home";}', '', '', 'Firefox', 'Unknown Windows OS', '', '2016', '08'),
('f06f9e00bbb4b93d8262ab6b7642ef5c', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:49.0) Gecko/20100101 Firefox/49.0', 1477203541, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:0:"";s:10:"referencia";s:0:"";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"10";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:5:"obras";}', '', '', 'Firefox', 'Unknown Windows OS', '', '2016', '10'),
('fb360102cb8242b87a64e2f53b686637', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0', 1468891029, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:0:"";s:10:"referencia";s:0:"";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"07";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:4:"home";}', '', '', 'Firefox', 'Unknown Windows OS', '', '2016', '07'),
('ff9ac8187ad4ac96ce197140091ab833', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:45.0) Gecko/20100101 Firefox/45.0', 1460121612, 'a:11:{s:9:"user_data";s:0:"";s:4:"pais";s:8:"Reserved";s:10:"referencia";s:0:"";s:9:"navegador";s:7:"Firefox";s:10:"plataforma";s:18:"Unknown Windows OS";s:6:"mobile";s:0:"";s:4:"anio";s:4:"2016";s:3:"mes";s:2:"04";s:3:"idi";s:3:"esp";s:8:"idi_camp";s:8:"_espanol";s:11:"menu_active";s:4:"home";}', 'Reserved', '', 'Firefox', 'Unknown Windows OS', '', '2016', '04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `im_slideshow`
--

CREATE TABLE `im_slideshow` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `titulo_espanol` varchar(255) NOT NULL,
  `descripcion_espanol` text NOT NULL,
  `archivo` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `tipo` varchar(15) NOT NULL,
  `posicion` int(11) NOT NULL,
  `color_texto` varchar(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0=activo; 1=inactivo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `im_slideshow`
--

INSERT INTO `im_slideshow` (`id`, `titulo`, `descripcion`, `titulo_espanol`, `descripcion_espanol`, `archivo`, `link`, `tipo`, `posicion`, `color_texto`, `status`) VALUES
(23, 'Banner 1', 'Banner de Zapatos Puma', 'Zapatos Puma', 'Zapatos Puma', '88d6c158e94eea064778704467437166.jpg', '', '', 1, '', 0),
(24, 'Banner 2', 'Banner de Zapatos Adidas', 'Zapatos Adidas', 'Zapatos Adidas', 'e2b0a80632cccbe3c4ef2b790959e549.jpg', '', '', 2, '', 0),
(25, 'banner 3', 'banner 3', 'banner 3', 'banner 3', '4e235df11ae06fea878cb62ec0518914.jpg', '', '', 3, '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `im_usuarios`
--

CREATE TABLE `im_usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `cargo` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `direccion` text NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0=activo; 1=inactivo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `im_usuarios`
--

INSERT INTO `im_usuarios` (`id`, `nombre`, `tags`, `cargo`, `email`, `telefono`, `direccion`, `imagen`, `usuario`, `clave`, `status`) VALUES
(1, 'Jose Bello', 'jose-bello', 'Gerente General', 'joseeduardo.bello@gmail.com', '04128658193', 'San Diego', 'b96c1b31d84900d4b33ad1f06d055125.jpg', 'jbello', '4a7d1ed414474e4033ac29ccb8653d9b', 0),
(2, 'Administrador del SIstema', 'administrador-del-sistema', 'Gerente de Sistemas', 'omzconstrucciones@gmail.com', '0', 'Caracas', '', 'administrador', '429339e33f6ca1b7197b5f83d5975723', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `im_usuarios_privilegios`
--

CREATE TABLE `im_usuarios_privilegios` (
  `id` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idmodulo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `im_usuarios_privilegios`
--

INSERT INTO `im_usuarios_privilegios` (`id`, `idusuario`, `idmodulo`) VALUES
(1, 1, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `im_visitas`
--

CREATE TABLE `im_visitas` (
  `id` int(11) NOT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `hora` varchar(8) DEFAULT NULL,
  `fecha` varchar(20) DEFAULT NULL,
  `horau` varchar(10) DEFAULT NULL,
  `diau` char(3) DEFAULT NULL,
  `aniou` varchar(4) DEFAULT NULL,
  `pais` varchar(255) NOT NULL,
  `referencia` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `im_visitas`
--

INSERT INTO `im_visitas` (`id`, `ip`, `hora`, `fecha`, `horau`, `diau`, `aniou`, `pais`, `referencia`) VALUES
(1, '127.0.0.1', '10:40:27', '25 del 2 de 2015', '10', '55', '2015', '', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bss_configuracion_envio`
--
ALTER TABLE `bss_configuracion_envio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `im_alertas`
--
ALTER TABLE `im_alertas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `im_carrito`
--
ALTER TABLE `im_carrito`
  ADD PRIMARY KEY (`idcarrito`);

--
-- Indices de la tabla `im_clientes`
--
ALTER TABLE `im_clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `im_configuracion`
--
ALTER TABLE `im_configuracion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `im_contenidos`
--
ALTER TABLE `im_contenidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `im_galeria`
--
ALTER TABLE `im_galeria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `im_galeria_categoria`
--
ALTER TABLE `im_galeria_categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `im_listas`
--
ALTER TABLE `im_listas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `im_mensajes`
--
ALTER TABLE `im_mensajes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `im_menus`
--
ALTER TABLE `im_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `im_menu_tipo`
--
ALTER TABLE `im_menu_tipo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `im_modulos`
--
ALTER TABLE `im_modulos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `im_modulos_privilegios`
--
ALTER TABLE `im_modulos_privilegios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `im_noticias`
--
ALTER TABLE `im_noticias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `im_noticias_categoria`
--
ALTER TABLE `im_noticias_categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `im_noticias_comentarios`
--
ALTER TABLE `im_noticias_comentarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `im_noticias_galeria`
--
ALTER TABLE `im_noticias_galeria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `im_obras`
--
ALTER TABLE `im_obras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `im_obras_categoria`
--
ALTER TABLE `im_obras_categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `im_obras_colecciones`
--
ALTER TABLE `im_obras_colecciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `im_obras_galeria`
--
ALTER TABLE `im_obras_galeria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `im_pedidolinea`
--
ALTER TABLE `im_pedidolinea`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `im_pedidos`
--
ALTER TABLE `im_pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `im_productos`
--
ALTER TABLE `im_productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `im_productos_categoria`
--
ALTER TABLE `im_productos_categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `im_productos_colecciones`
--
ALTER TABLE `im_productos_colecciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `im_productos_galeria`
--
ALTER TABLE `im_productos_galeria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `im_publicidad`
--
ALTER TABLE `im_publicidad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `im_publicidad_clic`
--
ALTER TABLE `im_publicidad_clic`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `im_publicidad_impresiones`
--
ALTER TABLE `im_publicidad_impresiones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `im_sessions`
--
ALTER TABLE `im_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `last_activity_idx` (`last_activity`);

--
-- Indices de la tabla `im_sessions_web`
--
ALTER TABLE `im_sessions_web`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `last_activity_idx` (`last_activity`);

--
-- Indices de la tabla `im_slideshow`
--
ALTER TABLE `im_slideshow`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `im_usuarios`
--
ALTER TABLE `im_usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `im_usuarios_privilegios`
--
ALTER TABLE `im_usuarios_privilegios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `im_visitas`
--
ALTER TABLE `im_visitas`
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bss_configuracion_envio`
--
ALTER TABLE `bss_configuracion_envio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `im_alertas`
--
ALTER TABLE `im_alertas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `im_carrito`
--
ALTER TABLE `im_carrito`
  MODIFY `idcarrito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT de la tabla `im_clientes`
--
ALTER TABLE `im_clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `im_configuracion`
--
ALTER TABLE `im_configuracion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=383;
--
-- AUTO_INCREMENT de la tabla `im_contenidos`
--
ALTER TABLE `im_contenidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT de la tabla `im_galeria`
--
ALTER TABLE `im_galeria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `im_galeria_categoria`
--
ALTER TABLE `im_galeria_categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `im_listas`
--
ALTER TABLE `im_listas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `im_mensajes`
--
ALTER TABLE `im_mensajes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `im_menus`
--
ALTER TABLE `im_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `im_menu_tipo`
--
ALTER TABLE `im_menu_tipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `im_modulos`
--
ALTER TABLE `im_modulos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `im_modulos_privilegios`
--
ALTER TABLE `im_modulos_privilegios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;
--
-- AUTO_INCREMENT de la tabla `im_noticias`
--
ALTER TABLE `im_noticias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `im_noticias_categoria`
--
ALTER TABLE `im_noticias_categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `im_noticias_comentarios`
--
ALTER TABLE `im_noticias_comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `im_noticias_galeria`
--
ALTER TABLE `im_noticias_galeria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT de la tabla `im_obras`
--
ALTER TABLE `im_obras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `im_obras_categoria`
--
ALTER TABLE `im_obras_categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `im_obras_colecciones`
--
ALTER TABLE `im_obras_colecciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `im_obras_galeria`
--
ALTER TABLE `im_obras_galeria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `im_pedidolinea`
--
ALTER TABLE `im_pedidolinea`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `im_pedidos`
--
ALTER TABLE `im_pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `im_productos`
--
ALTER TABLE `im_productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT de la tabla `im_productos_categoria`
--
ALTER TABLE `im_productos_categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT de la tabla `im_productos_colecciones`
--
ALTER TABLE `im_productos_colecciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `im_productos_galeria`
--
ALTER TABLE `im_productos_galeria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;
--
-- AUTO_INCREMENT de la tabla `im_publicidad`
--
ALTER TABLE `im_publicidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `im_publicidad_clic`
--
ALTER TABLE `im_publicidad_clic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `im_publicidad_impresiones`
--
ALTER TABLE `im_publicidad_impresiones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2117;
--
-- AUTO_INCREMENT de la tabla `im_slideshow`
--
ALTER TABLE `im_slideshow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT de la tabla `im_usuarios`
--
ALTER TABLE `im_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `im_usuarios_privilegios`
--
ALTER TABLE `im_usuarios_privilegios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `im_visitas`
--
ALTER TABLE `im_visitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
