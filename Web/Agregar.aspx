<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Agregar.aspx.cs" Inherits="Web.Agregar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



    <div class="card" />
    <div>

        <asp:Label ID="LblNombre" runat="server" Text="Nombre: "></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

    </div>
    <div>

        <asp:Label ID="LblDescripcion" runat="server" Text="Descripcion:"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server" Height="98px" Width="272px"></asp:TextBox>

    </div>
    <div>

        <asp:Label ID="LblImagenUrl" runat="server" Text="ImagenURL"></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>

    </div>
    <div>

        <asp:Label ID="LblDesarrollador" runat="server" Text="Desarrollador"></asp:Label>

        <asp:DropDownList ID="ddlDesarrollador" runat="server">
        </asp:DropDownList>

    </div>
    <div>

        <asp:Label ID="LblPlataforma" runat="server" Text="Plataforma"></asp:Label>

        <asp:DropDownList ID="ddlPlataforma" runat="server">
        </asp:DropDownList>

    </div>
    <div>

        <asp:Label ID="LblPrecio" runat="server" Text="Label"></asp:Label>
        <asp:TextBox ID="txtPrecio" runat="server"></asp:TextBox>

    </div>
    <div>

        <asp:Label ID="LblStock" runat="server" Text="Label"></asp:Label>
        <asp:TextBox ID="txtStock" runat="server"></asp:TextBox>

    </div>

    </div>


</asp:Content>
