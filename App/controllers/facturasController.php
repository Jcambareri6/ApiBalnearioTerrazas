<?php
require_once './App/Models/facturaModel.php';
class facturaController extends ApiController{
    private $model;
    public function __construct()
    {
        parent::__construct();
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
    


}