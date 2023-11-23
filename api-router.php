<?php
require_once './libs/Router.php';
require_once './app/controllers/estadiaController.php';
require_once './App/controllers/ClientesController.php';
require_once './App/controllers/EstacionamientoController.php';
require_once './App/controllers/UnidadSombracontroller.php';
require_once './App/controllers/UserController.php';
require_once './App/controllers/detalleFacturaController.php';

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
// endpoint Unidades Sombra
$router->addRoute('unidadSombra', 'GET', 'unidadSombraController','getUnidades');
$router->addRoute('unidadSombra/:ID', 'GET', 'unidadSombraController','getUnidades');
$router->addRoute('unidadSombra/:FECHAI/:FECHAF', 'GET', 'unidadSombraController','getUnidades');
$router->addRoute('unidadSombra', 'POST', 'unidadSombraController','GuardarUnidadSombra');
// endpoint detalleFactura
$router->addRoute('detalleFactura', 'GET', 'detalleFacturaController','getdetallesFactura');
$router->addRoute('detalleFactura/:ID', 'GET', 'detalleFacturaController','getdetallesFactura');
// usuario
$router->addRoute('user/token', 'GET',    'UserApiController', 'getToken');
// ejecuta la ruta (sea cual sea)
$router->route($_GET["resource"],$_SERVER['REQUEST_METHOD']);