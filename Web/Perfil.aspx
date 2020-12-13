<%@ Page Title="Perfil" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="Web.Perfil" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="centrado">
        <!-- falta cargar la imagen de usuario -->
        <img src="https://tinyurl.com/yxcyys3b" alt="foto-pefil" class="rounded-circle" style="max-height: 90px; max-width: 90px;" />
    </div>

    <div>
        <div  class="centrado">
            <%if (Session["GuardoUsuario"] != null)
                {
                    if ((bool)Session["GuardoUsuario"] == true)
                    {%>
            <h3 style="color: forestgreen">Datos guardados correctamente.</h3>
            <% }
                else
                {  %>
            <h3 style="color: red;">Contraseña incorrecta.</h3>
            <% }
                    Session["GuardoUsuario"] = null;
                }%>
        </div>
        <div class="centrado">
            <h2 class="centrado">Datos de cuenta </h2>
            <div style="width: 500px; border-radius: 10px; background-color: rgb(242,242,242); padding: 40px; opacity: 0.9;">
                <div class="centrado" style="font-size: 15px;">
                    <div>
                        <div class="form-group">
                            <label class="exampleInputEmail1">Nombre de usuario: </label>
                            <asp:Label ID="lblNombreUsuario" Text="Nombre Usuario" runat="server" />
                        </div>
                        <div class="form-group">
                            <label>Mail: </label>
                            <asp:Label ID="lblMail" Text="Mail" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <hr />

        <div class="centrado">
            <h2 class="centrado">Datos personales</h2>
            <div style="width: 500px; border-radius: 10px; background-color: rgb(242,242,242); padding: 40px; opacity: 0.9;">
                <div class="centrado" style="font-size: 15px;">
                    <div>
                        <div class="form-group">
                            <label>Nombre: </label>
                            <asp:Label ID="lblNombre" Text="Nombre" runat="server" />
                        </div>
                        <div class="form-group">
                            <label>Apellido: </label>
                            <asp:Label ID="lblApellido" Text="Apellido" runat="server" />
                        </div>
                        <div class="form-group">
                            <label>Telefono: </label>
                            <asp:Label ID="lblTelefono" Text="Telefono" runat="server" />
                        </div>
                        <div class="form-group">
                            <label>Telefono alternativo: </label>
                            <asp:Label ID="lblTelefonoAlter" Text="Tel alter" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <hr />

    <div class="centrado">
        <a href="CatalogoJuegos.aspx" class="btn btn-primary" style="border-color: red; background-color: red;">Descartar cambios</a>
        <a href="EditarPerfil.aspx" class="btn btn-primary">Editar perfil</a>
    </div>

</asp:Content>
