<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Modificar.aspx.cs" Inherits="Web.Modificar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <br />
    <br />

    <table style="font-size: 25px">
        <tr>
            <td>
                <div class="card" style="background-color: yellow;">
                    <h3>Datos Actuales</h3>
                    <div>
                        <asp:Label runat="server" ID="lblNombre" />
                    </div>
                    <div>
                        <asp:Label runat="server" ID="lblDescripcion" />
                    </div>
                    <div>
                        <asp:Label runat="server" ID="lblImagen" />
                    </div>
                    <div>
                        <asp:Image runat="server" ID="urlImage" Height="200px" />
                    </div>
                    <div>
                        <asp:Label runat="server" ID="lblDesarrolladora" />
                    </div>
                    <div>
                        <asp:Label runat="server" ID="lblPlataforma" />
                    </div>
                    <div>
                        <asp:Label runat="server" ID="lblStock" />
                    </div>
                    <div>
                        <asp:Label runat="server" ID="lblPrecio" />
                    </div>
                </div>
            </td>
            <td>
                <div class="card" style="background-color: red;">
                    <h3>Nuevos Datos</h3>
                    <div>
                        <asp:Label Text="Nombre: " runat="server" />
                        <asp:TextBox runat="server" ID="tbxNombre" Height="25px" />
                    </div>

                    <div>
                        <asp:Label Text="Descripcion: " runat="server" />
                        <asp:TextBox runat="server" ID="txbDescripcion" Height="25px" />
                    </div>
                    <div>
                        <asp:Label Text="URL Imagen: " runat="server" />
                        <asp:TextBox runat="server" ID="tbxImagen" Height="25px" />
                    </div>
                    <div>
                        <asp:Image runat="server" ID="newImagen" Height="200px" />
                    </div>
                    <div>
                        <asp:Label Text="Desarrolladora: " runat="server" />
                        <asp:DropDownList runat="server" ID="ddlDesarrolladora" Height="25px" />
                    </div>
                    <div>
                        <asp:Label Text="Plataforma: " runat="server" />
                        <asp:DropDownList runat="server" ID="ddlPlataforma" Height="25px" />
                    </div>
                    <div>
                        <asp:Label Text="Stock: " runat="server" />
                        <asp:TextBox runat="server" ID="tbxStock" Height="25px" />
                    </div>
                    <div>
                        <asp:Label Text="Precio: " runat="server" />
                        <asp:TextBox runat="server" ID="txtPrecio" Height="25px" />
                    </div>

                </div>
            </td>
        </tr>
    </table>
</asp:Content>

