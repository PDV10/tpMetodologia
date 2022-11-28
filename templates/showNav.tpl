<nav class="nav-var d-flex justify-content-between">
    {if $smarty.session.USER_ROL == MEDICO}
        <a class="p-2" href="{BASE_URL}turnos"><img src="{BASE_URL}/assets/img/logo_ligth.png" alt="logo" class="h-100"></a>
        {elseif $smarty.session.USER_ROL == SECRETARIA}
        <a class="p-2" href="{BASE_URL}listarMedicos"><img src="{BASE_URL}/assets/img/logo_ligth.png" alt="logo" class="h-100"></a>
    {/if}
   
    <a href="{BASE_URL}logOut" class="btn btn-dark btn-pr imary button-ligth me-3 d-flex justify-content-between btn-outline-light">Salir <ion-icon name="exit-outline" class="ms-1 mt-auto mb-auto"></ion-icon></a>
</nav>