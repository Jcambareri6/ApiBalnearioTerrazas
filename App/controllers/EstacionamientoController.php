<?php
  require_once './App/controllers/ApiController.php';
 class estacionamientoController extends ApiController{
    private $Model;
    public function __construct()
    {
        parent::__construct();
        $this->Model= new EstacionamientoModel();
    }

    public function getAll($params=null){
        if (empty($params)) {
            $estacionamientos = $this->Model->getEstacionamientos();
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
 }