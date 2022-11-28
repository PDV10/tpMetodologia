<?php
class UserModel
{
    private $db;

    function __construct()
    {
        $this->db = new PDO('mysql:host=localhost;' . 'dbname=db_turno_facil_v2;charset=utf8', 'root', '');
    }
    function getUser($user)
    {
        $query = $this->db->prepare(
            'SELECT u.id_usuario, u.nombre, u.apellido, u.user, u.pass, u.tipo
             FROM usuario u WHERE user = ?'
        );
        $query->execute([$user]);
        return $query->fetch(PDO::FETCH_OBJ);
    }
}
