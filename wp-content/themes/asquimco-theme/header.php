<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="angiespitia">
    <!-- <link rel="icon" href="http://getbootstrap.com/docs/3.3/favicon.ico"> -->

    <title> </title>

    <!-- Bootstrap core CSS -->
    <link href="<?php bloginfo('template_url'); ?>/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<?php bloginfo('template_url'); ?>/style.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="<?php bloginfo('template_url'); ?>/font-awesome/css/font-awesome.min.css" rel="stylesheet">

    <style type="text/css">
      .fondo1{
        background-image: url(<?php bloginfo('template_url'); ?>/img/hader-fondo.png);
      }
      .fondo2{
        background-image: url(<?php bloginfo('template_url'); ?>/img/hader-fondo2.png);
        background-position: right;
        background-repeat: no-repeat;
      }

      .fondo3{
        background-image: url(<?php bloginfo('template_url'); ?>/img/fondo-footer.png);
        background-size: 100%;
        background-color: #0076a6;
      }
    </style>

  </head>

  <body>

<!-- Header -->

  <div class="fondo1">
    <div class="fondo2">
      <div class="row div-header">
        <div class="col-md-5 col-sm-12 col-lg-5"><img src="<?php bloginfo('template_url'); ?>/img/logo-asquimco.png" alt="logo" /></div>
        <div class="col-md-7 col-lg-7 col-sm-12 text-right">
          <form class="navbar-form navbar-right">
            <div class="col-md-4 col-lg-4 col-sm-12"> 
              <div class="form-group">
                <input placeholder="Email" class="form-control " type="text">
              </div>
            </div>
            <div class="col-md-4 col-lg-4 col-sm-12 text-center">
              <div class="form-group">
                <input placeholder="Password" class="form-control" type="password">
                <br>
                <a href="#">¿ Olvidaste tu contraseña ?</a>
              </div>
            </div>
            <div class="col-md-4 col-lg-4 col-sm-12 text-center">
              <button type="submit" class="btn btn-azul"> Login </button>
              <br>
              <a href="#">¿ No tienes cuenta ?</a>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>


    <nav class="navbar nav-azul">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand border-right a-nav" href="https://asquimco.org/"><span class="glyphicon glyphicon-home"></span></a>
        </div>

        <?php wp_nav_menu(array(

          'theme_location' => 'menu',
          'container' => 'div',
          'container_class' => 'collapse navbar-collapse',
          'container_id' => 'navbar',
          'items_wrap' => '<ul class="nav navbar-nav">%3$s</ul>',
          'menu_class' => '',
          'walker' => new wp_bootstrap_navwalker()

        )); ?>

      </div>
    </nav>