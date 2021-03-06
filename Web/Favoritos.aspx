﻿<%@ Page Title="Favoritos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Favoritos.aspx.cs" Inherits="Web.Favoritos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <br />

    <%if (cantidadItemsListaFav == 0)
        { %>
    <div class="jumbotron centrado" style="height:auto; width:auto;">
        <h2>No hay favoritos agregados!</h2>
    </div>
    <%  } %>

    <%else
        {%>
    <table class="table" style="border: thin outset #000000; margin: auto;">
        <tr style="border: 1px groove #000000; background-color: #0c5094;">
            <td></td>
            <td>Nombre</td>
            <td>Plataforma</td>
            <td>Precio</td>
        </tr>

        <%foreach (Dominio.Juego item in listaFav)
            { %>
        <tr style="border: 1px groove #000000;">
            <td>
                <a href="Favoritos.aspx?IDJuego=<%= item.ID.ToString()%>&IDPlataforma=<%=item.PlataformaJuego.ID.ToString() %>&delete=1" class="mx-auto btn btn-outline-info" style="float: left;">
                    <img title="Eliminar favorito" src="https://tinyurl.com/y5mnq3y8" alt="img-fav" style="height: 20px; width: 20px;" />
                </a>
            </td>
            <td><%= item.Nombre %></td>
            <td><%= item.PlataformaJuego.Nombre %></td>
            <td><%= item.PlataformaJuego.Precio %></td>
        </tr>


        <%  } %>


        <%} %>
    </table>
    <div class="centrado">
        <a href="CatalogoJuegos.aspx" class="btn btn-primary">Volver</a>
    </div>
</asp:Content>
