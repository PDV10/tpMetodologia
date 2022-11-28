<?php
class SecretaryModel
{
    private $db;

    function __construct()
    {
        $this->db = new PDO('mysql:host=localhost;' . 'dbname=db_turno_facil;charset=utf8', 'root', '');
    }

    function getMedic($idUser)
    {
        $query = $this->db->prepare(
            'SELECT u.id_usuario, u.nombre, u.apellido, m.especialidad, m.secretaria, u.user, u.pass, u.tipo
             FROM usuario u JOIN medico m ON m.id_usuario = u.id_usuario WHERE m.id_usuario = ?'
        );
        $query->execute([$idUser]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    function getTurnsByMedic($user_id)
    {
        $query = $this->db->prepare('SELECT * 
                                     FROM turno t 
                                     JOIN paciente p 
                                     ON t.id_paciente = p.id_paciente 
                                     WHERE t.id_medico = ?
                                     ORDER BY t.dia');
        $query->execute([$user_id]);

        $turns = $query->fetchAll(PDO::FETCH_OBJ);
        return  $turns;
    }

    function getFilteredShifts($user_id, $dateUntil, $dateSince, $partOfDay)
    {
        $query = $this->db->prepare('SELECT * 
                                     FROM turno t 
                                     JOIN paciente p 
                                     ON t.id_paciente = p.id_paciente 
                                     WHERE t.id_medico = ? AND t.tipo_turno = ?  
                                     AND t.dia BETWEEN ? and  ? 
                                     ORDER BY t.dia ');
        $query->execute([$user_id, $partOfDay, $dateUntil, $dateSince]);
        $turns = $query->fetchAll(PDO::FETCH_OBJ);
        return $turns;
    }

    function getMedics($id){
        $query = $this->db->prepare(
                                    'SELECT u.id_usuario, u.nombre, u.apellido, m.especialidad
                                     FROM usuario u
                                     JOIN medico m ON m.id_usuario = u.id_usuario 
                                     WHERE m.secretaria = ?');
        $query->execute([$id]);
        return  $query->fetchAll(PDO::FETCH_OBJ);
    }
}
