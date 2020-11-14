<%@ Page Title="Iniciar Sesión / Registrarse" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Web.Login" %>

<asp:Content ID="ContentLogin" ContentPlaceHolderID="MainContent" runat="server">

    <script>
        function validar()
        {
            var Usuario = document.getElementById("tbUsuario").value;
            var Password = document.getElementById("<% = tbPassword.ClientID%>").value;
            var valido = true;

            if (Usuario === "") {
                alert("Completa el campo de usuario!");
                valido = false;
            }
            else
            {
                $("#tbUsuario").removeClass("is-invalid");
                $("#tbUsuario").addClass("is-valid");
            }


            if (Password === "") {
                alert("Completa el campo de password!");
                valido = false;
            }
            else {
                $("#tbPassword").removeClass("is-invalid");
                $("#tbPassword").addClass("is-valid");
            }

            if (!valido) { return false; }
            else { return true;}
        }
    </script>

    <div style="display:flex; align-items:center; justify-content:center;">
        <h1 style="font-style:italic; color:#1a1c20; text-shadow: 0.1em 0.1em #333;">Iniciar sesión / Registrarse</h1>
    </div>

    <div style="border-radius: 10px; background-color: rgb(242,242,242); padding: 40px;">
        <div class="form" style="width: 20rem; margin: 0 auto;">
            <div class="card-group">
                <label class="form-control-label">Usuario</label>
                <asp:TextBox CssClass="form-control" ID="tbUsuario" ClientIDMode="Static" runat="server"  />
                <br />

                <label class="form-control-label" for="inputPassword">Contraseña</label>
                <asp:TextBox CssClass="form-control" ID="tbPassword" ClientIDMode="Static" runat="server" TextMode="Password" />
                <br />

                <asp:Button ID="btnAceptar" CssClass="btn btn-primary btn-block" Text="Acceder" OnClientClick="return validar()" OnClick="btnAceptar_click" runat="server"  />
                <hr />

                <div style="display:flex; align-items:center; justify-content:center;">
                <label class="form-control-label" for="btnRegistrarse"> ¿Eres nuevo? </label>
                </div>
                <button id="btnRegistrarse" type="button" class="btn btn-primary btn-block" style="background-color:#14274e;"> Registrarse </button>
            </div>
        </div>
    </div>


</asp:Content>
