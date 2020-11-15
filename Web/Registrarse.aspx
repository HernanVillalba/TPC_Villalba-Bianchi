<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registrarse.aspx.cs" Inherits="Web.Registrarse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Registrarse</title>

    <webopt:BundleReference runat="server" Path="~/Content/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />

    <style>
        body {
            background-image: url(https://fondosmil.com/fondo/28067.jpg);
            background-position: center center;
            background-size: cover;
            background-attachment: fixed;
        }
    </style>
    <script>
        function validar() {
            var Nombre = document.getElementById("<%= txtNombre.ClientID%>").value;
            var Apellido = document.getElementById("<%= txtApellido.ClientID%>").value;
            var Mail = document.getElementById("<%= txtMail.ClientID%>").value;
            var NombreUsuario = document.getElementById("<%= txtUser.ClientID%>").value;
            var contraseña = document.getElementById("<%= txtContra.ClientID%>").value;
            if (Nombre === "" || Apellido === "" || Mail === "" || NombreUsuario === "" || contraseña === "") {
                alert("Complete todos los campos para registrarse!!!");
                return false;
            }  
            return true;
        }
    </script>
</head>
<body>
    <div style="display: flex; align-items: center; justify-content: center;">
        <h1 style="font-style: italic; color: #1a1c20; text-shadow: 0.1em 0.1em #333;">Registrarse</h1>
    </div>

    <form runat="server" class="form-inline">
        <div style="border-radius: 10px; background-color: rgb(242,242,242); padding: 40px; width: 1000px; margin: 0 auto;">

            <div class="form-group">
                <label>Nombre:</label>
                <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
                <div class="form-group">
                    <label>Apellido:</label>
                    <asp:TextBox runat="server" ID="txtApellido" CssClass="form-control" />
                </div>
            </div>
            <hr />
            <div class="form-group" style="width: 1000px; margin: 0 auto;">
                <label>Mail:</label>
                <asp:TextBox runat="server" ID="txtMail" CssClass="form-control" TextMode="Email" />

                <label>Nombre de usuario:</label>
                <asp:TextBox runat="server" ID="txtUser" CssClass="form-control" />
                <label>Contraseña:</label>
                <asp:TextBox runat="server" ID="txtContra" CssClass="form-control" TextMode="Password" />
            </div>
        </div>
        <asp:Button ID="btnRegistrarse" Text="Registrarse" runat="server" CssClass="btn btn-primary btn-block" Style="margin: 0 auto;" OnClientClick="return validar()" OnClick="btnRegistrarse_Click" />
    </form>
</body>
</html>