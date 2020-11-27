<%@ Page Title="Carrito de compras" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="Web.Carrito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <%if (((List<Dominio.Juego>)Session["ListaCarrito"]).Count() == 0)
        {%>
    <h1>CARRITO VACIO</h1>
    <%}%>

    <%else
        {%>
    <div style="display:flex; align-items:center; justify-content:center;">
    <div class="jumbotron" style="background-color: #1c2b2d; height:230px; opacity:0.9;">
        <h2 class="display-4" style="display:flex; align-items:center; justify-content:center;"><strong>Carrito</strong></h2>
        <hr />

        <div style="font-size: 15px;">
            <span class="badge badge-primary">Cantidad de articulos:</span>
            <asp:Label ID="lblCantidad" Text="0" runat="server" />
        </div>
        <div style="font-size: 15px;">
            <span class="badge badge-primary"">Precio total: $</span>
            <asp:Label ID="lblTotal" Text="0" runat="server" />
        </div>
        <div class="form-group" style="float: right;">
            <a href="Carrito.aspx?empty=1" class="btn btn-primary" style="background-color:darkred; border-bottom-color:darkred;">Vaciar carrito</a>
            <a href="#" class="btn btn-primary">Continuar compra</a>
        </div>
    </div>
        </div>

    <br />
    <br />
    <table class="table table-dark" border="1" style="border: thin outset #000000; margin: auto; background-color:#30475e; opacity:0.9;">
        <tr style="border: 1px groove #000000; background-color:#222831;">
            <td></td>
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
            <td><a class="btn btn-primary" href="Carrito.aspx?ID=<%=item.ID.ToString() %>&delete=1" style="background-color:#af2d2d;"> Eliminar </a></td>
            <td>
                <img src="<%= item.ImagenURL %>" class="card-img-top" width="120" height="60" alt="Imagen del <%=item.Nombre %>"></td>
            <td><%= item.Nombre %></td>
            <td><%= item.PlataformaJuego.Nombre %></td>

            <td><%=item.PlataformaJuego.Precio %></td>
            <td><%=item.Cantidad %> <input type="number" name="name" value="" /></td>
        </tr>

        <%     }
            }

        %>
    </table>

</asp:Content>
