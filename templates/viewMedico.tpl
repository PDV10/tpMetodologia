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
    <form action="GET">
        <label for="">Filtrar Turnos</label>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
            <label class="form-check-label" for="flexRadioDefault1">
                Mañana
            </label>
            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
        </div>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
            <label class="form-check-label" for="flexRadioDefault1">
                Tarde
            </label>
            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
        </div>
        <div>
            <label for="">Desde</label>
            <input type="date" name="inputDesde" id="">

            <label for="">Hasta</label>
            <input type="date" name="inputHasta" id="">
            <button class="btn btn-secondary btn-sm" type="submit">
                Buscar
                <i class="bi bi-search"></i>
            </button>
        </div>
    </form>
    <table class="table table-hover mt-3">
        <thead>
            <tr>
                <th scope="col">Desde</th>
                <th scope="col">Hasta</th>
                <th scope="col">Fecha</th>
                <th scope="col">Paciente</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>9:15</td>
                <td>9:30</td>
                <td>7/11/2022</td>
                <td>Agustin Urrutia</td>
            </tr>
            <tr>
                <td>10:30</td>
                <td>10:45</td>
                <td>Lautaro</td>
                <td>Gallo</td>
            </tr>
            <tr>
                <td>11:00</td>
                <td>11:20</td>
                <td>Patricio</td>
                <td>De Vicente</td>

            </tr>
        </tbody>
    </table>
</div>

{include file="templates/showFooter.tpl"}