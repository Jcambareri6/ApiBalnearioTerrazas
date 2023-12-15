<?php
require_once './App/Models/Model.php';
class UnidadSombraModel extends DB {
    public function getUnidades(){
        $query= $this->connect()->prepare('SELECT * FROM  unidadsombra ');
        $query->execute();
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
    public function actualizarEstadoUnidad($idUnidad, $estado) {
        $query = $this->connect()->prepare("UPDATE unidadsombra SET libre = ? WHERE id_unidad =? ");
        $query->execute([$estado,$idUnidad]);
    }
    // public function UpdateUnidad($Libre){
    //     // UPDATE estadia SET id_unidad=?,idEstacionamiento=?,fechaInicio=?,FechaFin=?,en_curso=?,finalizo=?,id_Cliente=? WHERE Id_estadia = ?
        
    // }
    public function existeIdUnidad($idUnidad){
        $query = $this->connect()->prepare('SELECT COUNT(*) as count FROM unidadsombra WHERE id_unidad = ?');
        $query->execute([$idUnidad]);
        $result = $query->fetch(PDO::FETCH_ASSOC);
        return $result['count'] > 0;
    }
    public function getByFieldValueAndDateRange($field, $value, $start_date, $end_date) {
        $query = $this->connect()->prepare("
            SELECT DISTINCT u.*
            FROM unidadsombra u
            LEFT JOIN estadia e ON u.id_unidad = e.id_unidad
         
              AND NOT EXISTS (
                  SELECT 1
                  FROM estadia e2
                  WHERE u.id_unidad = e2.id_unidad
                    AND (
                        (e2.fechaInicio <= :end_date AND (e2.fechaFin >= :start_date OR e2.fechaFin IS NULL)) OR
                        (e2.fechaInicio <= :start_date AND (e2.fechaFin >= :start_date OR e2.fechaFin IS NULL)) OR
                        (e2.fechaInicio >= :start_date AND e2.fechaFin <= :end_date)
                    )
              )
              AND (e.fechaInicio IS NULL OR e.fechaFin IS NULL OR (e.fechaInicio > :end_date OR e.fechaFin < :start_date))
        ");
    
        $query->execute([
            'value' => $value,
            'start_date' => $start_date,
            'end_date' => $end_date
        ]);
    
        return $query->fetchAll(PDO::FETCH_OBJ);
    }
    
    
    
    
    
    
    
    

} 