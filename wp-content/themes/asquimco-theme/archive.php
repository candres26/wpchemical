<?php get_header( ); ?>

<div class="container">
	<br>
	<div class="col-md-12 col-lg-12 col-sm-12">
    <h2 class="font-oswald-40px color-azul text-center"><?php single_cat_title( $prefix = '', $display = true ); ?></h2>
    <h4 class="text-center">En esta sección podrá ver todos los articulos relacionados con <?php single_cat_title( $prefix = '', $display = true ); ?> </h4>
    <br><br>

		<?php 
          // the query
          $the_query = new WP_Query( array( 'category_name' => 'Noticias,noticias') ); ?>

          <?php if ( $the_query->have_posts() ) : ?>

            <!-- pagination here -->

            <!-- the loop -->
            <?php while ( $the_query->have_posts() ) : $the_query->the_post(); ?>

              <div class="col-md-6 col-lg-6 col-sm-12">
                <div class="col-md-4 col-lg-4 col-sm-4">
                  <a href="<?php the_permalink(); ?>">
                    <?php if ( has_post_thumbnail() ) {
                        the_post_thumbnail( 
                          'post-thumbnails', array( 'class' => 'img-responsive box-shadow' )  
                        );
                    } ?></a>
                </div>
                <div class="col-md-8 col-lg-8 col-sm-8">
                  <a class="font20px color-azul" href="<?php the_permalink(); ?>"><?php the_title(); ?></a>
                  <p><?php the_excerpt(); ?></p> 
                  <p class="color-azul"><?php echo get_the_date(); ?> / <?php the_category(', '); ?></p>
                                  
                </div>
                <div class="col-md-12 col-sm-12 col-lg-12"><hr></div>
              </div>

            <?php endwhile; ?>
            <!-- end of the loop -->

            <!-- pagination here -->

            <?php wp_reset_postdata(); ?>

          <?php else : ?>
            <p><?php esc_html_e( 'No hay noticias aún.' ); ?></p>
          <?php endif; ?>

          <div id="pagination">
                  <p><?php next_posts_link('<- Post Siguientes')?>
                  <?php previous_posts_link('Post Anteriores ->') ?></p>
          </div>

	</div>
  <br><br><br>
</div>

<?php get_footer(); ?>