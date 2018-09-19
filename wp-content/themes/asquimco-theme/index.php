<?php get_header( ); ?>

<!---- transparencia --->
<?php dynamic_sidebar('transparencia'); ?>
<!---- fin transparencia --->

<!-- Content -->
  <!-- carousel -->
  <div class="div-carousel col-md-12 col-lg-12 col-sm-12">
    <div class="col-md-8 col-lg-8 col-sm-12 div-paddings-0px">
      <div class="row carousel-holder">
          <div class="col-md-12">
            <div style="display: none;">
              <?php
              $slides = array(); 
              $args = array( 'category_name' => 'Noticias,noticias', 'posts_per_page'=>5 );
              $slider_query = new WP_Query( $args );
              if ( $slider_query->have_posts() ) {
                  while ( $slider_query->have_posts() ) {
                      $slider_query->the_post();
                      if(has_post_thumbnail()){
                          $temp = array();
                          $thumb_id = get_post_thumbnail_id();
                          $thumb_url_array = wp_get_attachment_image_src($thumb_id, 'full', true);
                          $thumb_url = $thumb_url_array[0];
                          $temp['title'] = get_the_title();
                          $temp['excerpt'] = get_the_excerpt();
                          $temp['link'] = get_the_permalink();
                          $temp['image'] = $thumb_url;
                          $slides[] = $temp;
                      }
                  }
              } 
              wp_reset_postdata();
              ?>
            </div>
            <?php if(count($slides) > 0) { ?>
              <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                  <ol class="carousel-indicators">
                      <?php for($i=0;$i<count($slides);$i++) { ?>
                      <li data-target="#carousel-example-generic" data-slide-to="<?php echo $i ?>" <?php if($i==0) { ?>class="active"<?php } ?>></li>
                      <?php } ?>
                  </ol>
                  <div class="carousel-inner">
                    <?php $i=0; foreach($slides as $slide) { extract($slide); ?>
                    <div class="item <?php if($i == 0) { ?>active<?php } ?>" style="height: 450px;">
                        <img class="slide-image img-responsive" src="<?php echo $image ?>" alt="<?php esc_attr($title); ?>" width="100%">
                        <div class="carousel-caption div-carousel-caption"><h3 class="div-carousel-caption-title"><?php echo $title; ?></h3><p><?php echo $excerpt; ?></p><a href="<?php echo $link; ?>" class="btn btn-azul btn-lg">Ver Más</a>
                          </div>
                    </div>
                    <?php $i++; } ?>
                    </div>
                    
                  
                  <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev" >
                      <span class="glyphicon glyphicon-chevron-left div-carousel-control" style="font-size: 35px;transform: scaleY(2.2);"></span>
                  </a>
                  <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                      <span class="glyphicon glyphicon-chevron-right div-carousel-control" style="font-size: 35px;transform: scaleY(2.2);"></span>
                  </a>
                  <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                      <span class="glyphicon glyphicon-chevron-left div-carousel-control" style="font-size: 35px;transform: scaleY(2.2);"></span>
                  </a>
                  <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                      <span class="glyphicon glyphicon-chevron-right div-carousel-control" style="font-size: 35px;transform: scaleY(2.2);"></span>
                  </a>
              </div>
              <?php } ?>
            </div>
        </div>
      </div>
      <div class="col-sm-12 col-lg-4 col-md-4 div-paddings-0px">
          <div class="table-responsive" style="height: 450px;overflow: hidden;">
            <table id="calendario" class="table">

              <caption></caption>
              
                <thead class="col-sm-12 col-lg-12 col-md-12 fondo-calendar">

                  <tr>

                    <th><p>Lun</p></th><th><p>Mar</p></th><th><p>Mie</p></th><th><p>Jue</p></th><th><p>Vie</p></th><th><p>Sab</p></th><th><p>Dom</p></th>

                  </tr>

                </thead>

                <tbody class="col-sm-12 col-lg-12 col-md-12 fondo-calendar">

                </tbody>
            </table>
          </div>

      </div>
    </div>

    <!-- noticias -->
    <div class="noticias-box col-md-12 col-lg-12 col-sm-12">
      <div class="div-paddings-0px col-md-12 col-lg-12 col-sm-12">
        <div class="box1 col-md-2 col-lg-2 col-sm-6">
          <p><i class="fa fa-newspaper-o"></i> Publicaciones</p>
        </div>
        <div class="col-md-7 col-lg-7 col-sm-0">
          <br>
        </div>
        <div class="col-md-2 col-lg-2 col-sm-6 text-right">
          <div class="font20px" ><span style="font-family: 'oswald'; color: #0076a6;">Ver</span> <?php the_category(' '); ?></div>
        </div>
      </div>
      <div class="box2 col-md-12 col-lg-12 col-sm-12"> 

          <?php 
          // the query
          //$the_query = new WP_Query( array( 'category_name' => 'Noticias,noticias', 'posts_per_page'=>4 ) ); 
          
          // WP_Query arguments
          $args = array(
            'post_type'              => array( 'post' ),
            'posts_per_page'         => '3',
          );

          // The Query
          $the_query = new WP_Query( $args );
          ?>

          <?php if ( $the_query->have_posts() ) : ?>

            <!-- pagination here -->

            <!-- the loop -->
            <?php while ( $the_query->have_posts() ) : $the_query->the_post(); ?>

              <div class="div-paddings-0px col-md-4">
                <div class="div-paddings-0px col-md-5">
                  <a href="<?php the_permalink(); ?>">
                    <?php if ( has_post_thumbnail() ) {
                        the_post_thumbnail( 
                          'post-thumbnails', array( 'class' => 'img-responsive box-shadow', 'style'=>'height: 150px;' )  
                        );
                    } ?></a>
                </div>
                <div class="col-md-7">
                  <a class="font20px color-azul" href="<?php the_permalink(); ?>"><?php the_title(); ?></a>
                  <p><?php the_excerpt(); ?></p>
                  <p class="color-azul"><?php echo get_the_date(); ?> / <?php the_category(', '); ?></p>
                </div>
              </div>

            <?php endwhile; ?>
            <!-- end of the loop -->

            <!-- pagination here -->

            <?php wp_reset_postdata(); ?>

          <?php else : ?>
            <p><?php esc_html_e( 'No hay noticias aún.' ); ?></p>
          <?php endif; ?>

      </div> <!-- /container -->
    </div>

    <!-- box 2 -->
    <div class="noticias-box col-md-12 col-lg-12 col-sm-12">
      
      <!-- eventos -->
      <div class="div-paddings-0px eventos-box col-md-4 col-lg-4 col-sm-12">
        <div class="box3 col-md-12 col-lg-12 col-sm-12">
          <p><i class="fa fa fa-calendar"></i> Eventos</p>
        </div>

        <?php dynamic_sidebar('evento'); ?>

      </div>

      <!-- actividades -->
      <div class="div-paddings-0px eventos2-box col-md-4 col-lg-4 col-sm-12">
        <div class="box4 col-md-12 col-lg-12 col-sm-12">
          <p><i class="fa fa-calendar-check-o"></i> Actividades</p>
        </div>

        <?php dynamic_sidebar('actividad'); ?>

      </div>

      <!-- reconocimientos -->
      <div class="div-paddings-0px eventos-box col-md-4 col-lg-4 col-sm-12">
        <div class="box5 col-md-12 col-lg-12 col-sm-12">
          <p><i class="fa fa-star"></i> Reconocimientos</p>
        </div>

        <?php 
          // the query
          $the_query = new WP_Query( array( 'category_name' => 'Reconocimientos,reconocimientos' ) ); ?>

          <?php if ( $the_query->have_posts() ) : ?>

            <!-- pagination here -->

            <!-- the loop -->
            <?php while ( $the_query->have_posts() ) : $the_query->the_post(); ?>

              <div class="div-paddings-box col-md-12 col-lg-12 col-sm-12">

                <div class="div-paddings-0px col-md-4 col-lg-4 col-sm-4 "><br></div>
                <div class="div-paddings-0px col-md-4 col-lg-4 col-sm-4">
                    <a href="#">
                      <?php if ( has_post_thumbnail() ) {
                          the_post_thumbnail( 
                            'post-thumbnails', array( 'class' => 'img-responsive center-block' )  
                          );
                      } ?>                        
                      </a>
                  </div>
                  <div class="div-paddings-0px col-md-4 col-lg-4 col-sm-4"><br></div>

                  <div class="col-md-12 col-lg-12 col-sm-12 text-center">
                    <span class="font20px font-reconocimiento"><?php the_title(); ?></span>
                    <span><?php the_excerpt(); ?></span>
                    <small class="color-morado "><?php echo get_the_date(); ?></small>
                  </div>
              </div>

            <?php endwhile; ?>
            <!-- end of the loop -->

            <!-- pagination here -->

            <?php wp_reset_postdata(); ?>

          <?php else : ?>
            <div class="div-paddings-box col-md-12 col-lg-12 col-sm-12">
              <p class="margin-bottom0px font20px"><?php esc_html_e( 'No hay reconocimientos todavia.' ); ?></p>
            </div>
          <?php endif; ?>

      </div>

    </div>

    <?php get_footer(); ?>


