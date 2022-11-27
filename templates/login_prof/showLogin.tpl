{include file="templates/showHeader.tpl"}

<div class="container d-flex bgMedico">
    <div class="w-50 d-flex login flex-column justify-content-around">
        <div>
            <div class="logo d-flex ">
                <img src="{BASE_URL}/assets/img/logo.png" class="w-25 img-fluid">
                <div  class="d-flex flex-column ">
                    <h2 class="letra_blanca w-100 ">Portal para Profesionales</h2>
                    <h1 class="p-1">TurnoFacil</h1>
                </div>
            </div>
            <div class="letra_blanca">
                <h2 class="fs-1">Accéde fácil y rápido a los mejores profesionales</h2>
            </div>
        </div>

        <div class="m-auto" >
            <form action="logIn" method="POST" class="d-flex flex-column">
                <div class="mb-3 ">
                    <input required class="form-control text-center fs-3" aria-describedby="emailHelp" name="user" placeholder="ingresar usuario" >
                </div>
                <div class="mb-3">
                    <input required type="password" class="form-control text-center fs-3" id="exampleInputPassword1" name="password" placeholder="ingresar contraseña" >
                </div>
                <button type="submit" class="btn btn-primary fs-3">Entrar</button>
            </form>
        </div>
    </div>

    
</div>

{include file="templates/showFooter.tpl"}