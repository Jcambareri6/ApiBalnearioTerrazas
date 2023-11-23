<?php
require_once './App/Models/ModelEstadia.php';
require_once 'app/controllers/ApiController.php';


class EstadiaController extends ApiController {
    private $modelEstadia;
  
    public function __construct(){
        parent::__construct();
        $this->modelEstadia= new modelEstadia(); 
    }

    public function verificarEstadias(){
 
        $fechaActual = date('Y-m-d');

            $estanciasVencidas = $this->modelEstadia->getEstadiasVencidas($fechaActual);
           
            foreach ($estanciasVencidas as $estadia) {
                if(!empty($estadia)){
                    $this->modelEstadia->updateEstadia($estadia->id_unidad,$estadia->idEstacionamiento,$estadia->fechaInicio,$estadia->FechaFin,0,1,$estadia->id_Cliente,$estadia->Id_estadia);
                    // echo 'modificada';
                }
                // var_dump($estanciasVencidas);
                // die(__FILE__);
            }
    }
    public function getEstadias($params = null) {
        
        
       $this->verificarEstadias();
        if (empty($params)) {

            $estadias = $this->modelEstadia->getEstadiasWithClientNames();
            $this->view->response($estadias);

        } else {
            // var_dump($params[':ID']);
            // echo(__FILE__);
            $estadia = $this->modelEstadia->getEstadia($params[':ID']);
            if (!empty($estadia)) {
                if (!empty($params[':subrecurso'])) {
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
                                'La estadia no contiene ' . $params[':subrecurso'] . '.',
                                404
                            );
                           break;
                    }
                } else {
                    $this->view->response($estadia);
                }
            } else {
                return $this->view->response("la estadia con el id no existe", 404);
            }

        }
       
    }
    function  InsertEstadia(){
        $body = $this->getData();
        $idUnidad = $body->id_unidad;
        $idEstacionamiento = $body->idEstacionamiento;
        $fechaInicio = $body->fechaInicio;
        $FechaFin = $body->FechaFin;
        $enCurso=$body->en_curso;
        $finalizo=$body->finalizo;
        $id_Cliente = $body->id_Cliente;
        if ( $idUnidad != null && (!is_numeric($idUnidad) && !ctype_digit($idUnidad))
        ||empty($fechaInicio) || empty($FechaFin) || empty($id_Cliente)||
         $idEstacionamiento != null && (!is_numeric($idEstacionamiento) && !ctype_digit($idEstacionamiento)))  {
            $this->view->response("campos incompletos o incorrectos", 404);
        } else {
            $lastInsertID = $this->modelEstadia->InsertEstadia($idUnidad, $idEstacionamiento, $fechaInicio, $FechaFin, $id_Cliente);

            $estadia = $this->modelEstadia->getEstadia($lastInsertID);
            $this->view->response($estadia, 201);
        }
    }
    function delete($params = null)
    {
        $id = $params[':ID'];
        $this->modelEstadia->deleteEstadia($id);
        $estadia = $this->modelEstadia->getEstadia($id);
        if (empty($estadia)) {
            return $this->view->response("eliminado");
        }
        return $this->view->response("error", 404);
    }
    function UpdateEstadia($params = null)
    {
        $id = $params[':ID'];
        $estadia = $this->modelEstadia->getEstadia($id);
        if ($estadia) {
            $body = $this->getData();
            $idUnidad = $body->id_unidad;
            $idEstacionamiento = $body->idEstacionamiento;
            $fechaInicio = $body->fechaInicio;
            $FechaFin = $body->FechaFin;
            $enCurso = $body->en_curso;
            $finalizo = $body->finalizo;
            $id_Cliente = $body->id_Cliente;
            if 
                ($idUnidad != null && (!is_numeric($idUnidad) && !ctype_digit($idUnidad)) ||
                 empty($fechaInicio) || empty($FechaFin) || empty($id_Cliente) ||(!isset($enCurso) && $enCurso !== 0) ||(!isset($finalizo) && $finalizo !== 0)|| 
                $idEstacionamiento != null && (!is_numeric($idEstacionamiento) && !ctype_digit($idEstacionamiento)
                )
            ) {
                $this->view->response("campos incompletos o incorrectos", 404);
            } else {

                $this->modelEstadia->UpdateEstadia($idUnidad, $idEstacionamiento, $fechaInicio, $FechaFin, $enCurso, $finalizo, $id_Cliente, $id);
                $this->view->response('La tarea con id=' . $id . ' ha sido modificada.', 200);
            }
        } else {
            $this->view->response('La tarea con id=' . $id . ' no existe.', 404);
        }
       
        
    }
}