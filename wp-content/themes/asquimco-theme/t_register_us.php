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
	<div class="col-md-8 col-lg-8 col-sm-12" style="margin-top: 4em; margin-bottom: 4em;">
		<p class="font-oswald-40px color-azul text-center" ><?php the_title(); ?></p>
		<p>&nbsp;</p>
		<form action="<?php echo admin_url( 'admin-post.php' ) ?>" method="post">
			<div class="form-group">
				<label for="name" class="control-label font20px color-azul">Nombres</label>
				<input type="text" class="form-control" name="name" aria-describedby="nameHelp" placeholder="Escriba sus nombres">
				<!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
			</div>
			<div class="form-group">
				<label for="last-name" class="control-label font20px color-azul">Apellidos</label>
				<input type="text" class="form-control" name="last-name" aria-describedby="last-nameHelp" placeholder="Escriba sus apellidos">
			</div>
			<div class="form-group">
				<label for="email" class="control-label font20px color-azul">Email</label>
				<input type="email" class="form-control" name="email" aria-describedby="emailHelp" placeholder="Escriba su email">
				<!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
			</div>
			<div class="form-group">
				<label for="type-membership" class="control-label font20px color-azul">Tipo de Pago</label>
				<select class="form-control" id="type-membership" name="type-membership">
					<option value="#">Seleccione...</option>
					<option value="1">Tarjeta de Crédito</option>
					<option value="2">Pago en Oficina</option>
				</select>
			</div>
			<div class="form-group">
				<label for="type-membership" class="control-label font20px color-azul">Tipo de Membresía</label>
				<select class="form-control" id="type-membership" name="type-membership">
					<option value="">Seleccione...</option>
					<?php
						global $wpdb;
						$memberships = $wpdb->get_results(
							"
							SELECT *
							FROM qm_membership
							"
						);

						if( $memberships ){
							foreach ($memberships as $membership) {
								?>
								<option value="<?php echo( $membership->id ); ?>"><?php echo( $membership->name ); ?></option>
								<?php
							}
						}
					?>
				</select>
			</div>
			<p>&nbsp;</p>
			<input type="hidden" name="action" value="process_form">
			<button type="submit" class="btn btn-primary">Enviar</button>
			&nbsp;
			<button type="button" class="btn btn-secondary" onclick="cancel();">Cancelar</button>
		</form>
		<p>&nbsp;</p>
	</div>
</div>
<script type="text/javascript">
function cancel(){
	alert("Cancelado");
}
</script>
<?php get_footer(); ?>