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


    function showLogin()
    {
        $this->smarty->display("templates/login_prof/showLogin.tpl");
    }

    function showError($msg)
    {
        $this->smarty->assign("msg", $msg);
        $this->smarty->display("templates/showError.tpl");
    }
    function showViewMedic($turns)
    {
        $this->smarty->assign('turns', $turns);
        $this->smarty->display("templates/viewMedico.tpl");
    }



    // function showSearchTurns($searchTurns){
    //     $this->smarty->assign('searchTurns', $searchTurns);
    //     $this->smarty->display("templates/viewMedico.tpl");
    // }

}
