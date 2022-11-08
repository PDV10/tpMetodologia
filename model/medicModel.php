<?php
class MedicModel
{
    private $db;

    function __construct()
    {
        $this->db = new PDO('mysql:host=localhost;' . 'dbname=db_turno_facil;charset=utf8', 'root', '');
    }


    function getUser($user)
    {
        $query = $this->db->prepare(
            'SELECT * 
                FROM medico
                WHERE user = ?'
        );
        $query->execute([$user]);
        return $query->fetch(PDO::FETCH_OBJ);
    }




    function getTurns()
    {
        $query = $this->db->prepare('SELECT * FROM turno');
        $query->execute([]);

        $turns = $query->fetchAll(PDO::FETCH_OBJ);
        return  $turns;
    }

    function getSearchTurns($dateUntil, $dateSince, $partOfDay)
    {
        $query = $this->db->prepare('SELECT * FROM turno t JOIN medico m ON t .id_medico = m.id_medico WHERE t.tipo_turno = ?  AND t.dia BETWEEN ? and  ? ');
        $query->execute([$partOfDay, $dateUntil, $dateSince]);

        $turns = $query->fetchAll(PDO::FETCH_OBJ);
        return $turns;
    }
}
