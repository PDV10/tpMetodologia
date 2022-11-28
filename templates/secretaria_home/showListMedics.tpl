{include file="templates/showHeader.tpl"}
{include file="templates/showNav.tpl"}

<div class="container">
    <div class="d-flex flex-wrap flex-column justify-content-center align-items-center container-sm text-center ">
        {foreach from=$medicos item=$medico}
        <a href="turnos-medico/{{$medico->id_usuario}}" class="text-dark col-6 ">
        
        <div class="container d-flex colorFondo m-3 d-flex">
                    
                <div class=" container p-2 ">
                    <h3>Medico</h3>
                    <h4>Dr. {$medico->nombre} {$medico->apellido}</h4>
                    <p>{$medico->especialidad}</p>
                </div>
                <div class="container">
                    <img src="assets/img/Medico.jpg" alt="salvador bilardo" width=100px class="pt-2 rounded-circle">
                </div>
                
               
                
            </div>
        </a>
        {/foreach}
    </div>
</div>

{include file="templates/showFooter.tpl"}