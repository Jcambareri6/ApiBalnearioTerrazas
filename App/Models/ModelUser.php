<?php
  
class modelUser extends DB {
  public function getByEmail($email) {
    var_dump("el usuario que se ingreso a la bd es ". $email);
      $query = $this->connect()->prepare('SELECT * FROM usuarios WHERE username = ?');
      $query->execute([$email]);
      var_dump($user=$query->fetch(PDO::FETCH_OBJ));
      return  $user;
  }
}
