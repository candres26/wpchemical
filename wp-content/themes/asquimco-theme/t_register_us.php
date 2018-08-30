<?php 
/*
Template Name: Pagina de Registro
 */
get_header( ); ?>

<div class="container">
	<?php
		if ( isset($_GET['sent']) ){
			if ( $_GET['sent'] == '1'){
				echo "<p> ✔ Solicitud enviada correctamente</p><br>";
			}
			else {
				echo "<p>  Hubo un error al enviar la solicitud</p><br>";
			}
		}
	?>
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
				<label for="type-membership">Tipo de Membresía</label>
				<select class="form-control" id="type-membership" name="type-membership">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>
			</div>
			<input type="hidden" name="action" value="process_form">
			<button type="submit" class="btn btn-primary">Enviar</button>
		</form>
		<p>&nbsp;</p>
	</div>
</div>

<?php get_footer(); ?>