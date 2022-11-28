<?php
require_once('libs/lib/smarty-3.1.39/libs/Smarty.class.php');

class MedicView
{
    private $smarty;

    function __construct()
    {
        $this->smarty = new Smarty();
    }

    function showHome()
    {
        $this->smarty->display("templates/medico_home/showHome.tpl");
    }

    function showViewMedic($turns, $user)
    {
        $this->smarty->assign('turns', $turns);
        $this->smarty->assign('user', $user);
        $this->smarty->display("templates/medico_home/viewMedico.tpl");
    }



    function showSearchTurns($searchTurns)
    {
        $this->smarty->assign('searchTurns', $searchTurns);
        $this->smarty->display("templates/viewMedico.tpl");
    }
}
