<?php
    global $wpdb;
    ?>
    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-top: 4em; margin-bottom: 4em;">
        <form action="<?php $_SERVER['REQUEST_URI']; ?>" method="post">
            <div class="form-group">
                <label for="username" class="control-label font20px color-azul">Usuario</label>
                <input type="text" id="name" class="form-control" name="username" value="<?php ( isset( $_POST['username'] ) ? $username : null ) ?>" placeholder="Escriba sus nombres">
            </div>
            <div class="form-group">
                <label for="password" class="control-label font20px color-azul">Contraseña</label>
                <input type="password" class="form-control" name="password" value="<?php ( isset( $_POST['password'] ) ? $password : null ); ?>">
            </div>
            <div class="form-group">
                <label for="fname" class="control-label font20px color-azul">Nombres</label>
                <input type="text" class="form-control" name="fname" value="<?php ( isset( $_POST['fname']) ? $first_name : null ) ?>">
            </div>
            <div class="form-group">
                <label for="lname" class="control-label font20px color-azul">Apellidos</label>
                <input type="text" class="form-control" name="lname" value="<?php ( isset( $_POST['lname']) ? $last_name : null ) ?>">
            </div>
            <div class="form-group">
                <label for="email" class="control-label font20px color-azul">Email</label>
                <input type="text" class="form-control" name="email" value="<?php ( isset( $_POST['email']) ? $email : null ) ?>">
            </div>
            <div class="form-group">
                <label for="payment-type" class="control-label font20px color-azul">Tipo de Pago</label>
                <select class="form-control" id="payment-type" name="payment-type">
                    <option value="#">Seleccione...</option>
                    <option value="1">Tarjeta de Crédito</option>
                    <option value="2">Pago en Oficina</option>
                </select>
            </div>
            <div class="form-group">
                <label for="type-membership" class="control-label font20px color-azul">Tipo de Membresía</label>
                <select class="form-control" id="type-membership" name="type-membership">
                    <option value="" selected="selected">Seleccione...</option>';
                    <?php
                        $memberships = $wpdb->get_results(
                            "
                            SELECT *
                            FROM qm_membership
                            "
                        );
                        if( $memberships ){
                            foreach ($memberships as $membership) {
                                echo '<option value="';
                                echo( $membership->id ); 
                                echo '">';
                                echo( $membership->name );
                                echo'</option>';
                            }
                        }
                    ?>
                </select>
            </div>
            <div id="docs-container">
            </div>
            <p>&nbsp;</p>
            <button type="button" class="btn btn-primary" name="submit">Registrar</button>
        </form>
    </div>

    <script type="text/javascript">
    window.onload = listo;
    function listo(){
        alert( jQuery("#name") );
    }
    /*jQuery( "#type-membership" ).on( "change",function(){
        var url = "datos_login.php";
        jQuery.ajax({                        
            type: "POST",                 
            url: url,                     
            data: $("#formulario").serialize(), 
            success: function(data)             
            {
                $('#resp').html(data);               
            }
        });
    });*/
    </script>