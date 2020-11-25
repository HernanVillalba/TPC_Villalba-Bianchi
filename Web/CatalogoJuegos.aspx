<%@ Page Title="Juegos :)" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CatalogoJuegos.aspx.cs" Inherits="Web.CatalogoJuegos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <br />
    <div class="jumbotron" style="background-position: right center; background-image: url(https://www.hd-tecnologia.com/imagenes/articulos/2019/04/Crossplay-Las-familias-quieren-jugar-juntas-y-nadie-tiene-4-PlayStations.jpg); background-attachment: inherit; background-repeat: no-repeat;">
        <h2 class="display-5">Los juegos queres</h2>
        <h2 class="display-5">al Precio que podes!</h2>
        <p class="lead">Buscas algo particular?</p>
        <div class="lead">
            <asp:DropDownList ID="dropCat" runat="server"></asp:DropDownList>
            <div>
                <asp:TextBox ID="txtBuscar" runat="server"></asp:TextBox>
                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
            </div>
        </div>
    </div>

    <div class="row">
        <%
            foreach (Dominio.Juego item in (List<Dominio.Juego>)Session["Productos"])
            {%>
        <div class="col-md-4">
            <div class="card" style="width: 18rem; background-color: transparent;">
                <img class="card-img-top" src="<%= item.ImagenURL %>" alt="imagen-juego" style="width: inherit;" height="120">
                <div class="card-body">
                    <ul class="list-group">
                        <li class="list-group-item list-group-item-white"><%= item.Nombre %></li>
                        <li class="list-group-item list-group-item-white" style="color: cornflowerblue;"><%= item.PlataformaJuego.Nombre %></li>
                        <li class="list-group-item list-group-item-white">
                            <a href="Detalles.aspx?IDJ=<%=item.ID%>&IDP=<%=item.PlataformaJuego.ID%>" class="btn btn-primary btn-block" style="background-color: deepskyblue;" type="button">Detalles</a>
                            <a href="Carrito.aspx?ID=<%=item.ID.ToString()%>&add=1&IDP=<%=item.PlataformaJuego.ID %>" class="btn btn-primary btn-block" type="button">Agregar al Carrito</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <%}%>
    </div>

</asp:Content>
