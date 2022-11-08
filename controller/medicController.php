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
        //ESTO NO ANDA... ($_SESSION['USER_ID']) esta vacio... ves?
        if (!empty($_SESSION['USER_ID'])) {

            $id_user = $_SESSION['USER_ID'];

            $turns = $this->medicModel->getTurns($id_user);
            $this->medicView->showViewMedic($turns);
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

                $this->medicView->showViewMedic($searchTurns);
            }
        } else {
            $this->medicView->showError("Error, CAMPOS INCOMPLETOS!");
        }
    }
}
