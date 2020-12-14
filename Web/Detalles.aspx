<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Detalles.aspx.cs" Inherits="Web.WebForm1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div class="centrado">
        <h1><%=juegoDetalles.Nombre%> - <%=juegoDetalles.PlataformaJuego.Nombre %></h1>
    </div>

    <hr />

    <div class="jumbotron" style="height: auto; width: auto; opacity: 0.9;">
        <%if (Session["listaFav"] == null || ((List<Dominio.Juego>)Session["listaFav"]).Find(i => i.ID == juegoDetalles.ID && i.PlataformaJuego.ID == juegoDetalles.PlataformaJuego.ID) == null)
            { %>
        <a href="Favoritos.aspx?IDJuego= <%=juegoDetalles.ID %>&IDPlataforma=<%=juegoDetalles.PlataformaJuego.ID %>&add=1"  style="float: right;">
            <img title="Agregar a favoritos" src="https://image.flaticon.com/icons/png/512/13/13587.png" alt="img-fav" style="height: 20px; width: 20px;" />
        </a>

        <% }
            else
            {%>
        <a href="Favoritos.aspx?IDJuego=<%= juegoDetalles.ID %>&IDPlataforma=<%=juegoDetalles.PlataformaJuego.ID %>&delete=1" class="mx-auto btn btn-outline-info" style="float: right;">
            <img title="Agregar a favoritos" src="https://tinyurl.com/y5mnq3y8" alt="img-fav" style="height: 20px; width: 20px;" /></a>

        <% } %>
        <div class="centrado">
            <img src="<%=juegoDetalles.ImagenURL %>" alt="imagen-juego" style="height: 300px; width: auto; border-radius: 10px;" />
        </div>
        <br />
        <div class="card centrado" style="font-size: 15px; height: auto; width: auto;">
            <label>Descripción: <%=juegoDetalles.Descripcion %></label>
            <label>Desarrollador: <%=juegoDetalles.DesarrolladorJuego.Nombre %></label>
            <label>Stock: <%=juegoDetalles.PlataformaJuego.Stock %></label>
            <label>Precio: <%=juegoDetalles.PlataformaJuego.Precio %></label>
        </div>

        <div>
            <a href="Carrito.aspx?ID=<%=juegoDetalles.ID.ToString()%>&IDP=<%=juegoDetalles.PlataformaJuego.ID.ToString() %>&add=1" class="btn btn-primary btn-block" type="button">Agregar al Carrito</a>
            <a href="CatalogoJuegos.aspx" class="btn btn-primary btn-block" type="button">Volver</a>
        </div>
    </div>


</asp:Content>
