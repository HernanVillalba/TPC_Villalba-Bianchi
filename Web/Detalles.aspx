﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Detalles.aspx.cs" Inherits="Web.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <div class="row">
        <div class="card" style="background-color: midnightblue; width: 300px; height: 500px;">
            <div class="card"  >
                <h2 class="card-header" style="color: white; font-size: 27px;"><%=juegoDetalles.Nombre %></h2>
                <h4 style="color:white;"><% =juegoDetalles.PlataformaJuego.Nombre %> </h4>
                <img class="img-fluid" src="<%= juegoDetalles.ImagenURL %>" alt="imagen-juego" style="height: 500px; width:300px; max-height: 100px;">
                </div>
        </div>
        <ul class="list-group list-group-flush" style="background-color: white; font-size: 20px;">
            <li>Desarrollado por: <%=juegoDetalles.DesarrolladorJuego.Nombre %>  </li>
            <li>Sinopsis: <%=juegoDetalles.Descripcion %></li>
        </ul>
        <div>
           <a href="Carrito.aspx?ID=<%=juegoDetalles.ID.ToString()%>&add=1" class="btn btn-primary btn-block" type="button">Agregar al Carrito</a>
            <a href="CatalogoJuegos.aspx" class="btn btn-primary btn-block" type="button">Volver</a>
        </div>
    </div>
</asp:Content>
