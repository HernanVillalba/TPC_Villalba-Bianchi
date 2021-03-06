﻿<%@ Page Title="Juegos :)" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CatalogoJuegos.aspx.cs" Inherits="Web.CatalogoJuegos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col">
            <div class="centrado">
                <div class="jumbotron" style="height: 210px; background-position: 320px center; background-image: url(https://www.hd-tecnologia.com/imagenes/articulos/2019/04/Crossplay-Las-familias-quieren-jugar-juntas-y-nadie-tiene-4-PlayStations.jpg); background-attachment: inherit; background-size: 55%; background-repeat: no-repeat;">
                    <h2 class="display-5">Los juegos queres al Precio que podes!</h2>
                    <p class="lead">Buscas algo particular?</p>
                    <div class="lead">
                        <div class="dropdown" style="width: 230px; opacity: 0.9;">
                            <asp:DropDownList ID="dropCat" runat="server" CssClass="dropdown-item" BackColor="#393e46" AppendDataBoundItems="true">
                                <asp:ListItem Text="Todas las Plataformas" Value="0" />

                            </asp:DropDownList>
                        </div>
                        <br />
                        <div class="input-group" style="width: 230px;">
                            <asp:TextBox ID="txtBuscar" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" CssClass="btn btn-primary" />
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div class="col">
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel" style="max-width: 200px; max-height: 200px;" data-interval="3000">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <a href="#"><img class="d-block w-100" src="https://tinyurl.com/y72zx3yp" alt="First slide"></a>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="https://movilzona.xyz/img/xbox.png" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="https://tinyurl.com/yafmjsh9" alt="thirst slide">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>

            </div>
        </div>
    </div>



    <div class="row">
        <%foreach (Dominio.Juego item in (List<Dominio.Juego>)Session["Productos"])
            {%>
        <div class="col-md-4">
            <div class="card" style="width: 18rem; background-color: transparent; border-color: transparent; border-radius: 10px;">
                <div class="card-footer" style="border-radius: 5px;">

                    <%if (Session["listaFav"] == null || ((List<Dominio.Juego>)Session["listaFav"]).Find(i => i.ID == item.ID && i.PlataformaJuego.ID == item.PlataformaJuego.ID) == null)
                        { %>
                    <a href="Favoritos.aspx?IDJuego= <%=item.ID %>&IDPlataforma=<%=item.PlataformaJuego.ID %>&add=1" class="mx-auto btn btn-outline-info" style="float: right;">
                        <img title="Agregar a favoritos" src="https://image.flaticon.com/icons/png/512/13/13587.png" alt="img-fav" style="height: 20px; width: 20px;" /></a>

                    <% }
                        else
                        {%>
                    <a href="Favoritos.aspx?IDJuego=<%= item.ID %>&IDPlataforma=<%=item.PlataformaJuego.ID %>&delete=1" class="mx-auto btn btn-outline-info" style="float: right;">
                        <img title="Agregar a favoritos" src="https://tinyurl.com/y5mnq3y8" alt="img-fav" style="height: 20px; width: 20px;" /></a>

                    <% } %>
                </div>
                <img class="card-img-top" src="<%= item.ImagenURL %>" alt="imagen-juego" style="width: inherit;" height="120">
                <div class="card-body">
                    <ul class="list-group">

                        <li class="list-group-item centrado">$<%=item.PlataformaJuego.Precio %></li>
                        <li class="list-group-item centrado"><%= item.Nombre %></li>
                        <li class="list-group-item centrado" style="color: cornflowerblue;"><%= item.PlataformaJuego.Nombre %></li>
                        <li class="list-group-item ">
                            <%if (item.PlataformaJuego.Stock > 0)
                                { %> <a href="Detalles.aspx?IDJ=<%=item.ID%>&IDP=<%=item.PlataformaJuego.ID%>" class="btn btn-primary btn-block" style="background-color: deepskyblue;" type="button">Detalles</a>
                            <a href="Carrito.aspx?ID=<%=item.ID.ToString()%>&add=1&IDP=<%=item.PlataformaJuego.ID %>" class="btn btn-primary btn-block" type="button">Agregar al Carrito</a>
                            <%}
                                else
                                { %>
                            <asp:Label Text="Sin Stock" Style="color: red; font-size: large; font-family: 'Comic Sans MS';" runat="server" Font-Bold="True" />
                            <%} %>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <%}%>
    </div>

</asp:Content>
