<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CatalogoJuegos.aspx.cs" Inherits="Web.CatalogoJuegos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <br />
    <div class="row">
        <%
            foreach (Dominio.Juego item in Lista)
            {%>
        <div class="col-md-4">
            <div class="card" style="width: 18rem; background-color: transparent;">
                <img class="card-img-top" src="<%= item.ImagenURL %>" alt="imagen-juego" style="width:inherit;">
                <div class="card-body">
                    <ul class="list-group">
                        <li class="list-group-item list-group-item-white"><%= item.Nombre %></li>
                    </ul>
                    <a href="#<%= item.ID %>" class="btn btn-primary btn-block" style="background-color: deepskyblue;" type="button">Detalles</a>
                    <a href="#" class="btn btn-primary btn-block" type="button">Agregar al Carrito</a>
                </div>
            </div>
        </div>
        <%}%>
    </div>
</asp:Content>
