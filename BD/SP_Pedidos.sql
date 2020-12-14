-----------------------Procesos Pedidos-------------------------------

create procedure SP_CrearPedido(
@IDU int,
@IT money,
@EPC bit,
@IDD int,
@IDJ int,
@Precio money,
@Cantidad int,
@IDP int
)
as
begin try
			insert into Pedidos(IDUsuario, ImporteTotal,FechaCompra, EnvioPorCorreo, IDDireccion, Pagado,Estado)
			values (@IDU, @IT, GETDATE(), @EPC, @IDD, 0, 'Pedido Recibido')
end try
begin catch
		raiserror('No pudo ser creado el Pedido',18,1);

end catch

----------------------------------------------------------------------------------------------------------
select * from pedidos
select *from Producto_x_pedido


create procedure SP_GuardarProductos(
@IDPedido int,
@IDJ int,
@Precio money,
@Cantidad int,
@IDP int
)
as
begin try
insert into Producto_x_pedido (IDPedido, IDJuego, Precio, Cantidad,IDPlataforma)
		values(@IDPedido,@IDJ, @Precio, @Cantidad, @IDP)
		------Disminuimos Stock-----------
			update Plataforma_x_Juego
			set Stock=Stock-@Cantidad
			where IDPlataforma=@IDP and IDJuego = @IDJ
			
end try
begin catch
		raiserror('No se agregó el Producto en la tabla,',18,1)
end catch

----------------------------------------------------------------------------------
create  procedure SP_ListarProductosxPedido(
@IDP int
)
as
begin try
select J.ID, J.Nombre as Juego, PXP.Cantidad as Cantidad,J.Descripcion , J.ImagenURL, PxJ.Importe, P.ID as IDPlataforma, P.Nombre as Plataforma, D.ID as IDDesarrollador, D.Nombre as Desarrollador from Juegos as J
join Plataforma_x_Juego as PxJ on PxJ.IDJuego= J.ID
join Plataformas as P on P.ID = PxJ.IDPlataforma
join Desarrollador_x_Juego as DxJ on DxJ.IDJuego=J.ID
join Desarrolladores as D on D.ID=DxJ.IDDesarrollador
join Producto_x_pedido as PXP on PxJ.IDPlataforma = PXP.IDPlataforma and PxJ.IDJuego = PXP.IDJuego
join Pedidos as Ped on Ped.ID = PXP.IDPedido
where PXP.IDPedido=@IDP
end try
begin catch
		raiserror('No se pudo obtener la lista de juegos,',18,1)
end catch

select * from Usuarios
select * from Datos_Personales
select * from Producto_x_pedido order by IDPedido

exec SP_ListarProductosxPedido 13
