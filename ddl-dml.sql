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
