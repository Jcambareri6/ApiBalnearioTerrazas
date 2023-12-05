<?php
  
class modelUser extends DB {
  public function getByEmail($email) {
      $query = $this->connect()->prepare('SELECT * FROM usuarios WHERE username = ?');
      $query->execute([$email]);
      $user=$query->fetch(PDO::FETCH_OBJ);
      return  $user;
  }
}
