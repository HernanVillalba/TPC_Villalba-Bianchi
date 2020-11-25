<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="Web.Carrito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <%if (((List<Dominio.Juego>)Session["ListaCarrito"]).Count() == 0)
        {%>
    <h1>CARRITO VACIO</h1>
    <%}%>

    <%else
        {%>
    <div class="jumbotron" style="background-color: aquamarine;">
        <div>

            <span class="badge badge-primary"  style="font-size:20px;">
                Cantidad de articulos:
                <asp:Label ID="lblCantidad" Text="0" runat="server" />
            </span>
        </div>
        <div style="font-size:20px;">
            <span class="badge badge-primary"  style="font-size:20px;">
                Precio total: $
                <asp:Label ID="lblTotal" Text="0" runat="server" />
            </span>
        </div>
    </div>

    <br />
    <br />
    <table class="table" border="1" style="border: thin outset #000000; margin: auto; background-color: #FFCCFF;">
        <tr style="border: 1px groove #000000;">
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
                <img src="<%= item.ImagenURL %>" class="card-img-top" width="180" height="120" alt="Imagen del <%=item.Nombre %>"></td>
            <td><%= item.Nombre %></td>
            <td><%= item.PlataformaJuego.Nombre %></td>

            <td><%=item.PlataformaJuego.Precio %></td>
            <td><%= ((List<Dominio.Juego>)Session["ListaCarrito"]).Count(I => I.ID == item.ID && I.PlataformaJuego.ID == item.PlataformaJuego.ID)%></td>
        </tr>

        <%     }
            }

        %>
    </table>

</asp:Content>
