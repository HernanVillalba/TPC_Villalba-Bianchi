<%@ Page Title="Carrito de compras" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="Web.Carrito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <%if (((List<Dominio.Juego>)Session["ListaCarrito"]).Count() == 0)
        {%>
    <h1>CARRITO VACIO</h1>
    <%}%>

    <%else
        {%>
    <div class="jumbotron" style="background-color: aquamarine; height:auto;">
        <h2 class="display-4">Carrito</h2>
        <div>
            <span class="badge badge-primary" style="font-size: 10px;">Cantidad de articulos:</span>
            <asp:Label ID="lblCantidad" Text="0" runat="server" />
        </div>
        <div style="font-size: 20px;">
            <span class="badge badge-primary" style="font-size: 10px;">Precio total: $</span>
            <asp:Label ID="lblTotal" Text="0" runat="server" />
        </div>
        <div style="float: right;">
            <a href="Carrito.aspx?empty=1" class="btn btn-primary" style="background-color:darkred; border-bottom-color:darkred;">Vaciar carrito</a>
            <a href="#" class="btn btn-primary">Comprar</a>
        </div>
        <input type="number"/>
    </div>

    <br />
    <br />
    <table class="table table-dark" border="1" style="border: thin outset #000000; margin: auto; background-color:#30475e;">
        <tr style="border: 1px groove #000000; background-color:#222831;">
            <td>Imagen</td>
            <td>Nombre</td>
            <td>Plataforma</td>
            <td>Precio</td>
            <td>Cantidad</td>
        </tr>

        <%
            foreach (Dominio.Juego item in (List<Dominio.Juego>)Session["ListaCarrito"])
            {%>
        
        <tr style="border: 1px groove #000000;">
            <td>
                <a class="btn btn-primary" href="Carrito.aspx?ID=<%=item.ID.ToString() %>&delete=1" style="background-color:#af2d2d;"> Eliminar </a>
                <img src="<%= item.ImagenURL %>" class="card-img-top" width="180" height="120" alt="Imagen del <%=item.Nombre %>"></td>
            <td><%= item.Nombre %></td>
            <td><%= item.PlataformaJuego.Nombre %></td>

            <td><%=item.PlataformaJuego.Precio %></td>
            <td><%=item.Cantidad %></td>
        </tr>

        <%     }
            }

        %>
    </table>

</asp:Content>
