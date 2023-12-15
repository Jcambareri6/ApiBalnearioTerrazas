<?php
require_once './App/views/api.view.php';
require_once './App/helpers/authHelper.php';
    
abstract class ApiController {

    protected $view;
    private $data;
    private $AuthHelper;
    function __construct() {
         $this->view = new ApiView();
        $this->data = file_get_contents('php://input');   
         $this->AuthHelper = new AuthHelper ();
       $this->autenticar();
     
    }
    private function autenticar (){
        $user=$this->AuthHelper->currentUser();
        if(!$user){
            $this->view->response("unauthorized",401);
            die();
        }        
    }

    function getData() {
        return json_decode($this->data);
    }

    protected function getByFieldAndDateRange($model, $field, $value, $start_date, $end_date, $allowedFields) {
        if ($this->validarFechas($start_date, $end_date) && in_array($field, $allowedFields)) {
            $data = $model->getByFieldValueAndDateRange($field, $value, $start_date, $end_date);
    
            if (!empty($data)) {
                $this->view->response($data, 200);
                die(); // Sale de la función para evitar la ejecución de código adicional
            } else {
                $this->view->response("No hay datos disponibles en el rango de fechas especificado", 404);
                die();
            }
        } else {
            $this->view->response("Fechas inválidas o campo de filtrado incorrectos", 400);
            die();
        }
    }
    public function validarFechas($fechaIni,$fechaFin){
        $start_date_valid = strtotime($fechaIni) !== false;
            $end_date_valid = strtotime($fechaFin) !== false;
        return $start_date_valid && $end_date_valid;
    }
}
