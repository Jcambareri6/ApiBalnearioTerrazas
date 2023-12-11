<?php
require_once './App/Models/Model.php';
class EstacionamientoModel extends DB{

    public function getEstacionamientosLibres()
    {
        $query = $this->connect()->prepare('SELECT * FROM estacionamiento WHERE libre=?');
        $query->execute(['0']);
        $estacionamientos = $query->fetchAll(PDO::FETCH_OBJ);
        // var_dump($estacionamientos);
        // die(__FILE__);
        return $estacionamientos;
    }
    public function getEstacionamiento($id)
    {
        $query = $this->connect()->prepare('SELECT * FROM  estacionamiento WHERE id_estacionamiento=?');
        $query->execute([$id]);
        $Estacionamiento = $query->fetchAll(PDO::FETCH_OBJ);
        return $Estacionamiento;
    }

    public function insertEstacionamiento($numero,$libre,$tipo){
        $query = $this->connect()->prepare('INSERT INTO estacionamiento (numero, libre,tipo) VALUES (?,?,?)');
        if( $query->execute([$numero,$libre,$tipo])){
           return   $this->connect()->query('SELECT MAX(id_estacionamiento) FROM estacionamiento')->fetchColumn();   
        }
       
     }
     public function buscarEstacionamiento($fechaInicio, $fechaFin){
        
        $query = $this->connect()->prepare('SELECT e.* FROM estacionamiento e LEFT JOIN estadia es ON e.id_estacionamiento = es.idEstacionamiento WHERE e.libre = ? AND (es.fechaInicio IS NULL OR es.FechaFin IS NULL OR es.fechaInicio > ? OR es.FechaFin < ?)');
        $query->execute([ '0',$fechaInicio, $fechaFin]);
        $estacionamientosLibres= $query->fetchAll(PDO::FETCH_OBJ);
        return $estacionamientosLibres;
    }

    public function updateEstacionamientoM($numero,$libre,$tipo,$id){
        $query= $this->connect()->prepare('UPDATE estacionamiento SET numero=?,libre=?,tipo=? WHERE id_estacionamiento=?');
        $query->execute([$numero,$libre,$tipo,$id]);
     
    }
    public function existeIdEstacionamiento($idEstacionamiento){
        $query = $this->connect()->prepare('SELECT COUNT(*) as count FROM estacionamiento WHERE id_estacionamiento = ?');
        $query->execute([$idEstacionamiento]);
        $result = $query->fetch(PDO::FETCH_ASSOC);
        return $result['count'] > 0;
    }
    public function actualizarEstadoEstacionamiento($idEstacionamiento, $estado) {
        $query = $this->connect()->prepare("UPDATE estacionamiento SET libre = ? WHERE id_estacionamiento =? ");
        $query->execute([$estado,$idEstacionamiento]);
    }

}