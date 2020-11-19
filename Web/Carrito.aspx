<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="Web.Carrito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%if (((List<Dominio.Juego>)Session["ListaCarrito"]).Count() == 0)
        {%>
    <h1>CARRITO VACIO</h1>
    <%}%>

    <%else
        {%>
    <div class="card" style="background-color: aquamarine; line-height: normal; list-style-type: none; table-layout: auto;">
        <h1>Total de Items: <%=((List<Dominio.Juego>)Session["ListaCarrito"]).Count() %></h1>
        <h1>Sus Items en el Carrito son :</h1>

    </div>
    <table class="table" border="1" style="border: thin outset #000000; margin: auto; background-color: #FFCCFF;">
        <tr style="border: 1px groove #000000;">
            <td>Imagen</td>
            <td>Nombre</td>
            <td>Plataforma</td>
            <td>Precio</td>
            <td>Cantidad</td>
            


        </tr>
        <%
            foreach (Dominio.Juego item in  (List<Dominio.Juego>)Session["ListaCarrito"])
            {%>

        <tr style="border: 1px groove #000000;">
            <td>
                <img src="<%= item.ImagenURL %>" class="card-img-top" width="180" height="120" alt="Imagen del <%=item.Nombre %>"></td>
            <td><%= item.Nombre %></td>
            <td><%= item.PlataformaJuego.Nombre %></td>

            <td><%=item.PlataformaJuego.Precio %></td>
            <td><%= ((List<Dominio.Juego>)Session["ListaCarrito"]).Count(I => I.ID == item.ID && I.PlataformaJuego.ID == item.PlataformaJuego.ID)%></td>
        </tr>

        <%}%>
    </table>
    <div class="row">
        <%
         foreach (Dominio.Juego item in  (List<Dominio.Juego>)Session["ListaCarrito"])
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
                            <a href="Carrito.aspx?ID=<%=item.ID %>&delete=1" class="btn btn-primary btn-block" style="background-color: darkred" type="button">Eliminar del Carrito</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <%}%>
    </div>

    <%}%>
    <asp:GridView CssClass="table" ID="dgvCarrito" runat="server" AutoGenerateColumns="False" BackColor="#669999">
        <Columns>
            <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-CssClass="oculto" HeaderStyle-CssClass="oculto" />
            <asp:ImageField HeaderText="Imagen" DataImageUrlField="ImagenUrl" ControlStyle-Height="120" ControlStyle-Width="180" />
            <asp:BoundField HeaderText="Juego" DataField="Nombre" />
            <asp:BoundField HeaderText="Plataforma" DataField="PlataformaJuego.Nombre" />
            <asp:BoundField HeaderText="Cantidad" />

        </Columns>
    </asp:GridView>


</asp:Content>
