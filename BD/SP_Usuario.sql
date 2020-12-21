use DB_VILLALBA_BIANCHI

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
	values (@nombreUsuario, ENCRYPTBYPASSPHRASE('password', @contraseña))
	--ahora insert en Datos_Personales
	declare @ultID int
	set @ultID = @@IDENTITY
	insert into Datos_Personales(IDUsuario,Apellido, Nombre, Mail, Telefono)
	VALUES (@ultID, @apellido, @nombre, @mail, @telefono)
END TRY	

BEGIN CATCH
		 raiserror('Error al registrar el usuario en la DB',
		 18,
		 1)
END CATCH

go
------------------------------------------------------------------------------------------------
--SP que busca todos los pedidos del usuario logeado
create procedure SP_BuscarPedidoPorUsuario(
	@IDUsuario int
)
AS
BEGIN 
	   SELECT * FROM Pedidos where IDUsuario = @IDUsuario
END


go
------------------------------------------------------------------------------------------------------
--Procedimiento almacenado que trae todos los datos del usuario en Usuarios, DatosPersonales y DatosEnvio
--por ahora lo uso solo para cargar el perfil del usuario

create procedure SP_DatosUsuario(
@idUsuario int
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
		   isnull(DP.TelefonoAlter,0) as TelefonoAlter
	from Usuarios as U 
	full join Datos_Personales as DP on DP.IDUsuario = U.ID
	where U.ID = @idUsuario 
end try
begin catch
	raiserror('Error al obtener el usuario',18,1);
end catch
go

---------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE SP_GuardarMisDatos(
@id int,
@nombreUsuario varchar(200),
@nombre varchar(200),
@apellido varchar(200),
@mail varchar(200),
@telefono int,
@telefonoAlter int
)
AS
BEGIN TRY
	update Usuarios 
	set NombreUsuario =  @nombreUsuario
	where ID = @id
	update Datos_Personales
	set Nombre = @nombre, Apellido = @apellido, Mail = @mail, 
	Telefono = @telefono, TelefonoAlter = @telefonoAlter
	where IDUsuario = @id
END TRY
begin catch
	 raiserror('Error al guardar los datos del usuario en la DB',18,1);
end catch


go
-------------------------------------------------------------------------------------------------------------------

create procedure SP_ListarDirecciones(
@idUsuario int
)
as
begin try
	select IDEnvio,Direccion, Altura, CP, Localidad from Direcciones
	where IDUsuario = @idUsuario
end try
begin catch
	raiserror('No se pudo listar las Direcciones',18,1);
end catch

go
-------------------------------------------------------------------------------------------------------------------
	
create procedure SP_ListarTarjetas(
@idUsuario int)
as
begin try
		select IDTarjeta, Numero, Clave from tarjetas
		where IDUsuario = @idUsuario
end try
begin catch
	raiserror('No se pudo obtener las Tarjetas',18,1);

end catch
go
--------------------------------------------------------------------------------------------------------------------

create procedure SP_AgregarDireccion(
@idUsuario int,
@Direccion varchar(200),
@Altura int,
@CP int,
@Localidad varchar(200)
)
as
begin try
		insert into Direcciones(IDUsuario, Direccion, Altura, CP, Localidad)
		VALUES (@idUsuario, @Direccion, @Altura, @CP, @Localidad)
end try
begin catch
		raiserror('No se pudo agregar la Direccion',18,1)
end catch

go
------------------------------------------------------------------------------

create procedure SP_AgregarTarjeta(
@idUsuario int,
@Numero varchar(200),
@Clave varchar(5),
@Tipo int,
@alias varchar(200)
)
as

begin try
		insert into Tarjetas(IDUsuario,Numero,Clave,TipoTarjeta,Alias)
		values (@idUsuario,@Numero,@Clave, @Tipo, @alias)
end try
begin catch
	raiserror('No se pudo guardar las Tarjetas',18,1);

end catch

go
------------------------------------------------------------------------------

create procedure SP_ChequearPass(
@idUsuario int,
@contraseña varchar(200)
)
as
begin
	select U.ID from Usuarios as U
	where U.ID=@idUsuario and CONVERT(VARCHAR(MAX), DECRYPTBYPASSPHRASE('password',Contraseña))=@contraseña
end
go
------------------------------------------------------------------------------





create procedure SP_EliminarDireccion(
@idDireccion int,
@idUsuario int
)
as
begin try
	delete from Direcciones
	where IDEnvio=@idDireccion and IDUsuario=@idUsuario
end try
begin catch
	raiserror('No se pudo eliminar la direccion',18,1);
end catch


create Procedure SP_Login(
@user varchar(200),
@pass varchar(200)
)
as
begin 

	begin try

	select * from Usuarios
	where NombreUsuario=@user and CONVERT(VARCHAR(MAX), DECRYPTBYPASSPHRASE('password',Contraseña))=@pass

	end try

	begin catch
		raiserror('No se pudo Loguear',18,1);

	end catch
end