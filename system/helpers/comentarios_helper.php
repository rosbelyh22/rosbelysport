<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if ( ! function_exists('element'))
{
	
	function get_comentarios_facebook_helper(){
		?>
        <hr>
        <br>
        
        
        <div id="fb-root"></div>
		<script>(function(d, s, id) {
          var js, fjs = d.getElementsByTagName(s)[0];
          if (d.getElementById(id)) return;
          js = d.createElement(s); js.id = id;
          js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.3";
          fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));</script>
        
        <div class="fb-comments" data-width="100%" data-href="<?=current_url()?>" data-numposts="5"></div>
		<?php	
	}

}

/* End of file array_helper.php */
/* Location: ./system/helpers/array_helper.php */
?>