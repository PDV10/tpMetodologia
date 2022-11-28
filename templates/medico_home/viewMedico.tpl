{include file="templates/showHeader.tpl"}
{include file="templates/showNav.tpl"}

<h2 class="text-center mb-5">Panel Principal de Medico</h2>
<div class="col-5 d-flex flex-row mb-5 container-sm text-center shadow-lg colorFondo rounded-end">
    <div class="container">
        <h3>Medico</h3>
        <h4>Dr. {$user->nombre} {$user->apellido}</h4>
        <p>{$user->especialidad}</p>
    </div>
    <div class="container">
        {if $user->imagen != null }
            <img src="{{$user->imagen}}" alt="salvador bilardo" width=100px class="pt-2 rounded-circle">
        {else}
            <img src="assets/img/Medico.jpg" alt="salvador bilardo" width=100px class="pt-2 rounded-circle">
        {/if}
    </div>
</div>
<div class="container">
    <h5>Turnos: </h5>
    {if $smarty.session.USER_ROL == SECRETARIA }
        <form action="searchTurnsLikeSecretaria/{{$user->id_usuario}}">
    {else}
      <form action="searchTurns">
    {/if}
        <label for="">Filtrar Turnos</label>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="parteDelDia" id="flexRadioDefault1"> 
            <label class="form-check-label" for="flexRadioDefault1">
                Mañana
            </label>
            <input value="m" class="form-check-input" type="radio" name="parteDelDia" id="flexRadioDefault1" checked>
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
    {if $button == true && $smarty.session.USER_ROL == SECRETARIA } 
         <a class="btn btn-dark" href="turnos-medico/{{$user->id_usuario}}"> Todos Los Turnos</a>
        {else if $button == true}
        <a class="btn btn-dark" href="turnos"> Todos Los Turnos</a>
    {/if} 
    {if {$turns|count} > 0}
          <table class="table table-hover mt-3">
        <thead>
            <tr>
                <th scope="col">Hora</th>
                <th scope="col">Fecha</th>
                <th scope="col">Paciente</th>
                {if $smarty.session.USER_ROL == SECRETARIA}
                <th scope="col"></th>
                {/if}
            </tr>
        </thead>
        <tbody>
            {foreach from=$turns item=$turn}
                <tr>
                    <td>{$turn->hora}</td>
                    <td>{$turn->dia}</td>
                    <td>{$turn->nombre} {$turn->apellido}</td>
                     {if $smarty.session.USER_ROL == SECRETARIA}
                    <td>
                    
                        <button class="btn btn-sm bg-danger m-2" data-bs-toggle="modal" data-bs-target="#modal1">
                        <i class="bi bi-trash3-fill"></i>
                        </button>
                        <div class="modal fade" id="modal1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Seguro que quieres eliminar el turno?</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    Si eliminas el turno, se eliminara permanentemente.
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <form action="eliminarTurno/">
                                        <input type="hidden" name="idMedic" value="{$turn->id_medico}" >
                                        <input type="hidden" name="idTurn" value="{$turn->id_turno}" >
                                        <input type="submit" value="Si, deseo eliminar turno" class="btn btn-primary">
                                    </form>
                                </div>
                                </div>
                            </div>
                        </div>
                        
                    </td>
                {/if}
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