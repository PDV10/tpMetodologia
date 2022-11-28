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
        $this->smarty->display("templates/medico_home/viewMedico.tpl");
    }
}
