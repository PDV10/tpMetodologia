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
        }
        /*  DESCOMENTAR CUANDO ESTE LISTA LA TPM-103
            else if ($_SESSION['USER_ROL'] > $rol) {
            $this->errorView->showError("Usted no tiene permisos suficientes");
            die();
        }*/
    }

    public function login($user)
    {

        $_SESSION['USER_ID'] = $user->id_medico;
        $_SESSION['USER_EMAIL'] = $user->user;

        /** $$ CUANDO SE ESTABILICE LA BBDD (TPM-103)
         *      $_SESSION['USER_ROL'] = $user->rol;
         */
    }

    function logout()
    {
        session_destroy();
        header("Location: " . BASE_URL);
    }
}
