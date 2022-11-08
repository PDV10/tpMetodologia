{include file="templates/showHeader.tpl"}
{include file="templates/showNav.tpl"}

<h2 class="text-center mb-5">Panel Principal de Medico</h2>
<div class="col-5 d-flex flex-row mb-5 container-sm text-center shadow-lg colorFondo rounded-end">
    <div class="container">
        <h3>Medico</h3>
        <h4>Dr. Carlos Salvador Bilardo</h4>
        <p>Medico Mundialista</p>
    </div>
    <div class="container">
        <img src="assets/bilardooooo.jpg" alt="salvador bilardo" width=100px class="pt-2 rounded-circle">
    </div>
</div>
<div class="container">
    <h5>Turnos: </h5>
    <form action="searchTurns">
        <label for="">Filtrar Turnos</label>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="parteDelDia" id="flexRadioDefault1">
            <label class="form-check-label" for="flexRadioDefault1">
                Mañana
            </label>
            <input value="m" class="form-check-input" type="radio" name="parteDelDia" id="flexRadioDefault1">
        </div>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="parteDelDia" id="flexRadioDefault1">
            <label class="form-check-label" for="flexRadioDefault1">
                Tarde
            </label>
            <input value="t"  class="form-check-input" type="radio" name="parteDelDia" id="flexRadioDefault1">
        </div>
        <div>
            <label for="">Desde</label>
            <input type="date" name="inputDesde" id="">

            <label for="">Hasta</label>
            <input type="date" name="inputHasta" id="">
            <button class="btn btn-secondary btn-sm" type="submit" href='sendFilter'>
                Buscar
                <i class="bi bi-search"></i>
            </button>
        </div>
    </form>
    <table class="table table-hover mt-3">
        <thead>
            <tr>
                <th scope="col">Hora</th>
                <th scope="col">Fecha</th>
                <th scope="col">Paciente</th>
            </tr>
        </thead>
        <tbody>
   
            {foreach from=$turns item=$turn}
                <tr>
                    <td>{$turn->hora}</td>
                    <td>{$turn->dia}</td>
                    <td>{$turn->nombre} {$turn->apellido}</td>
                </tr>
            {/foreach}

        </tbody>
    </table>
</div>

{include file="templates/showFooter.tpl"}