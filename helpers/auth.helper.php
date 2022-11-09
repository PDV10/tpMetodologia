<?php

class AuthHelper
{
    function __construct()
    {
        if (session_status() != PHP_SESSION_ACTIVE) {
            session_start();
        }
    }

    public function checkLoggedIn()
    {
        /*
        -- Funcion encarga de checkear que el usuario este logueado
            para acceder a cierta funcionalidad...
        -- Ejecutable en los controladores
        xx en un futuro podria checkear ROLES
        */

        if (empty($_SESSION['USER_ID'])) {
            header("Location: " . BASE_URL . 'profesionales');
            die();
        }
    }

    public function login($user)
    {

        $_SESSION['USER_ID'] = $user->id_medico;
        $_SESSION['USER_EMAIL'] = $user->user;
    }

    function logout()
    {
        session_destroy();
        header("Location: " . BASE_URL);
    }
}
