INSERT INTO
    `asignaturas`
VALUES
    (NULL, 'POO'),
    (NULL, 'LAB. 1'),
    (NULL, 'ADMON. PROY.'),
    (NULL, 'PSW'),
    (NULL, 'LAB. 2'),
    (NULL, 'BD'),
    (NULL, 'TEC. PERSONALES');

INSERT INTO
    `estados`
VALUES
    (NULL, 'En Espera'),
    (NULL, 'Atendiendo'),
    (NULL, 'Solucionado');

INSERT INTO
    `laboratorios`
VALUES
    (NULL, 'LBD'),
    (NULL, 'LDS'),
    (NULL, 'LNT'),
    (NULL, 'A4.0');

INSERT INTO
    `marcas`
VALUES
    (NULL, 'Dell'),
    (NULL, 'Hp'),
    (NULL, 'Acer');

INSERT INTO
    `prioridades`
VALUES
    (NULL, 'Alta'),
    (NULL, 'Media'),
    (NULL, 'Baja');

INSERT INTO
    `tecnicos`
VALUES
    (NULL, 'Sebastian Lopez Carrazco'),
    (NULL, 'Jesus Tenorio Davila'),
    (NULL, 'Belen Morales Pelaez');

INSERT INTO
    `sexos`
VALUES
    (NULL, 'Masculino'),
    (NULL, 'Femenino');

SELECT
    *
FROM
    `asignaturas`;

SELECT
    *
FROM
    `estados`;

SELECT
    *
FROM
    `laboratorios`;

SELECT
    *
FROM
    `marcas`;

SELECT
    *
FROM
    `prioridades`;

SELECT
    *
FROM
    `tecnicos`;

INSERT INTO
    `cpu`
VALUES
    ('CPU001', 'Computadora Negra Dell'),
    ('CPU002', 'Computadora Negra Hp'),
    ('CPU003', 'Computadora Negra Hp'),
    ('CPU004', 'Computadora Negra Hp'),
    ('CPU005', 'Computadora Negra Hp'),
    ('CPU006', 'Computadora Negra Hp');

INSERT INTO
    `teclados`
VALUES
    ('TECLADO001', 'Teclado Dell Gris'),
    ('TECLADO002', 'Teclado Dell Gris'),
    ('TECLADO003', 'Teclado Dell Gris'),
    ('TECLADO004', 'Teclado Dell Gris'),
    ('TECLADO005', 'Teclado Dell Gris'),
    ('TECLADO006', 'Teclado Hp Gris');

INSERT INTO
    `monitores`
VALUES
    ('MONITOR001', 'Monitor Dell'),
    ('MONITOR002', 'Monitor Dell'),
    ('MONITOR003', 'Monitor Dell'),
    ('MONITOR004', 'Monitor Dell'),
    ('MONITOR005', 'Monitor Dell'),
    ('MONITOR006', 'Monitor Hp');

INSERT INTO
    `mouses`
VALUES
    ('MOUSE001', 'Mouse Dell'),
    ('MOUSE002', 'Mouse Dell'),
    ('MOUSE003', 'Mouse Dell'),
    ('MOUSE004', 'Mouse Dell'),
    ('MOUSE005', 'Mouse Dell'),
    ('MOUSE006', 'Mouse Hp');

SELECT
    *
FROM
    `cpu`;

SELECT
    *
FROM
    `teclados`;

SELECT
    *
FROM
    `monitores`;

SELECT
    *
FROM
    `mouses`;

INSERT INTO
    `profesores` (
        `pro_numempleado`,
        `pro_nombre`,
        `pro_appat`,
        `pro_apmat`,
        `sex_id`,
        `pro_fnacimiento`,
        `pro_email`,
        `pro_contrasena`
    )
VALUES
    (
        20210901,
        'Ian',
        'Ayala',
        'Gonzalez',
        1,
        '2004-10-13',
        'ayala.gonzalez.ian@gmail.com',
        '99310675'
    ),
    (
        20210902,
        'Maria',
        'Suarez',
        'Marquez',
        2,
        '2005-1-19',
        'example@gmail.com',
        '131022'
    );

SELECT
    *
FROM
    `profesores`;

INSERT INTO
    `equipos`
VALUES
    (
        'LBD1',
        'CPU001',
        'TECLADO001',
        'MOUSE001',
        1,
        'MONITOR001'
    ),
    (
        'LBD2',
        'CPU002',
        'TECLADO002',
        'MOUSE002',
        2,
        'MONITOR002'
    ),
    (
        'LDS1',
        'CPU003',
        'TECLADO003',
        'MOUSE003',
        3,
        'MONITOR003'
    ),
    (
        'LDS2',
        'CPU004',
        'TECLADO004',
        'MOUSE004',
        1,
        'MONITOR004'
    ),
    (
        'LNT1',
        'CPU005',
        'TECLADO005',
        'MOUSE005',
        2,
        'MONITOR005'
    );

SELECT
    *
FROM
    `equipos`;

INSERT INTO
    `reportes` (
        `lab_id`,
        `equ_etiqueta`,
        `pro_nombre`,
        `pro_numempleado`,
        `asi_id`,
        `rep_problema`,
        `rep_estado`,
        `pri_id`,
        `est_id`,
        `tecn_id`
    )
VALUES
    (
        1,
        'LBD1',
        'Ian',
        '20210901',
        1,
        'Presenta Pantallazos azules y error al hacer click',
        'Funcional',
        1,
        1,
        1
    ),
    (
        3,
        'LDS2',
        'Maria',
        '20210902',
        4,
        'Error al boton de encendio',
        'No Funcional',
        2,
        1,
        2
    );

SELECT
    `reportes`.`rep_id` AS `ID Reporte`,
    `laboratorios`.`lab_nom` AS `Laboratorio`,
    `reportes`.`rep_fechahora` AS `Fecha y Hora Reporte`,
    `reportes`.`equ_etiqueta` AS `Etiqueta Equipo`,
    `equipos`.`cpu_serial` AS `Serial CPU`,
    `equipos`.`tec_id` AS `ID Teclado`,
    `equipos`.`mou_id` AS `ID Mouse`,
    `marcas`.`mar_nom` AS `Marca`,
    `equipos`.`mon_id` AS `ID Monitor`,
    `reportes`.`pro_nombre` AS `Nombre Responsable`,
    `reportes`.`pro_numempleado` AS `No Empleado Responsable`,
    `asignaturas`.`asi_nom` AS `ID Asignatura`,
    `reportes`.`rep_problema` AS `Reporte`,
    `reportes`.`rep_estado` AS `Estado`,
    `prioridades`.`pri_nom` AS `Prioridad Reporte`,
    `estados`.`est_nom` AS `Estado Reporte`,
    `tecnicos`.`tecn_nombrec` AS `Tecnico`
FROM
    `equipos`
    INNER JOIN `reportes` ON `reportes`.`equ_etiqueta` = `equipos`.`equ_etiqueta`
    INNER JOIN `laboratorios` ON `laboratorios`.`lab_id` = `reportes`.`lab_id`
    INNER JOIN `marcas` ON `marcas`.`mar_id` = `equipos`.`mar_id`
    INNER JOIN `asignaturas` ON `asignaturas`.`asi_id` = `reportes`.`asi_id`
    INNER JOIN `prioridades` ON `prioridades`.`pri_id` = `reportes`.`pri_id`
    INNER JOIN `estados` ON `estados`.`est_id` = `reportes`.`est_id`
    INNER JOIN `tecnicos` ON `tecnicos`.`tecn_id` = `reportes`.`tecn_id`;

SELECT
    `profesores`.`pro_id` AS `ID Cuenta`,
    `profesores`.`pro_numempleado` AS `No Empleado`,
    `profesores`.`pro_nombre` AS `Nombre`,
    `profesores`.`pro_appat` AS `Apellido Paterno`,
    `profesores`.`pro_apmat` AS `Apellido Materno`,
    `sexos`.`sex_nom` AS `Sexo`,
    `profesores`.`pro_fnacimiento` AS `Fecha Nacimiento`,
    `profesores`.`pro_email` AS `Email`,
    `profesores`.`pro_contrasena` AS `Constraseña`,
    `profesores`.`pro_creatat` AS `Fecha de Creacion`
FROM
    `profesores`
    INNER JOIN `sexos` ON `sexos`.`sex_id` = `profesores`.`sex_id`;

SELECT
    `profesores`.`pro_id` AS `ID Cuenta`,
    `profesores`.`pro_numempleado` AS `No Empleado`,
    `profesores`.`pro_nombre` AS `Nombre`,
    `profesores`.`pro_appat` AS `Apellido Paterno`,
    `profesores`.`pro_apmat` AS `Apellido Materno`,
    `sexos`.`sex_nom` AS `Sexo`,
    `profesores`.`pro_fnacimiento` AS `Fecha Nacimiento`,
    `profesores`.`pro_email` AS `Email`,
    `profesores`.`pro_contrasena` AS `Constraseña`,
    `profesores`.`pro_creatat` AS `Fecha de Creacion`
FROM
    `profesores`
    INNER JOIN `sexos` ON `sexos`.`sex_id` = `profesores`.`sex_id`
WHERE
    `profesores`.`pro_email` = 'ayala.gonzalez.ian@gmail.com'
LIMIT
    1;

SELECT
    `pro_nombre`,
    `pro_numempleado`,
    `pro_email`
FROM
    `profesores`
WHERE
    `pro_numempleado` = 20210901
    AND `pro_email` = 'ayala.gonzalez.ian@gmail.com'
LIMIT
    1;