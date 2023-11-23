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
        $id= $body->idFactura;
        $nroPago= $body->NRO_PAGO;
        $total= $body->total;
        $restan = $body->restan;
        $medioDePago= $body->medioDePago;
        if( (empty($id) && !is_numeric($id)  && !$this->Model->idExistente($id)) || empty($nroPago)||empty($total) ||empty($restan)||empty($medioDePago)){
            $this->view->response("datos incorrectos",404);
        }else{
            $lastInsertID = $this->Model->InsertDetalleFactura($id, $nroPago, $total, $restan,$medioDePago);

            $estadia = $this->Model->getDetalleFactura($lastInsertID);
            $this->view->response($estadia, 201);
        }
    }
}