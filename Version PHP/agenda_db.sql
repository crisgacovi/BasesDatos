SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/* Base de datos: `agenda_db` */

CREATE DATABASE agenda_db;

/* Estructura para la tabla `eventos` */

CREATE TABLE `eventos` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `titulo` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fecha_inicio` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `fecha_fin` date NOT NULL,
  `hora_fin` time NOT NULL,
  `dia_completo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/* Inserción de datos para la tabla `eventos` */

INSERT INTO `eventos` (`id`, `user_id`, `titulo`, `fecha_inicio`, `hora_inicio`, `fecha_fin`, `hora_fin`, `dia_completo`) VALUES
(1, 1, 'Partido de futbol', '2019-07-21', '12:00:00', '2019-07-21', '14:00:00', 0),
(2, 1, 'Reunion con amigos', '2019-07-26', '19:00:00', '2019-07-26', '23:30:00', 0),
(3, 1, 'Cumple de jefe', '2019-08-01', '10:00:00', '2019-08-01', '11:00:00', 0);

/* Estructura para la tabla `usuarios` */

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `email` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `clave` varchar(255) COLLATE latin1_spanish_ci NOT NULL,
  `nacimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/* Inserción de datos para la tabla `usuarios`. Clave: 123456 */

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `clave`, `nacimiento`) VALUES
(1, 'Cristian Coronado', 'crisgacovi@hotmail.com', '$2y$10$jFnBSqxxec7ZSD4pg63UzO6wy38UTPAx9g6PrS0p/TDDHntOmftue', '1979-07-11'),
(2, 'Paula Barón', 'paucar2030@hotmail.com', '$2y$10$Oh1QOpQXy2vo0s0rZRK90eT8Akysegn68IKSzcBlKEn02LXE3wGie', '1986-10-13'),
(3, 'Nancy Coronado', 'mana_covi@yahoo.com', '$2y$10$cK3ZxXbGov.Kxocl8dugqu314uuFZvaEq7ZdDvlx0CzcJDRDUOGCO', '1969-11-16');

/* Indices de la tabla `eventos` */

ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_eventos_usuarios` (`user_id`);

/* Indices de la tabla `usuarios` */

ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

/* AUTO_INCREMENT de la tabla `eventos` */

ALTER TABLE `eventos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

/* AUTO_INCREMENT de la tabla `usuarios` */

ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

/* Restricción para tabla `eventos` */

ALTER TABLE `eventos`
  ADD CONSTRAINT `fk_eventos_usuarios` FOREIGN KEY (`user_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

