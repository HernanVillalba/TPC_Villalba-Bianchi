<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Administrador.aspx.cs" Inherits="Web.Administrador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">




    <div class="jumbotron">
        <p>
            <asp:DropDownList ID="dropCat" runat="server"></asp:DropDownList>
            <asp:TextBox ID="txtBuscar" runat="server"></asp:TextBox>

        </p>
    </div>

    <asp:GridView ID="gvJuegos" runat="server" AutoGenerateColumns="false" BackColor="White">
        <Columns>
            <asp:BoundField HeaderText="ID" DataField="ID"  />  
            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />  
            <asp:BoundField HeaderText="Descripcion" DataField="Descripcion" />
            <asp:BoundField HeaderText="Plataforma" DataField="PlataformaJuego.Nombre" />
            <asp:BoundField HeaderText="IDPlataforma" DataField="PlataformaJuego.ID" />
            <asp:BoundField HeaderText="Stock" DataField="PlataformaJuego.Stock" />
            <asp:BoundField HeaderText="Valor" DataField="PlataformaJuego.Precio" />
            <asp:BoundField HeaderText="Desarrollador" DataField="DesarrolladorJuego.Nombre" />
            <asp:BoundField HeaderText="IDDesarrollador" DataField="DesarrolladorJuego.ID" />
        </Columns>


    </asp:GridView>
  
</asp:Content>




