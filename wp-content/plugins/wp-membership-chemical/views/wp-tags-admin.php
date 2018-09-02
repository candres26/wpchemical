<div class="wrap">
<h1 class="wp-heading-inline">Administrar Etiquetas</h1>
    <hr class="wp-header-end"/>
    <p class="search-box">
        <a href="<?php echo ( esc_url( admin_url( 'admin.php' ) ) ); ?>?page=crear_nueva_etiqueta" class="page-title-action" > Añadir Nuevo</a>
    </p>
    <div style="margin-bottom: 1em;">&nbsp;</div>
    <table class="wp-list-table widefat fixed striped">
        <thead>
            <tr>
                <th>Nombre</th>
                <th>Descripción</th>
                <th style="text-align: center;">Opciones</th>
            </tr>
        </thead>
        <tbody>
            <?php
                global $wpdb;

                $tags = $wpdb->get_results(
                    "
                    SELECT * 
                    FROM qm_tag
                    "
                );
                if( count( $tags ) > 0 ){
                    if( $tags ){
                        foreach( $tags as $tag ){
                            ?>
                            <tr>
                                <td><?php echo ( $tag->name ); ?></td>
                                <td><?php echo ( $tag->description ); ?></td>
                                <td style="text-align: center;"><a href="<?php echo ( esc_url( admin_url( 'admin.php' ) ) ); ?>?page=editar_etiqueta&id=<?php echo( $tag->id ); ?>">Ver</a></td>
                            </tr>
                            <?php
                        }
                    }
                }else{
                    ?>
                    <tr><td colspan="5" style="text-align: center; font-size: 1.2em; font-weight: bold;">No hay registros para mostrar</td></tr>
                    <?php
                }
            ?>
        </tbody>   
    </table>    
</div>