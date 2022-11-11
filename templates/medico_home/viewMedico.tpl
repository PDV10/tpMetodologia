{include file="templates/showHeader.tpl"}
{include file="templates/showNav.tpl"}

<h2 class="text-center mb-5 mt-3">Panel Principal de Medico</h2>
<div class="col-5 d-flex flex-row mb-5 container-sm text-center shadow-lg colorFondo rounded-end">
    <div class="container p-2">
        <h3>Medico</h3>
        <h4>Dr. {$user->nombre} {$user->apellido}</h4>
        <p>{$user->especialidad}</p>
    </div>
    <div class="container">
        <img src="assets/img/Medico.jpg" alt="salvador bilardo" width=100px class="pt-2 rounded-circle">
    </div>
</div>
<div class="container mb-5 mt-5">
    
    <form action="searchTurns" class="d-flex flex-column justify-content-center shadow-lg rounded-end p-2 mb-3">
        <h4 class="p-2">Filtrar Turnos Por:</h4>
        <div class="d-flex gap-3 p-2 align-items-center justify-content-center ">
    
            <div class="form-check">
                {* porque hay dos inputs??? *}
                <input class="form-check-input" type="radio" name="parteDelDia" >
                <label class="form-check-label" for="flexRadioDefault1">
                    Mañana
                </label>
                <input value="m" class="form-check-input" type="radio" name="parteDelDia" >
            </div>
            <div class="form-check">
                {* porque hay dos inputs??? *}
                <input class="form-check-input" type="radio" name="parteDelDia" >
                <label class="form-check-label" for="flexRadioDefault1">
                    Tarde
                </label>
                <input value="t"  class="form-check-input" type="radio" name="parteDelDia" >
            </div>
            <div class="d-flex gap-3 align-items-center">
                <label for="">Desde</label>
                <input type="date" name="inputDesde" >

                <label for="">Hasta</label>
                <input type="date" name="inputHasta" >
                
            </div>
            
        </div>
        <button class="btn btn-secondary btn-sm mt-2" type="submit" href='sendFilter'>
            Buscar
            <i class="bi bi-search"></i>
        </button>
    </form>
    <h3 class="mt-5 p-2">Turnos: </h3>
    {if {$turns|count} > 0}
          <table class="table table-hover mb-5 text-center">
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
    {else}
        <div class="card text-center text-white bg-dark mb-5 mt-5">
            <div class="card-header">
                <h2> Dr. {$user->nombre} {$user->apellido}</h2>
            </div>
            <div class="card-body">
                <h4 class="error mb-5">Por ahora no tiene turnos asignados.</h4>
                   <footer class="blockquote-footer"> <cite title="Source Title">Que tenga un gran dia.</cite></footer>
            </div>
        </div>
    {/if}
  
</div>

{include file="templates/showFooter.tpl"}