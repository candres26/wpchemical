<div class="wrap">
    <?php
        if(isset($_GET['id']) && $_GET['id'] == 0 ){
            echo '<div class="notice notice-success is-dismissible"><p>Membresía actualizada correctamente</p></div>';
        }else{
            $id = ( $_GET['id'] );
        }

        global $wpdb;

        $membership = $wpdb->get_row(
            "
            SELECT * 
            FROM qm_membership
            WHERE id = $id
            "
        );
    ?>
    <h1 class="wp-heading-inline">Editar Membresía</h1>
    <hr class="wp-header-end"/>
    <div id="col-container" class="wp-clearfix">
        <div id="col-left">
            <div class="col-wrap">
                <div class="form-wrap">
                    <form action="<?php esc_url( admin_url( 'admin-post.php' ) ); ?>" method="post">
                        <input type="hidden" name="action" value="edit_membership_own">
                        <input id="documentos-id" type="hidden" name="documentos-id"/>
                        <input id="tags-id" type="hidden" name="tags-id"/>
                        <div class="form-field">
                            <label for="name">Nombre:&nbsp;</label>
                            <input id="id-field" type="text" name="name" placeholder="Nombre de la Membresía" required />
                        </div>
                        <div class="form-field">
                            <label for="description">Descripción:&nbsp;</label>
                            <textarea name="description" id="" cols="30" rows="10" required></textarea>
                        </div>
                        <div class="form-field">
                            <label for="price">Valor:&nbsp;</label>
                            <input type="number" name="price" placeholder="0" required/>
                        </div>
                        <div class="form-field">
                            <label for="duration">Duración:&nbsp;</label>
                            <input type="number" name="term" placeholder="30" required/>
                        </div>
                        <div class="form-field">
                            <label for="state">Estado:&nbsp;</label>
                            <select name="state">
                                <option value="1">Activo</option>
                                <option value="0">Inactivo</option>
                            </select>
                        </div>
                        <div>
                            <p class="submit">
                                <input class="button button-primary" type="submit" value="Guardar Cambios">
                            </p>
                        </div>
                        <div>
                            <p class="submit">
                                <input class="button button-secondary" type="submit" value="Eliminar Membresía">
                            </p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div id="col-right">
            <select id="documentos-ref">
                <option value="">Seleccione...</option>
                <?php
                    global $wpdb;

                    $documents = $wpdb->get_results(
                        "
                        SELECT id, name 
                        FROM qm_document
                        ORDER BY name
                        "
                    );
                    if( $documents ){
                        foreach( $documents as $document ){
                            ?>
                            <option value="<?php echo( $document->id ); ?>"><?php echo( $document->name ); ?></option>
                            <?php
                        }
                    }
                ?>
            </select>
            <input type="button" class="button" value="Agregar" onclick="add_document()"/>
            <table class="wp-list-table widefat fixed striped">
                <thead>
                    <th colspan="2">Documento</th>
                </thead>
                <tbody id="documentos">
                </tbody>
            </table>
            <br/>
            <select id="tags-ref">
                <option value="">Seleccione...</option>
                <?php
                    global $wpdb;

                    $tags = $wpdb->get_results(
                        "
                        SELECT id, name 
                        FROM qm_tag
                        ORDER BY name
                        "
                    );
                    if( $tags ){
                        foreach( $tags as $tag ){
                            ?>
                            <option value="<?php echo( $tag->id ); ?>"><?php echo( $tag->name ); ?></option>
                            <?php
                        }
                    }
                ?>
            </select>
            <input type="button" class="button" value="Agregar" onclick="add_tag()"/>
            <table class="wp-list-table widefat fixed striped">
                <thead>
                    <th colspan="2">Tag</th>
                </thead>
                <tbody id="tags">
                </tbody>
            </table>
        </div>
    </div>
</div>

<script type="text/javascript">

var name = "<?php echo( $membership->name ); ?>";
var description = "<?php echo( $membership->description ); ?>";
var price = "<?php echo( $membership->price ); ?>";
var term = "<?php echo( $membership->term ); ?>";

jQuery(document).ready(function(){
    //jQuery('#id-field').val(name);
    jQuery("input[name='name']").val(name);
    jQuery("textarea[name='description']").val(description);
    jQuery("input[name='price']").val(price);
    jQuery("input[name='term']").val(term);
});
</script>