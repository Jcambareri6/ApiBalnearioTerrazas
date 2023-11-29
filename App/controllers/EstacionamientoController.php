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

    public function getAll($params = null){
      if (empty($params)) {
          // No se proporcionaron parámetros, obtener todos los estacionamientos libres
          $estacionamientos = $this->Model->getEstacionamientosLibres();
          $this->view->response($estacionamientos);
      } else {
        
          $fecha_inicio = $params[':FECHAI'] ?? null;
          $fecha_fin = $params[':FECHAF'] ?? null;
  
          if ($fecha_inicio !== null && $fecha_fin !== null) {
              $estacionamientos = $this->Model->buscarEstacionamiento($fecha_inicio,$fecha_fin);
              if(!empty($estacionamientos)){
              $this->view->response($estacionamientos);
              }else{ $this->view->response("no hay estacionamientos libres en esa fecha");}
          } else {
            
              $estacionamiento = $this->Model->getEstacionamiento($params[':ID']);
              if ($estacionamiento) {
                  $this->view->response($estacionamiento);
              } else {
                  $this->view->response("el estacionamiento  con el id no existe", 404);
              }
          }
      }
  }
    public function GuardarEstacionamiento(){
        $body = $this->getData();
        $numero= $body->numero;
        $libre= $body->libre;
        $tipo= $body->tipo;
        if((empty($numero) && !is_numeric($numero)) || !isset($libre) || empty($tipo)){
          
            $this->view->response("datos incompletos o erroneos");
        }else{
            $lastInsertID = $this->Model->insertEstacionamiento($numero, $libre,$tipo);
            $estacionamiento = $this->Model->getEstacionamiento($lastInsertID);
            $this->view->response($estacionamiento, 201);
        }
    }
  
 }