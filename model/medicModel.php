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
            'SELECT u.id_usuario, u.nombre, u.apellido, m.especialidad, u.user, u.pass, u.tipo, m.imagen
             FROM usuario u JOIN medico m ON m.id_usuario = u.id_usuario WHERE user = ?'
        );
        $query->execute([$user]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    function getTurns($user_id)
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

    function getSearchTurns($id_user, $dateUntil, $dateSince, $partOfDay)
    {
        $query = $this->db->prepare('SELECT * 
                                     FROM turno t 
                                     JOIN paciente p 
                                     ON t.id_paciente = p.id_paciente 
                                     WHERE t.id_medico = ? AND t.tipo_turno = ?  
                                     AND t.dia BETWEEN ? and  ? 
                                     ORDER BY t.dia');
        $query->execute([$id_user, $partOfDay, $dateUntil, $dateSince]);

        $turns = $query->fetchAll(PDO::FETCH_OBJ);
        return $turns;
    }
}
