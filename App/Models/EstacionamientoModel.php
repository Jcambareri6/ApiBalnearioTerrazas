<?php
require_once './App/Models/Model.php';
class EstacionamientoModel extends DB{

 public function getEstacionamientos(){
    $query= $this->connect()->prepare('SELECT * FROM  estacionamiento ');
    $estacionamientos=  $query->fetchAll(PDO::FETCH_OBJ);
    return $estacionamientos; 
 }
 public function getEstacionamiento($params=null){
    $query= $this->connect()->prepare('SELECT * FROM  estacionamiento WHERE id_estacionamiento=?');
 }


}