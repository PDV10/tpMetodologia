<?php
/*Requerimientos internos */
require_once('model/medicModel.php');
require_once('view/medicView.php');
/* helpers */
require_once('helpers/auth.helper.php');
require_once('view/errorView.php');

class MedicController
{
    private $medicView;
    private $medicModel;
    private $authHelper;
    private $errorView;

    function __construct()
    {   
        $this->errorView = new ErrorView();
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
        //Barrera de login
        $this->authHelper->checkLoggedIn(MEDICO);

        $user = $this->medicModel->getUser($_SESSION['USER_EMAIL']);

        $turns = $this->medicModel->getTurns($user->id_usuario);
        $this->medicView->showViewMedic($turns, $user);
    }

    function showSearchTurns()
    {
        //barrera del login
        $this->authHelper->checkLoggedIn(MEDICO);

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

                $turns = $this->medicModel->getSearchTurns($id_user, $dateUntil, $dateSince, $partOfDay);
                $user = $this->medicModel->getUser($_SESSION['USER_EMAIL']);

                $this->medicView->showSearchTurns($turns, $user);
            }
        } else {
            $this->errorView->showError('Error, CAMPOS INCOMPLETOS! xdxd', 'LogIn');
        }
    }
}
