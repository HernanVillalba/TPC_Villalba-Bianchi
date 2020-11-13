<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Detalles.aspx.cs" Inherits="Web.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



    <br />
    <br />
    <div class="row">


        <div class="card" style="background-color: midnightblue;">
            <div class="card">
                <h2 class="card-header" style="color: white; font-size: 27px;"> <%=juegoDetalles.Nombre %>   <a href="CatalogoJuegos.aspx" style="color: white; float: right"><%=juegoDetalles.PlataformaJuego.Nombre %></a></h2>
            
                    <img class="card-img-top" src="<%= juegoDetalles.ImagenURL %>" alt="imagen-juego" style="height:inherit; width:inherit">
                    <a href="#" class="btn btn-primary btn" type="button">Agregar al Carrito</a>
           
        </div>
    </div>
          <ul class="list-group list-group-flush" style="background-color: white; font-size: 20px;">            
              <li>  Desarrollado por: <%=juegoDetalles.DesarrolladorJuego.Nombre %>  </li>
             <li> Sinopsis: <%=juegoDetalles.Descripcion %></li>
    </div>
</asp:Content>
