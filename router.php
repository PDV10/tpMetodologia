<?php

/**
 * CONTROLLERS
 */
require_once('controller/medicController.php');
require_once('controller/secretaryController.php');
require_once('controller/loginController.php');

/**
 * ROLES
 */
define('SECRETARIA', 'S');
define('MEDICO', 'M');

/**
 * BASE URL
 */
define('BASE_URL', '//' . $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']) . '/');
define('turnos', '//' . $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']) . '/turnos');

if (!empty($_REQUEST['action'])) {
    $action = $_REQUEST['action'];
} else {
    $action = 'profesionales';
}

$params = explode("/", $action);

//Controladores
$medicController = new MedicController();
$secretaryController = new SecretaryController();
$loginController = new LoginController();

switch ($params[0]) {
    case 'profesionales':
        $loginController->showLogin();
        break;
    case 'turnos':
        $medicController->showViewMedic();
        break;
    case 'logOut':
        $loginController->logOut();
        break;
    case 'logIn':
        $loginController->login();
        break;
    case 'searchTurns':
        $medicController->showSearchTurns();
        break;
    default:
        $medicController->showError();
        break;
}
