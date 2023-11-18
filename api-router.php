<?php
require_once './libs/Router.php';
require_once './app/controllers/estadiaController.php';
require_once './App/controllers/ClientesController.php';
require_once './App/controllers/EstacionamientoController.php';

// crea el router
$router = new Router();

// defina la tabla de ruteo
$router->addRoute('Estadias', 'GET', 'EstadiaController', 'getEstadias');
$router->addRoute('Estadias/:ID', 'GET', 'EstadiaController','getEstadias');
$router->addRoute('Estadias/:ID/:subrecurso', 'GET',    'EstadiaController', 'getEstadias'  );
 $router->addRoute('Estadias/:ID', 'DELETE', 'EstadiaController', 'delete');
 $router->addRoute('Estadias', 'POST', 'EstadiaController', 'InsertEstadia'); 
 $router->addRoute('Estadias/:ID', 'PUT', 'EstadiaController', 'UpdateEstadia');
 // endpoint Clientes
 $router->addRoute('Clientes', 'GET', 'ClientesController', 'GetClientes');
 $router->addRoute('Clientes/:ID', 'GET', 'ClientesController', 'GetClientes');
 $router->addRoute('Clientes/:ID/:subrecurso', 'GET', 'ClientesController', 'GetClientes');
 $router->addRoute('Clientes/', 'POST', 'ClientesController', 'GuardarCliente');
 $router->addRoute('Clientes/:ID', 'PUT', 'ClientesController', 'UpdateCliente');
 $router->addRoute('Clientes/:ID', 'DELETE', 'ClientesController', 'deleteCliente');
// endpoint Estacionamiento 
$router->addRoute('Estacionamiento', 'GET', 'estacionamientoController','getAll');
$router->addRoute('Estacionamiento/:FECHAI/:FECHAF', 'GET', 'estacionamientoController','getAll');
$router->addRoute('Estacionamiento/:ID', 'GET', 'estacionamientoController','getAll');
$router->addRoute('Estacionamiento', 'POST', 'estacionamientoController','GuardarEstacionamiento');
// ejecuta la ruta (sea cual sea)
$router->route($_GET["resource"],$_SERVER['REQUEST_METHOD']);