--No copiar todo y pegar, hacerlo por partes

-- Creo mi base de datos
CREATE DATABASE d7_g6;

-- La uso y dentro de ella creo las tablas
USE d7_g6;

--Primera tabla
CREATE TABLE usuario (
  id INT PRIMARY KEY,
  tipo_usuario VARCHAR(50),
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  celular INT,
  email VARCHAR(50),
  contraseña VARCHAR(50),
  fecha_creacion DATETIME,
  avatar VARCHAR(30),
  es_publico BOOLEAN,
  es_colaborador BOOLEAN,
  es_admin BOOLEAN,
  estado BOOLEAN
);
-- Cargo usuarios:

-- Usuario con rol de admin
INSERT INTO usuario (id, tipo_usuario, nombre, apellido, celular, email, contraseña, fecha_creacion, avatar, es_publico, es_colaborador, es_admin, estado)
VALUES (1, 'Admin', 'Jose', 'Martines', 364326432, 'josesitogamer@gmail.com', '14328aA', '28-03-23', 'gato informatico.jpg', FALSE, FALSE, TRUE, TRUE);


-- Usuarios con rol de colaborador
INSERT INTO usuario (id, tipo_usuario, nombre, apellido, celular, email, contraseña, fecha_creacion, avatar, es_publico, es_colaborador, es_admin, estado)
VALUES (2, 'Colaborador', 'Raul', 'Martines', 364523132, 'rosesitogamer@gmail.com', '143228aA', '21-05-23', 'mate.jpg', FALSE, TRUE, FALSE, TRUE);

INSERT INTO usuario (id, tipo_usuario, nombre, apellido, celular, email, contraseña, fecha_creacion, avatar, es_publico, es_colaborador, es_admin, estado)
VALUES (3, 'Colaborador', 'Luis', 'Tomas', 364647832, 'luisitogamer@gmail.com', '12528bA', '12-01-23', 'Moto 110.jpg', FALSE, TRUE, FALSE, TRUE);

INSERT INTO usuario (id, tipo_usuario, nombre, apellido, celular, email, contraseña, fecha_creacion, avatar, es_publico, es_colaborador, es_admin, estado)
VALUES (4, 'Colaborador', 'Mauricio', 'Sosa', 364763256, 'mauripro@gmail.com', '124328raA', '31-01-22', 'Una pizza.jpg', FALSE, TRUE, FALSE, TRUE);

INSERT INTO usuario (id, tipo_usuario, nombre, apellido, celular, email, contraseña, fecha_creacion, avatar, es_publico, es_colaborador, es_admin, estado)
VALUES (5, 'Colaborador', 'Pablo', 'Bogdánov', 364348645, 'BogdánovSukrapra@gmail.com', 'fs2341A6d', '18-02-23', 'ruso con gafas.jpg', FALSE, TRUE, FALSE, TRUE);


-- Usuarios con rol de público

INSERT INTO usuario (id, tipo_usuario, nombre, apellido, celular, email, contraseña, fecha_creacion, avatar, es_publico, es_colaborador, es_admin, estado)
VALUES (6, 'Publico', 'Martin', 'Bogdánovil', 364358635, 'Sukrapra@gmail.com', 'fs2341A6d', '13-09-23', 'cocodrilo.jpg', TRUE, FALSE, FALSE, TRUE);

INSERT INTO usuario (id, tipo_usuario, nombre, apellido, celular, email, contraseña, fecha_creacion, avatar, es_publico, es_colaborador, es_admin, estado)
VALUES (7, 'Publico', 'Maria', 'Rosa', 36498231, 'sameM@gmail.com', 'fskj312f4', '25-08-23', 'bicicleta.jpg', TRUE, FALSE, FALSE, TRUE);

INSERT INTO usuario (id, tipo_usuario, nombre, apellido, celular, email, contraseña, fecha_creacion, avatar, es_publico, es_colaborador, es_admin, estado)
VALUES (8, 'Publico', 'Mario', 'Rosa', 364753954, 'samelonMario@gmail.com', 'fs2sdfñkljd', '18-02-23', 'pikachu.jpg', TRUE, FALSE, FALSE, TRUE);

INSERT INTO usuario (id, tipo_usuario, nombre, apellido, celular, email, contraseña, fecha_creacion, avatar, es_publico, es_colaborador, es_admin, estado)
VALUES (9, 'Publico', 'Templa', 'Rodiño', 36408031, 'TemplitaBDOa@gmail.com', 'Afjk288fjss', '22-11-23', 'Antena.jpg', TRUE, FALSE, FALSE, TRUE);

INSERT INTO usuario (id, tipo_usuario, nombre, apellido, celular, email, contraseña, fecha_creacion, avatar, es_publico, es_colaborador, es_admin, estado)
VALUES (10, 'Publico', 'Francisco', 'Garcia', 364583423, 'sfvGarce@gmail.com', 'rs2flkj23A6d', '12-02-23', 'monito.jpg', TRUE, FALSE, FALSE, TRUE);

--Para ver el contenido de esta tabla y comprobar si esta correcto
SELECT * FROM usuario;

-- Actualizar roles a los usuarios de un colaborador a admin
UPDATE usuario
SET es_admin = TRUE
WHERE id = 2;


--Creamos la segunda tabla;

CREATE TABLE articulo (
  id INT PRIMARY KEY,
  numero_articulo VARCHAR(100),
  titulo VARCHAR(100),
  resumen VARCHAR(100),
  contenido VARCHAR(100),
  imagen VARCHAR(50),
  fecha_publicacion VARCHAR(10),
  estado BOOLEAN
);

-- Ingreso de articulos
INSERT INTO articulo (id, numero_articulo, titulo, resumen, contenido, imagen, fecha_publicacion ,estado)
VALUES (1, 'Articulo 1','El viaje de Luis a america', 'Luis muere', 'derechos', 'portada generica.jpg','06-06-23', TRUE);

INSERT INTO articulo  (id, numero_articulo, titulo, resumen, contenido, imagen, fecha_publicacion ,estado)
VALUES (2, 'Articulo 2','Mauricio camina en el pais mas peligroso', 'camina recorriendo calles', 'estado de vida de las personas.jpg', 'portada generica','07-01-23', TRUE);

INSERT INTO articulo  (id, numero_articulo, titulo, resumen, contenido, imagen, fecha_publicacion ,estado)
VALUES (3, 'Articulo 3','Los 3 inmigrantes que tuvieron suerte', 'los 3 puediron conseguir trabajo', 'trabajo', 'portada generica.jpg','02-12-23', TRUE);

INSERT INTO articulo  (id, numero_articulo, titulo, resumen, contenido, imagen, fecha_publicacion ,estado)
VALUES (4, 'Articulo 4','EE.UU anuncia su nueva alianza', 'se negocia un nuevo tratado', 'pais', 'Bandera Americana.jpg','06-06-2023', FALSE);

--Revisamos si se aplicaron los cambios
SELECT * FROM articulo;

-- Eliminar articulos que tengan false (para borrar todo lo false hay que sacar el modo seguro, como no se en que afecta puse la id = 4)
DELETE FROM articulo WHERE estado = FALSE AND id = 4;

--Creamos la 3ra tabla

CREATE TABLE comentario (
  id INT PRIMARY KEY,
  articulo_id INT,
  usuario_id INT,
  fecha_hora DATETIME,
  texto VARCHAR(200),
  estado BOOLEAN,
  FOREIGN KEY (articulo_id) REFERENCES articulo(id),
  FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

-- Agregar comentarios
INSERT INTO comentario (id, articulo_id, usuario_id, fecha_hora, texto, estado)
VALUES (1, 1, 6, '2023-06-05 10:00:00', 'Primer comentario en Articulo 1', TRUE);

INSERT INTO comentario (id, articulo_id, usuario_id, fecha_hora, texto, estado)
VALUES (2, 1, 7, '2023-06-05 10:30:00', 'Segundo comentario en Articulo 1', TRUE);

INSERT INTO comentario (id, articulo_id, usuario_id, fecha_hora, texto, estado)
VALUES (3, 1, 8, '2023-06-05 11:00:00', 'Tercer comentario en Articulo 1', TRUE);


INSERT INTO comentario (id, articulo_id, usuario_id, fecha_hora, texto, estado)
VALUES (4, 2, 9, '2023-06-05 12:00:00', 'Primer comentario en Articulo 2', TRUE);

INSERT INTO comentario (id, articulo_id, usuario_id, fecha_hora, texto, estado)
VALUES (5, 2, 10, '2023-06-05 12:30:00', 'Segundo comentario en Articulo 2', TRUE);

--Para ver los articulos que tienen comentarios
SELECT a.titulo, a.fecha_publicacion, u.nombre, MIN(c.fecha_hora) AS primera_fecha_hora
FROM articulo a
JOIN comentario c ON a.id = c.articulo_id
JOIN usuario u ON c.usuario_id = u.id
GROUP BY a.id, u.nombre
ORDER BY a.id;

--Creamos una tabla de categoria
CREATE TABLE categoria (
  id INT PRIMARY KEY,
  nombre VARCHAR(50),
  descripcion VARCHAR(100),
  estado BOOLEAN,
  imagen VARCHAR(50),
  id_categoria INT,
  FOREIGN KEY (id_categoria) REFERENCES categoria(id)
);

INSERT INTO categoria (id, nombre, descripcion, imagen, estado, id_categoria)
VALUES (1,'Viajes', 'Informacion de viajes', 'imagen_turistica.jpg', TRUE, 1);

INSERT INTO categoria (id, nombre, descripcion, imagen, estado, id_categoria)
VALUES (2,'Pais', 'Informacion de un sector del pais', 'imagen_paistica(?).jpg', TRUE, 1);

INSERT INTO categoria (id, nombre, descripcion, imagen, estado, id_categoria)
VALUES (3,'Humanidad', 'Oportunidades laborales', 'imagen_trabajo.jpg', TRUE, 1);

INSERT INTO categoria (id, nombre, descripcion, imagen, estado, id_categoria)
VALUES (4,'Pais', 'Acuerdos militares', 'imagen_de_un_tanque_apache.jpg', TRUE, 1);

--Creamos una tabla para unir 2 id

CREATE TABLE categoria_del_articulo (
  id INT PRIMARY KEY,
  id_articulo INT,
  id_categoria INT,
  FOREIGN KEY (id_articulo) REFERENCES articulo(id),
  FOREIGN KEY (id_categoria) REFERENCES categoria(id)
);

--Para unir una categoria con un articulo
INSERT INTO categoria_del_articulo (id, id_articulo, id_categoria) VALUES (1, 1, 1);

--Integrante:
--Fernando Javier Svoboda