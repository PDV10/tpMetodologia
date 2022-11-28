<?php
/*Requerimientos internos*/
require_once('model/secretaryModel.php');
require_once('view/secretaryView.php');
require_once('view/errorView.php');
/*Helpers*/
require_once('helpers/auth.helper.php');

class SecretaryController
{
    private $secretaryModel;
    private $secretaryView;
    private $authHelper;
    private $errorView;

    function __construct()
    {
        $this->secretaryModel = new SecretaryModel();
        $this->secretaryView = new SecretaryView();
        $this->authHelper = new AuthHelper();
        $this->errorView = new ErrorView();
    }

    function showTurnsByMedic($idMedic)
    {   
        $this->authHelper->checkLoggedIn(SECRETARIA);

        $medic = $this->secretaryModel->getMedic($idMedic);

        if ($medic->secretaria == $_SESSION['USER_ID']) {
            $turns = $this->secretaryModel->getTurnsByMedic($medic->id_usuario);
            $this->secretaryView->showTurnsByMedic($turns, $medic);
        } else {
            //TAREA PATO agregar el segundo paramtro que seria el id del medico para listarlo
            $this->errorView->showError('Este medico no le pertenece', 'listarMedicos');
        }
    }

    function showListMedics(){
        $medicos = $this->secretaryModel->getMedics($_SESSION['USER_ID']);
        $this->secretaryView->showListMedics($medicos);
    }

    function test(){
        echo("adasd");
    }
}
