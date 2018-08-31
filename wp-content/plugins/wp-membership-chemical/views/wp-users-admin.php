<div class="wrap">
    <h2>Administrar Usuarios</h2>
    <table class="wp-list-table widefat fixed striped">
        <thead>
            <tr>
                <th>Nombres</th>
                <th>Apellidos</th>
                <th>Email</th>
                <th>Estado</th>
                <th>Opciones</th>
            </tr>
        </thead>
        <tbody>
            <?php
                global $wpdb;

                $users = $wpdb->get_results(
                    "
                    SELECT * 
                    FROM qm_user
                    "
                );
                if( count( $users ) > 0 ){
                    if( $users ){
                        foreach( $users as $user ){
                            ?>
                            <tr>
                                <td><?php echo ( $user->first_name ); ?></td>
                                <td><?php echo ( $user->last_name ); ?></td>
                                <td><?php echo ( $user->email ); ?></td>
                                <td><?php $state = $user->state == 1 ? "Activo": "Inactivo"; echo $state; ?></td>
                                <td><a href="<?php echo ( esc_url( admin_url( 'admin.php' ) ) ); ?>?page=editar_usuario&id=<?php echo( $user->id ); ?>">Ver</a></td>
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