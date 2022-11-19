<?php
class SecretaryModel
{
    private $db;

    function __construct()
    {
        $this->db = new PDO('mysql:host=localhost;' . 'dbname=db_turno_facil;charset=utf8', 'root', '');
    }
}
