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
        'Administrar Solicitudes',
        'Administrar Solicitudes',
        'manage_options',
        'administrar_solicitudes',
        'request_admin_page'
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
        'Administrar Etiquetas',
        'Administrar Etiquetas',
        'manage_options',
        'administrar_etiquetas',
        'tag_admin_page'
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
}

function users_admin_page(){
    //printf( get_view('wp-users-admin.php') );
    include_once( dirname( __FILE__ ) . '/views/wp-users-admin.php' );
}

function request_admin_page(){
    include_once( dirname( __FILE__ ) . '/views/wp-requests-admin.php' );
}

function membership_admin_page(){
    include_once( dirname( __FILE__ ) . '/views/wp-memberships-admin.php' );
}

function document_admin_page(){
    include_once( dirname( __FILE__ ) . '/views/wp-documents-admin.php' );
}

function tag_admin_page(){
    include_once( dirname( __FILE__ ) . '/views/wp-tags-admin.php' );
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

function document_edit_page(){
    include_once( dirname( __FILE__ ) . '/views/wp-document-edit.php' );
}

function tag_edit_page(){
    include_once( dirname( __FILE__ ) . '/views/wp-tag-edit.php' );
}


add_action( 'admin_enqueue_scripts', 'enqueue_styles' );

add_action( 'init', 'register_styles' );

add_action('admin_menu', 'membership_menu');

add_action( 'admin_menu', 'membership_edit' );

add_action( 'init', 'create_membership_own' );

add_action( 'init', 'delete_membership_own' );

add_action( 'init', 'edit_membership_own' );

add_action( 'init', 'create_document_own' );

add_action( 'admin_menu', 'document_edit' );

add_action( 'init', 'delete_document_own' );

add_action( 'init', 'edit_document_own' );

add_action( 'init', 'create_tag_own' );

add_action( 'admin_menu', 'tag_edit' );

add_action( 'init', 'delete_tag_own' );

add_action( 'init', 'edit_tag_own' );


function tag_edit(){
    add_dashboard_page('Editar Etiqueta', 'Editar Etiqueta', 'manage_options', 'editar_etiqueta', 'tag_edit_page' );
}

function document_edit(){
    add_dashboard_page('Editar Documento', 'Editar Documento', 'manage_options', 'editar_documento', 'document_edit_page' );
}

function membership_edit(){
    add_dashboard_page('Editar Membresía', 'Editar Membresía', 'manage_options', 'editar_membresia', 'membership_edit_page' );
}

function register_styles(){
	wp_register_style('wpchemicalstyle', plugins_url( '/css/wp_chem_styles.css', __FILE__ ) );
}

function enqueue_styles() {
	wp_enqueue_style( 'wpchemicalstyle' );
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
                'id'=>$_POST['id_edit_mem']
            ),
            array(
                '%s',
                '%s',
                '%s',
                '%s',
                '%s'
            )
        );
        
        $id = $_POST['id_edit_mem'];
        
        //$membership_id = $wpdb->insert_id;
        
        $documentos = explode( ";", $_POST["documentos-id"] );
        
        $membership_doc = $wpdb->get_results(
            "
            SELECT *
            FROM qm_membership_document
            WHERE membership_id=$id"
        );
        
        $arraydocid = [];
        
        foreach( $membership_doc as $arrdocids ){
            array_push( $arraydocid, $arrdocids->document_id );
        }
        
        if( $membership_doc != '' ){
            foreach( $membership_doc as $damem ){
                if( array_search( $damem->document_id, $documentos, true ) === false ){
                    $wpdb->delete(
                        'qm_membership_document',
                        array( 'id'=> $damem->id )
                    );
                }
            }
            
            foreach ($documentos as $indoc) {
                if ( array_search( $indoc,  $arraydocid, true ) === false ) {
                    $wpdb->insert(
                        'qm_membership_document',
                        array(
                            'membership_id'=> $id,
                            'document_id'=> $indoc
                        ),
                        array(
                            '%d',
                            '%d',
                        )
                    );
                }
            }
        }else{
            foreach( $documentos as $documento ){
                $wpdb->insert(
                    'qm_membership_document',
                    array(
                        'membership_id'=> $id,
                        'document_id'=> $documento
                    ),
                    array(
                        '%d',
                        '%d',
                        )
                    );
                }
        }
        
        $tags = explode( ";", $_POST["tags-id"] );
        
        $membership_tag = $wpdb->get_results(
            "
            SELECT *
            FROM qm_membership_tag
            WHERE membership_id=$id"
        );
        
        $arraytagid = [];
        
        foreach( $membership_tag as $arrtagids ){
            array_push( $arraytagid, $arrtagids->tag_id );
        }
        
        if( $membership_tag != '' ){
            foreach( $membership_tag as $tamem ){
                if( array_search( $tamem->tag_id, $tags, true ) === false ){
                    $wpdb->delete(
                        'qm_membership_tag',
                        array( 'id'=> $tamem->id )
                    );
                }
            }
            
            foreach ($tags as $intag) {
                if ( array_search( $intag,  $arraytagid, true ) === false ) {
                    $wpdb->insert(
                        'qm_membership_tag',
                        array(
                            'membership_id'=> $id,
                            'tag_id'=> $intag
                        ),
                        array(
                            '%d',
                            '%d',
                            )
                    );
                }
            }
        }else{
            foreach( $tags as $tag ){
                $wpdb->insert(
                    'qm_membership_tag',
                    array(
                        'membership_id'=> $id,
                        'tag_id'=> $tag
                    ),
                    array(
                        '%d',
                        '%d',
                        )
                    );
            }
        }
        
        $upval = 1;
        
        wp_redirect( esc_url( admin_url( 'admin.php' ) ) . '?page=editar_membresia&id='.$id.'&msjup='.$upval );
    }
}

function delete_membership_own(){
    global $wpdb;
    if( isset( $_REQUEST[ "action" ] ) && $_REQUEST[ "action" ] == "delete_membership_own"){
        $id = $_POST['id_delete_mem'];
        
        $membership_doc = $wpdb->get_results(
            "
            SELECT *
            FROM qm_membership_document
            WHERE membership_id=$id"
        );
        
        $membership_tag = $wpdb->get_results(
            "
            SELECT *
            FROM qm_membership_tag
            WHERE membership_id=$id"
        );
        
        foreach ($membership_doc as $memdoc) {
            $wpdb->delete(
                'qm_membership_document',
                array( 'id'=> $memdoc->id )
            );
        }
        
        foreach ($membership_tag as $memtag) {
            $wpdb->delete(
                'qm_membership_tag',
                array( 'id'=> $memtag->id )
            );
        }
        
        $wpdb->delete(
            'qm_membership',
            array( 'id'=> $id )
        );
        
        wp_redirect( esc_url( admin_url( 'admin.php' ) ) . '?page=administrar_membresias&status=0' );
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

function edit_document_own(){
    global $wpdb;
    if( isset( $_REQUEST[ "action" ] ) && $_REQUEST[ "action" ] == "edit_document_own"){
        $wpdb->update(
            'qm_document',
            array(
                'name'=> $_POST['name'],
                'description'=> $_POST['description']
            ),
            array(
                'id'=>$_POST['id_edit_doc']
            ),
            array(
                '%s',
                '%s'
            )
        );
        
        $id = $_POST['id_edit_doc'];

        $upval = 1;
        
        wp_redirect( esc_url( admin_url( 'admin.php' ) ) . '?page=editar_documento&id='.$id.'&msjup='.$upval );
    }
}
    

function delete_document_own(){
    global $wpdb;
    if( isset( $_REQUEST[ "action" ] ) && $_REQUEST[ "action" ] == "delete_document_own"){
        $id = $_POST['id_delete_doc'];
        
        $wpdb->delete(
            'qm_document',
            array( 'id'=> $id )
        );
        
        wp_redirect( esc_url( admin_url( 'admin.php' ) ) . '?page=administrar_documentos&status=0' );
    }
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

function edit_tag_own(){
    global $wpdb;
    if( isset( $_REQUEST[ "action" ] ) && $_REQUEST[ "action" ] == "edit_tag_own"){
        $wpdb->update(
            'qm_tag',
            array(
                'name'=> $_POST['name'],
                'description'=> $_POST['description']
            ),
            array(
                'id'=>$_POST['id_edit_tag']
            ),
            array(
                '%s',
                '%s'
            )
        );
        
        $id = $_POST['id_edit_tag'];

        $upval = 1;
        
        wp_redirect( esc_url( admin_url( 'admin.php' ) ) . '?page=editar_etiqueta&id='.$id.'&msjup='.$upval );
    }
}
    

function delete_tag_own(){
    global $wpdb;
    if( isset( $_REQUEST[ "action" ] ) && $_REQUEST[ "action" ] == "delete_tag_own"){
        $id = $_POST['id_delete_tag'];
        
        $wpdb->delete(
            'qm_tag',
            array( 'id'=> $id )
        );
        
        wp_redirect( esc_url( admin_url( 'admin.php' ) ) . '?page=administrar_etiquetas&status=0' );
    }
}

    
