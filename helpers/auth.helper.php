<?php

class AuthHelper
{
    function __construct()
    {
        if (session_status() != PHP_SESSION_ACTIVE) {
            session_start();
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
