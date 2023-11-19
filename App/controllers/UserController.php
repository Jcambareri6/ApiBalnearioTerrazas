<?php
    require_once './App/Models/ModelUser.php';
    require_once './App/helpers/authHelper.php';

    class UserApiController  {
        private $model;
        private $authHelper;
        private $view;

        function __construct() {
           
            $this->authHelper = new AuthHelper();
            $this->model = new modelUser();
            $this->view= new ApiView() ;
        }

        function getToken($params = []) {
            $basic = $this->authHelper->getAuthHeaders(); // Darnos el header 'Authorization:' 'Basic: base64(usr:pass)'
            
            if(empty($basic)) {
                //
                $this->view->response('No envió encabezados de autenticación.', 401);
                return;
            }

            $basic = explode(" ", $basic); // ["Basic", "base64(usr:pass)"]
            
            if($basic[0]!="Basic") {
                $this->view->response('Los encabezados de autenticación son incorrectos.', 401);
                return;
            }

            $userpass = base64_decode($basic[1]); // usr:pass
            $userpass = explode(":", $userpass); // ["usr", "pass"]

            $user = $userpass[0];
            $pass = $userpass[1];

            $userdata = $this->model->getByEmail($user); // Llamar a la DB
        
            if ( $user==$userdata->username && password_verify($pass,$userdata->password)) {
                // Usuario es válido
                
                $token = $this->authHelper->createToken($userdata);
                $this->view->response($token);
            } else {
                $this->view->response('El usuario o contraseña son incorrectos.', 401);
            }
        }
    }