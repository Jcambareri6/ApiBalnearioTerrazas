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

    public function insertEstacionamiento($numero,$libre){
        $query = $this->connect()->prepare('INSERT INTO estacionamiento (numero, libre) VALUES (?,?)');
        if( $query->execute([$numero,$libre])){
           return   $this->connect()->query('SELECT MAX(id_estacionamiento) FROM estacionamiento')->fetchColumn();   
        }
       
     }
     public function buscarEstacionamiento($fechaInicio, $fechaFin){
        
        $query = $this->connect()->prepare('SELECT  e.*
        FROM estacionamiento e
        JOIN estadia es ON e.id_estacionamiento = es.idEstacionamiento
        WHERE e.libre = ?
        AND es.fechaInicio <= ?;  
        AND es.FechaFin >= ?');
        $query->execute([ '0',$fechaInicio, $fechaFin]);
        $estacionamientosLibres= $query->fetchAll(PDO::FETCH_OBJ);
        return $estacionamientosLibres;
    }


}