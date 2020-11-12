<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Detalles.aspx.cs" Inherits="Web.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



    <br />
    <br />
    <div class="row">
      
        <div class="col-md-4">
            <div class="card" style="width: 18rem; background-color: transparent;">
                <img class="card-img-top" src="<%= juegoDetalles.ImagenURL %>" alt="imagen-juego" style="width:inherit;" height="120">
                <div class="card-body">
                    <ul class="list-group">
                        <li class="list-group-item list-group-item-white"><%= juegoDetalles.Nombre %></li>
                        <li class="list-group-item list-group-item-white" style="color:cornflowerblue;"><%= juegoDetalles.PlataformaJuego.Nombre %></li>
               
                    <a href="#" class="btn btn-primary btn-block" type="button">Agregar al Carrito</a>
                        </ul>
                </div>
            </div>
    </div>
    </div>










</asp:Content>
