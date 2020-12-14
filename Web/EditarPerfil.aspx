<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditarPerfil.aspx.cs" Inherits="Web.EditarPerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="centrado">
        <div style="width: 500px; border-radius: 10px; background-color: rgb(242,242,242); padding: 40px; opacity: 0.9;">
            <div>
                <div class="form-group">
                    <label>Nombre de usuario: </label>
                    <asp:TextBox runat="server" ID="tbNombreUsuario" CssClass="form-control" required="true" />
                </div>
                <div class="form-group">
                    <label>Mail</label>
                    <asp:TextBox runat="server" ID="tbMail" CssClass="form-control" required="true" />
                </div>
                <div class="form-group">
                    <label>Nombre: </label>
                    <asp:TextBox runat="server" ID="tbNombre" CssClass="form-control" required="true" />
                </div>
                <div class="form-group">
                    <label>Apellido</label>
                    <asp:TextBox runat="server" ID="tbApellido" CssClass="form-control" required="true" />
                </div>
                <div class="form-group">
                    <label>Teléfono</label>
                    <asp:TextBox runat="server" ID="tbTel" CssClass="form-control" required="true" />
                </div>
                <div class="form-group">
                    <label>Teléfono alternativo</label>
                    <asp:TextBox runat="server" ID="tbTelAlter" CssClass="form-control" />
                </div>
            </div>
        </div>
    </div>

    <div class="centrado">
        <div class="form-group">
            <label>Para guardar, ingrese su contraseña: </label>
            <asp:TextBox runat="server" ID="tbContraseña" CssClass="form-control" TextMode="Password"/>
        </div>
    </div>

    <div class="centrado">
        <div class="row">
            <div class="col">
                <a href="Perfil.aspx" class="btn btn-primary btn-block" style="background-color: red; border-color: red;">Descartar cambios</a>
            </div>
            <div class="col">
                <asp:Button ID="btnGuardar" Text="Guardar cambios" runat="server" CssClass="btn btn-primary btn-block" OnClick="btnGuardar_Click" />
            </div>
        </div>
    </div>
</asp:Content>
