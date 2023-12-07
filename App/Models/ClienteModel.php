<?php 

class clienteModel extends DB{
    public function getclientes(){
       
        $query= $this->connect()->prepare('SELECT * FROM clientes');
        $query->execute();
        $Clientes= $query->fetchAll(PDO::FETCH_OBJ);
        return $Clientes;
    }
    public function getcliente($id){
        $query= $this->connect()->prepare('SELECT * FROM clientes WHERE id_Cliente=?');
        $query->execute([$id]);
        $Cliente= $query->fetch(PDO::FETCH_OBJ);
        return $Cliente;
    }
    public function insertCliente($nombre, $apellido,$dni ,$telefono, $localidad, $email,$medioDeContacto,$tipo){
            $query = $this->connect()->prepare('INSERT INTO clientes (nombre,apellido, dni ,telefono, localidad,email, medioDeContacto,tipo ) VALUES (?,?,?,?,?,?,?,?)');
            
            if($query->execute([$nombre, $apellido,$dni ,$telefono, $localidad, $email,$medioDeContacto,$tipo])){
                $lastInsertId = $this->connect()->query('SELECT MAX(id_Cliente) FROM clientes')->fetchColumn();
            }
            
            return $lastInsertId;   
    }
    function updateCliente($nombre, $apellido,$dni ,$telefono, $localidad, $email,$medioDeContacto,$tipo,$id){
        $query= $this->connect()->prepare('UPDATE  clientes SET nombre=?,apellido=?,dni=?,telefono=?,localidad=?,email=?,medioDeContacto=?, tipo=? WHERE id_Cliente = ?');
        $query->execute([$nombre, $apellido,$dni ,$telefono, $localidad, $email,$medioDeContacto,$tipo,$id]);
        
    }   
    function delete($id) {
        $query = $this->connect()->prepare('DELETE FROM clientes WHERE id_Cliente = ?');
        $query->execute([$id]);
    }
    public function existeIdCliente($idCliente){
        $query = $this->connect()->prepare('SELECT COUNT(*) as count FROM clientes WHERE id_Cliente = ?');
        $query->execute([$idCliente]);
        $result = $query->fetch(PDO::FETCH_ASSOC);
        return $result['count'] > 0;
    }


}