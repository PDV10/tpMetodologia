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
            //$this->musicModel = new MedicModel();
            $this->authHelper = new AuthHelper();
        }

        function showHome(){
            $this->medicView->showHome();
        }

        function showViewMedic(){
            $this->medicView->showViewMedic();
        }
        function showLogin(){
            $this->medicView->showLogin();
        }

        
    }