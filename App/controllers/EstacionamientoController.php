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

    public function getAll($params = null) {
        if (isset( $_GET['start_date'], $_GET['end_date'])){
         
     
            $start_date = $_GET['start_date'];
            $end_date = $_GET['end_date'];
            if($this->validarFechas($start_date,$end_date)){
                $estacionamientos= $this->Model->seleccionarDisponibles( $start_date,$end_date);
                if(!empty($estacionamientos)){
                    $this->view->response($estacionamientos,200);
                    die();
                }else{
                    $this->view->response("no hay estadias en ese rango de fechas",404);
                }
             
            }else{
                $this->view->response("fechas incorrectas",404);
            }
          
         
        }
      
        if (empty($params)) {
   
            $estacionamientos = $this->Model->getEstacionamientos();
            $this->view->response($estacionamientos);
        }else{
            $id= $params[':ID'];
           $estacionamiento=  $this->Model->getEstacionamiento($id);
           if(!empty($estacionamiento)){
            $this->view->response($estacionamiento);
            

        }else{
            $this->view->response("el estacionamiento con el id ".$id." no existe");
            die();
        }
        
        }
    }
    

    public function GuardarEstacionamiento(){
        $body = $this->getData();
        $numero= $body->numero;
        $libre= $body->libre;
        $tipo= $body->tipo;
        if((empty($numero) && !is_numeric($numero)) || !isset($libre) || !in_array($libre, [0, 1] ) || empty($tipo)){
            $this->view->response("datos incompletos o erroneos");
        }else{
            $lastInsertID = $this->Model->insertEstacionamiento($numero, $libre,$tipo);
            $estacionamiento = $this->Model->getEstacionamiento($lastInsertID);
            $this->view->response($estacionamiento, 201);
        }
    }
    public function updateEstacionamiento($params=null){
        $id=$params[':ID'];
        $estacionamiento= $this->Model->getEstacionamiento($id);
        if($estacionamiento){
            $body = $this->getData();
            $numero= $body->numero;
            $libre= $body->libre;
            $tipo= $body->tipo;
        if((empty($numero) && !is_numeric($numero)) || !isset($libre) || empty($tipo)){
            $this->view->response("datos incompletos o erroneos");
            
        }else{
            
            $this->Model->updateEstacionamientoM($numero,$libre,$tipo,$id);
            $this->view->response("se modifico el estacionamiento con el id".$id."correctamente");
        }


    }else{
        $this->view->response("el estacionamiento con el id ".$id." no existe");
    }
}
}