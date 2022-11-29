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

    function showTurnsByMedic($idMedic){   
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

    function showFilteredShifts($idMedic)
    {
        $this->authHelper->checkLoggedIn(SECRETARIA);

        if (
            !empty($_GET["inputDesde"]) &&
            !empty($_GET["inputHasta"])  &&
            !empty($_GET["parteDelDia"])
        ) {
            $dateUntil = $_REQUEST['inputDesde'];
            $dateSince = $_REQUEST['inputHasta'];
            $partOfDay = $_REQUEST['parteDelDia'];
       
        $medic = $this->secretaryModel->getMedic($idMedic);
        $turns = $this->secretaryModel->getFilteredShifts($idMedic, $dateUntil, $dateSince, $partOfDay);
        $this->secretaryView->showListFilteredShifts($turns, $medic);
        } else {
            $this->errorView->showError('Verificar que los campos esten completos', 'listarMedicos');
        }
    }

    function showListMedics(){
        $medic = $this->secretaryModel->getMedics($_SESSION['USER_ID']);
        $this->secretaryView->showListMedics($medic);
    }

    function test(){
        echo("adasd");
    }

    function deleteTurn(){
        $this->authHelper->checkLoggedIn(SECRETARIA);

        if(!empty($_GET["idMedic"]) && !empty($_GET["idTurn"])){
            
            $idTurn = $_REQUEST["idTurn"];
            $idMedic = $_REQUEST["idMedic"];
            $this->secretaryModel->deleteTurn($idTurn,$idMedic);
            $this->showTurnsByMedic($idMedic);
        }else{
            $this->errorView->showError('¡ERROR! No se encuentra el Turno a eliminar', 'turnos-medico');
        }
    }

}
