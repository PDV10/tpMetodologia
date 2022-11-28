<?php
require_once('view/errorView.php');

require_once('view/loginView.php');
require_once('model/userModel.php');

class LoginController
{
    private $model;
    private $view;
    private $errorView;
    private $authHelper;


    function __construct()
    {
        $this->view = new LoginView();
        $this->model = new UserModel();
        $this->authHelper = new AuthHelper();
        $this->errorView = new ErrorView();
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
                if ($user->tipo == MEDICO) {
                    header("Location: " . turnos);
                } else if ($user->tipo == SECRETARIA) {
                    // ACA IRIA LA FUNCIONALIDAD DE LISTAR
                    header("Location: " . BASE_URL . "turnos-medico/1");
                }
            } else {
                $this->errorView->showError("Usuario o contraseña inválida", '');
            }
        } else {
            echo ('error');
        }
    }
}
