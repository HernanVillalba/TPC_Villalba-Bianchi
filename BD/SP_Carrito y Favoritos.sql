-------- Procesos Carrito y Favoritos ---------------------------
use DB_VILLALBA_BIANCHI
go
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
go
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
go
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
go
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
go
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
go
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
go
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
go
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
