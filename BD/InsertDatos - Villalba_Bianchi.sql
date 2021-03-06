use DB_VILLALBA_BIANCHI
GO
INSERT INTO Plataformas(Nombre)
VALUES ('PlayStation 4'), --ID1
	   ('XBOX One'),	  --2
	   ('PC'),			  --3
	   ('PlayStation 3'), --4
	   ('XBOX 360'),	  --5
	   ('PlayStation 2'), --6
	   ('Nintendo Switch') --7

GO
INSERT INTO Juegos(Nombre,Descripcion,ImagenURL) 													   --ID
VALUES ('God Of War', 'kratos viaja mucho junto a su hijo llamado BOY', 'https://tinyurl.com/y6lwpktj'), --1
	   ('Resident Evil 4', 'Dej� de ser survival horror', 'https://tinyurl.com/y2yklvmn'),			     --2
	   ('Fifa 20', 'Siempre el mismo juego, distinto n�mero', 'https://tinyurl.com/y5zzyzo4'),		     --3
	   ('Bloodborne', 'Dark Souls sin escudo', 'https://tinyurl.com/y6k2p7m6'),						     --4
	   ('The Last Of Us', 'El mejor juego de la generaci�n?', 'https://tinyurl.com/y6ywnm4w'),			 --5
	   ('Red Dead Redemption 2', 'GTA de Vaqueros', 'https://tinyurl.com/y4o2scoq')						 --6
GO
INSERT INTO Plataforma_x_Juego(IDJuego,IDPlataforma,Importe,Stock, Estado)
VALUES (1,1,1800,17,1),
	   (2,1,900,21,1),
	   (2,2,800,10,1),
	   (2,3,150,3,1),
	   (2,4,500,11,1),
	   (2,5,250,18,1),
	   (2,6,90,109,1),
	   (2,7,350,21,1),
	   (3,1,1500,1,1),
	   (3,2,900,55,1),
	   (3,3,80,77,1),
	   (4,1,450,9,1),
	   (5,1,1299,3,1),
	   (5,4,799,9,1),
	   (6,2,3000,15,1)
GO
INSERT INTO Desarrolladores(Nombre)
VALUES ('Santa Monica Studio'), --1
	   ('Capcom'),				--2
	   ('Electronic Arts'),		--3
	   ('From Software'),		--4
	   ('Naughty Dog'),			--5
	   ('Rockstar Games')
GO
INSERT INTO Desarrollador_x_Juego(IDJuego,IDDesarrollador)
VALUES (1,1),
	   (2,2),
	   (3,3),
	   (4,4),
	   (5,5),
	   (6,6)
	   
GO
INSERT INTO Usuarios(NombreUsuario,Contrase�a)
VALUES ('admin', ENCRYPTBYPASSPHRASE('password','admin')),
	   ('link', ENCRYPTBYPASSPHRASE('password','zelda')),
	   ('oscar20',ENCRYPTBYPASSPHRASE('password', 'oski')),
	   ('hernanvi_', ENCRYPTBYPASSPHRASE('password','herni'))

GO
INSERT INTO Datos_Personales (IDUsuario, Nombre, Apellido, Mail, Telefono, TelefonoAlter)
VALUES (2, 'Link', 'Zelda', 'legendofzelda@link.com', 11, 21),
	   (3, 'Oscar', 'Bianchi', 'oski@gmail.com', 312, 23),
	   (4, 'Hern�n', 'Villalaba', 'hernan@gmail.com', 6541, 032)


