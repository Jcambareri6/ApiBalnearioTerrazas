<?php
require_once './App/Models/Model.php';
class UnidadSombraModel extends DB {
    public function getUnidadesLibres(){
        $query= $this->connect()->prepare('SELECT * FROM  unidadsombra WHERE  libre=?');
        $query->execute(['0']);
        $unidadesSombra= $query->fetchAll(PDO::FETCH_OBJ);
        return $unidadesSombra;
    } 
    public function getUnidad($id){
        $query = $this->connect()->prepare('SELECT * FROM unidadsombra WHERE id_unidad = ?');
        $query->execute([$id]);
        $estadia = $query->fetch(PDO::FETCH_OBJ);
        return $estadia;
    }
    public function GuardarUnidad($tipo,$numero,$Libre){
       //INSERT INTO estadia (tipo,numero ,libre) VALUES (?,?,?) 
        $query = $this->connect()->prepare('INSERT INTO unidadsombra (tipo,numero ,libre) VALUES (?,?,?) ');
        if($query->execute([$tipo,$numero,$Libre])){
         return $this->connect()->query('SELECT MAX(id_unidad) FROM unidadsombra')->fetchColumn();   
        }else{
            return false;
        }
    }
    public function seleccionarUnidadesDisponiblesFecha($fechaInicio, $fechaFin){
        $query = $this->connect()->prepare('SELECT unidadsombra.* FROM unidadsombra JOIN estadia es 
        ON unidadsombra.id_unidad = es.id_unidad WHERE 
         unidadsombra.libre = ?
          AND es.fechaInicio <= ?
           AND es.FechaFin >= ?');
        $query->execute([ '0',$fechaInicio, $fechaFin]);

        $unidadesSombrasLibres= $query->fetchAll(PDO::FETCH_OBJ);
        return $unidadesSombrasLibres;
    }
    public function UpdateUnidad($Libre){
        // UPDATE estadia SET id_unidad=?,idEstacionamiento=?,fechaInicio=?,FechaFin=?,en_curso=?,finalizo=?,id_Cliente=? WHERE Id_estadia = ?
        
    }

}