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

        // $user=$this->AuthHelper->currentUser();
        // if(!$user){
        //     $this->view->response("unauthorized",401);
        //     die();
        // }
    }

    function getData() {
        return json_decode($this->data);
    }
}
