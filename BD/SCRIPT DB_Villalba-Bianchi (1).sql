

CREATE DATABASE DB_VILLALBA_BIANCHI

GO
USE DB_VILLALBA_BIANCHI

GO
create table Juegos(
ID int not null identity(1,1),
Nombre varchar(150) not null,
Descripcion varchar(500) not null,
ImagenURL varchar(1000)	null,
primary key(ID)
)

GO
create table Desarrolladores(
ID int not null identity(1,1),
Nombre varchar(150) not null,
primary key(ID)
)
	
GO
create table Desarrollador_x_Juego(
IDJuego int not null,
IDDesarrollador int not null,
primary key(IDJuego, IDDesarrollador)
)
GO
alter table Desarrollador_x_Juego
add constraint FK_DxJ_Jue foreign key(IDJuego) references Juegos(ID)
GO
alter table Desarrollador_x_Juego
add constraint FK_DxJ_Des foreign key(IDDesarrollador) references Desarrolladores(ID)

GO
create table Plataformas(
ID int not null identity(1,1),
Nombre varchar(100) not null,
primary key(ID)
)

GO
create table Plataforma_x_Juego(
IDJuego int not null,
IDPlataforma int not null,
Importe	money not null,
Stock int not null,
Estado bit not null,
primary key (IDJuego,IDPlataforma)
)
GO
alter table Plataforma_x_Juego
add constraint FK_PxJ_Jue foreign key(IDJuego) references Juegos(ID)
GO
alter table Plataforma_x_Juego
add constraint FK_PxJ_Pla foreign key(IDPlataforma) references Plataformas(ID)

go
Create table Distribuidor(
ID int not null,
Nombre varchar(100) not null,
primary key(ID)
)
go
create table Usuarios(
ID int identity(1,1) not null,
NombreUsuario varchar(200) not null,
Contraseña varchar(200) not null,
primary key (ID)
)
go
alter table Usuarios add unique(NombreUsuario) --unico usuario e inrrepetible

GO
CREATE TABLE Favoritos(
IDUsuario int not null,
IDJuego int not null,
IDPlataforma int not null
primary key(IDUsuario, IDJuego, IDPlataforma)
)
GO
alter table Favoritos
add constraint FK_FAV_Usuarios foreign key(IDUsuario) references Usuarios(ID)
GO
alter table Favoritos
add constraint FK_FAV_PXJ_IDJ foreign key(IDJuego,IDPlataforma) references Plataforma_x_Juego(IDJuego,IDPlataforma)

GO
CREATE TABLE Carrito(
IDUsuario int not null,
IDJuego int not null,
IDPlataforma int not null,
Cantidad int not null,
primary key(IDUsuario,IDJuego,IDPlataforma)
)
GO
ALTER TABLE Carrito
ADD CONSTRAINT FK_Car_Usu FOREIGN KEY(IDUsuario) REFERENCES Usuarios(ID)
GO
ALTER TABLE Carrito
ADD CONSTRAINT FK_Car_PxJ_IDJ_IDP FOREIGN KEY(IDJuego,IDPlataforma) REFERENCES Plataforma_x_Juego(IDJuego,IDPlataforma)

go 
create table Datos_Personales(
IDUsuario int not null,
Apellido varchar(100) not null,
Nombre varchar(100)not null,
Mail varchar(200) not null,
Telefono int not null,
TelefonoAlter int null,
primary key (IDUsuario),
constraint FK_IDUsu_Usu foreign key(IDUsuario) references Usuarios(ID)
)
go 
alter table Datos_Personales add unique (IDUsuario, Mail)

GO
create table Direcciones(
IDEnvio int identity(1,1) not null,
IDUsuario int not null,
Direccion varchar(200) null,
Altura int null,
CP int null
primary key(IDEnvio,IDusuario)
)
alter table Direcciones
add constraint FK_DE_DP foreign key(IDUsuario) references Datos_Personales(IDUsuario)

go 
create table Pedidos(
ID int identity(1,1) not null,
IDUsuario int not null foreign key references Usuarios(ID),
ImporteJuego money not null,
FechaCompra datetime not null,
EnvioPorCorreo bit not null,
DireccionEnvio varchar(200) not null,
Pagado bit not null,
Estado varchar(50) not null,
primary key (ID)
)

go
create table Envio(
ID int not null,
IDPedido int not null,
Estado tinyint not null,
Direccion varchar(100) not null,
IDdistribuidor int not null,
primary key(ID),
constraint FK_Distribuidor foreign key (IDdistribuidor) references Distribuidor (ID),
constraint FK_IDPED_PED foreign key(IDPedido) references Pedidos(ID)
)


go
create table Producto_x_pedido(
IDPedido int not null,
IDJuego int not null,
Precio Money not null,
Cantidad tinyint not null,
IDPlataforma int not null ,
)
go
Alter Table Producto_x_pedido
Add Constraint PK_P_X_P Primary Key (IDJuego, IDPedido, IDPlataforma)
go
Alter Table Producto_x_pedido
Add Constraint FK_IDPedido Foreign Key(IDpedido) References Pedidos(ID)
go
alter table Producto_x_pedido
add constraint FK_PxP_PXJ_IDJ_IDP foreign key(IDJuego,IDPlataforma) references Plataforma_x_Juego(IDJuego,IDPlataforma)

