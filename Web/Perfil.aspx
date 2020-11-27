<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="Web.Perfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Falta hacer!!!!</h1>
    
    <div class="form">
        <img src="#" alt="foto-pefil" />
        <h3>Datos de cuenta</h3>
        <label>Mail: </label>
        <asp:TextBox ID="tbMail" runat="server" />
        <label>Nombre de usuario: </label>
        <asp:TextBox ID="tbNombreUsuario" Text="Nombre usuario" runat="server" />
        <label>Contraseña: </label>
        <asp:TextBox ID="tbContraseña" Text="Contraseña" runat="server" />

        <h3>Datos personales: </h3>
        <label>Nombre: </label>
        <asp:TextBox ID="tbNombre" runat="server" />
        <label>Apellido: </label>
        <asp:TextBox ID="tbApellido" runat="server" />

        <h3>Datos de envio</h3>
        <label>CP: </label>
        <label></label>
        <label></label>

        <h3></h3>
    </div>
</asp:Content>
