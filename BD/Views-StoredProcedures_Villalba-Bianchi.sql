----VISTA----

--vista que trae todos los campos asociados con la tabla de juegos para listarlos por la web.
create view VW_ListarTodosLosCampos
as
select J.ID, J.Nombre as Juego, J.Descripcion , J.ImagenURL, PxJ.Importe, PxJ.Stock, P.ID as IDPlataforma, P.Nombre as Plataforma, D.ID as IDDesarrollador, D.Nombre as Desarrollador from Juegos as J
join Plataforma_x_Juego as PxJ on PxJ.IDJuego= J.ID
join Plataformas as P on P.ID = PxJ.IDPlataforma
join Desarrollador_x_Juego as DxJ on DxJ.IDJuego=J.ID
join Desarrolladores as D on D.ID=DxJ.IDDesarrollador
--select * from VW_ListarTodosLosCampos
--drop view ListarTodosLosCampos

----PROCEDIMIENTOS ALMACENADOS----

--procedimiento almacenado que primero inserta los datos de la tabla de usuario, toma ese ID (que es identity) y
--lo guarda en una variable para luego insertarlo en la tabla de Datos_Personales junto a las demás columnas
create procedure SP_Registrarse(
	@nombre	varchar(200),
	@apellido varchar(200),
	@mail varchar(200),
	@CP INT,
	@nombreUsuario varchar(200),
	@contraseña varchar(200)
) WITH ENCRYPTION
AS
BEGIN TRY
	--primero insertamos los datos de la tabla de usuario ya que en datos
	--personales el IDUsuario hace referencia al ID de esta tabla
	INSERT INTO Usuarios(NombreUsuario, Contraseña)
	values (@nombreUsuario, @contraseña)
	--ahora insert en Datos_Personales
	declare @ultID int
	set @ultID = @@IDENTITY
	insert into Datos_Personales(IDUsuario,Apellido, Nombre, Mail, CP)
	VALUES (@ultID, @apellido, @nombre, @mail, @CP)
END TRY	

BEGIN CATCH
		 raiserror('Error al registrar el usuario en la DB',
		 18,
		 1);
END CATCH


/*
--prueba del SP de Acción con parametros
exec SP_Registrarse 'hola', 'asdasd', 'jjajaj', 1212, 'oskigay18', 'soygay'
drop procedure SP_Registrarse
*/

------------------------------------------------------------------------------------------------
--SP que busca todos los pedidos del usuario logeado
create procedure SP_BuscarPedidoPorUsuario(
	@IDUsuario int
)
AS
BEGIN 
	   SELECT * FROM Pedidos where IDUsuario = @IDUsuario
END

/*
 PRUEBA DE SP DE CONSULTA CON PARAMETRO
EXEC SP_BuscarPedidoPorUsuario 2
drop procedure SP_BuscarPedidoPorUsuario
*/



create procedure SP_NuevoJuego(

--Datos del juego que traemos del visual
@nombre varchar(200),
@descripcion varchar(500),
@imagenurl varchar (100),
@idplataforma int,
@importe money,
@stock int,
@iddesarrollador int
)
AS
BEGIN TRY
		--Ingresamos el juego
		INSERT INTO Juegos (Nombre,Descripcion,ImagenURL)
		values (@nombre,@descripcion,@imagenurl)
		--Buscamos su ID recien creado
		declare @idjuego int
		set @idjuego = @@IDENTITY
		--Creamos la nueva plataforma x juego para definir el stock e importe
		INSERT INTO Plataforma_x_Juego(IDJuego,IDPlataforma,Importe,Stock)
		VALUES(@idjuego,@idplataforma,@importe, @stock)
		--Declaramos la desarrolladora del juego
		INSERT INTO Desarrollador_x_Juego(IDJuego,IDDesarrollador)
		VALUES (@idjuego,@iddesarrollador)

END TRY
BEGIN CATCH
	 raiserror('Error al registrar el Juego en la DB',
		 18,
		 1);
END CATCH

exec SP_NuevoJuego 'Red Dead Redemption 2', 'GTA de Vaqueros', 'https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/styles/480/public/media/image/2018/10/red-dead-redemption-2_22.jpg?itok=TyDias-N', 2, 3000, 4, 2