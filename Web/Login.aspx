<%@ Page Title="Iniciar Sesión / Registrarse" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Web.Login" %>

<asp:Content ID="ContentLogin" ContentPlaceHolderID="MainContent" runat="server">

    <div style="display:flex; align-items:center; justify-content:center;">
        <h1 style="font-style:italic; color:#1a1c20; text-shadow: 0.1em 0.1em #333;">Iniciar sesión / Registrarse</h1>
    </div>


    <div style="border-radius: 10px; background-color: rgb(242,242,242); padding: 40px;">
        <div class="form" style="width: 20rem; margin: 0 auto;">
            <div class="card-group">
                <label class="form-control-label" for="inputUser">Usuario</label>
                <input class="form-control" type="text" id="inputUser" placeholder="Ingresa su mail o usuario" required="required"/>
                <br />

                <label class="form-control-label" for="inputPassword">Contraseña</label>
                <input type="password" class="form-control" id="inputPassword" placeholder="Ingrese su contrseña" required="required" />
                <br />

                <button type="button" class="btn btn-primary btn-block"> Acceder </button>
                <hr />

                <div style="display:flex; align-items:center; justify-content:center;">
                <label class="form-control-label" for="btnRegistrarse"> ¿Eres nuevo? </label>
                </div>
                <button id="btnRegistrarse" type="button" class="btn btn-primary btn-block" style="background-color:#14274e;"> Registrarse </button>
            </div>
        </div>
    </div>


</asp:Content>
