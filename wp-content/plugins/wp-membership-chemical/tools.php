<?php

function get_view( $name ){
    $url = dirname( __FILE__ ) . '/views/'. $name;
    $codigo = fopen( $url, 'r' );
    $buffer = fread( $codigo, filesize( $url ) );
    fclose( $codigo );
    return $buffer;
}