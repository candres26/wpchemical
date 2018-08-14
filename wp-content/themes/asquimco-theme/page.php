<?php get_header( ); ?>

<div class="container">
	<br>
	<div class="col-md-12 col-lg-12 col-sm-12" style="margin-top:20px;margin-bottom:45px;">
		<?php if ( have_posts() ) : while ( have_posts() ) : the_post(); ?>
			<p class="font-oswald-40px color-azul text-center" ><?php the_title(); ?></p>
			<br>
			<p class="text-justify"><?php the_content(); ?></p>
		<?php endwhile; endif; ?>

	</div>
</div>

<?php get_footer(); ?>