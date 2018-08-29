<div class="wrap">
    <h2>Administrar Etiquetas</h2>
    <table class="wp-list-table widefat fixed striped">
        <thead>
            <tr>
                <th>Nombre</th>
                <th>Descripción</th>
                <th>Opciones</th>
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
                                <td><a href="<?php echo ( esc_url( admin_url( 'admin.php' ) ) ); ?>?page=editar_etiqueta&id=<?php echo( $tag->id ); ?>">Ver</a></td>
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