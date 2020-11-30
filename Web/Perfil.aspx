<%@ Page Title="Perfil" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="Web.Perfil" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Falta hacer!!!!</h1>

    <div class="centrado">
        <!-- falta cargar la imagen de usuario -->
        <img src="https://tinyurl.com/yxcyys3b" alt="foto-pefil" class="rounded-circle" style="max-height: 90px; max-width: 90px;" />
    </div>


    <div class="form" style="background-color: #222831; opacity: 0.9; border-radius: 10px 10px;">
        <%if (Session["GuardardoExitoso"] != null && (bool)Session["GuardardoExitoso"] == true)
            { %>
        <h3 style="color: forestgreen;">Datos guardados correctamente!</h3>
        <% }
            else if(Session["GuardardoExitoso"] != null && (bool)Session["GuardardoExitoso"] == false)
            {%>
        <h3 style="color:red;">No se guardaron los cambios.</h3>
        <%} %>



        <h3 class="centrado">Datos de cuenta </h3>
        <div class="centrado">
            <label>Nombre de usuario: </label>
            <asp:TextBox ID="tbNombreUsuario" runat="server" CssClass="form-control" required="true" />
            <label>Contraseña: </label>
            <asp:TextBox ID="tbContraseña" runat="server" CssClass="form-control" type="password" required="true" />
            <asp:Label ID="lblContra" Text="" runat="server" type="password" />
        </div>

        <hr />

        <h3 class="centrado">Datos personales</h3>
        <div class="centrado">
            <label>Nombre: </label>
            <asp:TextBox ID="tbNombre" runat="server" CssClass="form-control" required="true" />
            <label>Apellido: </label>
            <asp:TextBox ID="tbApellido" runat="server" CssClass="form-control" required="true" />
            <label>Mail: </label>
            <asp:TextBox ID="tbMail" runat="server" CssClass="form-control" required="true" />
            <label>Telefono: </label>
            <asp:TextBox runat="server" ID="tbTelefono" CssClass="form-control" required="true" />
            <label>Telefono alternativo: </label>
            <asp:TextBox runat="server" ID="tbTelefonoAlter" CssClass="form-control" required="true"/>
        </div>

        <hr />

        <h3 class="centrado">Datos de envio</h3>
        <div class="centrado">
            <label>Dirección: </label>
            <asp:TextBox runat="server" ID="tbDireccion" CssClass="form-control" required="true" />
            <label>Altura: </label>
            <asp:TextBox runat="server" ID="tbAltura" CssClass="form-control" required="true" />
            <label>CP: </label>
            <asp:TextBox runat="server" ID="tbCP" CssClass="form-control" required="true" />
        </div>
        <br />

        <div class="centrado">
            <a href="CatalogoJuegos.aspx" class="btn btn-primary" style="border-color: red; background-color: red;">Descartar cambios</a>
            <asp:Button ID="btnGuardar" Text="Guardar Cambios" runat="server" CssClass="btn btn-primary" OnClick="btnGuardar_Click" />
            <a href="Perfil.aspx?guardar=1" class="btn btn-primary">Guardar cambios2</a>
        </div>

    </div>
</asp:Content>
