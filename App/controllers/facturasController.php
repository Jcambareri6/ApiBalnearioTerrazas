<?php
require_once './App/Models/facturaModel.php';
require_once './App/Models/ModelEstadia.php';
class facturaController extends ApiController{
    private $modelEstadia;
    private $model;
    public function __construct()
    {
        parent::__construct();
        $this->modelEstadia= new modelEstadia();
        $this->model= new facturaModel();
    }
    public function getFacturas($params=NULL){
        if(empty($params)){
            $detallesFac= $this->model->getFacturasModel();
            $this->view->response($detallesFac,200);
        }else{
            $id= $params[':ID'];
            $Factura= $this->model->getFactura($id);
            if(!empty($Factura)){
                $this->view->response($Factura);
            }else{
                $this->view->response("el detalle de factura con el id ".$id." no existe");
            }

        }
    }
    public function guardarFactura(){
        $body=$this->getData();
        $temporada=120;
        $IdEstadia= $body->idEstadia;
        $total= $body->total;

        if((empty($IdEstadia)|| !is_numeric($IdEstadia)|| !$this->modelEstadia->IDexistente($IdEstadia) || empty($total))){
            $this->view->response("error",404);
        }else{
        $fechas= $this->modelEstadia->getFechaInicioyfin($IdEstadia);
        $fechaInicio = new DateTime($fechas->fechaInicio);
        $fechaFin = new DateTime($fechas->FechaFin);
        $diferenciaDias = $fechaFin->diff($fechaInicio)->days;
        var_dump($diferenciaDias);
        $precioXdia= $total/$diferenciaDias;
        switch ($diferenciaDias){
            case $diferenciaDias>=$temporada:
                $concepto= "temporada";
            break;
            default :
            $concepto = $diferenciaDias." dias";
            break;

        }
  
        $id= $this->model->InsertFactura($IdEstadia,$total,$precioXdia,$concepto);
         $Factura= $this->model->getFactura($id);
           if($Factura){
             $this->view->response($Factura,201);
           }
        }
    }
    public function UpdateFactura($params=null){
       
        $id = $params[':ID'];
        $factura = $this->model->getFactura($id);
        if ($factura) {
            $body = $this->getData();
            $IdEstadia= $body->idEstadia;
             $total =  $body->total;
            $precioXdia= $body->precioXdia;
            if((empty($IdEstadia)|| !is_numeric($IdEstadia)|| !$this->modelEstadia->IDexistente($IdEstadia)||empty($total) || empty($precioXdia))){
                $this->view->response("error",404);
            }else{
                $this->model->UpdateFactura($IdEstadia,$total,$precioXdia,$id);
                $this->view->response("se modifico con exito",200);
            }

        }else{
            $this->view->response("la estadia con el id :".$id."no existe");
        }
    }
    


}