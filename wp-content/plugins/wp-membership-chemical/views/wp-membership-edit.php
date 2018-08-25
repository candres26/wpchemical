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

        $membership_tag = $wpdb->get_results(
            "
            SELECT * 
            FROM qm_membership_tag 
            WHERE membership_id= $id
            "
        );

        $membership_doc = $wpdb->get_results(
            "
            SELECT * 
            FROM qm_membership_document 
            WHERE membership_id=$id"
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
                        <input id="documentos-id" type="text" name="documentos-id"/>
                        <input id="tags-id" type="text" name="tags-id"/>
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
                <?php
                    foreach ($membership_doc as $memdoc) {
                        foreach ($documents as $doc) {
                            if( $memdoc->document_id == $doc->id ) {
                                ?>
                                <tr><td><?php echo( $doc->name ) ?></td><td>X</td></tr>
                                <?php
                            }
                        }
                    }
                ?>
                </tbody>
            </table>
            <br/>
            <select id="tags-ref">
                <option value="">Seleccione...</option>
                <?php
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
                <?php
                    foreach ($membership_tag as $memtag) {
                        foreach ($tags as $tagmem) {
                            if( $memtag->tag_id == $tagmem->id ) {
                                ?>
                                <tr><td><?php echo( $tagmem->name ) ?></td><td>X</td></tr>
                                <?php
                            }
                        }
                    }
                ?>
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
var state = "<?php echo( $membership->state ); ?>";

jQuery(document).ready(function(){
    //jQuery('#id-field').val(name);
    jQuery("input[name='name']").val(name);
    jQuery("textarea[name='description']").val(description);
    jQuery("input[name='price']").val(price);
    jQuery("input[name='term']").val(term);


    if(state == 1){
        jQuery("select[name='state'] option[value="+ state +"]").attr("selected", true);
    }else{
        jQuery("select[name='state'] option[value="+ state +"]").attr("selected", true);
    }
});

function add_document(){
    if( jQuery( '#documentos-id' ).val() != '' )
        var did = jQuery( '#documentos-id' ).val().split(';');
    else
        did = [];

    if( jQuery('#documentos-ref').val() != '' && did.indexOf( jQuery('#documentos-ref').val() ) == -1 ){
        var dname = jQuery('#documentos-ref').find(':selected').text();
        jQuery( '#documentos' ).append( '<tr><td style="display: none; ">'+ jQuery('#documentos-ref').val() +'</td><td>' + dname  + '</td><td onclick="rem_document( this );">X</td></tr>' );
        did.push( jQuery('#documentos-ref').val() );
        jQuery( '#documentos-id' ).val(did.join(';') );
    }
}

function rem_document( cell ){
    var parent =  cell.parentNode;
    var did = jQuery( '#documentos-id' ).val().split(';');
    var ind = did.indexOf( parent.cells[0].innerHTML );
    did.splice( ind, 1 );
    jQuery( '#documentos-id' ).val(did.join(';') );
    parent.remove();
}


function add_tag(){
    if( jQuery( '#tags-id' ).val() != '' )
        var tid = jQuery( '#tags-id' ).val().split(';');
    else
        tid = [];

    if( jQuery('#tags-ref').val() != '' && tid.indexOf( jQuery('#tags-ref').val() ) == -1 ){
        var dname = jQuery('#tags-ref').find(':selected').text();
        jQuery( '#tags' ).append( '<tr><td style="display: none; ">'+ jQuery('#tags-ref').val() +'</td><td>' + dname  + '</td><td onclick="rem_tag( this );">X</td></tr>' );
        tid.push( jQuery('#tags-ref').val() );
        jQuery( '#tags-id' ).val(tid.join(';') );
    }
}

function rem_tag( cell ){
    var parent =  cell.parentNode;
    var tid = jQuery( '#tags-id' ).val().split(';');
    var ind = tid.indexOf( parent.cells[0].innerHTML );
    tid.splice( ind, 1 );
    jQuery( '#tags-id' ).val(tid.join(';') );
    parent.remove();
}

</script>