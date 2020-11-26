<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Agregar.aspx.cs" Inherits="Web.Agregar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />


    <div class="form" style="background-color:chocolate">
        <div class="form-group">

            <asp:Label ID="LblNombre" runat="server" Text="Nombre: "></asp:Label>
            <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
            <br />
        </div>
        <div class="form-group">

            <asp:Label ID="LblDescripcion" runat="server" Text="Descripcion:"></asp:Label>
            <asp:TextBox ID="txtDesc" runat="server" Height="98px" Width="272px"></asp:TextBox>
            <br />
        </div>
        <div class="form-group">

            <asp:Label ID="LblImagenUrl" runat="server" Text="ImagenURL:"></asp:Label>
            <asp:TextBox ID="txtImagenUrl" runat="server"></asp:TextBox>
            <br />
        </div>
        <div class="form-group">

            <asp:Label ID="LblDesarrollador" runat="server" Text="Desarrollador:"></asp:Label>
            <asp:DropDownList ID="ddlDesarrollador" runat="server">
            </asp:DropDownList>
            <br />
        </div>
        <div class="form-group">

            <asp:Label ID="LblPlataforma" runat="server" Text="Plataforma:"></asp:Label>

            <asp:DropDownList ID="ddlPlataforma" runat="server">
            </asp:DropDownList>

        </div>
        <div class="form-group">

            <asp:Label ID="LblPrecio" runat="server" Text="Precio:"></asp:Label>
            <asp:TextBox ID="txtPrecio" runat="server"></asp:TextBox>

        </div>
        <div class="form-group">

            <asp:Label ID="LblStock" runat="server" Text="Stock:"></asp:Label>
            <asp:TextBox ID="txtStock" runat="server"></asp:TextBox>

        </div>

    </div>


</asp:Content>
