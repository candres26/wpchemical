<div class="wrap">
    <h2>Administrar Solicitudes</h2>
    <table class="wp-list-table widefat fixed striped">
        <thead>
            <tr>
                <th>Usuario</th>
                <th>Tipo de Membresia</th>
                <th>Tipo de Pago</th>
                <th>Fecha de Expiración</th>
                <th>Estado</th>
                <th style="text-align: center;">Opciones</th>
            </tr>
        </thead>
        <tbody>
            <?php
                global $wpdb;

                $requests = $wpdb->get_results(
                    "
                    SELECT * 
                    FROM qm_request
                    "
                );

                $users = $wpdb->get_results(
                    "
                    SELECT * 
                    FROM qm_user
                    "
                );

                $memberships = $wpdb->get_results(
                    "
                    SELECT * 
                    FROM qm_membership
                    "
                );

                if( count( $requests ) > 0 ){
                    if( $requests ){
                        foreach( $requests as $request ){
                            ?>
                            <tr>
                                <td>
                                    <?php 
                                        foreach ($users as $user) {
                                            if( $user->id == $request->user_id ){
                                                echo ( $user->first_name . " " . $user->last_name ); 
                                            }
                                        }
                                    ?>
                                </td>
                                <td>
                                    <?php
                                        foreach ($memberships as $membership) {
                                            if( $membership->id == $request->membership_id ){
                                                echo ( $membership->name );
                                            }
                                        } 
                                    ?>
                                </td>
                                <td>
                                    <?php 
                                        if( $request->payment_option == '1' ){
                                            echo ( 'Pago en Línea' );
                                        }elseif( $request->payment_option == '2' ){
                                            echo ( 'Pago en Oficina' );
                                        }else{
                                            echo( 'Indeterminado' );
                                        }
                                    ?>
                                </td>
                                <td><?php echo( $request->expiration_date ); ?></td>
                                <td><?php $state = $request->state == 1 ? "Activo": "Inactivo"; echo $state; ?></td>
                                <td style="text-align: center;"><a href="<?php echo ( esc_url( admin_url( 'admin.php' ) ) ); ?>?page=editar_solicitud&id=<?php echo( $request->id ); ?>">Ver</a></td>
                            </tr>
                            <?php
                        }
                    }
                }else{
                    ?>
                    <tr><td colspan="6" style="text-align: center; font-size: 1.2em; font-weight: bold;">No hay registros para mostrar</td></tr>
                    <?php
                }
            ?>
        </tbody>   
    </table>    
</div>