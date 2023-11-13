<?php
  require  './app/model/Model.php';
class modelUser extends DB {
    private $db;
     public function __construct()
     {
    
       $this->db= new DB(); 
     }
    
   
    public function authenticate ($username,$password){   
    
    $sql = 'SELECT * FROM usuarios WHERE username = ? ';
        $stmt = $this->db->connect()->prepare($sql);
        $stmt->execute([$username]);

        $usuario = $stmt->fetch(PDO::FETCH_OBJ);

        if ($usuario && password_verify($password, $usuario->password)) {
         
           return $usuario; // Usuario autenticado
        
        }
       
    return false;
   }
      
   
}