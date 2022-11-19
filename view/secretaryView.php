<?php
require_once('libs/lib/smarty-3.1.39/libs/Smarty.class.php');

class SecretaryView
{
    private $smarty;

    function __construct()
    {
        $this->smarty = new Smarty();
    }
}
