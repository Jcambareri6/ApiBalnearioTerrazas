<?php
require_once './App/Models/Model.php';
class modelEstadia extends DB{

  
    public function getEstadiasWithClientNames() {
        
            $sql = $this->connect()->prepare( 'SELECT estadia.*, clientes.nombre
            FROM estadia 
            INNER JOIN clientes ON estadia.id_Cliente = clientes.id_Cliente  '); // Aquí se debe indicar la columna de clientes que se relaciona con estadia
    
            $sql->execute();
    
            $result = $sql->fetchAll(PDO::FETCH_OBJ);
    
            return $result;
        
    }
    function getEstadia($id) {
       
        $query = $this->connect()->prepare('SELECT * FROM estadia WHERE id_estadia = ?');
    
        $query->execute([$id]);

    
        $estadia = $query->fetch(PDO::FETCH_OBJ);

        return $estadia;
    }


    public function insertEstadia($idUnidad,$idEstacionamiento,$fechaInicio,$fechaFin, $idCliente){
        
            $sql = $this->connect()->prepare('INSERT INTO estadia (id_unidad,idEstacionamiento ,fechaInicio, FechaFin,en_curso, id_Cliente ) VALUES (?,?,?,?,?,?)');
            $sql->execute([$idUnidad,$idEstacionamiento,$fechaInicio, $fechaFin,1,$idCliente]);        
            $lastInsertId = $this->connect()->query('SELECT MAX(id_estadia) FROM estadia')->fetchColumn();
            return $lastInsertId;
           
    }
    
    function deleteEstadia($id) {
        $query = $this->connect()->prepare('DELETE FROM estadia WHERE id_estadia = ?');
        $query->execute([$id]);
    }

    function updateEstadia($idUnidad, $idEstacionamiento, $fechaInicio, $FechaFin, $enCurso, $finalizo, $id_Cliente, $id)
    {
        $query = $this->connect()->prepare('UPDATE estadia SET id_unidad=?,idEstacionamiento=?,fechaInicio=?,FechaFin=?,en_curso=?,finalizo=?,id_Cliente=? WHERE Id_estadia = ?');
        $query->execute([$idUnidad, $idEstacionamiento, $fechaInicio, $FechaFin, $enCurso, $finalizo, $id_Cliente, $id]);
    }
    function getEstadiasVencidas($diaActual)
    {
        $sql =  $this->connect()->prepare('SELECT * FROM estadia WHERE FechaFin < ?');
        $sql->execute([$diaActual]);

        $estanciasVencidas = $sql->fetchAll(PDO::FETCH_OBJ);

        return $estanciasVencidas;
    }
    public function IDexistente($id){
        $query= $this->connect()->prepare('SELECT id_estadia FROM estadia WHERE id_estadia = ? ');
        $query->execute([$id]);
        return $query->rowCount() > 0;
    }

  
    

    
    

}