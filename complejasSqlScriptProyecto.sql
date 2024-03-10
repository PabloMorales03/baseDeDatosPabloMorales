DROP DATABASE IF EXISTS tienda_vuitton;
CREATE DATABASE tienda_vuitton;
USE tienda_vuitton;

CREATE TABLE persona(
    dni CHAR(9) PRIMARY KEY, 
    nombre VARCHAR(50),
    apellidos VARCHAR(50),
    direccion VARCHAR(100),
    telefono CHAR(9)
);

DESCRIBE persona;

CREATE TABLE empleado(
    id_empleado INT PRIMARY KEY AUTO_INCREMENT,
    dni CHAR(9),
    CONSTRAINT fk_empleado_persona FOREIGN KEY (dni) REFERENCES persona(dni)
);

DESCRIBE empleado;

CREATE TABLE atcliente(
    id_empleado INT PRIMARY KEY AUTO_INCREMENT,
    edad INT,
    sueldo DECIMAL(6,2),
    CONSTRAINT fk_atcliente_empleado FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
);

DESCRIBE atcliente;

CREATE TABLE transportista(
    id_empleado INT PRIMARY KEY AUTO_INCREMENT,
    color_pelo VARCHAR(20),
    CONSTRAINT fk_transportista_empleado FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
);

DESCRIBE transportista;

CREATE TABLE jefe(
    id_jefe INT PRIMARY KEY AUTO_INCREMENT,
    dni CHAR(9),
    CONSTRAINT fk_jefe_persona FOREIGN KEY (dni) REFERENCES persona(dni)
);

DESCRIBE jefe;

CREATE TABLE cliente(
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    dni CHAR(9),
    CONSTRAINT fk_cliente_persona FOREIGN KEY (dni) REFERENCES persona(dni)
);

DESCRIBE cliente;

CREATE TABLE tienda(
    id_tienda INT PRIMARY KEY AUTO_INCREMENT, 
    anio_construccion YEAR,
    fecha_apertura DATE,
    direccion VARCHAR(100),
    id_jefe INT,
    CONSTRAINT fk_tienda_jefe FOREIGN KEY (id_jefe) REFERENCES jefe(id_jefe)
);

DESCRIBE tienda;

CREATE TABLE producto(
    referencia INT PRIMARY KEY AUTO_INCREMENT, 
    tejido VARCHAR(50),
    calidad VARCHAR(25),
    precio DECIMAL(6,2)
);

DESCRIBE producto;

CREATE TABLE compra(
    hora_compra INT PRIMARY KEY,
    id_cliente INT,
    referencia INT,
    CONSTRAINT fk_compra_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    CONSTRAINT fk_compra_producto FOREIGN KEY (referencia) REFERENCES producto(referencia)
);

DESCRIBE compra;

CREATE TABLE joyas(
    id_joyas INT PRIMARY KEY AUTO_INCREMENT,
    referencia INT,
    tipo_joyas CHAR(1),
    CONSTRAINT chk_tipo_joyas CHECK (tipo_joyas IN ('P','O')),  -- pueden ser de plata o de oro
    CONSTRAINT fk_joyas_producto FOREIGN KEY (referencia) REFERENCES producto(referencia)
);

DESCRIBE joyas;

CREATE TABLE ropa(
    id_ropa INT PRIMARY KEY AUTO_INCREMENT,
    referencia INT,
    tipo_ropa CHAR(1),
    CONSTRAINT chk_tipo_ropa CHECK (tipo_ropa IN ('V','I')), -- de verano o de invierno
    CONSTRAINT fk_ropa_producto FOREIGN KEY (referencia) REFERENCES producto(referencia)
);

DESCRIBE ropa;

CREATE TABLE complementos(
    id_complementos INT PRIMARY KEY AUTO_INCREMENT,
    referencia INT,
    tipo_complementos CHAR(1),
    CONSTRAINT chk_tipo_complementos CHECK (tipo_complementos IN ('A','V')),    -- actual o vintage
    CONSTRAINT fk_complementos_producto FOREIGN KEY (referencia) REFERENCES producto(referencia)
);

DESCRIBE complementos;





-- Ahora, tras haber creado las tablas, pasaremos a insertar los datos en cada una de ellas


INSERT INTO persona (dni, nombre, apellidos, direccion, telefono) VALUES ('28756358V', 'Juan', 'Algaba', 'C/Real', '955456678');
INSERT INTO persona (dni, nombre, apellidos, direccion, telefono) VALUES ('28756358F', 'Fran', 'Morales', 'C/Aston', '987676543');
INSERT INTO persona (dni, nombre, apellidos, direccion, telefono) VALUES ('25367824F', 'Kevin', 'Lopez', 'C/Alcor', '976545678');
INSERT INTO persona (dni, nombre, apellidos, direccion, telefono) VALUES ('73589065L', 'Laura', 'Ruiz', 'C/Clavel', '987812345');
INSERT INTO persona (dni, nombre, apellidos, direccion, telefono) VALUES ('23413234S', 'Alvaro', 'Muñoz', 'C/Messi', '975234232');
INSERT INTO persona (dni, nombre, apellidos, direccion, telefono) VALUES ('19029387H', 'Julia', 'Macias', 'C/Ronaldo', '955263525');
INSERT INTO persona (dni, nombre, apellidos, direccion, telefono) VALUES ('92637655S', 'Irene', 'Borreguero', 'C/Isidro', '950909090');
INSERT INTO persona (dni, nombre, apellidos, direccion, telefono) VALUES ('09876543D', 'Marta', 'Leon', 'C/Fraternidad', '956567899');
INSERT INTO persona (dni, nombre, apellidos, direccion, telefono) VALUES ('12321234E', 'Sonia', 'Algaba', 'C/Cañalizo', '955456000');
INSERT INTO persona (dni, nombre, apellidos, direccion, telefono) VALUES ('90908765G', 'Pablo', 'Algaba', 'C/Albaicin', '955450078');


INSERT INTO empleado (dni) VALUES 
('12321234K'),
('24567890K'),
('63787678L'),
('12321200K'),
('76389087H'),
('92999999F'),
('12435625G'),
('23435434F'),
('00019181H'),
('12345654A');


INSERT INTO atcliente (id_empleado, edad, sueldo) VALUES 
(1, 30, 2500.00),
(2, 35, 2800.00),
(3, 28, 2200.00),
(4, 32, 2700.00),
(5, 29, 2600.00),
(6, 33, 3000.00),
(7, 31, 2400.00),
(8, 36, 2900.00),
(9, 27, 2100.00),
(10, 34, 3200.00);


INSERT INTO transportista (id_empleado, color_pelo) VALUES 
(11, 'Negro'),
(12, 'Rubio'),
(13, 'Castano'),
(14, 'Negro'),
(15, 'Negro'),
(16, 'Rubio'),
(17, 'Castano'),
(18, 'Ngro'),
(19, 'Negro'),
(20, 'Rubio');


INSERT INTO producto (referencia, tejido, calidad, precio) VALUES 
(1, 'Algodón', 'Alta', 29.99),
(2, 'Seda', 'Baja', 49.99),
(3, 'Lana', 'Media', 39.99),
(4, 'Lana', 'Baja', 19.99),
(5, 'Polister', 'Media', 34.99),
(6, 'Cuero', 'Alta', 69.99),
(7, 'Lino', 'Media', 44.99),
(8, 'Lana', 'Baja', 14.99),
(9, 'Cuero', 'Baaja', 89.99),
(10, 'Cuero', 'Media', 24.99);


INSERT INTO jefe (dni) VALUES 
('11111111A'),
('22222222B'),
('33333333C'),
('44444444D'),
('55555555E'),
('66666666F'),
('77777777G'),
('88888888H'),
('99999999I'),
('10101010J');


INSERT INTO tienda (anio_construccion, fecha_apertura, direccion, id_jefe) VALUES 
(2020, '2020-01-01', 'C/Ppal', 1),
(2018, '2018-03-15', 'Avenida Central', 2),
(2019, '2019-07-10', 'C/Mayor', 3),
(2017, '2017-05-20', 'C/Parque', 4),
(2016, '2016-11-30', 'C/Callejon', 5),
(2021, '2021-09-05', 'Avenida de la Paz', 6),
(2015, '2015-04-12', 'C/Camino Real', 7),
(2014, '2014-08-25', 'Avenida de la paz', 8),
(2013, '2013-10-18', 'C/Rosario', 9),
(2012, '2012-12-01', 'C/Rosario', 10);


INSERT INTO cliente (dni) VALUES 
('11111111A'),
('22222222B'),
('33333333C'),
('44444444D'),
('55555555E'),
('66666666F'),
('77777777G'),
('88888888H'),
('99999999I'),
('10101010J');


-- problemas en la inserccion de datos de la tabla compra porque la hora de compra puede coincidir


INSERT INTO joyas (referencia, tipo_joyas) VALUES 
(1, 'P'),
(2, 'O'),
(3, 'P'),
(4, 'O'),
(5, 'P'),
(6, 'O'),
(7, 'P'),
(8, 'O'),
(9, 'P'),
(10, 'O');


INSERT INTO ropa (referencia, tipo_ropa) VALUES 
(1, 'V'),
(2, 'I'),
(3, 'I'),
(4, 'I'),
(5, 'V'),
(6, 'V'),
(7, 'V'),
(8, 'I'),
(9, 'I'),
(10, 'V');


INSERT INTO joyas (referencia, tipo_joyas) VALUES 
(1, 'V'),
(2, 'V'),
(3, 'V'),
(4, 'A'),
(5, 'V'),
(6, 'A'),
(7, 'V'),
(8, 'A'),
(9, 'V'),
(10, 'A');








-- Estas son las consultas simples

-- Muestrame todos los registros de la tabla persona.
SELECT * FROM persona;

-- Ahora, sólo muestra (de la tabla persona) el dni de las personas cuyo nombre sea Marta. 
SELECT dni FROM persona
WHERE nombre = 'Marta';

-- Mostrar aquellas personas cuyo nombre empiece por ‘L’
SELECT * FROM persona
WHERE nombre LIKE 'L%';




