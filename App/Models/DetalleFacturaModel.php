<?php
require_once './App/Models/Model.php';
class detalleFacturaModel extends DB {
     
    public function getAll(){

       $query=$this->connect()->prepare('SELECT * FROM detallefactura');
        $query->execute();
        $detalleFacturas= $query->fetchAll(PDO::FETCH_OBJ);
        return $detalleFacturas;
    }
    public function getDetalleFactura($id){
        $query = $this->connect()->prepare('SELECT * FROM  detallefactura WHERE id_factura=?');
        $query->execute([$id]);
        $DetalleFactura= $query->fetch(PDO::FETCH_OBJ);
        return $DetalleFactura;
    }
    public function InsertDetalleFactura($nroPago,$pago,$restan,$medioDePago,$idFacturas){
        $query= $this->connect()->prepare('INSERT INTO detallefactura (NRO_PAGO,pago,restan, medioDePago,id_Facturas) values (?,?,?,?,?)');
       if( $query->execute([$nroPago,$pago,$restan,$medioDePago,$idFacturas])){
        return $this->connect()->query('SELECT MAX(id_factura) FROM detallefactura')->fetchColumn(); 
       }
       return false;
    }
    public function updateDetalleFactura($nroPago,$total,$pago,$restan,$medioDePago,$id){
        // 'UPDATE detallefactura SET NRO_PAGO=?,total=?,restan=?,medioDePago=? WHERE idFactura=? '
        $query= $this->connect()->prepare('UPDATE detallefactura SET NRO_PAGO=?,total=?,pago=?,restan=?, medioDePago=? WHERE id_factura=?');
        $query->execute([$nroPago,$total,$pago,$restan,$medioDePago,$id]);
    }
    public function idExistente($id) {
        $query = $this->connect()->prepare('SELECT COUNT(*) as count FROM facturas INNER JOIN detallefactura ON detallefactura.id_factura = facturas.idfacturas WHERE detallefactura.id_factura = ? ');
    
        $query->execute([$id]);
        $resultado = $query->fetch(PDO::FETCH_OBJ);
    
        // Accede a la propiedad 'count' del objeto resultado
        return $resultado->count > 0;
  
    }
   
   
}