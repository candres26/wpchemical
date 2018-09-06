function getDocuments( id ){
    jQuery.ajax({ 
        type: 'POST',
        url: documentObject.ajaxurl,
        data: {             
            'action': 'requestAjax',             
            'idSelected' : id         
        },         
        success: function(data) {
            readyDocuments( data );
        }
    });
}