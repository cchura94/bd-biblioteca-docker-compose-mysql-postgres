CREATE DATABASE biblioteca;
USE biblioteca;
# 1
CREATE TABLE categorias(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT
);
# 2
CREATE TABLE libros(
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(250) NOT NULL,
    anio_publicacion INT NOT NULL,
    editorial VARCHAR(100) NOT NULL,
    categoria_id INT NOT NULL,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);
# 3
CREATE TABLE autores(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    nacionalidad VARCHAR(100) NOT NULL,
    fecha_nac DATE
);
# 4
CREATE TABLE autor_libro(
    libro_id INT NOT NULL,
    autor_id INT NOT NULL,
    FOREIGN KEY (libro_id) REFERENCES libros(id),
    FOREIGN KEY (autor_id) REFERENCES autores(id),
    PRIMARY KEY (libro_id, autor_id)
);
# 5

CREATE TABLE ejemplares(
    id INT AUTO_INCREMENT PRIMARY KEY,
    isbn VARCHAR(20) NOT NULL,
    ubicacion VARCHAR(100),
    estado_fisico_libro VARCHAR(50),
    libro_id INT NOT NULL,
    disponible BOOLEAN DEFAULT TRUE,
    CONSTRAINT fk_ejemplares_libros
        FOREIGN KEY (libro_id)
        REFERENCES libros(id)
);

CREATE TABLE usuarios(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    nro_documento VARCHAR(25) NOT NULL,
    telefono VARCHAR(20),
    correo VARCHAR(200) NOT NULL,
    genero VARCHAR(20) NOT NULL,
    estado BOOLEAN DEFAULT TRUE
);

CREATE TABLE carnets(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nro_kardex VARCHAR(50) NOT NULL,
    fecha_emision DATE,
    fecha_caducidad DATE,
    estado VARCHAR(20),
    usuario_id INT NOT NULL UNIQUE,
    CONSTRAINT fk_carnets_usuarios
        FOREIGN KEY (usuario_id)
        REFERENCES usuarios(id)
);

CREATE TABLE prestamo(
    id INT AUTO_INCREMENT PRIMARY KEY,
    ejemplar_id INT NOT NULL,
    usuario_id INT NOT NULL,
    fecha_prestamo DATETIME NOT NULL,
    fecha_devolucion DATETIME NOT NULL,
    fecha_devolucion_real DATETIME NOT NULL,
    estado_prestamo BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (ejemplar_id) REFERENCES ejemplares(id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);