<div class="wrap">
    <h2>Administrar Membresías</h2>
    <table class="wp-list-table widefat fixed striped">
        <thead>
            <tr>
                <th>Nombre</th>
                <th>Valor</th>
                <th>Duración (días)</th>
                <th>Estado</th>
                <th>Opciones</th>
            </tr>
        </thead>
        <tbody>
            <?php
                global $wpdb;

                $memberships = $wpdb->get_results(
                    "
                    SELECT * 
                    FROM qm_membership
                    "
                );

                if( $memberships ){
                    foreach( $memberships as $membership ){
                        ?>
                        <tr>
                            <td><?php echo ( $membership->name ); ?></td>
                            <td><?php echo ( $membership->price ); ?></td>
                            <td><?php echo ( $membership->term ); ?></td>
                            <td><?php $state = $membership->state == 1 ? "Activo": "Inactivo"; echo $state; ?></td>
                            <td><a href="#">Ver</a></td>
                        </tr>
                        <?php
                    }
                }
            ?>
        </tbody>   
    </table>    
</div>
