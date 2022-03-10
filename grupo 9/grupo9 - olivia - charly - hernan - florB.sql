/* 1 Generar un reporte que indique la cantidad de usuarios por país,
mostrando el nombre del país y su cantidad.*/

select pais.nombre, count(usuario.Pais_idPais) as cantidad from pais
inner join usuario on pais.idPais = usuario.Pais_idPais
group by nombre;

/* 2. Mostrar el Top 5 de avatars utilizados por los usuarios, listando el
nombre del avatar y la cantidad de veces utilizado.*/

select avatar.nombre, idAvatar, count(usuario.Avatar_idAvatar) AS cantidad from avatar
left join usuario on avatar.idAvatar = usuario.Avatar_idAvatar
group by usuario.Avatar_idAvatar
order by cantidad desc
limit 5;

/*3. Emitir un listado de todas las playlists públicas, informando el nombre
del usuario que la creó, el título de cada video que posee y el nombre
y año de creación de la playlist.*/

select playlist.nombre, usuario.nombre, date_format(fechaCreacion, '%Y'), concat(playlist_video.Video_idVideo) from playlist
left join usuario on playlist.Usuario_idUsuario = usuario.idUsuario
inner join playlist_video on playlist.idPlaylist = playlist_video.Playlist_idPlaylist;
 -- continuar
 
 /* 4.Listar las 10 etiquetas menos usadas.*/
 
 select etiqueta.nombre, Etiqueta_idEtiqueta, Video_idVideo, count(video_etiqueta.Etiqueta_idEtiqueta) from video_etiqueta
 inner join video on video_etiqueta.Video_idVideo = video.idVideo
 inner join etiqueta on video_etiqueta.Etiqueta_idEtiqueta = etiqueta.idEtiqueta;
 -- continuar
 
 /*5. Generar un reporte de las últimas 10 reacciones, listando la fecha, el
nombre de la reacción, el id y nombre de usuario, y el título del video.*/

 select date_format(fecha, '%d/%m/%y') as fecha, tiporeaccion.nombre, idReaccion, usuario.idUsuario, video.titulo from reaccion
 left join tiporeaccion on reaccion.idReaccion = tiporeaccion.idTipoReaccion
 left join usuario on reaccion.Usuario_idUsuario = usuario.idUsuario
 left join video on reaccion.Video_idVideo = video.idVideo
 order by fecha desc limit 10;
 
 /*7 Generar un reporte de las reacciones generadas en el 2021, con el
siguiente formato :*/

SELECT tiporeaccion.nombre AS "Nombre de Reacción" , usuario.nombre AS "Nombre de Usuario",
 video.titulo AS "Título de Video", reaccion.fecha AS Fecha from reaccion
INNER JOIN usuario on idUsuario = Usuario_idUsuario
INNER JOIN video on Video_idVideo = idVideo
INNER JOIN tiporeaccion on idTipoReaccion = TipoReaccion_idTipoReaccion;




/* 8. Listar la cantidad de videos según sean públicos o privados.*/

SELECT privado, count(privado) AS Cantidad from video
GROUP BY privado;


-- 9. Generar un reporte con los nombres de los usuario que no poseen ninguna Playlist.

SELECT  * FROM usuario
LEFT JOIN playlist ON Usuario_idUsuario = idUsuario
WHERE isnull(Usuario_idUsuario);
 /*12*/
 
 SELECT nombre, idUsuario
FROM usuario
LEFT JOIN  video ON video.Usuario_idUsuario = usuario.idUsuario
WHERE titulo IS NULL;

-- 14 Listar los videos que tienen los usuarios cuyo nombre contiene la letra “a” y son del país Argentina.

SELECT * from  usuario 
INNER JOIN pais on Pais_idPais = pais.idPais

where usuario.nombre like "%a%" and pais.nombre like "Argentina";

-- 

/* Numeral 19. Generar un reporte listando los usuarios, sus canales, playlists y los
videos que integran esas playlists. */
SELECT usuario.nombre, canal.idCanal, playlist.nombre, video.titulo FROM usuario
LEFT JOIN canal ON Usuario_idUsuario=idUsuario
INNER JOIN playlist ON idPlaylist=idUsuario
INNER JOIN playlist_video ON Playlist_idPlaylist=idPlaylist
INNER JOIN video ON playlist_video.Video_idVideo=video.idVideo
;


/* Numeral 20. Listar todas las playlists que posean menos de 3 videos, mostrando el
nombre de usuario y el avatar que posee. */
SELECT playlist.nombre, COUNT(playlist.nombre) AS 'Número de Videos', playlist.idPlaylist, playlist.Usuario_idUsuario FROM playlist
INNER JOIN playlist_video ON playlist.idPlaylist=playlist_video.Playlist_idPlaylist
INNER JOIN video ON video.idVideo=playlist_video.Video_idVideo
GROUP BY playlist.nombre
HAVING COUNT(playlist.nombre)<3
ORDER BY 'Número de Videos'

