<?='<?xml version="1.0" encoding="utf-8"?>'?>
<rss version="2.0" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:sy="http://purl.org/rss/1.0/modules/syndication/" xmlns:admin="http://webns.net/mvcb/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:content="http://purl.org/rss/1.0/modules/content/" xmlns:atom="http://www.w3.org/2005/Atom">
    <channel>
        <title><? echo $nombre_feed; ?></title>
        <link><? echo $url_feed; ?></link>
        <atom:link href="<? echo $url_feed; ?>" rel="self" type="application/rss+xml" />
        <description><? echo $descripcion; ?></description>
        <language><? echo $lenguaje; ?></language>
        <!--define la fecha de la última publicación del contenido en el feed RSS-->
        <pubDate>
        <?php
        echo $articulos[0]->fecha_publicacion;
		?>
        </pubDate>
        <sy:updatePeriod>hourly</sy:updatePeriod>
        <!--cada cuántas horas quieres que mire si 
        hay nuevos posts tu feed, entre 0 y 24-->
        <sy:updateFrequency>1</sy:updateFrequency>
       <!--define la fecha de la última publicación del contenido en el feed RSS-->
        <lastBuildDate>
        <?php echo $articulos[0]->fecha_publicacion;?>
        </lastBuildDate>
        <docs>http://www.rssboard.org/rss-specification</docs>
        <managingEditor><? echo $autor; ?></managingEditor>
        <webMaster><? echo $nombre_feed; ?></webMaster>
        <!--obtenemos los posts para nuestro feed-->
        <?php foreach ($articulos as $post){ ?>
            <item>
                <title><?= $post->titulo ?></title>
                <!--el enlace permanente de nuestro posts por ejemplo
                http://localhost/rssCI/titulodelpost/iddelpost, por cada enlace
                se crearía un enlace permanente-->
                <link><?php echo base_url()."detalle_noticia/get/".$post->tags; ?></link>
                <description><![CDATA[<?php echo word_limiter($post->contenido, 100, ' [...]');?>]]></description>
                <pubDate>
				<?php echo $post->fecha_publicacion;?>
                </pubDate>
                <dc:creator><?php echo $autor; ?></dc:creator>
                <category><![CDATA[<?= $post->nombre_categoria ?>]]></category>
            </item>   
        <?php 
        }
        ?>
    </channel>
</rss>