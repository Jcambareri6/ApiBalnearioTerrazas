<?php
require_once './App/Models/ModelEstadia.php';
require_once 'app/controllers/ApiController.php';

class EstadiaController extends ApiController {
    private $modelEstadia;
 

    public function __construct(){
        parent::__construct();
        $this->modelEstadia= new modelEstadia();
       
    }
    public function getEstadias($params=null) {
        if (empty($params)){
            $estadias = $this->modelEstadia->getEstadiasWithClientNames();
                $this->view->response($estadias);
        } else {
            // var_dump($params[':ID']);
            // echo(__FILE__);
            $estadia = $this->modelEstadia->getEstadia($params[':ID']);
            if(!empty($estadia)) {
                if(!empty($params[':subrecurso'])) {
                    switch ($params[':subrecurso']) {
                        case 'id_unidad':
                            $this->view->response($estadia->id_unidad, 200);
                        break;
                        case 'idEstacionamiento':
                            $this->view->response($estadia->idEstacionamiento, 200);
                            break; 
                         case 'fechaInicio':
                            $this->view->response($estadia->fechaInicio, 200);
                         break; 
                         case 'FechaFin':
                            $this->view->response($estadia->FechaFin, 200);
                         break; 
                         case 'id_Cliente':
                            $this->view->response($estadia->id_Cliente, 200);
                         break; 
                        default:
                        $this->view->response(
                            'La estadia no contiene '.$params[':subrecurso'].'.', 404);
                        break;
                    }
             
            }else{
                $this->view->response($estadia);
            }
             
        }
    }
}
function  InsertEstadia(){
    $body= $this->getData();
    $idUnidad= $body->id_unidad;
   // $idEstacionamiento= $body->idEstacionamiento;
    $fechaInicio= $body->fechaInicio;
    $FechaFin= $body->FechaFin;
    $id_Cliente= $body->id_Cliente;
        if (empty($idUnidad) ||empty($fechaInicio) 
        || empty($FechaFin) || empty($id_Cliente)) {
        
            $this->view->response("campos incompletos",404);

        }else{
            $lastInsertID= $this->modelEstadia->InsertEstadia($idUnidad,$fechaInicio,$FechaFin,$id_Cliente);
            
            $estadia = $this->modelEstadia->getEstadia($lastInsertID);
                $this->view->response($estadia, 201);

        }
 }
 function delete($params=null){
    $id=$params[':ID'];
    $this->modelEstadia->deleteEstadia($id);
    $estadia = $this->modelEstadia->getEstadia($id);
    if(empty($estadia)){
        return $this->view->response("eliminado");
    }
        return $this->view->response("error",404);
    
    
 }
}