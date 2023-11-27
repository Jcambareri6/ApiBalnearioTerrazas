<?php
require_once './App/Models/facturaModel.php';
class facturaController extends ApiController{
    private $model;
    public function __construct()
    {
        parent::__construct();
        $this->model= new facturaModel();
    }
    public function getFacturas(){
        $facturas =$this->model->getFacturasModel();
      
         $this->view->response($facturas);
    }
    


}