<div class="wrap">
    <?php
        if(isset($_GET['status']) && $_GET['status'] == 0 ){
            echo '<div class="notice notice-success is-dismissible"><p>Documento guardado correctamente</p></div>';
        }
    ?>
    <h2 class="wp-heading-inline">Agregar Nuevo Documento</h2>
    <hr class="wp-header-end" />
    <div id="col-container" class="wp-clearfix">
        <div id="col-left">
            <div class="col-wrap">
                <div class="form-wrap">
                    <form action="<?php esc_url( admin_url( 'admin-post.php' ) ); ?>" method="post">
                        <input type="hidden" name="action" value="create_document_own">
                        <div class="form-field">
                            <label for="name">Nombre:&nbsp;</label>
                            <input type="text" name="name" placeholder="Nombre del documento" required>
                        </div>
                        <div class="form-field">
                            <label for="description">Descripción:&nbsp;</label>
                            <textarea name="description" id="" cols="30" rows="10" placeholder="Descripción del documento" required></textarea>
                        </div>
                        <div>
                            <p class="submit">
                                <input class="button button-primary" type="submit" value="Guardar Cambios">
                            </p>
                        </div>  
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>