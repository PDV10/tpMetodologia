<?php
    require_once('controller/medicController.php');
   

    define('BASE_URL', '//'.$_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']).'/');
    
    
    if(!empty($_REQUEST['action'])){
        $action = $_REQUEST['action'];
    }else{
        $action = 'home';
    }

    $params = explode("/", $action);

   $medicController = new MedicController();

    switch ($params[0]) {
        case 'home':
            $medicController->showHome();
            break; 
        default:
            echo('error');
            break; 
    }