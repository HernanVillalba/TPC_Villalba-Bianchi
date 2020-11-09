<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Web.Login" %>

<asp:Content ID="ContentLogin" ContentPlaceHolderID="MainContent" runat="server">

    <div style="margin: 0 auto;">
        <h1>Iniciar sesión</h1>
    </div>


    <div class="card" style="width: 20rem; margin: 0 auto;">
        <label>Usuario</label>
        <input type="email" class="form-control" id="inputUser" placeholder="Ingresa su mail o usuario" />

        <label>Contraseña</label>
        <input type="password" class="form-control" id="inputPassword" placeholder="Ingrese su contrseña" />

        <div>
            <button class="btn btn-primary"> Aceptar</button>
        </div>
    </div>


</asp:Content>
