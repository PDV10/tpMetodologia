<?php
require_once('libs/lib/smarty-3.1.39/libs/Smarty.class.php');

class ErrorView
{
    private $smarty;

    function __construct()
    {
        $this->smarty = new Smarty();
    }

    function showError($msg)
    {
        $this->smarty->assign("msg", $msg);
        $this->smarty->display("templates/showError.tpl");
    }
}
