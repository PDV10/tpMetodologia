<?php

require_once('view/errorView.php');

class AuthHelper
{
    private $errorView;

    function __construct()
    {
        if (session_status() != PHP_SESSION_ACTIVE) {
            session_start();
        }
        $this->errorView = new ErrorView();
    }

    /**
     * -- Parametro de entrada $rol refiere a la
     *     jerarquia de roles globales instaciados en el router.php
     * -- Ejecutable en los controladores
     */
    public function checkLoggedIn($rol)
    {
        if (empty($_SESSION['USER_ID'])) {
            header("Location: " . BASE_URL . 'profesionales');
            die();
        } else if ($_SESSION['USER_ROL'] != $rol) {
            if ($rol == MEDICO) {
                $this->errorView->showError("Usted no tiene permisos suficientes", "turnos");
            } else if ($rol == SECRETARIA) {
                //ACA TAMBIEN IRIA LA LISTA DE MEDICOS COMO PATH
                $this->errorView->showError("Usted no tiene permisos suficientes", "");
            }
            die();
        }
    }

    public function login($user)
    {

        $_SESSION['USER_ID'] = $user->id_usuario;
        $_SESSION['USER_EMAIL'] = $user->user;
        $_SESSION['USER_ROL'] = $user->tipo;
    }

    function logout()
    {
        session_destroy();
        header("Location: " . BASE_URL);
    }
}
