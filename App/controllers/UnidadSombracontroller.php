<?php 
require_once './App/controllers/ApiController.php';
require_once './App/Models/unidadSombraModel.php';
class unidadSombraController extends ApiController{
    private $Model;
    public function __construct(){
        parent::__construct();
        $this->Model= new UnidadSombraModel();
    } 
    public function validarFechas($fechaIni,$fechaFin){
        $start_date_valid = strtotime($fechaIni) !== false;
            $end_date_valid = strtotime($fechaFin) !== false;
        return $start_date_valid && $end_date_valid;
    }
    public function getUnidades($params) {
        // Verifica si se proporcionaron parámetros en la URL
        if (isset($_GET['field'], $_GET['value'], $_GET['start_date'], $_GET['end_date'])) {
            $field = $_GET['field'];
            $value = $_GET['value'];
            $start_date = $_GET['start_date'];
            $end_date = $_GET['end_date'];
            $allowedField= ['tipo','numero','libre'];
          
            $this->getByFieldAndDateRange($this->Model, $field, $value, $start_date, $end_date, $allowedField);
            // } else {
            //     $this->view->response("Fechas inválidas o campo de filtrado incorrectos", 400);
               
            //     die();
        }
        
    
        // Si no se proporcionaron parámetros, obtén todas las unidades disponibles
        if(empty($params)){
            // echo 'hola entre al getAll';
            $unidadSombra = $this->Model->getUnidades();
            $this->view->response($unidadSombra, 200);
        }else{
            $estadia = $this->Model->getUnidad($params[':ID']);
            $this->view->response($estadia,200);
        }
    }
    
     
    
    
    
    public function GuardarUnidadSombra(){
        $body=$this->getData();
        $tipo= $body->tipo;
        $numero= $body->numero;
        $libre= $body->libre;
        if((empty($numero) && !is_numeric($numero)) || !isset($libre) || !in_array($libre, [0, 1] )){
            $this->view->response("datos incompletos o erroneos");
            die();
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