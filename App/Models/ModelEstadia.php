<?php
require_once './App/Models/Model.php';
class modelEstadia extends DB{
    private $db;
   public function __construct()
   {
     $this->db= new DB();
   }
    public function getEstadiasWithClientNames() {
        
            $sql = $this->db->connect()->prepare( 'SELECT estadia.id_estadia,estadia.id_Cliente, estadia.fechaInicio, estadia.fechaFin, clientes.nombre
            FROM estadia 
            INNER JOIN clientes ON estadia.id_Cliente = clientes.id_Cliente'); // Aquí se debe indicar la columna de clientes que se relaciona con estadia
    
            $sql->execute();
    
            $result = $sql->fetchAll(PDO::FETCH_OBJ);
    
            return $result;
        
    }
    function getEstadia($id) {
       
        $query = $this->db->connect()->prepare('SELECT * FROM estadia WHERE id_estadia = ?');
    
        $query->execute([$id]);

    
        $estadia = $query->fetch(PDO::FETCH_OBJ);

        return $estadia;
    }


    public function insertEstadia($idUnidad,$fechaInicio,$fechaFin, $idCliente){
        
            $sql = $this->db->connect()->prepare('INSERT INTO estadia (id_unidad ,fechaInicio, FechaFin, id_Cliente ) VALUES (?,?, ?, ?)');

            $sql->execute([$idUnidad,$fechaInicio, $fechaFin, $idCliente]);        
            $lastInsertId = $this->db->connect()->query('SELECT MAX(id_estadia) FROM estadia')->fetchColumn();
            return $lastInsertId;
           
    }
    function deleteEstadia($id) {
        $query = $this->db->connect()->prepare('DELETE FROM estadia WHERE id_estadia = ?');
        $query->execute([$id]);
    }


    
    

}