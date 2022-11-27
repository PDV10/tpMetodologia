<?php

require_once('view/loginView.php');
require_once('model/userModel.php');

class LoginController
{
    private $model;
    private $view;
    private $authHelper;


    function __construct()
    {
        $this->view = new LoginView();
        $this->model = new UserModel();
        $this->authHelper = new AuthHelper();
    }

    function showLogin()
    {
        //como checkear que un usuario logueado no acceda al login
        $this->view->showLogin();
    }

    function logOut()
    {
        $this->authHelper->logout();
    }

    function login()
    {
        if (!empty($_POST['user']) && !empty($_POST['password'])) {
            $user = $_POST['user'];
            $password = $_POST['password'];

            $user = $this->model->getUser($user);

            if ($user && ($password == $user->pass)) {
                $this->authHelper->login($user);
                header("Location: " . turnos);
            } else {
                $this->view->showError("Usuario o contraseña inválida");
            }
        } else {
            echo ('error');
        }
    }
}
