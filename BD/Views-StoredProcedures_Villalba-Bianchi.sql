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

------------------------------------------------------------------------------------------------
--SP que busca todos los pedidos del usuario logeado
create procedure SP_BuscarPedidoPorUsuario(
	@IDUsuario int
)
AS
BEGIN 
	   SELECT * FROM Pedidos where IDUsuario = @IDUsuario
END

------------------------------------------------------------------------------------------------

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

------------------------------------------------------------------------------------------------------
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

---------------------------------------------------------------------------------------------------------------

create procedure SP_ActualizarJuego(
@IDJuego int,
@Nombre varchar(200),
@Descripcion varchar(200),
@ImagenURL varchar(200),
@IDPlataforma int,
@Importe money,
@Stock int
)
as
begin try
	
		update Plataforma_x_Juego 
		set 
		Importe= @Importe, 
		Stock = @Stock
		where IDJuego = @IDJuego and IDPlataforma = @IDPlataforma
		update Juegos
		set 
		Nombre = @Nombre, 
		Descripcion = @Descripcion,
		ImagenURL = @ImagenURL
		where ID=@IDJuego
end try

begin catch
	raiserror('Error al Actualizar el Juego',18,1);

end catch

-------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE SP_GuardarDatosPersonales(
@id int,
@nombreUsuario varchar(200),
@contraseña varchar(200),
@nombre varchar(200),
@apellido varchar(200),
@mail varchar(200),
@telefono int,
@telefonoAlter int
)
AS
BEGIN TRY
	update Usuarios 
	set NombreUsuario =  @nombreUsuario, Contraseña =  @contraseña
	where ID = @id
	update Datos_Personales
	set Nombre = @nombre, Apellido = @apellido, Mail = @mail, 
	Telefono = @telefono, TelefonoAlter = @telefonoAlter
	where IDUsuario = @id
END TRY
begin catch
	 raiserror('Error al registrar el usuario en la DB',18,1);
end catch

exec SP_GuardarDatosPersonales 4, 'hernanvi_', 'herni', 'Hernan', 'Villalba', 'hernan@gmail.com', 99999, 99999
drop procedure SP_GuardarDatosPersonales


-------------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE SP_AgregarFavorito(
@idUsuario int,
@idJuego int,
@idPlataforma int
)
as
begin try
		insert into Favoritos(IDUsuario,IDJuego,IDPlataforma)
		values(@idUsuario,@idJuego,@idPlataforma)
end try

begin catch
		raiserror('No se agregó el fav en la tabla,',18,1);
end catch

---------------------------------------------------------------------------------------

create procedure SP_EliminarFavorito(
@idUsuario int,
@idJuego int,
@idPlataforma int
)
as
begin try
		delete from Favoritos
		where  @idUsuario = IDUsuario and @idJuego = IDJuego and @idPlataforma = IDPlataforma
end try

begin catch
		raiserror('No se eliminó el fav en la tabla,',18,1);
end catch

---------------------------------------------------------------------------------------
Create procedure SP_ListarFavUsuario(
@idUsuario int
)
as
begin
	select J.ID, J.Nombre as Juego, J.Descripcion , J.ImagenURL, PxJ.Importe, PxJ.Stock, P.ID as IDPlataforma, P.Nombre as Plataforma, D.ID as IDDesarrollador, D.Nombre as Desarrollador from Juegos as J
	join Plataforma_x_Juego as PxJ on PxJ.IDJuego= J.ID
	join Plataformas as P on P.ID = PxJ.IDPlataforma
	join Desarrollador_x_Juego as DxJ on DxJ.IDJuego=J.ID
	join Desarrolladores as D on D.ID=DxJ.IDDesarrollador
	join Usuarios as U on U.ID = @idUsuario
	join Favoritos as F on F.IDUsuario = @idUsuario
	where f.IDJuego = J.ID and f.IDPlataforma=P.ID and F.IDUsuario = @idUsuario
end

-------------------------------------------------------------------------------
Create procedure SP_AgregarItemCarrito(
@idUsuario int,
@idJuego int,
@idPlataforma int
)
as 
begin try
	insert into Carrito(IDUsuario, IDJuego, IDPlataforma, Cantidad)
	values (@idUsuario, @idJuego, @idPlataforma, 1)
end	try
begin catch
	raiserror('No se agregó el item al carrito.',18,1);
end catch


-------------------------------------------------------------------------------
create procedure SP_SumarCantidadItemCarrito(
@idUsuario int,
@idJuego int,
@idPlataforma int
)
as
begin try
	update Carrito
	set Cantidad=Cantidad+1
	where IDUsuario=@idUsuario and IDJuego=@idJuego and IDPlataforma=@idPlataforma
end try

begin catch
	raiserror('No se sumó la cantidad.',18,1);
end catch


-------------------------------------------------------------------------------
create procedure SP_EliminarItemCarrito(
@idUsuario int,
@idJuego int,
@idPlataforma int
)
as
begin try	
	delete from Carrito
	where IDUsuario=@idUsuario and IDJuego	= @idJuego and IDPlataforma=@idPlataforma
end try
begin catch
	raiserror('No se eliminó el item al carrito.',18,1);
end catch

-------------------------------------------------------------------------------
create procedure SP_ListarCarrito(
@idUsuario int
)
as
begin try
	select J.ID, J.Nombre as Juego, J.Descripcion , J.ImagenURL, PxJ.Importe, PxJ.Stock, P.ID as IDPlataforma, P.Nombre as Plataforma, D.ID as IDDesarrollador, D.Nombre as Desarrollador, C.Cantidad 
	from Juegos as J
	join Plataforma_x_Juego as PxJ on PxJ.IDJuego=J.ID
	join Plataformas as P on P.ID=PxJ.IDPlataforma 
	join Desarrollador_x_Juego as DxJ on DxJ.IDJuego=J.ID
	join Desarrolladores as D on D.ID=DxJ.IDDesarrollador
	join Usuarios as U on U.ID = 4
	join Carrito as C on C.IDUsuario = 4
	where C.IDJuego=J.ID and C.IDPlataforma=PxJ.IDPlataforma and U.ID=C.IDUsuario
end try	

begin catch
	raiserror('No se puede listar el carrito del usuario.',18,1);
end catch

-------------------------------------------------------------------------------
create procedure SP_VaciarCarrito(
@idUsuario int
)
as
begin try
	delete from Carrito
	where IDUsuario=@idUsuario
end try

begin catch
	raiserror('No se puede vaciar el carrito',18,1);
end catch

create procedure SP_ListarDirecciones(
@idUsuario int)
as
begin try
	select IDEnvio,Direccion, Altura, CP from Direcciones
	where IDUsuario = @idUsuario
end try
begin catch
	raiserror('No se pudo listar las Direcciones',18,1);

end catch

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