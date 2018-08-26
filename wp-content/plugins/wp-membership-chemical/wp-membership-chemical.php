<?php
/*
Plugin Name: WP Membership Chemical
Description: This plugin it allows administration of contents for members registered.
Version: 1.0.0
Author: ICE and Andres Reyes
License: GPLv2
*/

// If this file is called directly, abort.
if ( ! defined( 'WPINC' ) ) {
    die;
}


require_once( dirname( __FILE__ ) . '/tools.php' );

function membership_menu(){
    
    add_menu_page(
        'Administrador de Usuarios',
        'Administrar usuarios',
        'manage_options',
        'administrar_usuarios',
        'users_admin_page',
        'dashicons-admin-generic'
    );
        
    add_submenu_page(
        'administrar_usuarios',
        'Administrar Membresías',
        'Administrar Membresías',
        'manage_options',
        'administrar_membresias',
        'membership_admin_page'
    );

    add_submenu_page(
        'administrar_usuarios',
        'Administrar Documentos',
        'Administrar Documentos',
        'manage_options',
        'administrar_documentos',
        'document_admin_page'
    );
 
    add_submenu_page(
        'administrar_usuarios',
        'Agregar Nueva Membresía',
        'Agregar Nueva Membresía',
        'manage_options',
        'crear_nueva_membresia',
        'membership_create_page'
    );
    
    add_submenu_page(
        'administrar_usuarios',
        'Agregar Nuevo Documento',
        'Agregar Nuevo Documento',
        'manage_options',
        'crear_nuevo_documento',
        'document_create_page'
    );
    
    add_submenu_page(
        'administrar_usuarios',
        'Agregar Nueva Etiqueta',
        'Agregar Nueva Etiqueta',
        'manage_options',
        'crear_nueva_etiqueta',
        'tag_create_page'
    );

    add_submenu_page(
        null,
        'Editar Membresía',
        'Editar Membresía',
        'manage_options',
        'editar_membresía',
        'membership_edit_page'
    );
}

function users_admin_page(){
    //printf( get_view('wp-users-admin.php') );
    include_once( dirname( __FILE__ ) . '/views/wp-users-admin.php' );
}

function membership_admin_page(){
    include_once( dirname( __FILE__ ) . '/views/wp-memberships-admin.php' );
}

function document_admin_page(){
    include_once( dirname( __FILE__ ) . '/views/wp-documents-admin.php' );
}

function membership_create_page(){
    include_once( dirname( __FILE__ ) . '/views/wp-membership-create.php' );
}

function document_create_page(){
    include_once(dirname( __FILE__ ) . '/views/wp-document-create.php' );
}

function tag_create_page(){
    include_once(dirname( __FILE__ ) . '/views/wp-tag-create.php' );
}

function membership_edit_page(){
        include_once( dirname( __FILE__ ) . '/views/wp-membership-edit.php' );
}


add_action('admin_menu', 'membership_menu');

add_action( 'admin_enqueue_scripts', 'enqueue_styles' );

add_action( 'init', 'register_styles' );

add_action( 'init', 'create_tag_own' );

add_action( 'init', 'create_document_own' );

add_action( 'init', 'create_membership_own' );

add_action( 'admin_menu', 'membership_edit' );

add_action( 'init', 'edit_membership_own' );


function membership_edit(){
    add_pages_page('Editar Membresía', 'Editar Membresía', 'manage_options', 'editar_membresia', 'membership_edit_page' );
}

function register_styles(){
	wp_register_style('wpchemicalstyle', plugins_url( '/css/wp_chem_styles.css', __FILE__ ) );
}

function enqueue_styles() {
	wp_enqueue_style( 'wpchemicalstyle' );
}

function create_tag_own(){
    global $wpdb;

    if( isset( $_REQUEST[ "action" ] ) && $_REQUEST[ "action" ] == "create_tag_own"){
        $wpdb->insert(
            'qm_tag',
            array(
                'name'=> $_POST['name'],
                'description'=> $_POST['description']
            ),
            array(
                '%s',
                '%s'
                )
            );
            wp_redirect( esc_url( admin_url( 'admin.php' ) ) . '?page=crear_nueva_etiqueta&status=0' );
    }
}
    
function create_document_own(){
    global $wpdb;
    if( isset( $_REQUEST[ "action" ] ) && $_REQUEST[ "action" ] == "create_document_own"){
        $wpdb->insert(
            'qm_document',
            array(
                'name'=> $_POST['name'],
                'description'=> $_POST['description']
            ),
            array(
                '%s',
                '%s'
            )
        );
        wp_redirect( esc_url( admin_url( 'admin.php' ) ) . '?page=crear_nuevo_documento&status=0' );
    }
}

    
function create_membership_own(){
    global $wpdb;
    if( isset( $_REQUEST[ "action" ] ) && $_REQUEST[ "action" ] == "create_membership_own"){
        $wpdb->insert(
            'qm_membership',
            array(
                'name'=> $_POST['name'],
                'description'=> $_POST['description'],
                'price'=> $_POST['price'],
                'term'=> $_POST['term'],
                'state'=> $_POST['state']
            ),
            array(
                '%s',
                '%s',
                '%s',
                '%s',
                '%s'
            )
        );

        $membership_id = $wpdb->insert_id;

        $documentos = explode( ";", $_POST["documentos-id"] );

        foreach( $documentos as $documento ){
            $wpdb->insert(
                'qm_membership_document',
                array(
                    'membership_id'=> $membership_id,
                    'document_id'=> $documento
                ),
                array(
                    '%d',
                    '%d',
                )
            );
        }

        $tags = explode( ";", $_POST["tags-id"] );

        foreach( $tags as $tag ){
            $wpdb->insert(
                'qm_membership_tag',
                array(
                    'membership_id'=> $membership_id,
                    'tag_id'=> $tag
                ),
                array(
                    '%d',
                    '%d',
                )
            );
        }

        wp_redirect( esc_url( admin_url( 'admin.php' ) ) . '?page=crear_nueva_membresia&status=0' );
    }
}

function edit_membership_own(){
    global $wpdb;
    if( isset( $_REQUEST[ "action" ] ) && $_REQUEST[ "action" ] == "edit_membership_own"){
        $wpdb->update(
            'qm_membership',
            array(
                'name'=> $_POST['name'],
                'description'=> $_POST['description'],
                'price'=> $_POST['price'],
                'term'=> $_POST['term'],
                'state'=> $_POST['state']
            ),
            array(
                '%s',
                '%s',
                '%s',
                '%s',
                '%s'
            )
        );

        $membership_id = $wpdb->insert_id;

        $documentos = explode( ";", $_POST["documentos-id"] );

        foreach( $documentos as $documento ){
            $wpdb->insert(
                'qm_membership_document',
                array(
                    'membership_id'=> $membership_id,
                    'document_id'=> $documento
                ),
                array(
                    '%d',
                    '%d',
                )
            );
        }

        $tags = explode( ";", $_POST["tags-id"] );

        foreach( $tags as $tag ){
            $wpdb->insert(
                'qm_membership_tag',
                array(
                    'membership_id'=> $membership_id,
                    'tag_id'=> $tag
                ),
                array(
                    '%d',
                    '%d',
                )
            );
        }

        wp_redirect( esc_url( admin_url( 'admin.php' ) ) . '?page=crear_nueva_membresia&status=0' );
    }
}