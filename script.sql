/*----------------DDL-------------------------*/
SHOW DATABASES; /*Mostrar las bases de datos*/
CREATE DATABASE sistema_ventas; /*Crear base de datos*/
USE sistema_ventas; /*Seleccionar base de datos*/
/*Motor de almacenamiento MyISAM, InnoDB ( ENGINE=MYISAM;)*/

DROP TABLE IF EXISTS sedes; 

CREATE TABLE sedes (
    id INT UNSIGNED AUTO_INCREMENT, 
    nombre VARCHAR(200) NOT NULL 
        CONSTRAINT `uq_nombre_sedes` UNIQUE , 
    calle VARCHAR(10) NOT NULL,
    carrera VARCHAR(10) NOT NULL,
    nomenclatura VARCHAR(10) NOT NULL, 
    barrio VARCHAR(50), 
    ciudad VARCHAR(100) NOT NULL, 
    descripcion TEXT,
    CONSTRAINT `pk_id_sedes` PRIMARY KEY(id) 
); 

DROP TABLE IF EXISTS productos; 

CREATE TABLE productos (
    id INT UNSIGNED AUTO_INCREMENT, 
    nombre VARCHAR(255) NOT NULL CONSTRAINT `uq_nombre_productos` UNIQUE , 
    descripcion VARCHAR(500), 
    numero_pasillo INT UNSIGNED NOT NULL, 
    estanteria VARCHAR(5) NOT NULL, 
    nivel INT NOT NULL, 
    precio FLOAT(6,3) UNSIGNED NOT NULL, 
    stock INT UNSIGNED, 
    id_sede INT NOT NULL, 
    CONSTRAINT `pk_id_productos` PRIMARY KEY(id), 
    CONSTRAINT `fk_id_sede_productos` 
        FOREIGN KEY (id_sede) REFERENCES sedes(id) 
);

DROP TABLE IF EXISTS usuarios; 

CREATE TABLE usuarios (
    id INT UNSIGNED AUTO_INCREMENT, 
    documento VARCHAR(100) NOT NULL,
    nombre VARCHAR(200) NOT NULL, 
    apellido VARCHAR(100) NOT NULL,
    sexo ENUM('Femenino', 'Masculino'), 
    tipo_documento ENUM('CC','CE','TI') NOT NULL, 
    fecha_nacimiento DATE, 
    nacionalidad ENUM('Colombiano', 'Venezolanos', 'Colombo-Venzolano'), 
    fecha_creacion TIMESTAMP NOT NULL, 
    CONSTRAINT `pk_id_usuarios` PRIMARY KEY(id) 
);

DROP TABLE IF EXISTS ventas; 

CREATE TABLE ventas ( 
    id INT UNSIGNED AUTO_INCREMENT, 
    fecha DATE, 
    id_vendedor INT UNSIGNED, 
    id_cliente INT UNSIGNED, 
    id_sede INT UNSIGNED, 
    CONSTRAINT `pk_id_ventas` PRIMARY KEY(id), 
    CONSTRAINT `fk_id_vendedor_ventas` FOREIGN KEY (id_vendedor) REFERENCES usuarios(id) , 
    CONSTRAINT `fk_id_cliente_ventas` FOREIGN KEY (id_cliente) REFERENCES usuarios(id), 
    CONSTRAINT `fk_id_sede_ventas` FOREIGN KEY (id_sede) REFERENCES sede(id) 
);
