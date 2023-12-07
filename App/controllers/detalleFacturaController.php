<?php 
require_once './App/Models/DetalleFacturaModel.php';
require_once './App/Models/facturaModel.php';
class detalleFacturaController  extends ApiController {
    private $ModelDetalleFactura;
    private $ModelFacturas;
    public function __construct()
    {
        parent::__construct();
        $this->ModelDetalleFactura= new detalleFacturaModel();
        $this->ModelFacturas= new facturaModel();
    }
    public function getdetallesFactura($params=null){
        if(empty($params)){
            $detallesFac= $this->ModelDetalleFactura->getAll();
            $this->view->response($detallesFac);
        }else{
            $id= $params[':ID'];
            $detalleFac= $this->ModelDetalleFactura->getDetalleFactura($id);
            if(!empty($detalleFac)){
                $this->view->response($detalleFac);

            }else{
                $this->view->response("el detalle de factura con el id ".$id." no existe");
            }

        }
        
    }
    public function GuardarDetalle() {
        $body = $this->getData();

       
        $pago = $body->pago;
        $medioDePago = $body->medioDePago;
        $idFacturas = $body->id_Facturas;
   
        if ( empty($pago) || empty($medioDePago) || empty($idFacturas) || !is_numeric($idFacturas)){
            $this->view->response("Datos incorrectos", 400);
        } else {
            $montoActual = $this->ModelFacturas->getMontoTotal($idFacturas);
    
            if ($montoActual >= $pago) {
                $restan = $montoActual - $pago;
                $nroPago= $this->ModelDetalleFactura->getNroPago($idFacturas);
                 
                // Validar que el nuevo total no sea negativo
                if ($restan < 0) {
                    $this->view->response("Error en el monto", 400);
                    die();
                }
    
              
            
             
                $lastInsertID = $this->ModelDetalleFactura->InsertDetalleFactura($nroPago, $pago, $restan, $medioDePago, $idFacturas);

                $detalleFac = $this->ModelDetalleFactura->getDetalleFactura($lastInsertID);

                $this->ModelFacturas->updateMonto($restan, $idFacturas);
    
                if ($detalleFac) {
                    $this->view->response($detalleFac, 201);
                } else {
                    $this->view->response("ERROR");
                }
            } else {
                $this->view->response("Error en el monto", 400);
            }
        }
    }
    
    }
    

    


    
  
