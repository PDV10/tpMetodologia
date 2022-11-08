<?php
/* internos */
require_once('model/medicModel.php');
require_once('view/medicView.php');
/* helper */
require_once('helpers/auth.helper.php');
/* externos */
require_once('model/medicModel.php');

class MedicController
{
    private $medicView;
    private $medicModel;
    private $authHelper;

    function __construct()
    {
        $this->medicView = new MedicView();
        $this->medicModel = new MedicModel();
        $this->authHelper = new AuthHelper();
    }

    function showHome()
    {
        $this->medicView->showHome();
    }


    function showViewMedic()
    {
        if (!empty($_SESSION['USER_ID'])) {

            $user = $this->medicModel->getUser($_SESSION['USER_EMAIL']);

            $turns = $this->medicModel->getTurns($user->id_medico);
            $this->medicView->showViewMedic($turns,$user);
        }
    }
    
    function showLogin()
    {
        $this->medicView->showLogin();
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

            $user = $this->medicModel->getUser($user);

            if ($user && ($password == $user->pass)) {
                $this->authHelper->login($user);
                header("Location: " . turnos);
            } else {
                $this->medicView->showError("Usuario o contraseña inválida");
            }
        } else {
            echo ('error');
        }
    }

    function showSearchTurns()
    {
        if (
            !empty($_GET["inputDesde"]) &&
            !empty($_GET["inputHasta"])  &&
            !empty($_GET["parteDelDia"])
        ) {

            $dateUntil = $_REQUEST['inputDesde'];
            $dateSince = $_REQUEST['inputHasta'];
            $partOfDay = $_REQUEST['parteDelDia'];

            if (!empty($_SESSION['USER_ID'])) {
                $id_user = $_SESSION['USER_ID'];

                $searchTurns = $this->medicModel->getSearchTurns($id_user, $dateUntil, $dateSince, $partOfDay);
                $user = $this->medicModel->getUser($_SESSION['USER_EMAIL']);

                $this->medicView->showViewMedic($searchTurns,$user);
            }
        } else {
            $this->medicView->showError("Error, CAMPOS INCOMPLETOS!");
        }
    }
}
