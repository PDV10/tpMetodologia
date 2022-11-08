{include file="templates/showHeader.tpl"}

<div class="container">
    <div class="w-50 d-flex login flex-column justify-content-around">
        <div>
            <div class="logo d-flex">
                <img src="{BASE_URL}/assets/img/logo.png" class="w-50 align-self-auto">
                <div  class="align-self-end">
                    <h2 class="letra_blanca w-100 ">Portal para Profecionales</h2>
                    <h1 class="p-1">TurnoFacil</h1>
                </div>
            </div>
            <div class="letra_blanca">
                <h2 class="fs-1">Accéde fácil y rápido a los mejores profesionales</h2>
            </div>
        </div>

        <div class="m-auto" >
            <form action="loginMedico" method="POST" class="d-flex flex-column">
                <div class="mb-3 ">
                    <input class="form-control text-center fs-3" aria-describedby="emailHelp" name="user" placeholder="ingresar usuario" >
                </div>
                <div class="mb-3">
                    <input type="password" class="form-control text-center fs-3" id="exampleInputPassword1" name="password" placeholder="ingresar contraseña" >
                </div>
                <button type="submit" class="btn btn-primary fs-3">Entrar</button>
            </form>
        </div>
    </div>
    
</div>