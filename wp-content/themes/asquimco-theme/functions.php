<?php 
require_once('wp_bootstrap_navwalker.php');
if (function_exists('register_nav_menus')) {
	register_nav_menus (array('menu' => 'Menu principal superior',
	));
}

//clase a
	add_filter('nav_menu_link_attributes', 'clases_a_menu', 10, 3);

	function clases_a_menu ($atts, $item, $args){
		$class = 'border a-nav';
		$atts['class'] = $class;
		return $atts;
	}

// imagen destacada
	if ( function_exists( 'add_theme_support' ) ) {
    add_theme_support( 'post-thumbnails' );
 }

 function bootstrapstarter_wp_setup() {
    add_theme_support( 'title-tag' );
    add_theme_support( 'post-thumbnails' );
}
add_action( 'after_setup_theme', 'bootstrapstarter_wp_setup' );

 //widgets
 add_action( 'widgets_init', 'my_register_sidebars' );
function my_register_sidebars() {
  
    register_sidebar(
        array(
            'id'            => 'evento',
            'name'          => __( 'Eventos Index' ),
            'description'   => __( 'Windgets eventos index.' ),
            'before_widget' => '<div id="%1$s" class="widget %2$s">',
            'after_widget'  => '</div>',
            'before_title'  => '<h3 class="widget-title">',
            'after_title'   => '</h3>',
            )
    );
    register_sidebar(
        array(
            'id'            => 'actividad',
            'name'          => __( 'Actividades Index' ),
            'description'   => __( 'Windgets actividades index.' ),
            'before_widget' => '<div id="%1$s" class="widget %2$s">',
            'after_widget'  => '</div>',
            'before_title'  => '<h3 class="widget-title">',
            'after_title'   => '</h3>',
            )
    );
    register_sidebar(
        array(
            'id'            => 'barra',
            'name'          => __( 'Barra Lateral single' ),
            'description'   => __( 'Widgets para la barra de single' ),
            'before_widget' => '<div id="%1$s" class="widget %2$s">',
            'after_widget'  => '</div>',
            'before_title'  => '<h3 class="widget-title">',
            'after_title'   => '</h3>',
            )
    );
    register_sidebar(
        array(
            'id'            => 'transparencia',
            'name'          => __( 'Transparencia Index' ),
            'description'   => __( 'Widgets para la transparencia' ),
            'before_widget' => '<div id="%1$s" class="widget %2$s">',
            'after_widget'  => '</div>',
            'before_title'  => '<h3 class="widget-title">',
            'after_title'   => '</h3>',
            )
    );
}

function feed($id_usuario){
    global $token; // tocken required
    // $id_usuario = "114613901916966";
    $token = '2058191994444785|AYigbQ4tHF_kyFPdnEgGMcSBrTg';
    $respuesta = wp_remote_get("https://graph.facebook.com/v2.6/".$id_usuario."/feed?fields=picture,message,story,created_time,shares,likes.limit(1).summary(true)&access_token=".$token);
    $datos = var_dump($respuesta["headers"]);
    $facebook = array();
    $i = 0;
    echo "lala " . $datos;
    // foreach ($datos as $value) {
    //         $facebook[$i]["numero_comentarios"] = $value["comments"]["count"]; 
    // }
    // $html = "";
    // foreach ($facebook as $key => $value) {
    //     $html .= '
    //         <div>
    //             <h1>'.$value["numero_comentarios"].'</h1>
    //         </div>
    //     ';
//}
 
//echo $html;
}
 
function getFacebookId($pageID) // This function return facebook page details by its url
{
 // get token from main file
 global $token; 
 $json = file_get_contents_curl('https://graph.facebook.com/'.$pageID.'?fields=fan_count,talking_about_count,name&access_token='.$token); 
 // decode returned json data in arrau.
 $json = json_decode($json);
 return $json;
}

// Hooks admin-post
add_action( 'admin_post_nopriv_process_form', 'send_request' );
add_action( 'admin_post_process_form', 'send_request' );

// Funcion callback
function send_request() {

    $name = sanitize_text_field($_POST['name']);
    $lastname = sanitize_text_field($_POST['last-name']);
	$email = sanitize_email($_POST['email']);
	$message = sanitize_text_field($_POST['type-membership']);

	$adminmail = "destino@dominio.com"; //email destino
	$subject = 'Formulario de contacto'; //asunto
	$headers = "Reply-to: " . $name . " <" . $email . ">";

	//Cuerpo del mensaje
	$msg = "Nombre: " . $name . "\n";
	$msg .= "E-mail: " . $email . "\n\n";
	$msg .= "Mensaje: \n\n" . $message . "\n";

	$sendmail = wp_mail( $adminmail, $subject, $msg, $headers);

	wp_redirect( home_url("/registro/")."?sent=".$sendmail ); //asumiendo que existe esta url
}


?>

