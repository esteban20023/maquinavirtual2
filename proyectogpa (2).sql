-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 17-11-2023 a las 00:10:43
-- Versión del servidor: 8.0.32
-- Versión de PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyectogpa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `idCategoria` int NOT NULL AUTO_INCREMENT,
  `catNombre` varchar(50) NOT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
CREATE TABLE IF NOT EXISTS `ciudad` (
  `idCiudad` int NOT NULL AUTO_INCREMENT,
  `ciuNombre` varchar(50) NOT NULL,
  PRIMARY KEY (`idCiudad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallescompra`
--

DROP TABLE IF EXISTS `detallescompra`;
CREATE TABLE IF NOT EXISTS `detallescompra` (
  `idDetallesCompra` int NOT NULL AUTO_INCREMENT,
  `detaCantidad` int NOT NULL,
  `detaValorUnitario` float NOT NULL,
  `detaValorTotal` float NOT NULL,
  `detaDescuento` float DEFAULT NULL,
  PRIMARY KEY (`idDetallesCompra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE IF NOT EXISTS `empleado` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(60) NOT NULL,
  `Apellido` varchar(60) NOT NULL,
  `Edad` varchar(11) NOT NULL,
  `Direccion` varchar(60) NOT NULL,
  `Tipo_Documento` varchar(45) NOT NULL,
  `Numero_Documento` varchar(11) NOT NULL,
  `Telefono` varchar(11) NOT NULL,
  `Tipo_Contrato` varchar(45) NOT NULL,
  `Sueldo` int NOT NULL,
  `Cargo` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`Id`, `Nombre`, `Apellido`, `Edad`, `Direccion`, `Tipo_Documento`, `Numero_Documento`, `Telefono`, `Tipo_Contrato`, `Sueldo`, `Cargo`) VALUES
(1, 'David', '', '24', 'calle 52', 'C.c', '1002697484', '320731913', 'contrato fijo ', 23, 'Administrador'),
(2, 'johan', 'martinez', '24', 'calle 52', 'C.c', '1002697484', '320731913', 'contrato fijo ', 23, 'mecanico  en jefe'),
(3, 'Fredy', 'amaya', '28', 'calle 52', 'C.c', '100269564', '320731913', 'Aprendiz', 234, 'mecanico'),
(4, 'javier', 'Jimenez', '34', 'calle 52', 'C.c', '1002697484', '320731913', 'contrato fijo ', 23, 'Administrador'),
(5, 'harrison', 'ibarra', '25', 'calle 52', 'C.c', '1002697484', '123456789', 'contrato fijo ', 23, 'Administrador'),
(6, 'David', 'Jimenez', '34', 'calle 52', 'C.c', '1002697484', '320731913', 'contrato fijo ', 23, 'Administrador'),
(7, 'David', 'Jimenez', '35', 'calle 52', 'C.c', '1002697484', '320731913', 'contrato fijo ', 34, 'Administrador'),
(8, 'yeison', 'huertas', '25', 'calle 52', 'C.c', '1002697484', '123456786', 'contrato fijo ', 23, 'Administrador'),
(9, 'yeison', 'huertas', '25', 'calle 52', 'C.c', '1002697484', '123456786', 'contrato fijo ', 23, 'Administrador'),
(15, 'David', 'Jimenez', '34', 'calle 52', 'C.c', '1002697484', '3207319136', 'Aprendiz', 34000, 'mecanico  en jefe');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

DROP TABLE IF EXISTS `marca`;
CREATE TABLE IF NOT EXISTS `marca` (
  `idMarca` int NOT NULL AUTO_INCREMENT,
  `marNombre` varchar(50) NOT NULL,
  PRIMARY KEY (`idMarca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordencompra`
--

DROP TABLE IF EXISTS `ordencompra`;
CREATE TABLE IF NOT EXISTS `ordencompra` (
  `idOrdenCompra` int NOT NULL AUTO_INCREMENT,
  `ordFechaCompra` date NOT NULL,
  `idUsuarios` int DEFAULT NULL,
  `idDetallesCompra` int DEFAULT NULL,
  `idProducto` int DEFAULT NULL,
  `idServicio` int DEFAULT NULL,
  PRIMARY KEY (`idOrdenCompra`),
  KEY `idUsuarios` (`idUsuarios`),
  KEY `idDetallesCompra` (`idDetallesCompra`),
  KEY `idProducto` (`idProducto`),
  KEY `idServicio` (`idServicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `idProducto` int NOT NULL AUTO_INCREMENT,
  `prodNombre` varchar(50) NOT NULL,
  `prodReferencia` varchar(50) NOT NULL,
  `prodCantidad` int NOT NULL,
  `prodValorUnitario` float NOT NULL,
  `idMarca` int DEFAULT NULL,
  `idCategoria` int DEFAULT NULL,
  `idProveedor` int DEFAULT NULL,
  `Url_image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `idMarca` (`idMarca`),
  KEY `idCategoria` (`idCategoria`),
  KEY `idProveedor` (`idProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE IF NOT EXISTS `proveedor` (
  `idProveedor` int NOT NULL AUTO_INCREMENT,
  `proNombre` varchar(50) NOT NULL,
  `proTelefono` varchar(50) NOT NULL,
  `proCorreo` varchar(50) NOT NULL,
  `proDireccion` varchar(50) NOT NULL,
  `idCiudad` int DEFAULT NULL,
  PRIMARY KEY (`idProveedor`),
  KEY `idCiudad` (`idCiudad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

DROP TABLE IF EXISTS `servicio`;
CREATE TABLE IF NOT EXISTS `servicio` (
  `idServicio` int NOT NULL AUTO_INCREMENT,
  `serNombre` varchar(50) NOT NULL,
  `idTipoServicio` int DEFAULT NULL,
  PRIMARY KEY (`idServicio`),
  KEY `idTipoServicio` (`idTipoServicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposervicio`
--

DROP TABLE IF EXISTS `tiposervicio`;
CREATE TABLE IF NOT EXISTS `tiposervicio` (
  `idTipoServicio` int NOT NULL AUTO_INCREMENT,
  `tipNombre` varchar(50) NOT NULL,
  PRIMARY KEY (`idTipoServicio`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tiposervicio`
--

INSERT INTO `tiposervicio` (`idTipoServicio`, `tipNombre`) VALUES
(1, 'Electrico'),
(2, 'Mecanico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `idUsuarios` int NOT NULL AUTO_INCREMENT,
  `usuNombre` varchar(50) NOT NULL,
  `usuApellido` varchar(50) NOT NULL,
  `usuTipoDocumento` varchar(50) NOT NULL,
  `usuDocumento` varchar(50) NOT NULL,
  `usuTelefono` varchar(50) NOT NULL,
  `usuCorreo` varchar(50) NOT NULL,
  `usuDireccion` varchar(50) NOT NULL,
  `usuContrasena` varchar(50) NOT NULL,
  PRIMARY KEY (`idUsuarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
CREATE TABLE IF NOT EXISTS `vehiculo` (
  `idVehiculo` int NOT NULL AUTO_INCREMENT,
  `vehPlaca` varchar(50) NOT NULL,
  `vehMarca` varchar(50) NOT NULL,
  `Nom_propetario` varchar(60) DEFAULT NULL,
  `Numero_Documento` varchar(11) DEFAULT NULL,
  `Tipo_Servicio` varchar(50) DEFAULT NULL,
  `Nombre_Servicio` varchar(50) DEFAULT NULL,
  `Precio` int DEFAULT NULL,
  PRIMARY KEY (`idVehiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`idVehiculo`, `vehPlaca`, `vehMarca`, `Nom_propetario`, `Numero_Documento`, `Tipo_Servicio`, `Nombre_Servicio`, `Precio`) VALUES
(1, 'yof34g', 'akt cr4', 'jhon amaya', '1002697484', 'electrico', 'luces', 25),
(2, 'yof34g', 'akt cr4', 'jhon amaya', '1002697484', 'electrico', 'luces', 25),
(3, 'hsfr56', 'akt cr4', 'jhon amaya', '1002697484', 'electrico', 'bateria', 25),
(4, 'hsfr57', 'akt cr4', 'david jimenez', '246513122', 'electrico', 'bateria', 30),
(5, 'yof34g', 'akt cr4', 'david jimenez', '12345678', 'electrico', 'luces', 25000),
(6, 'yof34g', 'akt cr4', 'david jimenez', '1002697484', 'electrico', 'luces', 30000),
(7, 'yof34g', 'akt cr4', 'jhon amaya', '1002697484', 'electrico', 'bateria', 25000),
(8, 'yof34g', 'akt cr4', 'jhon amaya', '1002697484', 'electrico', 'bateria', 25000),
(9, 'yok23r', 'bajja', 'miyer cardenas', '102896785', 'mecanico', 'cambio de aceite', 25000),
(10, 'yof34g', 'ktm', 'harrison ibarra', '1002697484', 'mecanico', 'cambio de aceite', 30000),
(11, 'yof34g', 'bajja', 'david jimenez', '1002697484', 'mecanico', 'kit de arrastre', 150000),
(12, 'yof34g', 'bajja', 'david jimenez', '1002697484', 'mecanico', 'kit de arrastre', 150000),
(13, 'god45rd', 'akt cr4', 'david jimenez', '1002697484', 'electrico', 'bateria', 30000),
(14, 'god45rd', 'akt cr4', 'david jimenez', '1002697484', 'electrico', 'bateria', 30000),
(15, 'hsfr57', 'akt cr4', 'david jimenez', '1002697484', 'mecanico', 'cambio de aceite', 30000),
(16, 'hsfr57', 'akt cr4', 'david jimenez', '1002697484', 'mecanico', 'cambio de aceite', 30000),
(17, 'god45rd', 'ktm', 'jhon amaya', '1002697484', 'mecanico', 'cambio de aceite', 30000);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ordencompra`
--
ALTER TABLE `ordencompra`
  ADD CONSTRAINT `ordencompra_ibfk_1` FOREIGN KEY (`idUsuarios`) REFERENCES `usuarios` (`idUsuarios`),
  ADD CONSTRAINT `ordencompra_ibfk_2` FOREIGN KEY (`idDetallesCompra`) REFERENCES `detallescompra` (`idDetallesCompra`),
  ADD CONSTRAINT `ordencompra_ibfk_3` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`),
  ADD CONSTRAINT `ordencompra_ibfk_4` FOREIGN KEY (`idServicio`) REFERENCES `servicio` (`idServicio`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`idMarca`) REFERENCES `marca` (`idMarca`),
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`),
  ADD CONSTRAINT `producto_ibfk_3` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`);

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`idCiudad`) REFERENCES `ciudad` (`idCiudad`);

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `servicio_ibfk_1` FOREIGN KEY (`idTipoServicio`) REFERENCES `tiposervicio` (`idTipoServicio`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
