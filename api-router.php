<?php
require_once './libs/Router.php';
require_once './app/controllers/estadiaController.php';

// crea el router
$router = new Router();

// defina la tabla de ruteo
$router->addRoute('Estadias', 'GET', 'EstadiaController', 'getEstadias');
$router->addRoute('Estadias/:ID', 'GET', 'EstadiaController','getEstadias');
$router->addRoute('Estadias/:ID/:subrecurso', 'GET',    'EstadiaController', 'getEstadias'  );
 $router->addRoute('Estadias/:ID', 'DELETE', 'EstadiaController', 'delete');
 $router->addRoute('Estadias', 'POST', 'EstadiaController', 'InsertEstadia'); 

// ejecuta la ruta (sea cual sea)
$router->route($_GET["resource"],$_SERVER['REQUEST_METHOD']);