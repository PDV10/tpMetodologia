<?php
require_once('libs/lib/smarty-3.1.39/libs/Smarty.class.php');

class MedicView{
    private $smarty;

    function __construct(){
        $this->smarty = new Smarty();
    }

    function showHome(){
        $this->smarty->display("templates/medico_home/showHome.tpl");
    }
        
        
}