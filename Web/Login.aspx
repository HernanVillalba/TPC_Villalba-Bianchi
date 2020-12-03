<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Web.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Iniciar sesión</title>
    <webopt:BundleReference runat="server" Path="~/Content/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />

    <style>
        body {
            background-image: url(https://tinyurl.com/y33w67gl);
        }

        .centrado {
            display: flex;
            align-items: center;
            justify-content: center;
        }
    </style>

</head>
<body>
    <form runat="server">
        <div class="centrado">
            <img src="https://image.flaticon.com/icons/png/512/1484/1484867.png" height="100" alt="imagen de usuario" />
        </div>
        <div class="centrado">
            <h1 style="font-style: italic; color: #1a1c20; text-shadow: 0.1em 0.1em #333;">Iniciar sesión</h1>
        </div>

        <div class="centrado">
            <div style="width: 500px; border-radius: 10px; background-color: rgb(242,242,242); padding: 40px; opacity: 0.9;">
                <div style="width: 20rem; margin: 0 auto;">
                    <%if (Session["InicioSesion"] != null && (bool)Session["InicioSesion"] == false)
                        {%>
                    <label class="form-control-label" style="color: red;">Usuario o contraseña incorrectos</label>
                    <% } %>
                    <div class="form-group">
                        <label class="form-control-label">Usuario</label>
                        <asp:TextBox CssClass="form-control" ID="tbUsuario" ClientIDMode="Static" runat="server" placeHolder="Nombre de usuario" Required="true" />

                    </div>

                    <div class="form-group">
                        <label class="form-control-label" for="inputPassword">Contraseña</label>
                        <div class="input-control">
                            <asp:TextBox CssClass="form-control" ID="tbPassword" ClientIDMode="Static" runat="server" TextMode="Password" placeHolder="Contraseña" Required="true" />
                        </div>
                    </div>
                    <br />

                    <asp:Button ID="btnAcceder" autopostback="false" CssClass="btn btn-primary btn-block" Text="Acceder" OnClick="btnAcceder_Click" runat="server" />
                    <hr />


                    <div style="display: flex; align-items: center; justify-content: center;">
                        <label class="form-control-label" for="btnRegistrarse">¿Eres nuevo? </label>
                    </div>
                    <a class="btn btn-primary btn-block" style="background-color: #14274e;" href="Registrarse.aspx">Registrarse</a>
                </div>
            </div>
        </div>

    </form>


</body>
</html>



