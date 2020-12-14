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
end try
begin catch
		raiserror('No se agregó el Producto en la tabla,',18,1)
end catch

