<?php
    global $wpdb;
?>
<div class="col-md-12 col-lg-12 col-sm-12" style="margin-top: 4em; margin-bottom: 4em;">
    <form action="<?php $_SERVER['REQUEST_URI']; ?>" method="post" id="form-register">
        <div class="form-group">
            <label for="fname" class="control-label font20px color-azul">Nombres</label>
            <input type="text" class="form-control" name="fname" value="<?php ( isset( $_POST['fname']) ? $fname : null ) ?>">
        </div>
        <div class="form-group">
            <label for="lname" class="control-label font20px color-azul">Apellidos</label>
            <input type="text" class="form-control" name="lname" value="<?php ( isset( $_POST['lname']) ? $lname : null ) ?>">
        </div>
        <div class="form-group">
            <label for="email" class="control-label font20px color-azul">Email</label>
            <input type="text" class="form-control" name="email" value="<?php ( isset( $_POST['email']) ? $email : null ) ?>">
        </div>
        <div class="form-group">
            <label for="paytype" class="control-label font20px color-azul">Tipo de Pago</label>
            <select class="form-control" id="paytype" name="paytype">
                <option value="#">Seleccione...</option>
                <option value="1">Pago en Linea</option>
                <option value="2">Pago en Oficina</option>
            </select>
        </div>
        <div class="form-group">
            <label for="membership-type" class="control-label font20px color-azul">Tipo de Membresía</label>
            <select class="form-control" id="membership-type" name="membership-type">
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
        <div id="panel-description" class="panel panel-default" style="display: none;">
        </div>
        <textarea name="documentsContent" id="documentsContent" cols="30" rows="10" style="display: none"></textarea>
        <p>&nbsp;</p>
    </form>
    <div id="docs-container">
    </div>
    <button type="button" onclick="sendForm();" class="btn btn-primary" name="submit">Registrar</button>
</div>
<script type="text/javascript">
var $documentsObject = {};
window.onload = readyGo;
function readyGo(){
    jQuery("#membership-type").on("change", function(){
        var idMember = jQuery("#membership-type option:selected").val();
        $documentsObject = {};
        var data = getDocuments( idMember );
    });
}

function readyDocuments( data )
{
    var fields = data.split(",");
    var code = "";
    var description = "";

    for( var i = 1; i < fields.length; i++ )
    {
        var content = fields[i].split(":");
        code = code + '<div class="custom-file"><input type="file" class="form-control-file" name="doc_'+ content[0] +'" id="doc_'+ content[0] +'" onchange="loadFile(event);"><label for="doc_'+ content[0] +'">'+ content[1] +'</label></div>';
    }
    jQuery('#docs-container').html( code );
    var contentDesc = fields[0].split(":");
    description = '<!--<div class="panel-heading">'+ contentDesc[0] +'</div>--><div class="panel-body"><p>'+ contentDesc[1] +'</p></div>'
    jQuery('#panel-description').css('display', 'block');
    jQuery('#panel-description').html(description);

}

function loadFile(event) {
    var id = event.target.id;     
    var filesSelected = document.getElementById( id ).files;     
    if (filesSelected.length > 0)
    {         
        var fileToLoad = filesSelected[0];           
        var fileReader = new FileReader();           
        fileReader.onload = function( fileLoadedEvent ){
            $documentsObject[''+ id] = fileLoadedEvent.target.result;
            console.log( $documentsObject ); 
        };           
        
        fileReader.readAsDataURL(fileToLoad);     
        
    } 
}


function sendForm(){
    jQuery("#documentsContent").val(JSON.stringify($documentsObject));
    jQuery("#form-register").submit();
}
</script>