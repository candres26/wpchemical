<div class="wrap">
    <h2>Agregar Nueva Membresía</h2>
    <form class="form-wpchem" action='' method="post">
        <input id="documentos-id" type="text" name="documentos-id"/>
        <input id="tags-id" type="text" name="tags-id"/>
        <div class="form-group">
            <label for="name">Nombre:&nbsp;</label>
            <input type="text" name="name" placeholder="Nombre de la Membresía" required>
        </div>
        <div class="form-group">
            <label for="description">Descripción:&nbsp;</label>
            <textarea name="description" id="" cols="30" rows="10" placeholder="Descripción de la Membresía" required></textarea>
        </div>
        <div class="form-group">
            <label for="price">Valor:&nbsp;</label>
            <input type="number" name="price" placeholder="0" required>
        </div>
        <div class="form-group">
            <label for="duration">Duración:&nbsp;</label>
            <input type="number" name="duration" placeholder="30" required>
        </div>
        <div>
            <p class="submit">
                <input class="button button-primary" type="submit" value="Guardar Cambios">
            </p>
        </div>   
    </form>
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
    <table border="1" width="100%">
        <thead>
            <th colspan="2">Documento</th>
        </thead>
        <tbody id="documentos">
        </tbody>
    </table>
    <input type="button" value="Agregar" onclick="add_document()"/>
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
    <table border="1" width="100%">
        <thead>
            <th colspan="2">Tag</th>
        </thead>
        <tbody id="tags">
        </tbody>
    </table>
    <input type="button" value="Agregar" onclick="add_tag()"/>
</div>

<script type="text/javascript">

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