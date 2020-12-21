----VISTA----
use DB_VILLALBA_BIANCHI
--vista que trae todos los campos asociados con la tabla de juegos para listarlos por la web.

GO
create view VW_ListarTodosLosCampos
as
select J.ID, J.Nombre as Juego, J.Descripcion , J.ImagenURL, PxJ.Importe, PxJ.Stock, P.ID as IDPlataforma, P.Nombre as Plataforma, D.ID as IDDesarrollador, D.Nombre as Desarrollador from Juegos as J
join Plataforma_x_Juego as PxJ on PxJ.IDJuego= J.ID
join Plataformas as P on P.ID = PxJ.IDPlataforma
join Desarrollador_x_Juego as DxJ on DxJ.IDJuego=J.ID
join Desarrolladores as D on D.ID=DxJ.IDDesarrollador


-------------------------------------------------------------------------------------
GO
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
		INSERT INTO Plataforma_x_Juego(IDJuego,IDPlataforma,Importe,Stock, Estado)
		VALUES(@idjuego,@idplataforma,@importe, @stock, 1)
		--Declaramos la desarrolladora del juego
		INSERT INTO Desarrollador_x_Juego(IDJuego,IDDesarrollador)
		VALUES (@idjuego,@iddesarrollador)
		

END TRY
BEGIN CATCH
	 raiserror('Error al registrar el Juego en la DB',18,1);
END CATCH

-------------------------------------------------------------------------------------------------------------------
GO
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

