<div class="wrap">
    <?php
        if(isset($_GET['status']) && $_GET['status'] == 0 ){
            echo '<div class="notice notice-success is-dismissible"><p>Tag guardado correctamente</p></div>';
        }
    ?>
    <h2>Agregar Nueva Etiqueta</h2>
    <form class="form-wpchem" action="<?php esc_url( admin_url( 'admin-post.php' ) ); ?>" method="post">
        <input type="hidden" name="action" value="create_tag_own">
        <div class="form-group">
            <label for="name">Nombre:&nbsp;</label>
            <input type="text" name="name" placeholder="Nombre de la Etiqueta" required>
        </div>
        <div class="form-group">
            <label for="description">Descripción:&nbsp;</label>
            <textarea name="description" id="" cols="30" rows="10" placeholder="Descripción de la Etiqueta" required></textarea>
        </div>
        <div>
            <p class="submit">
                <input class="button button-primary" type="submit" value="Guardar Cambios">
            </p>
        </div>  
    </form>
</div>