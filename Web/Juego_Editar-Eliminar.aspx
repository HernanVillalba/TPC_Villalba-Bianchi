<%@ Page Title="Editar/Eliminar" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Juego_Editar-Eliminar.aspx.cs" Inherits="Web.Administrador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <asp:DropDownList ID="dropCat" runat="server" Height="24px" Width="168px"></asp:DropDownList>
        <asp:TextBox ID="txtBuscar" runat="server" Height="24px" Width="192px"></asp:TextBox>
        <asp:Button ID="Button2" runat="server" CssClass="badge" Height="24px" Text="Buscar" Width="112px" />
    </div>

    <asp:GridView ID="dgvJuegos" runat="server" AutoGenerateColumns="false" BackColor="White" OnRowCommand="gvJuegos_RowCommand">
        <Columns>
            <asp:BoundField HeaderText="ID" DataField="ID" />
            <asp:ImageField HeaderText="Imagen" DataImageUrlField="ImagenURL" ControlStyle-Height="100" ControlStyle-Width="100" AlternateText="Imagen" />
            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
            <asp:BoundField HeaderText="Descripcion" DataField="Descripcion" />
            <asp:BoundField HeaderText="Plataforma" DataField="PlataformaJuego.Nombre" />
            <asp:BoundField HeaderText="IDPlataforma" DataField="PlataformaJuego.ID" />
            <asp:BoundField HeaderText="Stock" DataField="PlataformaJuego.Stock" />
            <asp:BoundField HeaderText="Valor" DataField="PlataformaJuego.Precio" />
            <asp:BoundField HeaderText="Desarrollador" DataField="DesarrolladorJuego.Nombre" />
            <asp:BoundField HeaderText="IDDesarrollador" DataField="DesarrolladorJuego.ID" />
            <asp:ButtonField ButtonType="Button" Text="Modificar" commandName="Modify"/>
            <asp:ButtonField ButtonType="Button" Text="Eliminar" CommandName="Delete" />
        </Columns>


    </asp:GridView>

</asp:Content>




