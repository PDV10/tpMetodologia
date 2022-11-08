<?php
    class MedicModel{
        private $db;

        function __construct(){
            $this->db = new PDO('mysql:host=localhost;'.'dbname=db_turno_facil;charset=utf8', 'root', '');
        }
        
        function getTurns(){
            $query = $this->db->prepare(
            'SELECT *
            FROM turnos');
            $query->execute([]);
            return $query->fetchAll(PDO::FETCH_OBJ);
        }

       function getUser($user){
            $query = $this->db->prepare(
               'SELECT * 
                FROM medico
                WHERE user = ?');
                $query->execute([$user]);
                return $query->fetch(PDO::FETCH_OBJ);    
        }

    
    }    