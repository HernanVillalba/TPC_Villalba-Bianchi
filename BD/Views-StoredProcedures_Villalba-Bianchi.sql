Use DB_VILLALBA_BIANCHI

create view ListarTodosLosCampos
as
select J.ID, J.Nombre as Juego, J.Descripcion , J.ImagenURL, PxJ.Importe, PxJ.Stock, P.ID as IDPlataforma, P.Nombre as Plataforma, D.ID as IDDesarrollador, D.Nombre as Desarrollador from Juegos as J
join Plataforma_x_Juego as PxJ on PxJ.IDJuego= J.ID
join Plataformas as P on P.ID = PxJ.IDPlataforma
join Desarrollador_x_Juego as DxJ on DxJ.IDJuego=J.ID
join Desarrolladores as D on D.ID=DxJ.IDDesarrollador

select * from ListarTodosLosCampos

drop view ListarTodosLosCampos