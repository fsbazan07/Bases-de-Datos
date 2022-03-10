SELECT * FROM avatar;
SELECT * FROM canal;
SELECT * FROM etiqueta;
SELECT * FROM pais;
SELECT * FROM playlist;
SELECT * FROM playlist_video;
SELECT * FROM reaccion;
SELECT * FROM tiporeaccion;
SELECT * FROM usuario;
SELECT * FROM video;
SELECT * FROM video_etiqueta;

SELECT * FROM usuario
WHERE nombre LIKE "a%";

SELECT * FROM usuario
WHERE email IS NULL;

SELECT * FROM canal
WHERE fechaCreacion BETWEEN '2021-04-01' AND '2021-06-01';

SELECT * FROM usuario
ORDER BY fechaNacimiento DESC
LIMIT 10;

SELECT * FROM playlist
WHERE privado = 1;

SELECT * FROM video
ORDER BY cantidadLikes DESC
LIMIT 5;

INSERT INTO `usuario` VALUES
(DEFAULT, 'Juan Jose Batzal', 'jjbatzal@gmail.com', 'jj1597', '2000-04-01', '1429' , 9, 85);

SELECT * FROM usuario
WHERE fechaNacimiento LIKE "2000%";

SELECT UPPER(nombre) FROM pais
ORDER BY nombre ASC;

SELECT * FROM video
WHERE cantidadReproducciones > 500000;

SELECT * FROM video
WHERE fechaPublicacion LIKE "2020%" AND privado = 1 AND cantidadDislikes > 100;

UPDATE `usuario` 
SET fechaNacimiento = '2000-01-04'
WHERE idUsuario = 0;

SELECT * FROM usuario
WHERE length(password) < 5;
