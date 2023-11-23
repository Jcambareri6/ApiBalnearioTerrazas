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
        $query = $this->connect()->prepare('SELECT * FROM  detallefactura WHERE idFactura=?');
        $query->execute([$id]);
        $DetalleFactura= $query->fetch(PDO::FETCH_OBJ);
        return $DetalleFactura;
    }
    public function InsertDetalleFactura($id,$nroPago,$total,$restan,$medioDePago){
        $query= $this->connect()->prepare('INSERT INTO detallefactura (idFactura,NRO_PAGO,total,restan, medioDePago) values (?,?,?,?)');
       if( $query->execute([$id,$nroPago,$total,$restan,$medioDePago])){
        return $this->connect()->query('SELECT MAX(idFactura) FROM detallefactura')->fetchColumn(); 
       }
       return false;
    }
    public function updateDetalleFactura($nroPago,$total,$restan,$medioDePago){
        // 'UPDATE detallefactura SET NRO_PAGO=?,total=?,restan=?,medioDePago=? WHERE idFactura=? '
        $query= $this->connect()->prepare('UPDATE detallefactura SET NRO_PAGO=?,total=?,restan=?,medioDePago=? WHERE idFactura=?');
        $query->execute([$nroPago,$total,$restan,$medioDePago]);
    }
     public function idExistente ($id){
        $query = $this->connect()->prepare('SELECT COUNT(*) FROM facturas INNER JOIN detallefactura ON detallefactura.idFactura = facturas.id_factura WHERE detallefactura.idFactura = ? ');
        $query->execute([$id]);
        $cantidad= $query->fetch(PDO::FETCH_OBJ);
        return $cantidad>0;
     }

}