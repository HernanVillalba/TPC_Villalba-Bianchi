<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Juego_Agregar.aspx.cs" Inherits="Web.Agregar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />

    <div class="centrado">
        <div class="card" style="background-color: khaki; width: 500px; align-items:center;">

            <div class="card-header" style="background-color:transparent">
                <h1><strong>Agregar juego</strong></h1>

            </div>
            <div class="card-body">

                <div class="form">
                    <div class="form-group">

                        <label>Nombre: </label>
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Descripción: </label>
                        <asp:TextBox ID="txtDesc" runat="server" Height="98px" Width="272px" CssClass="form-control"></asp:TextBox>

                    </div>
                    <div class="form-group">

                        <label>URL Imagen:</label>
                        <asp:TextBox ID="txtImagenUrl" runat="server" CssClass="form-control"></asp:TextBox>

                    </div>
                    <div class="form-group">
                        <label>Desarrollador: </label>
                        <asp:DropDownList ID="ddlDesarrollador" runat="server" AppendDataBoundItems="true">
                            <asp:ListItem Text="Seleccionar" Value="0" />
                        </asp:DropDownList>

                    </div>
                    <div class="form-group">
                        <label>Plataforma: </label>
                        <asp:DropDownList ID="ddlPlataforma" runat="server" AppendDataBoundItems="true">
                            <asp:ListItem Text="Seleccionar" Value="0" />
                        </asp:DropDownList>

                    </div>
                    <div class="form-group">
                        <label>Precio: </label>
                        <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Stock: </label>
                        <asp:TextBox ID="txtStock" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="card-footer" style="background-color:transparent">
                <div class="row">
                    <div class="col">

                <asp:Button Text="Agregar" CssClass="btn btn-primary btn-block" runat="server" ID="btnAgregar" OnClick="btnAgregar_Click" />
                    </div>
                    <div class="col">
                <asp:Button Text="Cancelar" CssClass="btn btn-primary btn-block" ID="btnCancelar" runat="server" OnClick="btnCancelar_Click" BackColor="Red" BorderColor="Red" />

                    </div>
                </div>
            </div>

        </div>
    </div>

</asp:Content>
