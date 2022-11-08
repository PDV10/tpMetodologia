<?php
require_once('controller/medicController.php');


define('BASE_URL', '//' . $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']) . '/');
define('turnos', '//' . $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']) . '/turnos');

if (!empty($_REQUEST['action'])) {
    $action = $_REQUEST['action'];
} else {
    $action = 'profesionales';
}

    $params = explode("/", $action);

$medicController = new MedicController();

    switch ($params[0]) {
        case 'home':
            $medicController->showHome();
            break; 
        case 'turnos':
            $medicController->showViewMedic();
            break;
        case 'login':
            $medicController->showLogin();
            break;
        default:
            echo('error');
            break; 
    }