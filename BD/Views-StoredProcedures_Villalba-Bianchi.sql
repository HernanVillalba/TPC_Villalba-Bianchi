----VISTA----
use DB_VILLALBA_BIANCHI
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
	@telefono INT,
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
	insert into Datos_Personales(IDUsuario,Apellido, Nombre, Mail, Telefono)
	VALUES (@ultID, @apellido, @nombre, @mail, @telefono)
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
	 raiserror('Error al registrar el Juego en la DB',18,1);
END CATCH

-------------------------------------------
--Procedimiento almacenado que trae todos los datos del usuario en Usuarios, DatosPersonales y DatosEnvio
--por ahora lo uso solo para cargar el perfil del usuario

create procedure SP_DatosUsuario(
@nombreUsuario varchar(200)
)
as
begin try
	select isnull(U.ID,0) as ID, 
		   isnull(U.NombreUsuario,0) as NombreUsuario, 
		   isnull(U.Contraseña,0) as Contraseña,
		   isnull(DP.Apellido,0) as Apellido, 
		   isnull(DP.Nombre,0) as Nombre,
	       isnull(DP.Mail,0) as Mail, 
		   isnull(DP.Telefono,0) as Telefono, 
		   isnull(DP.TelefonoAlter,0) as TelefonoAlter, 
	       isnull(DE.Direccion,0) as Direccion,
		   isnull(DE.Altura,0) as Altura,
		   isnull(DE.CP,0) as CP
	from Usuarios as U 
	full join Datos_Personales as DP on DP.IDUsuario = U.ID
	full join Datos_Envio as DE on DE.IDUsuario = U.ID
	where U.NombreUsuario = @nombreUsuario 
end try
begin catch
	raiserror('Error al obtener el usuario',18,1);
end catch


/*
drop procedure SP_DatosUsuario
exec SP_DatosUsuario 'link'
*/

