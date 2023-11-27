<?php 
class facturaModel extends DB {
   public function UpdateFactura($total,$id){
      try {
       
       $factura= $this->getFactura($id);
      //  var_dump($factura);
         $query = $this->connect()->prepare('UPDATE facturas SET total=? WHERE idFacturas=?');
         $query->execute([$total,$id]);
    
      
        
         return $query->rowCount();

        
      // o puedes devolver $query->rowCount() para verificar si se realizaron cambios
     } catch (PDOException $e) {
         // Manejar el error de la base de datos
         error_log("Error en UpdateFactura: " . $e->getMessage());
         return false;
     }
    //UPDATE 'facturas' SET 'idFacturas'=?,'idEstadia'=?,'total'=?,'precioXdia'= ? WHER
   }
   public  function getFacturasModel(){
      $query= $this->connect()->prepare('SELECT * FROM facturas');
      $query->execute();
      $facturas= $query->fetchAll(PDO::FETCH_OBJ);
       return $facturas;
   }
   public function getMontoTotal ($id){
      $query= $this->connect()->prepare('SELECT total FROM Facturas WHERE idFacturas=?');
      $query->execute([$id]);
      $total = $query->fetchColumn();
      return $total;
   }
   public function getFactura($id){
      $query= $this->connect()->prepare('SELECT * FROM facturas WHERE idFacturas=?');
      $query->execute([$id]);
      $factura= $query->fetch(PDO::FETCH_OBJ);
      return $factura;

   }
}