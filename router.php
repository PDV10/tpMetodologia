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
    case 'turnos':
        $medicController->showViewMedic();
        break;

    case 'profesionales':
        $medicController->showLogin();
        break;
    case 'loginMedico':
        $medicController->login();
        break;

    case 'searchTurns':
        $medicController->showSearchTurns();
        break;

    default:
        echo ('error');
        break;
}
