-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-11-2023 a las 21:59:43
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

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
  `dni` varchar(100) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `localidad` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `medioDeContacto` varchar(45) NOT NULL,
  `tipo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_Cliente`, `nombre`, `apellido`, `dni`, `telefono`, `localidad`, `email`, `medioDeContacto`, `tipo`) VALUES
(1, 'joaquin', 'cambareri', '', '2262507023', 'necochea', 'joauqincambareri@', 'telefno', 'sombrilla'),
(2, 'franco', 'ruaben', '', '2262507123', 'tandil', 'franco@', '2272333', 'carpa'),
(4, 'RUSO', 'ANGLADETTE', '', '2262489833', 'Pringles', 'ruso02@gmail', 'email', 'carpa'),
(5, 'abril', 'Cambareri', '', '2262489833', 'necochea', 'abril@gmail', 'email', 'sombrilla'),
(6, 'abril', 'Cambareri', '', '2262489833', 'necochea', 'abril@gmail', 'email', 'sombrilla'),
(7, 'abril', 'Cambareri', '44046999', '2262489833', 'necochea', 'abril@gmail', 'email', 'sombrilla'),
(8, 'miguel', 'cabodevila', '5392134', '2262445677', 'Tandil', 'Miguel@gmail', 'Telefono', 'sombrilla');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallefactura`
--

CREATE TABLE `detallefactura` (
  `id_factura` int(11) NOT NULL,
  `NRO_PAGO` int(11) NOT NULL,
  `pago` int(11) NOT NULL,
  `restan` int(11) NOT NULL,
  `medioDePago` varchar(45) NOT NULL,
  `id_Facturas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detallefactura`
--

INSERT INTO `detallefactura` (`id_factura`, `NRO_PAGO`, `pago`, `restan`, `medioDePago`, `id_Facturas`) VALUES
(1, 1, 2000, 4, 'EFECTIVO', 4),
(2, 1, 2000, 4, 'EFECTIVO', 4),
(3, 1, 2000, 4, 'EFECTIVO', 4),
(4, 1, 2000, 4, 'EFECTIVO', 5),
(5, 1, 2000, 4, 'EFECTIVO', 5),
(6, 1, 2000, 4, 'EFECTIVO', 4),
(7, 1, 2000, 4, 'EFECTIVO', 4),
(8, 1, 2000, 4, 'EFECTIVO', 5),
(9, 1, 2000, 4, 'EFECTIVO', 5),
(10, 1, 2000, 4, 'EFECTIVO', 5),
(11, 1, 8000, 4, 'EFECTIVO', 5),
(12, 1, 2000, 4, 'EFECTIVO', 5),
(13, 1, 8000, 4, 'EFECTIVO', 5),
(14, 1, 8000, 4, 'EFECTIVO', 5),
(15, 1, 2000, 4, 'EFECTIVO', 5),
(16, 1, 2000, 4, 'EFECTIVO', 5),
(17, 1, 2000, 4, 'EFECTIVO', 5),
(18, 1, 2000, 4, 'EFECTIVO', 5),
(19, 1, 2000, 4, 'EFECTIVO', 5),
(20, 1, 8000, 4, 'EFECTIVO', 5),
(21, 1, 8000, 4, 'EFECTIVO', 5),
(24, 1, 8000, 4, 'EFECTIVO', 5),
(25, 1, 2000, 4, 'EFECTIVO', 5),
(26, 1, 2000, 4, 'EFECTIVO', 5),
(27, 1, 2000, 4, 'EFECTIVO', 5),
(28, 1, 3000, 4, 'EFECTIVO', 5),
(29, 1, 3000, 4, 'EFECTIVO', 5),
(30, 1, 7000, 4, 'EFECTIVO', 5),
(31, 1, 7000, 4, 'EFECTIVO', 5),
(32, 1, 3000, 4, 'EFECTIVO', 5),
(33, 1, 3000, 4, 'EFECTIVO', 5),
(34, 1, 3000, 4, 'EFECTIVO', 5),
(35, 1, 3000, 4, 'EFECTIVO', 5),
(36, 1, 3000, 4, 'EFECTIVO', 5),
(37, 1, 3000, 4, 'EFECTIVO', 5),
(38, 1, 4000, 4, 'EFECTIVO', 5),
(39, 1, 4000, 4, 'EFECTIVO', 5),
(40, 1, 6000, 4, 'EFECTIVO', 5),
(41, 1, 6000, 4, 'EFECTIVO', 5),
(42, 1, 6000, 4, 'EFECTIVO', 5),
(43, 1, 6000, 4, 'EFECTIVO', 5),
(44, 1, 4000, 4, 'EFECTIVO', 5),
(45, 1, 4000, 4, 'EFECTIVO', 5),
(46, 1, 6000, 4, 'EFECTIVO', 5),
(47, 1, 4000, 4, 'EFECTIVO', 5),
(48, 1, 6000, 4, 'EFECTIVO', 5),
(49, 1, 6000, 4, 'EFECTIVO', 5),
(50, 1, 6000, 4, 'EFECTIVO', 5),
(51, 1, 4000, 4, 'EFECTIVO', 5),
(52, 1, 5000, 4, 'EFECTIVO', 5),
(53, 1, 5000, 4, 'EFECTIVO', 5),
(54, 1, 5000, 4, 'EFECTIVO', 5),
(55, 1, 5000, 4, 'EFECTIVO', 5),
(56, 1, 5000, 4, 'EFECTIVO', 5),
(57, 1, 5000, 4, 'EFECTIVO', 5),
(58, 1, 5000, 4, 'EFECTIVO', 5),
(59, 1, 5000, 4, 'EFECTIVO', 5),
(60, 1, 5000, 4, 'EFECTIVO', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estacionamiento`
--

CREATE TABLE `estacionamiento` (
  `id_estacionamiento` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `libre` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estacionamiento`
--

INSERT INTO `estacionamiento` (`id_estacionamiento`, `numero`, `libre`) VALUES
(1, 1, 0),
(2, 2, 0),
(3, 1, 1),
(4, 1, 0),
(5, 1, 0),
(6, 1, 1),
(7, 1, 0),
(8, 1, 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estadia`
--

INSERT INTO `estadia` (`Id_estadia`, `id_unidad`, `idEstacionamiento`, `fechaInicio`, `FechaFin`, `en_curso`, `finalizo`, `id_Cliente`) VALUES
(11, NULL, NULL, '0022-01-12', '4221-03-12', 0, 0, 1),
(55, 4, 3, '2023-11-18', '0000-00-00', 0, 1, 6),
(58, 9, 3, '2023-11-22', '2023-11-22', 0, 1, 1),
(59, 8, NULL, '2023-11-08', '2023-09-09', 0, 1, 6),
(60, 2, 5, '2023-11-08', '2023-11-09', 0, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `idFacturas` int(11) NOT NULL,
  `idEstadia` int(11) NOT NULL,
  `total` float NOT NULL,
  `precioXdia` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`idFacturas`, `idEstadia`, `total`, `precioXdia`) VALUES
(4, 55, 10000, 2000),
(5, 60, 5000, 2000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `integrantes`
--

CREATE TABLE `integrantes` (
  `id_Cliente` int(11) NOT NULL,
  `nombre` int(11) NOT NULL,
  `apellido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidadsombra`
--

CREATE TABLE `unidadsombra` (
  `id_unidad` int(11) NOT NULL,
  `tipo` varchar(15) NOT NULL,
  `numero` int(11) NOT NULL,
  `libre` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `unidadsombra`
--

INSERT INTO `unidadsombra` (`id_unidad`, `tipo`, `numero`, `libre`) VALUES
(1, 'SOMB', 0, 1),
(2, 'carpa', 2, 0),
(3, 'sombrilla', 3, 0),
(4, 'carpa', 4, 0),
(5, 'carpa', 5, 1),
(6, 'carpa', 5, 1),
(7, 'carpa', 5, 1),
(8, 'carpa', 5, 1),
(9, 'carpa', 1, 0),
(10, 'sombrilla', 5, 1),
(11, 'sombrilla', 5, 1),
(12, 'sombrilla', 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_User` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_User`, `username`, `password`) VALUES
(2, 'jcambareri6', '$2y$10$hYzDk8cL0MzBb6xZ0SpKwuRs1oHnOsa4LUVSPgPWsGceX8IZtrNkW');

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
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `idFacturaFK` (`id_Facturas`);

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
  ADD PRIMARY KEY (`idFacturas`),
  ADD KEY `fk_idEstadia` (`idEstadia`);

--
-- Indices de la tabla `integrantes`
--
ALTER TABLE `integrantes`
  ADD PRIMARY KEY (`id_Cliente`);

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
  MODIFY `id_Cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `estacionamiento`
--
ALTER TABLE `estacionamiento`
  MODIFY `id_estacionamiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `estadia`
--
ALTER TABLE `estadia`
  MODIFY `Id_estadia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `idFacturas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `integrantes`
--
ALTER TABLE `integrantes`
  MODIFY `id_Cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `unidadsombra`
--
ALTER TABLE `unidadsombra`
  MODIFY `id_unidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
  ADD CONSTRAINT `idFacturaFK` FOREIGN KEY (`id_Facturas`) REFERENCES `facturas` (`idFacturas`);

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
