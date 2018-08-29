<?php 
/*
Template Name: Pagina de Registro
 */
get_header( ); ?>

<div class="container">
	<div class="col-md-2 col-lg-2 col-sm-2">
		<?php dynamic_sidebar('barra'); ?>
	</div>
	<div class="col-md-12 col-lg-12 col-sm-12">
		<p class="font-oswald-40px color-azul text-center" ><?php the_title(); ?></p>
		<p>&nbsp;</p>
		<form>
			<div class="form-group">
				<label for="name">Nombres</label>
				<input type="text" class="form-control" name="name" aria-describedby="nameHelp" placeholder="Escriba sus nombres">
				<!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
			</div>
			<div class="form-group">
				<label for="last-name">Apellidos</label>
				<input type="text" class="form-control" name="last-name" aria-describedby="last-nameHelp" placeholder="Escriba sus apellidos">
			</div>
			<div class="form-group">
				<label for="email">Email</label>
				<input type="email" class="form-control" name="email" aria-describedby="emailHelp" placeholder="Escriba su email">
				<!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Password</label>
				<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
			</div>
			<div class="form-check">
				<input type="checkbox" class="form-check-input" id="exampleCheck1">
				<label class="form-check-label" for="exampleCheck1">Check me out</label>
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
		<p>&nbsp;</p>
	</div>
</div>

<?php get_footer(); ?>