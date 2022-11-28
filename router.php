<?php

/**
 * SHOWERROR
 */
require_once('view/errorView.php');

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
define('ListarMedicos', '//' . $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']) . '/listarMedicos');


if (!empty($_REQUEST['action'])) {
    $action = $_REQUEST['action'];
} else {
    $action = 'profesionales';
}

$params = explode("/", $action);

//SHOWERROR
$errorView = new ErrorView();
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
    case 'turnos-medico':
        if (isset($params[1])) {
            $secretaryController->showTurnsByMedic($params[1]);
        }
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
    case 'searchTurnsLikeSecretaria':
        if (isset($params[1])) {
            $secretaryController->showFilteredShifts($params[1]);
        }
        break;
    case 'listarMedicos':
        $secretaryController->showListMedics();
        break;
    case 'eliminarTurno':
        if (isset($params[1])) {
            $secretaryController->deleteTurn();
        }
        break;
    default:
        $errorView->showError('ruta incorrecta', '');
        break;
}
