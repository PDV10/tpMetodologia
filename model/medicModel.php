<?php
    class MedicModel{
        private $db;

        function __construct(){
            $this->db = new PDO('mysql:host=localhost;'.'dbname= -- nombre bd  --;charset=utf8', 'root', '');
        }
        
        function getTurns(){
            $query = $this->db->prepare(
            'SELECT *
            FROM turnos');
            $query->execute([]);
            return $query->fetchAll(PDO::FETCH_OBJ);
        }

    }    