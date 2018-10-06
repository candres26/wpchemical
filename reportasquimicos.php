<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" type="text/css" href="reportstylepr.css" media="print">
        <link rel="stylesheet" type="text/css" href="reportstylesc.css" media="screen">
        <title>Document</title>
    </head>
    <body>
    <?php
    
    
    function report($data){
        $table = "
        <table class='tableWrap'>
        <tbody>
        <tr>
        <td rowspan='3' width='20%'><img src='asquim.png' alt='Logo Asquimicos' width='200'></td>
        <td rowspan='3' colspan='2' align='center'>contacto@asquimco.org - Bogotá, Colombia</td>
        <td>Nit. ". $data['nit'] ."</td>
        </tr>
        <tr>
        <td>No. 2232111</td>
        </tr>
        <tr>
        <td>Fecha ". date('Y-m-d') ."</td>
        </tr>
        <tr>
        <td><strong>Nombre</strong></td>
        <td width='35%'>". $data['name'] ."</td>
        <td width='20%'><strong>Documento</strong></td>
        <td>". $data['documento'] ."</td>
        </tr>
        <tr>
        <td><strong>Apellidos</strong></td>
        <td>". $data['lname'] ."</td>
        <td><strong>Dirección</strong></td>
        <td></td>
        </tr>
        <tr>
        <td><strong>La suma de</strong></td>
        <td colspan='3'></td>
        </tr>
        <tr>
        <td colspan='4' style='border-bottom: hidden;'><strong>Por concepto de</strong></td>
        </tr>
        <tr>
        <td height='180px' colspan='4'></td>
        </tr>
        <tr>
        <td rowspan='3' colspan='2'></td>
        <td><strong>SubTotal</strong></td>
        <td></td>
        </tr>
        <tr>
        <td><strong>IVA</strong></td>
        <td></td>
        </tr>
        <tr>
        <td><strong>Total Recibido</strong></td>
        <td></td>
        </tr>
        </tbody>
        </table>";
        return $table;
    }
    
    $dat = array("name" => "andres", "lname" => "reyes", "documento" => "11205767", "nit" => "122322233-0",);
    $tab = report($dat);
    echo $tab;
    ?>
</body>
</html>
