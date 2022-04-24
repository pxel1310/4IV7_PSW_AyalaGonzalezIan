-- Creada por Ian Ayala "pxel1310"
DROP DATABASE IF EXISTS `reg_reportes_inmuebles`;

CREATE DATABASE IF NOT EXISTS `reg_reportes_inmuebles` DEFAULT CHARACTER SET latin1;

USE `reg_reportes_inmuebles`;

CREATE TABLE `laboratorios` (
    `lab_id` INT unsigned NOT NULL AUTO_INCREMENT,
    `lab_nom` VARCHAR(28) NOT NULL,
    PRIMARY KEY (`lab_id`),
    KEY `lab_nom` (`lab_nom`)
) DEFAULT CHARACTER SET = latin1;

CREATE TABLE `asignaturas` (
    `asi_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `asi_nom` VARCHAR(28) NOT NULL,
    PRIMARY KEY (`asi_id`),
    KEY `asi_nom` (`asi_nom`)
) DEFAULT CHARACTER SET = latin1;

CREATE TABLE `cpu` (
    `cpu_serial` VARCHAR(28) NOT NULL,
    `cpu_descripcion` VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (`cpu_serial`),
    KEY `cpu_descripcion` (`cpu_descripcion`)
) DEFAULT CHARACTER SET = latin1;

CREATE TABLE `teclados` (
    `tec_id` VARCHAR(28) NOT NULL,
    `tec_descripcion` VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (`tec_id`),
    KEY `tec_descripcion` (`tec_descripcion`)
) DEFAULT CHARACTER SET = latin1;

CREATE TABLE `mouses` (
    `mou_id` VARCHAR(28) NOT NULL,
    `mou_descripcion` VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (`mou_id`),
    KEY `mou_descripcion` (`mou_descripcion`)
) DEFAULT CHARACTER SET = latin1;

CREATE TABLE `marcas` (
    `mar_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `mar_nom` VARCHAR(128) NOT NULL,
    PRIMARY KEY (`mar_id`),
    KEY `mar_nom` (`mar_nom`)
) DEFAULT CHARACTER SET = latin1;

CREATE TABLE `monitores` (
    `mon_id` VARCHAR(28) NOT NULL,
    `mon_descripcion` VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (`mon_id`),
    KEY `mon_descripcion` (`mon_descripcion`)
) DEFAULT CHARACTER SET = latin1;

CREATE TABLE `estados` (
    `est_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `est_nom` VARCHAR(128) NOT NULL,
    PRIMARY KEY (`est_id`),
    KEY `est_nom` (`est_nom`)
) DEFAULT CHARACTER SET = latin1;

CREATE TABLE `prioridades` (
    `pri_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `pri_nom` VARCHAR(128) NOT NULL,
    PRIMARY KEY (`pri_id`),
    KEY `pri_nom` (`pri_nom`)
) DEFAULT CHARACTER SET = latin1;

CREATE TABLE `tecnicos` (
    `tecn_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `tecn_nombrec` VARCHAR(128) NOT NULL,
    PRIMARY KEY (`tecn_id`),
    KEY `tecn_nombrec` (`tecn_nombrec`)
) DEFAULT CHARACTER SET = latin1;

CREATE TABLE `sexos` (
    `sex_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `sex_nom` VARCHAR(28) NOT NULL,
    PRIMARY KEY (`sex_id`),
    KEY `sex_nom` (`sex_nom`)
) DEFAULT CHARACTER SET = latin1;

CREATE TABLE `profesores` (
    `pro_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `pro_numempleado` INT UNSIGNED NOT NULL,
    `pro_nombre` VARCHAR(25) NOT NULL,
    `pro_appat` VARCHAR(25) NOT NULL,
    `pro_apmat` VARCHAR(25) NOT NULL,
    `sex_id` INT UNSIGNED NOT NULL,
    `pro_fnacimiento` DATE DEFAULT NULL,
    `pro_email` VARCHAR(100) NOT NULL,
    `pro_contrasena` varchar(30) NOT NULL,
    `pro_creatat` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `pro_active` TINYINT(1) DEFAULT 1,
    PRIMARY KEY (`pro_id`),
    KEY `pro_numempleado` (`pro_numempleado`),
    KEY `pro_nombre` (`pro_nombre`),
    KEY `sex_id` (`sex_id`),
    UNIQUE KEY `pro_email` (`pro_email`),
    CONSTRAINT `profesores_ibfk_1` FOREIGN KEY (`sex_id`) REFERENCES `sexos` (`sex_id`)
) DEFAULT CHARACTER SET = latin1;

CREATE TABLE `equipos` (
    `equ_etiqueta` VARCHAR(10) NOT NULL,
    `cpu_serial` VARCHAR(20) NOT NULL,
    `tec_id` VARCHAR(20) NOT NULL,
    `mou_id` VARCHAR(20) NOT NULL,
    `mar_id` INT UNSIGNED NOT NULL,
    `mon_id` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`equ_etiqueta`),
    KEY `cpu_serial` (`cpu_serial`),
    KEY `tec_id` (`tec_id`),
    KEY `mou_id` (`mou_id`),
    KEY `mar_id` (`mar_id`),
    KEY `mon_id` (`mon_id`),
    CONSTRAINT `equipo_ibfk_1` FOREIGN KEY (`cpu_serial`) REFERENCES `cpu` (`cpu_serial`),
    CONSTRAINT `equipo_ibfk_2` FOREIGN KEY (`tec_id`) REFERENCES `teclados` (`tec_id`),
    CONSTRAINT `equipo_ibfk_3` FOREIGN KEY (`mou_id`) REFERENCES `mouses` (`mou_id`),
    CONSTRAINT `equipo_ibfk_4` FOREIGN KEY (`mar_id`) REFERENCES `marcas` (`mar_id`),
    CONSTRAINT `equipo_ibfk_5` FOREIGN KEY (`mon_id`) REFERENCES `monitores` (`mon_id`)
) DEFAULT CHARACTER SET = latin1;

CREATE TABLE `reportes` (
    `rep_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `lab_id` INT UNSIGNED NOT NULL,
    `rep_fechahora` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `equ_etiqueta` VARCHAR(10) NOT NULL,
    `pro_nombre` VARCHAR(25) NOT NULL,
    `pro_numempleado` INT UNSIGNED NOT NULL,
    `asi_id` INT UNSIGNED,
    `rep_problema` VARCHAR(255) NOT NULL,
    `rep_estado` ENUM('Funcional', 'No Funcional') DEFAULT NULL,
    `pri_id` INT UNSIGNED NOT NULL,
    `est_id` INT UNSIGNED DEFAULT NULL,
    `tecn_id` INT UNSIGNED,
    PRIMARY KEY (`rep_id`),
    KEY `lab_id` (`lab_id`),
    KEY `rep_fechahora` (`rep_fechahora`),
    KEY `equ_etiqueta` (`equ_etiqueta`),
    KEY `pro_nombre` (`pro_nombre`),
    KEY `pro_numempleado` (`pro_numempleado`),
    KEY `asi_id` (`asi_id`),
    KEY `rep_problema` (`rep_problema`),
    KEY `rep_estado` (`rep_estado`),
    KEY `pri_id` (`pri_id`),
    KEY `est_id` (`est_id`),
    KEY `tecn_id` (`tecn_id`),
    CONSTRAINT `reportes_ibfk_1` FOREIGN KEY (`lab_id`) REFERENCES `laboratorios` (`lab_id`),
    CONSTRAINT `reportes_ibfk_2` FOREIGN KEY (`equ_etiqueta`) REFERENCES `equipos` (`equ_etiqueta`),
    CONSTRAINT `reportes_ibfk_3` FOREIGN KEY (`pro_nombre`) REFERENCES `profesores` (`pro_nombre`),
    CONSTRAINT `reportes_ibfk_4` FOREIGN KEY (`pro_numempleado`) REFERENCES `profesores` (`pro_numempleado`),
    CONSTRAINT `reportes_ibfk_5` FOREIGN KEY (`asi_id`) REFERENCES `asignaturas` (`asi_id`),
    CONSTRAINT `reportes_ibfk_6` FOREIGN KEY (`pri_id`) REFERENCES `prioridades` (`pri_id`),
    CONSTRAINT `reportes_ibfk_7` FOREIGN KEY (`est_id`) REFERENCES `estados` (`est_id`),
    CONSTRAINT `reportes_ibfk_8` FOREIGN KEY (`tecn_id`) REFERENCES `tecnicos` (`tecn_id`)
) DEFAULT CHARACTER SET = latin1;

SHOW TABLES;

DESC `asignaturas`;

DESC `cpu`;

DESC `equipos`;

DESC `estados`;

DESC `laboratorios`;

DESC `marcas`;

DESC `monitores`;

DESC `mouses`;

DESC `prioridades`;

DESC `profesores`;

DESC `reportes`;

DESC `teclados`;

DESC `tecnicos`;

DESC `sexos`;