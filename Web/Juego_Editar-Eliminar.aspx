<%@ Page Title="Editar/Eliminar" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Juego_Editar-Eliminar.aspx.cs" Inherits="Web.Administrador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



    <asp:GridView ID="dgvJuegos" runat="server" AutoGenerateColumns="false" BackColor="White" OnRowCommand="gvJuegos_RowCommand" RowStyle-HorizontalAlign="Center">
        <Columns>
            <asp:BoundField HeaderText="ID" DataField="ID" />
            <asp:ImageField HeaderText="Imagen" DataImageUrlField="ImagenURL" ControlStyle-Height="100" ControlStyle-Width="100" AlternateText="Imagen" />
            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
            <asp:BoundField HeaderText="Descripcion" DataField="Descripcion" />
            <asp:BoundField HeaderText="Plataforma" DataField="PlataformaJuego.Nombre" />
            <asp:BoundField HeaderText="IDPlataforma" DataField="PlataformaJuego.ID"    />
            <asp:BoundField HeaderText="Stock" DataField="PlataformaJuego.Stock" ItemStyle-Width="50" />
            <asp:BoundField HeaderText="Valor" DataField="PlataformaJuego.Precio" />
            <asp:BoundField HeaderText="Desarrollador" DataField="DesarrolladorJuego.Nombre" />
            <asp:BoundField HeaderText="IDDesarrollador" DataField="DesarrolladorJuego.ID" />
            <asp:ButtonField ButtonType="Button" Text="Modificar" commandName="Modify" ControlStyle-BackColor="Yellow" ControlStyle-Font-Bold="true" ControlStyle-ForeColor="black" ItemStyle-CssClass="btn-outline-warning"/>
            <asp:ButtonField ButtonType="Button" Text="Eliminar" CommandName="Delete" ControlStyle-BackColor="red"  ControlStyle-Font-Bold="true" ControlStyle-ForeColor="black" ItemStyle-CssClass="btn-outline-danger"/>
        </Columns>


    </asp:GridView>

</asp:Content>




