<?php 
/*
Plugin Name:ASQUIMCO Eventos
Plugin URI:https://asquimco.org/
Description:Plugin para la configuracion de eventos de asquimco
Author:Angie Espitia
Author URI:https://asquimco.org/
Version:1.0
License:GPLv2 or later
Text Domain:asquimco-aventos
Requires at least:4.0
Domain Path:/languages/
*/
if( ! class_exists( 'WP_List_Table' ) ) 
{
    require_once( ABSPATH . 'wp-admin/includes/class-wp-list-table.php' );
}

load_plugin_textdomain( $domain,false,plugin_dir_path(__FILE__) );
register_activation_hook(__FILE__, 'bd_add_table' );
function bd_add_table() {

	$table_name	= "eventos";

	$table_columns = "id INT(6) UNSIGNED AUTO_INCREMENT,
	 					titulo_evento varchar(60) NOT NULL,
				        hora_evento varchar(64) NOT NULL,
				        lugar_evento varchar(100) NOT NULL,
				        fecha_evento varchar(64) NOT NULL";

	$table_keys = "PRIMARY KEY (id)";

	create_table($table_name, $table_columns, $table_keys);

}

register_deactivation_hook(__FILE__, 'db_remove_table' ); 
function db_remove_table(){
    global $wpdb;
    $table_name = $wpdb->prefix . 'eventos';
    $sql = "DROP table IF EXISTS" . $table_name .";" ; 
	$wpdb->query($sql);
}


add_action('init','eventos_asquimco');
if(!function_exists("eventos_asquimco")){
	function eventos_asquimco(){
		add_shortcode('eventos_asquimco','lista_eventos');
	}
}
if(!function_exists('lista_eventos')){
	function lista_eventos(){

		global $wpdb;
	    $wpdb->show_errors = true;
		$table = $wpdb->prefix.'eventos';
		$resultados = $wpdb->get_results($wpdb->prepare('SELECT * FROM wp_eventos ORDER BY fecha_evento', $table), OBJECT);
		if($resultados == null){
			echo("<h3>no hay eventos registrados</h3>");
		}
		else{
			foreach ($resultados as $value) {
				if (substr($value->fecha_evento, 5, 2) == '01'){
                  	$mes = 'Enero';
                }else if(substr($value->fecha_evento, 5, 2) == '02'){
                  	$mes = 'Febrero';
                }else if(substr($value->fecha_evento, 5, 2) == '03'){
                  	$mes = 'Marzo';
                }else if(substr($value->fecha_evento, 5, 2) == '04'){
                  	$mes = 'Abril';
                }else if(substr($value->fecha_evento, 5, 2) == '05'){
                  	$mes = 'Mayo';
                }else if(substr($value->fecha_evento, 5, 2) == '06'){
                  	$mes = 'Junio';
                }else if(substr($value->fecha_evento, 5, 2) == '07'){
                  	$mes = 'Julio';
                }else if(substr($value->fecha_evento, 5, 2) == '08'){
                  	$mes = 'Agosto';
                }else if(substr($value->fecha_evento, 5, 2) == '09'){
                  	$mes = 'Septiembre';
                }else if(substr($value->fecha_evento, 5, 2) == '10'){
                  	$mes = 'Octubre';
                }else if(substr($value->fecha_evento, 5, 2) == '11'){
                  	$mes = 'Noviembre';
                }else if(substr($value->fecha_evento, 5, 2) == '12'){
                  	$mes = 'Diciembre';
                }
				echo("<div class='div-paddings-box col-md-12 col-lg-12 col-sm-12'>
			                  <div class='div-paddings-0px eventos-dias-box col-md-4'>
			                  <p class='margin-bottom0px' style='font-size:25px;'>".$mes."</p>
			                      <p class='margin-bottom0px font50px'>".substr($value->fecha_evento, 8, 2)."</p>
			                  </div>
			                  <div class='col-md-8'>
			                    <a class='font20px color-naranja'>".$value->titulo_evento."</a>
			                    <br><br>
			                    <p> Hora: ".$value->hora_evento."</p>
			                    <p> Lugar: ".$value->lugar_evento."</p>
			                  </div>
			              </div>");
				
			}
			
		}
	}
}

function eventos_plugin_menu(){
	add_menu_page('Ajustes plugin de eventos ASQUIMCO',
					'Eventos ASQUIMCO',
					'administrator',
					'eventos_asquimco_id',
					'eventos_asquimco_funtion',
					'dashicons-admin-generic');
	add_submenu_page(
        'eventos_asquimco_id',
        'Agregar Nuevo Evento',
        'Agregar Nuevo Evento',
        'manage_options',
        'subeventos_asquimco_id',
        'get_event_plugin'
    );
}add_action('admin_menu','eventos_plugin_menu');

function eventos_asquimco_funtion(){  
			
	$udpListTable = new List_Class_Table();
	$udpListTable->prepare_items();

	$message = '';
    if ('delete' === $udpListTable->current_action()) 
    {
        $message = '<div class="updated below-h2" id="message"><p>' . sprintf(__('Items eliminados: %d', 'udplisttable'), 
        	count($_GET['id'])) . '</p></div>';
    }

	?>
	<div class="wrap">

	    <h2><?php _e('Eventos ASQUIMCO', 'udplisttable')?> 
	    <a class="add-new-h2" href="<?php echo get_admin_url(get_current_blog_id(), 'admin.php?page=subeventos_asquimco_id');?>">
	    	<?php _e('Añadir nuevo evento', 'udplisttable')?>
	    </a>
	    </h2>
	    <p>Para añadir eventos a la página, agrega un widget de texto y pon el shortcode: <strong>[eventos_asquimco][/eventos_asquimco]</strong></p>
	    <?php echo $message; ?>

	    <form id="search-table" method="GET">
	        <input type="hidden" name="page" value="<?php echo $_GET['page'] ?>"/>
	        <?php $udpListTable->display() ?>
	    </form>
	</div>
		 <?php 
}

function get_event_plugin() { 
    if(isset($_POST['action'])){
        global $wpdb;
		$table = $wpdb->prefix.'eventos';
		$data = array('titulo_evento' => $_POST['titulo_evento'], 'hora_evento' => $_POST['hora_evento'], 'lugar_evento' => $_POST['lugar_evento'], 'fecha_evento' => $_POST['fecha_evento'] );
		$format = array('%s','%s','%s','%s');
		$wpdb->insert($table,$data,$format);
		$my_id = $wpdb->insert_id;
        echo("<div class='updated message' style='padding: 10px'>Opciones guardadas.</div>");
    }

	?>
		<div class="wrap">
			<h2>Configuración plugin para Eventos</h2>
			<h3 class="title">Descripción</h3>
			<p>Este Plugin permite crear una lista de eventos para el tema de ASQUIMCO.</p>
			<form method="POST" name="action">
				<?php 
					settings_fields('eventos_asquimco_group');
					@do_settings_sections('eventos_asquimco_group');
				 ?>
				<table class="form-table">
                    <tr valign="top">
                        <th scope="row">
				 			<label>Titulo del evento</label>
				 		</th>
                        <td>
				 			<input type="text" name="titulo_evento" id="titulo_evento" value="<?php echo get_option('titulo_evento'); ?>">
				 			<br />
                            <small></small>
                        </td>
                    </tr>
                    <tr valign="top">
                        <th scope="row">
				 			<label>Hora del evento</label>
				 		</th>
                        <td>
				 			<input type="time" name="hora_evento" id="hora_evento" value="<?php echo get_option('hora_evento'); ?>">
				 			<br />
                            <small>Hora en la que se realizará el evento</small>
                        </td>
                    </tr>
                    <tr valign="top">
                        <th scope="row">
				 			<label>Lugar del evento</label>
				 		</th>
                        <td>
				 			<input type="text" name="lugar_evento" id="lugar_evento" value="<?php echo get_option('lugar_evento'); ?>">
				 			<br />
                            <small>Lugar en el que se realizará el evento</small>
                        </td>
                    </tr>
                    <tr valign="top">
                        <th scope="row">
				 			<label>Fecha del evento</label>
				 		</th>
                        <td>
				 			<input type="date" name="fecha_evento" id="fecha_evento" value="<?php echo get_option('fecha_evento'); ?>">
				 			<br />
                            <small>Día de la realización del evento</small>
                        </td>
                    </tr>
                </table>
				<?php @submit_button( ); ?>
			</form>
		</div>
	<?php
}

class List_Class_Table extends WP_List_Table {

    function __construct()
    {
        parent::__construct( 
        	array(
	            'singular'  => __( 'Evento', 'udplisttable' ),     //singular
	            'plural'    => __( 'Eventos', 'udplisttable' ),   //plural
	            'ajax'      => false        //soporte ajax
    		) 
       	);
    }

  	function column_default( $item, $column_name ) 
  	{
	    switch( $column_name ) 
	    { 
	        case 'id':
	        case 'titulo_evento':
	        case 'hora_evento':
	        case 'lugar_evento':
	        case 'fecha_evento':
	            return $item[ $column_name ];
	        default:
	            return print_r( $item, true ) ; //si no existe la columna aparecerá esto
	    }
  	}

	function get_columns()
	{
        $columns = array(
        	'cb'        => '<input type="checkbox" />',
            'id' => __( 'Id', 'udplisttable' ),
            'titulo_evento'    => __( 'Titulo', 'udplisttable' ),
            'hora_evento'    => __( 'Hora', 'udplisttable' ),
            'lugar_evento'    => __( 'Lugar', 'udplisttable' ),
            'fecha_evento'    => __( 'Fecha', 'udplisttable' )
        );
        return $columns;
    }

	function prepare_items() 
	{
		//objecto global wp
	  	global $wpdb;
        $table_name = $wpdb->prefix . 'eventos'; 
        $per_page = 4;
        $columns = $this->get_columns();
        $hidden = array();
        $sortable = $this->get_sortable_columns();
        $this->_column_headers = array($columns, $hidden, $sortable);
        $this->process_bulk_action();
        $total_items = $wpdb->get_var("SELECT COUNT(id) FROM $table_name");
        $paged = isset($_GET['paged']) ? 
        		 max(0, intval($_GET['paged']) - 1) : 
        		 0;
        $orderby = (isset($_GET['orderby']) && in_array($_GET['orderby'], array_keys($this->get_sortable_columns()))) ? 
        			$_GET['orderby'] : 
        			'id';
        $order = (isset($_GET['order']) && in_array($_GET['order'], array('asc', 'desc'))) ? 
        		 $_GET['order'] : 
        		 'asc';

        $this->items = $wpdb->get_results($wpdb->prepare(
        		"SELECT * FROM $table_name ORDER BY $orderby $order LIMIT %d OFFSET %d", $per_page, ($paged*$per_page)
        	), 
        	ARRAY_A
        );

        $this->set_pagination_args(array(
            'total_items' => $total_items, // total items
            'per_page' => $per_page, // items por página
            'total_pages' => ceil($total_items / $per_page) // páginas en total para los enlaces de la paginación
        ));
	}

	function get_sortable_columns() 
	{
	  	$sortable_columns = array(
		    'id'  => array('id',true),
		    'titulo_evento' => array('titulo_evento',true),
		    'hora_evento' => array('hora_evento',true),
		    'lugar_evento' => array('lugar_evento',true),
		    'fecha_evento' => array('fecha_evento',true)
	  	);
	  	return $sortable_columns;
	}

	function column_id($item) 
	{
        $actions = array(
            'edit' => sprintf('<a href="?page=subeventos_asquimco_id&id=%s">%s</a>', $item['id'],'Editar'),
            'delete' => sprintf('<a href="?page=%s&action=delete&id=%s">%s</a>', $_REQUEST['page'], $item['id'], 'Eliminar'),
        );

        return sprintf('%s %s',
            $item['id'],
            $this->row_actions($actions)
        );
	}

	function get_bulk_actions() 
	{
	  	$actions = array(
	    	'delete'    => 'Eliminar'
	  	);
	  	return $actions;
	}

    function process_bulk_action()
    {
        global $wpdb;
        $table_name = $wpdb->prefix . 'eventos'; 

        if ('delete' === $this->current_action()) 
        {
            $ids = isset($_GET['id']) ? $_GET['id'] : array();
            //si es un array de ids
            if (is_array($ids)) 
            {
            	$ids = implode(',', $ids);
            }

            if (!empty($ids)) 
            {
                $wpdb->query("DELETE FROM $table_name WHERE id IN($ids)");
            }
        }
    }

	function column_cb($item) 
	{
        return sprintf(
            '<input type="checkbox" name="id[]" value="%s" />', $item['id']
        );    
    }

    function no_items() 
    {
	  	_e( 'No se encontrarón búsquedas.' );
	}

} 

// Funcion para crear tabla en la bd
function create_table($table_name, $table_columns, $table_keys = null, $db_prefix = true, $charset_collate = null) {
		global $wpdb;

		if($charset_collate == null)
			$charset_collate = $wpdb->get_charset_collate();
		$table_name = ($db_prefix) ? $wpdb->prefix.$table_name : $table_name;
		$table_columns = strtolower($table_columns);

		if($table_keys)
			$table_keys =  ", $table_keys";

		$table_structure = "( $table_columns $table_keys )";

		$search_array = array();
		$replace_array = array();

		$search_array[] = "`";
		$replace_array[] = "";

		$table_structure = str_replace($search_array,$replace_array,$table_structure);

		$sql = "CREATE TABLE $table_name $table_structure $charset_collate;";
		require_once (ABSPATH . 'wp-admin/includes/upgrade.php');
		return dbDelta($sql);
}

 ?>
