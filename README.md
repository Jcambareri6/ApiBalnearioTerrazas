# Sistema de Administración de Balnearios - Backend

## Descripción General

El backend del Sistema de Administración de Balnearios está desarrollado en PHP puro y utiliza un enrutador personalizado para gestionar las diversas operaciones del sistema. Este componente es esencial para la gestión de estadias, registro de clientes, facturación, administración de espacios (estacionamiento y unidades sombra) y otras funciones clave del sistema.

## Estructura del Proyecto

La estructura del proyecto se organiza de la siguiente manera:

- **/libs:** Contiene archivos y clases esenciales para el funcionamiento del enrutador.
- **/app/controllers:** Almacena los controladores de cada entidad del sistema

## Endpoints y Funcionalidades

### ESTADIAS 

- `GET /Estadias`: Obtiene todas las estancias del balneario.
- `GET /Estadias/:ID`: Obtiene información detallada de una estadia específica según su ID.
- `POST /Estadias`: Inserta una nueva estadia en el sistema.
- `PUT /Estadias/:ID`: Actualiza la información de una estadia existente.
- `DELETE /Estadias/:ID`: Elimina una estadia según su ID.


#### 
- **GET /Clientes**: Obtiene información de todos los clientes registrados.
- **GET /Clientes/:ID**: Obtiene información detallada de un cliente específico según su ID.
- **POST /Clientes**: Registra un nuevo cliente en el sistema.
- **PUT /Clientes/:ID**: Actualiza la información de un cliente existente.
- **DELETE /Clientes/:ID**: Elimina un cliente según su ID.
- 

##### ESTACIONAMIENTO
GET /Estacionamiento: Obtiene información sobre el estacionamiento.
GET /Estacionamiento/:FECHAI/:FECHAF: Obtiene información sobre el estacionamiento en un rango de fechas.
GET /Estacionamiento/:ID: Obtiene detalles sobre el estacionamiento según su ID.
POST /Estacionamiento: Registra información sobre el estacionamiento.
PUT /Estacionamiento/:ID: Actualiza la información del estacionamiento.
###### UNIDAD SOMBRA: 
###### obtiene los datos sobre la sombrillas y las carpas ingresadas en el sistema

GET /unidadSombra: Obtiene información sobre las unidades de sombra.
GET /unidadSombra/:ID: Obtiene detalles de una unidad de sombra según su ID.
GET /unidadSombra/:FECHAI/:FECHAF: Obtiene información sobre las unidades de sombra en un rango de fechas.
POST /unidadSombra: Registra información sobre una nueva unidad de sombra.
##### FACTURAS
GET /facturas: Obtiene información sobre las facturas generadas.
GET /facturas/:ID: Obtiene detalles de una factura según su ID.
POST /facturas: Genera una nueva factura.
PUT /facturas/:ID: Actualiza la información de una factura existente.
##### Usuario
GET /user/token: Obtiene un token de usuario para autenticación.

**Importante**: Para acceder a estos endpoints, es necesario validar los datos del administrador mediante un proceso de autenticación.


