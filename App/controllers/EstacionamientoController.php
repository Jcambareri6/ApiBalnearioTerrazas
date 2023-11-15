<?php
  require_once './App/controllers/ApiController.php';
  require_once './App/Models/EstacionamientoModel.php';
 class estacionamientoController extends ApiController{
    private $Model;
    public function __construct()
    {
        parent::__construct();
        $this->Model= new EstacionamientoModel();
    }

    public function getAll($params=null){
        if (empty($params)) {
            $estacionamientos = $this->Model->getEstacionamientosLibres();
            $this->view->response($estacionamientos);
        }else{
          $estacionamiento = $this->Model->getEstacionamiento($params[':ID']);
          if($estacionamiento){
            $this->view->response($estacionamiento);
          }else{
            $this->view->response("la estadia con el id no existe", 404);
          }
        }
    }
    public function GuardarEstacionamiento(){
        $body = $this->getData();
        $numero= $body->numero;
        $libre= $body->libre;
        if((empty($numero) && !is_numeric($numero)) || empty($libre)){
            $this->view->response("datos incompletos o erroneos");
        }else{
            $lastInsertID = $this->Model->insertEstacionamiento($numero, $libre);
            $estacionamiento = $this->Model->getEstacionamiento($lastInsertID);
            $this->view->response($estacionamiento, 201);
        }
    }
  
 }