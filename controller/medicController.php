<?php 
    /* internos */
    require_once('model/medicModel.php');
    require_once('view/medicView.php');
    /* helper */
    require_once('helpers/auth.helper.php');
    /* externos */
    require_once('model/medicModel.php');

    class MedicController{
        private $medicView;
        private $medicModel;
        private $authHelper;

        function __construct(){
            $this->medicView = new MedicView();
            $this->medicModel = new MedicModel();
            $this->authHelper = new AuthHelper();
        }

        function showHome(){
            $this->medicView->showHome();
        }

        
        function showViewMedic(){
            $turns = $this->medicModel->getTurns();
            $this->medicView->showViewMedic($turns);
        }

        function showSearchTurns(){
             if ( !empty($_GET["inputDesde"]) && 
                  !empty($_GET["inputHasta"])  &&
                  !empty($_GET["parteDelDia"])){
              
                    $dateUntil = $_REQUEST['inputDesde'];
                    $dateSince = $_REQUEST['inputHasta'];
                    $partOfDay = $_REQUEST['parteDelDia'];
            
                    $searchTurns = $this->medicModel->getSearchTurns($dateUntil,$dateSince,$partOfDay);

                    $this->medicView->showViewMedic($searchTurns);
             }else{  
                     $this->medicView->showError();
             }   
        }
    }