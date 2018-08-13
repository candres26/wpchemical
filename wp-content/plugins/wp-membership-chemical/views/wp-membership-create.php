<div class="wrap">
    <h2>Agregar Nueva Membresía</h2>
    <form class="form-wpchem" action='' method="post">
        <div class="form-group">
            <label for="name">Nombre:&nbsp;</label>
            <input type="text" name="name" placeholder="Nombre de la Membresía" required>
        </div>
        <div class="form-group">
            <label for="description">Descripción:&nbsp;</label>
            <textarea name="description" id="" cols="30" rows="10" placeholder="Descripción de la Membresía" required></textarea>
        </div>
        <div class="form-group">
            <label for="price">Valor:&nbsp;</label>
            <input type="number" name="price" placeholder="0" required>
        </div>
        <div class="form-group">
            <label for="duration">Duración:&nbsp;</label>
            <input type="number" name="duration" placeholder="30" required>
        </div>
        <div>
            <p class="submit">
                <input class="button button-primary" type="submit" value="Guardar Cambios">
            </p>
        </div>   
    </form>
</div>