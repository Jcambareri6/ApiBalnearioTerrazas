<?php 
require_once './App/controllers/ApiController.php';
require_once './App/Models/unidadSombraModel.php';
class unidadSombraController extends ApiController{
    private $Model;
    public function __construct(){
        parent::__construct();
        $this->Model= new UnidadSombraModel();
    } 
    public function getUnidades($params){
        if (empty($params)) {
            $unidades = $this->Model->getUnidadesLibres();
            $this->view->response($unidades);
        
        }else{
            $fecha_inicio = $params[':FECHAI'] ?? null;
            $fecha_fin = $params[':FECHAF'] ?? null;
            $tipo=  $params[':TIPO'] ?? null;
    
            if ($fecha_inicio !== null && $fecha_fin !== null) {
                $UnidadesLibres = $this->Model->seleccionarUnidadesDisponiblesFecha($tipo,$fecha_inicio,$fecha_fin);
                if(!empty($UnidadesLibres)){
                $this->view->response($UnidadesLibres);
                }else{ $this->view->response("no hay unidades libres en esa fecha");}
            } else {
      
                $unidad = $this->Model->getUnidad($params[':ID']);
                if ($unidad) {
                    $this->view->response($unidad);
                } else {
                    $this->view->response("la unidad  con el id no existe", 404);
                }
            }
        }
       
    }
    public function GuardarUnidadSombra(){
        $body=$this->getData();
        $tipo= $body->tipo;
        $numero= $body->numero;
        $libre= $body->libre;
        if((empty($numero) && !is_numeric($numero)) || empty($libre)){
            $this->view->response("datos incompletos o erroneos");
        }else{
            $lastInsertID = $this->Model->GuardarUnidad($tipo,$numero, $libre);
            $unidad = $this->Model->getUnidad($lastInsertID);
            if($unidad!=false){
                $this->view->response($unidad, 201);
            }else{
                $this->view->response("error", 404);
            }
        
        }
    }


}