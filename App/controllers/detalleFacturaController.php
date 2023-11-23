<?php 
require_once './App/Models/DetalleFacturaModel.php';



class detalleFacturaController  extends ApiController {
    private $Model;
    public function __construct()
    {
        parent::__construct();
        $this->Model= new detalleFacturaModel();
    }
    public function getdetallesFactura($params=null){
        if(empty($params)){
            $detallesFac= $this->Model->getAll();
            $this->view->response($detallesFac);
        }else{
            $id= $params[':ID'];
            $detalleFac= $this->Model->getDetalleFactura($id);
            if(!empty($detalleFac)){
                $this->view->response($detalleFac);

            }else{
                $this->view->response("el detalle de factura con el id ".$id." no existe");
            }

        }
        
    }
    public function GuardarDetalle(){
        $body= $this->getData();
        
        $nroPago= $body->NRO_PAGO;
        $total= $body->total;
        $pago= $body->pago;
        $restan = $body->restan;
        $medioDePago= $body->medioDePago;
        $idFacturas= $body->id_Facturas;
        if(empty($nroPago)||empty($total) || empty($pago) ||empty($restan)||empty($medioDePago)|| (empty($idFacturas) || !is_numeric($idFacturas) || $this->Model->idExistente($idFacturas)!=true)){
            $this->view->response("datos incorrectos",404);
        }else{
            $lastInsertID = $this->Model->InsertDetalleFactura($nroPago, $total,$pago ,$restan,$medioDePago,$idFacturas);

            $estadia = $this->Model->getDetalleFactura($lastInsertID);
            $this->view->response($estadia, 201);
        }
    }
}