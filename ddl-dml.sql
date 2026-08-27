DDL

Pregunta 1 — Agregar una columna
La biblioteca desea registrar cuántas páginas tiene cada libro.
Agrega a la tabla libros el campo:
• numero_paginas
• Tipo entero.

ALTER TABLE libros
ADD COLUMN numero_pagina INT;


Pregunta 3 — Modificar una columna
La biblioteca necesita almacenar nombres de editoriales más largos.
Modifica la columna editorial para que pueda almacenar hasta 150 caracteres.

ALTER TABLE libros
MODIFY COLUMN editorial VARCHAR(150) NOT NULL;

Pregunta 5 — Agregar una restricción UNIQUE
El ISBN de un libro no debería repetirse.
Agrega una restricción UNIQUE sobre la columna isbn.

ALTER TABLE ejemplares
ADD CONSTRAINT uq_ejemplares_isbn UNIQUE (isbn);

# DML
Pregunta 7 — Insertar categorías
Registra las siguientes categorías:
• Literatura
• Informática
• Historia
• Ciencias
Cada categoría debe tener una descripción apropiada.

INSERT INTO categorias (nombre, descripcion) 
VALUES 
('Literatura', 'Libros de novelas, cuentos, poesía y obras literarias'),
('Informática', 'Libros relacionados con computación, programación y tecnología'),
('Historia', 'Libros sobre acontecimientos y períodos históricos'),
('Ciencias', 'Libros relacionados con ciencias naturales, física, química y biología');

Pregunta 9 — Insertar libros
Registra los siguientes libros:
• Cien años de soledad
• Introducción a MySQL
• Historia de Bolivia
• Programación Web
• Ciencia y tecnología

Recuerda utilizar categoria_id para relacionar cada libro con su categoría.

id	titulo	anio_publicacion	editorial	categoria_id	numero_pagina	

INSERT INTO libros (titulo, anio_publicacion, editorial, categoria_id, numero_pagina) 
VALUES
('Cien años de soledad', 1967, 'Editorial Sudamericana', 1, 471),
('Introducción a MySQL', 2020, 'Alfaomega', 2, 320),
('Historia de Bolivia', 2016, 'Editorial Juventud', 3, 450),
('Programación Web', 2021, 'Alfaomega', 2, 380),
('Ciencia y tecnología', 2019, 'Editorial Universitaria', 4, 300);


Pregunta 11 — Registrar ejemplares
Registra ejemplares para los libros de la biblioteca.
Algunos libros deben tener más de una copia.
Utiliza los siguientes estados según corresponda:
• DISPONIBLE
• MANTENIMIENTO

INSERT INTO ejemplares
(isbn, ubicacion, estado_fisico_libro, libro_id, disponible)
VALUES
('9780307474728', 'Estante A-01', 'DISPONIBLE', 1, TRUE),
('9780307474729', 'Estante A-01', 'DISPONIBLE', 1, TRUE),

('9788441532100', 'Estante B-01', 'DISPONIBLE', 2, TRUE),
('9788441532101', 'Estante B-01', 'MANTENIMIENTO', 2, FALSE),

('9789995412345', 'Estante C-01', 'DISPONIBLE', 3, TRUE),

('9788426734567', 'Estante B-02', 'DISPONIBLE', 4, TRUE),
('9788426734568', 'Estante B-02', 'DISPONIBLE', 4, TRUE),

('9786071512345', 'Estante D-01', 'MANTENIMIENTO', 5, FALSE);

DML
INSERT DE USUARIOS
Pregunta 13 — Registrar usuarios
Registra cuatro usuarios:
• Carlos Chávez
• María Mamani
• Juan Pérez
• Ana Quispe
Para cada usuario registra:
• nombres
• apellidos
• número de documento
• teléfono
• correo
• estado
Tres usuarios deben estar ACTIVO y uno INACTIVO

INSERT INTO usuarios (nombres, apellidos, nro_documento, telefono, correo, genero, estado)
VALUES
('Carlos', 'Chávez', '132654', '+5912321222', 'carlos@mail.com', 'MASCULINO', true),
('María', 'Mamani', '98645351', '+5916554555', 'maria@mail.com', 'FEMENINO', true),
('Juan', 'Pérez', '8645521', '+5914515455', 'juan@mail.com', 'MASCULINO', true),
('Ana', 'Quispe', '86452121', '+591875545', 'ana@mail.com', 'FEMENINO', true);


DML
INSERT DE PRÉSTAMOS
Pregunta 15 — Registrar préstamos
Registra tres préstamos realizados por diferentes usuarios.
Condiciones:
• Un préstamo debe estar DEVUELTO.
• Dos préstamos deben estar PRESTADO.
• El préstamo devuelto debe tener registrada su fecha_devolucion_real.
• Los préstamos todavía prestados deben tener fecha_devolucion_real en NULL.

- Primero fue alterar la columna fecha_devolucion_real que permita asignar valores NULL

ALTER TABLE prestamo
MODIFY COLUMN fecha_devolucion_real DATETIME;


INSERT INTO prestamo
(ejemplar_id, usuario_id, fecha_prestamo, fecha_devolucion, fecha_devolucion_real, estado_prestamo)
VALUES
(1, 1, '2026-08-01', '2026-08-15', '2026-08-14', false),
(3, 2, '2026-08-10', '2026-08-24', NULL, true),
(5, 3, '2026-08-15', '2026-08-29', NULL, true);


Pregunta 17 — Actualizar un usuario
El usuario con id = 1 cambió su número de teléfono.
Actualiza su teléfono a:
77799999

UPDATE usuarios
SET telefono = '77799999'
WHERE id = 1;

Pregunta 19 — Actualizar un libro
El libro con id = 2 cambió de editorial.
Actualiza la editorial a:
Editorial Tecnológica

UPDATE libros
SET editorial = 'Editorial Tecnológica'
WHERE id = 2;

Pregunta 21 — Actualizar un ejemplar
El ejemplar con id = 3 fue prestado.
Cambia su estado de:
DISPONIBLE (true)
a:
PRESTADO (false)

UPDATE ejemplares
SET disponible = 0
WHERE id = 3;



Pregunta 23 — Registrar devolución
El préstamo con id = 2 fue devuelto.
Actualiza:
• fecha_devolucion_real
• estado
La devolución ocurrió el:
2026-08-14

UPDATE prestamo
SET fecha_devolucion_real = '2026-08-14', estado_prestamo = false
WHERE id = 2

Pregunta 25 — Eliminar una relación
Si existe la tabla autor_libro, elimina la relación entre:
• libro_id = 2
• autor_id = 3

////////// PENDIENTE

DELETE FROM autor_libro
WHERE libro_id = 2
  AND autor_id = 3;


Pregunta 27 — Eliminar un usuario
Elimina los usuarios que no tenga préstamos .

Ten en cuenta que si el usuario tiene registros relacionados en prestamos, la clave foránea
puede impedir la eliminación.

DELETE FROM usuarios
WHERE id = 4;

--------
DELETE FROM usuarios
WHERE id NOT IN(
    SELECT usuario_id
    FROM prestamos
);

- usuarios que se prestaron
SELECT usuario_id
FROM prestamos;
--------------------------





----------------------------------------------------------
# RESET
----------------------------------------------------------
TRUNCATE categorias;
id iniciará desde el 1

DELETE FROM categorias;
ALTER TABLE categorias AUTO_INCREMENT = 1;

DELETE FROM libros;
ALTER TABLE libros AUTO_INCREMENT = 1;

DELETE FROM ejemplares;
ALTER TABLE ejemplares AUTO_INCREMENT = 1;


PLSQL
PGPLSQL

INDICES
PROCEDIMIENTOS ALMACENADOS
FUNCIONES
VISTAS
TRIGGERS
CURSORES


https://laravue2.blumbit.net/back/public/api/producto? page=6 & limit= &q=

OFFSET
LIMIT

