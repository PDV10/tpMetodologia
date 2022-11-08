<?php
    class MedicModel{
        private $db;

        function __construct(){
            $this->db = new PDO('mysql:host=localhost;' . 'dbname=db_turno_facil;charset=utf8', 'root', '');
        }
        
        
    /*function __construct(){
            
        $this->db = new PDO('mysql:host=localhost;' . 'dbname=db_equipos;charset=utf8', 'root', '');
 
     }

     function getAllCountries(){
        $query=$this->db->prepare('SELECT * FROM countries');
        $query->execute();

        $countrie=$query->fetchAll(PDO::FETCH_OBJ);

        return $countrie;
 
     }*/

    function getTurns(){
            $query=$this->db->prepare('SELECT * FROM turno');
            $query->execute([]);

            $turns = $query->fetchAll(PDO::FETCH_OBJ);
            return  $turns;
    }

    function getSearchTurns($dateUntil,$dateSince,$partOfDay){
            $query=$this->db->prepare('SELECT * FROM turno t JOIN medico m ON t .id_medico = m.id_medico WHERE t.tipo_turno = ?  AND t.dia BETWEEN ? and  ? ');
            $query->execute([$partOfDay,$dateUntil,$dateSince]);

            $turns = $query->fetchAll(PDO::FETCH_OBJ);
            return $turns;
    }

    }   