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
	   ('Resident Evil 4', 'Dej� de ser survival horror', 'https://tinyurl.com/y5pyxmkf'),			     --2
	   ('Fifa 20', 'Siempre el mismo juego, distinto n�mero', 'https://tinyurl.com/y5zzyzo4'),		     --3
	   ('Bloodborne', 'Dark Souls sin escudo', 'https://tinyurl.com/y6k2p7m6'),						     --4
	   ('The Last Of Us', 'El mejor juego de la generaci�n?', 'https://tinyurl.com/y6ywnm4w')			 --5
GO
INSERT INTO Plataforma_x_Juego(IDJuego,IDPlataforma,Importe,Stock)
VALUES (1,1,1800,17),
	   (2,1,900,21),
	   (2,2,800,10),
	   (2,3,150,3),
	   (2,4,500,11),
	   (2,5,250,18),
	   (2,6,90,109),
	   (2,7,350,21),
	   (3,1,1500,100),
	   (3,2,900,55),
	   (3,3,80,77),
	   (4,1,450,9),
	   (5,1,1299,3),
	   (5,4,799,9)
GO
INSERT INTO Desarrolladores(Nombre)
VALUES ('Santa Monica Studio'), --1
	   ('Capcom'),				--2
	   ('Electronic Arts'),		--3
	   ('From Software'),		--4
	   ('Naughty Dog')			--5
GO
INSERT INTO Desarrollador_x_Juego(IDJuego,IDDesarrollador)
VALUES (1,1),
	   (2,2),
	   (3,3),
	   (4,4),
	   (5,5)