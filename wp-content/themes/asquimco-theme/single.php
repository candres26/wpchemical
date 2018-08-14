<?php get_header( ); ?>

<div class="container">
	<br>

	<div class="col-md-2 col-lg-2 col-sm-2">
		<?php dynamic_sidebar('barra'); ?>
	</div>
	<div class="col-md-10 col-lg-10 col-sm-10">
		<?php if ( have_posts() ) : while ( have_posts() ) : the_post(); ?>

			<p class="font-oswald-40px color-azul text-center" ><?php the_title(); ?></p>
			<div class="col-md-12 col-lg-12 col-sm-12">
				<div class="col-md-3 col-lg-3 col-sm-3"><br></div>
				<div class="col-md-6 col-lg-6 col-sm-6">
					<?php if ( has_post_thumbnail() ) {
			            the_post_thumbnail( 
			              'post-thumbnails', array( 'class' => 'img-responsive' )  
			            );
			    	} ?>
			    	<br>
			    </div>
			    <div class="col-md-3 col-lg-3 col-sm-3"><br></div>	
		    </div>
		    
			<p class="color-azul"><?php echo get_the_date(); ?> / <?php the_category(', '); ?></p>
			<p class="text-justify"><?php the_content(); ?></p>
		<?php endwhile; endif; ?>
		<br>
	</div>
</div>

<?php get_footer(); ?>