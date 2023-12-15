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
        if (isset($_GET['field'], $_GET['value'], $_GET['start_date'], $_GET['end_date'])) {
            $field = $_GET['field'];
            $value = $_GET['value'];
            $start_date = $_GET['start_date'];
            $end_date = $_GET['end_date'];
            $allowedField = ['numero', 'libre', 'tipo'];
            $this->getByFieldAndDateRange($this->Model, $field, $value, $start_date, $end_date, $allowedField);
        } else {
            $this->view->response("Fechas inválidas o campo de filtrado incorrectos", 400);
            die();
        }
        
        $this->view->response("No hay unidades disponibles en el rango de fechas especificado", 404);
        die();
    
        if (empty($params)) {
            $estacionamientos = $this->Model->getEstacionamientos();
            $this->view->response($estacionamientos);
        }
    }
    
  public function validarFechas($fechaIni,$fechaFin){
    $start_date_valid = strtotime($fechaIni) !== false;
        $end_date_valid = strtotime($fechaFin) !== false;
    return $start_date_valid && $end_date_valid;
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