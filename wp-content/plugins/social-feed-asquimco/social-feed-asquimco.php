<?php 
/*
Plugin Name:ASQUIMCO Social Feed
Plugin URI:https://asquimco.org/
Description:Plugin para la obtencion de publicaciones de redes sociales 
Author:Angie Espitia
Author URI:https://asquimco.org/
Version:1.0
License:GPLv2 or later
Text Domain:asquimco-aventos
Requires at least:4.0
Domain Path:/languages/
*/
add_action('init','social_feed_asquimco');
if(!function_exists("social_feed_asquimco")){
	function social_feed_asquimco(){
		add_shortcode('social_feed_asquimco','lista_publicaciones');
	}
}
if(!function_exists('lista_publicaciones')){
	function lista_publicaciones(){

		$twitterObject = new Twitter();
	    $jsonraw =  $twitterObject->getTweets("ASQUIMCO");
	    $rawdata =  $twitterObject->getArrayTweets($jsonraw);
	    $twitterObject->displayTable($rawdata); 
	}
}

class Twitter{

    function getTweets($user){
        ini_set('display_errors', 1);
        require_once('ApiTwitter.php');

        $settings = array(
    'oauth_access_token' => "151656750-jQ09eOsIAwNHY0m19mwe02a4q95Msp90cwfz3IOJ",
    'oauth_access_token_secret' => "cn2qPAxnd5nXpbrv3bk8WlukF2AZaSynNMQ1rw79MNHxG",
    'consumer_key' => "Zn6w41fp6wlyDdj28KW9VN8xz",
    'consumer_secret' => "pDNDMSB6SKDGQhb2MN1u36UawvnePASeOJdPLeApNCsHBjDLAu"
        );

        $url = 'https://api.twitter.com/1.1/statuses/user_timeline.json';
        $getfield = '?screen_name='.$user.'&count=5';        
        $requestMethod = 'GET';
        $twitter = new TwitterAPIExchange($settings);
        $json =  $twitter->setGetfield($getfield)
                     ->buildOauth($url, $requestMethod)
                     ->performRequest();
        return $json;

    }

    function getArrayTweets($jsonraw){

        $rawdata = array();
        $json = json_decode($jsonraw);
        $num_items = count($json);
        for($i=0; $i<$num_items; $i++){

            $user = $json[$i];

            $fecha = $user->created_at;
            $url_imagen = $user->user->profile_image_url;
            $screen_name = $user->user->screen_name;
            $tweet = $user->text;

            $imagen = "<a href='https://twitter.com/".$screen_name."' target=_blank><img src=".$url_imagen."></img></a>";
            $name = "<a href='https://twitter.com/".$screen_name."' target=_blank>@".$screen_name."</a>";

            $rawdata[$i][0]=$fecha;
            $rawdata[$i]["FECHA"]=$fecha;
            $rawdata[$i][1]=$imagen;
            $rawdata[$i]["imagen"]=$imagen;
            $rawdata[$i][2]=$name;
            $rawdata[$i]["screen_name"]=$name;
            $rawdata[$i][3]=$tweet;
            $rawdata[$i]["tweet"]=$tweet;
        }
        return $rawdata;
    }

    function displayTable($rawdata){
    	
        $filas = count($rawdata);
        for($i=0;$i<$filas;$i++){
            echo '<div class="div-paddings-box col-md-12 col-lg-12 col-sm-12"  style="padding-bottom: 0px; padding-top: 15px;">
                <div class="div-paddings-0px col-md-2">
                	'.$rawdata[$i]['imagen'].'
            	</div>
            	<div class="div-paddings-0px col-md-10">';
            	
	        	echo '<a class="font20px color-verde">'.$rawdata[$i]['screen_name'].'</a> <small class="color-verde">'.$rawdata[$i]['FECHA'].'</small>              
	             		<p>'.$rawdata[$i]['tweet'].'</p>
	            	</div>
	       		</div>';
           echo '<div class="col-md-12 col-lg-12 col-sm-12" style="padding-bottom: 15px;"><hr class="hr-verde"></div>';  		
        }       
        
    }
}

function rudr_instagram_api_curl_connect( $api_url ){
	$connection_c = curl_init(); // initializing
	curl_setopt( $connection_c, CURLOPT_URL, $api_url ); // API URL to connect
	curl_setopt( $connection_c, CURLOPT_RETURNTRANSFER, 1 ); // return the result, do not print
	curl_setopt( $connection_c, CURLOPT_TIMEOUT, 20 );
	$json_return = curl_exec( $connection_c ); // connect and get json data
	curl_close( $connection_c ); // close connection
	return json_decode( $json_return ); // decode and return
}

?>

<style type="text/css">
    .fts-jal-fb-group-display{
     margin-top: 18%;
     padding-right: 20px;
     padding-left: 20px;   
    }
    .fts-jal-fb-header{
        display: none;
    }
    .fts-jal-fb-user-thumb{
        float: left;
        margin-right: 15px;
    }
    .fts-jal-fb-user-name>a{
        color: #02897b;
    }
    .fts-jal-fb-post-time{
        color: #02897b;
    }
    .fts-jal-fb-link-wrap{
        margin-top: 15px;
    }
    .fts-fb-large-photo>img{
        width: 270px;
        padding-left: 17%;
    }
    .fts-likes-shares-etc-wrap{
        display: none;
    }
    .fts-fb-photo-post-wrap{
        margin-bottom: 15px;
        padding-bottom: 10px;
        border-bottom: 1.5px #02897b solid;
    }
</style>