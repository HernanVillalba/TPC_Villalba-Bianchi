<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Detalles.aspx.cs" Inherits="Web.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



    <br />
    <br />
    <div class="row">
        <div class="card" style="background-color: midnightblue;">
            <div class="card">
                <h2 class="card-header" style="color: white; font-size: 27px;"><%=juegoDetalles.Nombre %></h2>
                <h3 ><% =juegoDetalles.PlataformaJuego.Nombre %> </h3>
                <img class="card-img-top" src="<%= juegoDetalles.ImagenURL %>" alt="imagen-juego" style="height: inherit; width: inherit">
            </div>
        </div>
        <ul class="list-group list-group-flush" style="background-color: white; font-size: 20px;">
            <li>Desarrollado por: <%=juegoDetalles.DesarrolladorJuego.Nombre %>  </li>
            <li>Sinopsis: <%=juegoDetalles.Descripcion %></li>
        </ul>
        <div>
            <a href="#" class="btn btn-primary btn-block" type="button">Agregar al Carrito</a>
            <a href="CatalogoJuegos.aspx" class="btn btn-primary btn-block" type="button">Volver</a>
        </div>
    </div>
</asp:Content>
