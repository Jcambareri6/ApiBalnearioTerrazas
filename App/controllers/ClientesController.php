<?php
require_once './App/controllers/ApiController.php';
require_once './App/Models/ClienteModel.php';
require_once './App/helpers/authHelper.php';

class ClientesController extends ApiController{
    private $Model;
    private $authelper;
  public function __construct()
  {
    parent::__construct();
    $this->Model= new clienteModel ();
    $this->authelper= new AuthHelper();
  }
    public function GetClientes($params = null)
    {
        $user=$this->authelper->currentUser();
        if(!$user){
            $this->view->response("unauthorized",401);
            die();
        }
        if (empty($params)) {
            $Clientes = $this->Model->getclientes();
            $this->view->response($Clientes);
        } else {
            $Cliente = $this->Model->getcliente($params[':ID']);
            if (!empty($Cliente)) {
                if (!empty($params[':subrecurso'])) {
                    switch ($params[':subrecurso']) {
                        case 'nombre':
                            $this->view->response($Cliente->nombre, 200);
                            break;
                        case 'apellido':
                            $this->view->response($Cliente->apellido, 200);
                            break;
                        case 'dni':
                                $this->view->response($Cliente->dni, 200);
                        break;
                        case 'telefono':
                            $this->view->response($Cliente->telefono, 200);
                            break;
                        case 'localidad':
                            $this->view->response($Cliente->localidad, 200);
                            break;
                        case 'email':
                            $this->view->response($Cliente->email, 200);
                            break;
                        case 'medioDeContacto':
                            $this->view->response($Cliente->email, 200);
                            break;
                        case 'tipo':
                            $this->view->response($Cliente->tipo, 200);
                            break;
                          
                        default:
                            $this->view->response('La estadia no contiene ' . $params[':subrecurso'] . '.', 404);
                            break;
                    }
                } else {
                    $this->view->response($Cliente, 200);
                }
            } else {
                $this->view->response("no existe", 404);
            }
        }
    }
    public function GuardarCliente(){
        $body = $this->getData();
        $nombre = $body->nombre;
        $apellido=$body->apellido;
        $dni=$body->dni;
        $telefono = $body->telefono;
        $localidad = $body->localidad;
        $email = $body->email;
        $medioDeContacto = $body->medioDeContacto;
        $tipo = $body->tipo;
        if(empty($nombre)|| empty($apellido)|| 
        empty($telefono) || empty($localidad) || 
        empty($email) || empty($medioDeContacto) ||
        empty($tipo) || empty($dni)){
           $this->view->response("datos del clientes incompletos",404);     
        }else{
            $lastInsertID = $this->Model->insertCliente($nombre, $apellido,$dni, $telefono, $localidad, $email,$medioDeContacto,$tipo);
            $estadia = $this->Model->getcliente($lastInsertID);
            $this->view->response($estadia, 201);
        }
    }
    public function UpdateCliente($params=null){
        $id= $params[':ID'];
        $Cliente = $this->Model->getcliente($id);
        if($Cliente){
            $body = $this->getData();
            $nombre = $body->nombre;
            $apellido=$body->apellido;
            $dni=$body->dni;
            $telefono = $body->telefono;
            $localidad = $body->localidad;
            $email = $body->email;
            $medioDeContacto = $body->medioDeContacto;
            $tipo = $body->tipo;
        if(empty($nombre)|| empty($apellido)|| 
        empty($telefono) || empty($localidad) || 
        empty($email) || empty($medioDeContacto) ||
        empty($tipo) || empty($dni)){
           $this->view->response("datos del clientes incompletos",404);     
        }else{
            $this->Model->updateCliente($nombre, $apellido,$dni, $telefono, $localidad, $email,$medioDeContacto,$tipo,$id);
            $this->view->response('La tarea con id='.$id.' ha sido modificada.', 200);
        }
   
    } else{
        $this->view->response('La tarea con id='.$id.' no existe.', 404);
    }
}
    function deleteCliente($params = null)
    {
        $id = $params[':ID'];
        $this->Model->delete($id);
        $Cliente = $this->Model->getcliente($id);
        if (empty($Cliente)) {
            return $this->view->response("eliminado");
        }
        return $this->view->response("error", 404);
    }
}