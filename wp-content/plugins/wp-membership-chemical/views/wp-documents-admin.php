<div class="wrap">
    <h2>Administrar Documentos</h2>
    <table class="wp-list-table widefat fixed striped">
        <thead>
            <tr>
                <th>Id</th>
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

                if( $documents ){
                    foreach( $documents as $document ){
                        ?>
                        <tr>
                            <td><?php echo ( $document->id ); ?></td>
                            <td><?php echo ( $document->name ); ?></td>
                            <td><?php echo ( $document->description ); ?></td>
                            <td><a href="#">Editar</a>&nbsp;&nbsp;<a href="#">Eliminar</a></td>
                        </tr>
                        <?php
                    }
                }
            ?>
        </tbody>   
    </table>    
</div>

