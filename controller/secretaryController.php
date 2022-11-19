<?php
//Requerimientos internos
require_once('model/secretaryModel.php');
require_once('view/secretaryView.php');
// Helpers
require_once('helpers/auth.helper.php');

class SecretaryController
{
    private $secretaryModel;
    private $secretaryView;
    private $authHelper;

    function __construct()
    {
        $this->secretaryModel = new SecretaryModel();
        $this->secretaryView = new SecretaryView();
        $this->authHelper = new AuthHelper();
    }
}
