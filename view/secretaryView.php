<?php
require_once('libs/lib/smarty-3.1.39/libs/Smarty.class.php');

class SecretaryView
{
    private $smarty;

    function __construct()
    {
        $this->smarty = new Smarty();
    }

    function showTurnsByMedic($turns, $user)
    {
        $this->smarty->assign('turns', $turns);
        $this->smarty->assign('user', $user);
        $this->smarty->assign('button', false );
        $this->smarty->display("templates/medico_home/viewMedico.tpl");
    }

    function showListMedics($medicos){
        $this->smarty->assign('medicos', $medicos);
        $this->smarty->display("templates/secretaria_home/showListMedics.tpl");
    }
    
    function showListFilteredShifts($turns, $user){
        $this->smarty->assign('turns', $turns);
        $this->smarty->assign('user', $user);
        $this->smarty->assign('button', true );
        $this->smarty->display("templates/medico_home/viewMedico.tpl");
    }
}
