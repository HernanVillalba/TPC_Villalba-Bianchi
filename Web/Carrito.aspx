<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="Web.Carrito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%if (listaCarrito.Count() == 0)
        {%>
    <h1>CARRITO VACIO</h1>
    <%}%>

    <%else
        {%> 
    <div class ="card" style="background-color:aquamarine">
    <h1> Total de Items: <%=listaCarrito.Count() %></h1>
    <h1> Sus Items en el Carrito son :</h1>

    </div>
    <div class="row">
        <%
            foreach (Dominio.Juego item in listaCarrito)
            {%>
        <div class="col-md-4">
            <div class="card" style="width: 18rem; background-color: transparent;">
                <img class="card-img-top" src="<%= item.ImagenURL %>" alt="imagen-juego" style="width: inherit;" height="120">
                <div class="card-body">
                    <ul class="list-group">
                        <li class="list-group-item list-group-item-white"><%= item.Nombre %></li>
                        <li class="list-group-item list-group-item-white" style="color: cornflowerblue;"><%= item.PlataformaJuego.Nombre %></li>
                        <li class="list-group-item list-group-item-white">
                            <a href="Detalles.aspx?IDJ=<%= item.ID %>&IDP=<%=item.PlataformaJuego.ID%>" class="btn btn-primary btn-block" style="background-color: deepskyblue;" type="button">Detalles</a>
                            <a href="Carrito.aspx?ID=<%=item.ID %>&add=1" class="btn btn-primary btn-block" type="button">Agregar al Carrito</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <%}%>
    </div>
    <%}%>
</asp:Content>
