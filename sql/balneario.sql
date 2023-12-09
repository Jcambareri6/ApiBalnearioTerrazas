-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-12-2023 a las 14:18:29
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

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
(1, 'Nicolas', 'Angladette', '44831634', '02262486975', 'La Plata', 'nicoruso37@outlook.com', 'Redes', 'sombrilla'),
(6, 'Natalia', 'Colantonio', '2132432', '2262303506', 'Necochea', 'colantonio_n@hotmail.com', 'telefono', 'sombrilla'),
(7, 'Joaquin', 'Cambareri', '23948272', '226293826', 'Necochea', 'camba@gmail.com', 'Compu', 'sombrilla'),
(8, 'Franco', 'Ruaben', '43928372', '2262937263', 'Tandil', 'Franco@gmail.com', 'Redes', 'carpa'),
(9, 'Joaquin', 'Cambareri', '43902826', '226287394', 'Azul', 'camba@gmail.com', 'Redes', 'sombrilla'),
(10, 'Joaquin', 'cambareri', '44046999', '02262580775', 'Necochea - Quequén', 'joaquin.cambareri@eest3necochea.edu.ar', 'gmail', 'sombrilla'),
(11, 'Joaquin', 'cambareri', '44046999', '02262580775', 'Necochea - Quequén', 'joaquin.cambareri@eest3necochea.edu.ar', 'gmail', 'sombrilla'),
(12, 'Joaquin', 'cambareri', '44046999', '02262580775', 'Tandil', 'joaquincambareri@gmail.com', 'gmail', 'sombrilla'),
(13, 'Joaquin', 'cambareri', '44046999', '02262580775', 'Necochea - Quequén', 'joaquin.cambareri@eest3necochea.edu.ar', 'gmail', 'sombrilla');

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estacionamiento`
--

CREATE TABLE `estacionamiento` (
  `id_estacionamiento` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `libre` tinyint(1) NOT NULL,
  `tipo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estacionamiento`
--

INSERT INTO `estacionamiento` (`id_estacionamiento`, `numero`, `libre`, `tipo`) VALUES
(1, 1, 0, 'Sol'),
(2, 20, 0, 'Sombra');

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
(1, NULL, 1, '2023-12-08', '2023-12-15', 1, 0, 8),
(2, 2, NULL, '2023-12-05', '2023-12-15', 1, 0, 7),
(3, 1, 2, '2023-12-21', '2023-12-30', 1, 0, 6),
(4, 1, NULL, '2023-12-23', '2023-12-30', 1, 0, 9),
(5, 2, 2, '2024-01-01', '2024-01-07', 1, 0, 13),
(6, 2, 2, '2024-01-04', '2024-01-13', 1, 0, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `idFacturas` int(11) NOT NULL,
  `idEstadia` int(11) NOT NULL,
  `total` float NOT NULL,
  `precioXdia` float NOT NULL,
  `concepto` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`idFacturas`, `idEstadia`, `total`, `precioXdia`, `concepto`) VALUES
(1, 2, 290000, 12000, '30 dias'),
(2, 2, 250000, 25000, '10 dias'),
(3, 2, 250000, 25000, '10 dias');

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
(1, 'Carpa', 10, 0),
(2, 'Sombrilla', 11, 0);

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
(1, 'balneario_terrazas', '$2y$10$bYJXhXU4cCgIwCE0rMF5qeOh/MtrRb1d01SyiGEUaAko8HNhxHZbS');

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
  MODIFY `id_Cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estacionamiento`
--
ALTER TABLE `estacionamiento`
  MODIFY `id_estacionamiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estadia`
--
ALTER TABLE `estadia`
  MODIFY `Id_estadia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `idFacturas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `integrantes`
--
ALTER TABLE `integrantes`
  MODIFY `id_Cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `unidadsombra`
--
ALTER TABLE `unidadsombra`
  MODIFY `id_unidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_User` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
