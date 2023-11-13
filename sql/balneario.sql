-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-11-2023 a las 19:57:39
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `balneario`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_Cliente` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `localidad` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `medioDeContacto` varchar(45) NOT NULL,
  `tipo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_Cliente`, `nombre`, `apellido`, `telefono`, `localidad`, `email`, `medioDeContacto`, `tipo`) VALUES
(1, 'joaquin', 'cambareri', '2262507023', 'necochea', 'joauqincambareri@', 'telefno', 'sombrilla'),
(2, 'franco', 'ruaben', '2262507123', 'tandil', 'franco@', '2272333', 'carpa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallefactura`
--

CREATE TABLE `detallefactura` (
  `idFactura` int(11) NOT NULL,
  `NRO_PAGO` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `restan` int(11) NOT NULL,
  `medioDePago` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estacionamiento`
--

CREATE TABLE `estacionamiento` (
  `id_estacionamiento` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `libre` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadia`
--

CREATE TABLE `estadia` (
  `Id_estadia` int(11) NOT NULL,
  `id_unidad` int(11) DEFAULT NULL,
  `idEstacionamiento` int(11) DEFAULT NULL,
  `fechaInicio` date NOT NULL,
  `FechaFin` date NOT NULL,
  `en_curso` tinyint(1) DEFAULT 0,
  `finalizo` tinyint(1) DEFAULT 0,
  `id_Cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estadia`
--

INSERT INTO `estadia` (`Id_estadia`, `id_unidad`, `idEstacionamiento`, `fechaInicio`, `FechaFin`, `en_curso`, `finalizo`, `id_Cliente`) VALUES
(2, NULL, NULL, '2023-09-20', '2023-09-22', 0, 0, 2),
(8, NULL, NULL, '2002-12-28', '2002-12-28', 0, 0, 1),
(10, NULL, NULL, '2002-12-28', '2002-12-28', 0, 0, 1),
(11, NULL, NULL, '0022-01-12', '4221-03-12', 0, 0, 1),
(12, NULL, NULL, '0022-01-12', '4221-03-12', 0, 0, 1),
(13, NULL, NULL, '2002-12-28', '2003-02-12', 0, 0, 1),
(14, NULL, NULL, '2002-12-28', '2002-02-19', 0, 0, 2),
(16, NULL, NULL, '0000-00-00', '0000-00-00', 0, 0, 1),
(17, NULL, NULL, '2002-12-28', '2002-12-28', 0, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `id_factura` int(11) NOT NULL,
  `idEstadia` int(11) NOT NULL,
  `total` float NOT NULL,
  `precioXdia` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `integrantes`
--

CREATE TABLE `integrantes` (
  `id_Cliente` int(11) NOT NULL,
  `nombre` int(11) NOT NULL,
  `apellido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `ProductoID` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` text NOT NULL,
  `Precio` double NOT NULL,
  `Stock` int(11) NOT NULL,
  `Condicion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidadsombra`
--

CREATE TABLE `unidadsombra` (
  `id_unidad` int(11) NOT NULL,
  `tipo` varchar(15) NOT NULL,
  `numero` int(11) NOT NULL,
  `libre` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_User` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_User`, `username`, `password`) VALUES
(2, 'jcambareri6', '$2y$10$NV5nQMbwTb450liyemG.9.UOrHokjDl3Igaqk5yzOvUvXNNgdRO4e');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_Cliente`);

--
-- Indices de la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  ADD PRIMARY KEY (`idFactura`);

--
-- Indices de la tabla `estacionamiento`
--
ALTER TABLE `estacionamiento`
  ADD PRIMARY KEY (`id_estacionamiento`);

--
-- Indices de la tabla `estadia`
--
ALTER TABLE `estadia`
  ADD PRIMARY KEY (`Id_estadia`),
  ADD KEY `fk_idCliente` (`id_Cliente`),
  ADD KEY `fk_idUnidad` (`id_unidad`),
  ADD KEY `fk_IdEstacionamiento_estadia` (`idEstacionamiento`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `fk_idEstadia` (`idEstadia`);

--
-- Indices de la tabla `integrantes`
--
ALTER TABLE `integrantes`
  ADD PRIMARY KEY (`id_Cliente`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`ProductoID`);

--
-- Indices de la tabla `unidadsombra`
--
ALTER TABLE `unidadsombra`
  ADD PRIMARY KEY (`id_unidad`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_User`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_Cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  MODIFY `idFactura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estacionamiento`
--
ALTER TABLE `estacionamiento`
  MODIFY `id_estacionamiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estadia`
--
ALTER TABLE `estadia`
  MODIFY `Id_estadia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `integrantes`
--
ALTER TABLE `integrantes`
  MODIFY `id_Cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `ProductoID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `unidadsombra`
--
ALTER TABLE `unidadsombra`
  MODIFY `id_unidad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_User` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  ADD CONSTRAINT `fk_IdFactura_estadia` FOREIGN KEY (`idFactura`) REFERENCES `facturas` (`id_factura`);

--
-- Filtros para la tabla `estadia`
--
ALTER TABLE `estadia`
  ADD CONSTRAINT `fk_IdEstacionamiento_estadia` FOREIGN KEY (`idEstacionamiento`) REFERENCES `estacionamiento` (`id_estacionamiento`),
  ADD CONSTRAINT `fk_idCliente` FOREIGN KEY (`id_Cliente`) REFERENCES `clientes` (`id_Cliente`),
  ADD CONSTRAINT `fk_idUnidad` FOREIGN KEY (`id_unidad`) REFERENCES `unidadsombra` (`id_unidad`);

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `fk_idEstadia` FOREIGN KEY (`idEstadia`) REFERENCES `estadia` (`Id_estadia`);

--
-- Filtros para la tabla `integrantes`
--
ALTER TABLE `integrantes`
  ADD CONSTRAINT `fk_integrantes` FOREIGN KEY (`id_Cliente`) REFERENCES `clientes` (`id_Cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
