<div class="wrap">
    <?php
        if( isset($_GET['id']) && isset( $_GET['msjup'] ) && $_GET['msjup'] == 1 ){
            echo('<div class="notice notice-success is-dismissible"><p>Documento actualizado correctamente</p></div>');
            $id = ( $_GET['id'] );
        }elseif( isset($_GET['id']) ){
            $id = ( $_GET['id'] );
        }

        global $wpdb;

        $document = $wpdb->get_row(
            "
            SELECT * 
            FROM qm_document
            WHERE id = $id
            "
        );

    ?>
    <h2 class="wp-heading-inline">Editar Documento</h2>
    <hr class="wp-header-end"/>
    <div id="col-container" class="wp-clearfix">
        <div id="col-left">
            <div class="col-wrap">
                <div class="form-wrap">
                    <form action="<?php esc_url( admin_url( 'admin-post.php' ) ); ?>" method="post">
                        <input type="hidden" name="action" value="edit_document_own">
                        <input type="hidden" name="id_edit_doc" value="<?php echo( $id ); ?>"/>
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
                    <form id="form-delete" action="<?php esc_url( admin_url( 'admin-post.php' ) ); ?>" method="post">
                        <input type="hidden" name="action" value="delete_document_own"/>
                        <input type="hidden" name="id_delete_doc" value="<?php echo( $id ); ?>"/>
                        <div>
                            <p class="submit">
                                <input class="button button-secondary" type="button" value="Eliminar Documento" onclick="delete_reg(<?php echo( $_GET['id'] ) ?>)">
                            </p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div id="col-right">
            &nbsp;
        </div>
    </div>
</div>

<script type="text/javascript">

var name = "<?php echo( $document->name ); ?>";
var description = "<?php echo( $document->description ); ?>";

jQuery(document).ready(function(){
    //jQuery('#id-field').val(name);
    jQuery("input[name='name']").val(name);
    jQuery("textarea[name='description']").val(description);
});

function delete_reg(){
    if( confirm('¿Está seguro de eliminar este registro?') ){
        jQuery('#form-delete').submit()
    }
}

</script>