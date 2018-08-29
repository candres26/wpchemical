<div class="wrap">
    <h2>Administrar Documentos</h2>
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

                $documents = $wpdb->get_results(
                    "
                    SELECT * 
                    FROM qm_document
                    "
                );
                if( count( $documents ) > 0 ){
                    if( $documents ){
                        foreach( $documents as $document ){
                            ?>
                            <tr>
                                <td><?php echo ( $document->name ); ?></td>
                                <td><?php echo ( $document->description ); ?></td>
                                <td><a href="<?php echo ( esc_url( admin_url( 'admin.php' ) ) ); ?>?page=editar_documento&id=<?php echo( $document->id ); ?>">Ver</a></td>
                            </tr>
                            <?php
                        }
                    }
                }else {
                    ?>
                    <tr><td colspan="5" style="text-align: center; font-size: 1.2em; font-weight: bold;">No hay registros para mostrar</td></tr>
                    <?php
                }

            ?>
        </tbody>   
    </table>    
</div>

