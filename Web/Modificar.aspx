<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Modificar.aspx.cs" Inherits="Web.Modificar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <br />
    <br />
    <script>
        function validar() {
            var Nombre = document.getElementById("<%= tbxNombre.ClientID %>").value;
            var Imagen = document.getElementById("<%= tbxImagen.ClientID %>").value;
            var Descripcion = document.getElementById("<%= tbxDescripcion.ClientID%>").value;
            var Stock = document.getElementById("<%= tbxStock.ClientID %>").value;
            var Precio = document.getElementById("<%= tbxPrecio.ClientID%>").value;

            if (Nombre === "" || Imagen === "" || Descripcion === "" || Stock === "" || Precio === "")
            {
                alert("No Ingreso Todos los datos, revise");
                return false;
            }



            return true;
        }

    </script>


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
            <td style="width: 531px">
                <div class="card" style="background-color: red;">
                    <h3>Nuevos Datos</h3>
                    <div>
                        <asp:Label Text="Nombre: " runat="server" />
                        <asp:TextBox runat="server" ID="tbxNombre" Height="25px" Width="211px" />
                        <asp:CheckBox Text="Conservar Actual" runat="server" ID="chkNombre" Font-Overline="True" Font-Size="12pt" />

                    </div>

                    <div>
                        <asp:Label Text="Descripcion: " runat="server" />
                        <asp:TextBox runat="server" ID="tbxDescripcion" Height="25px" Width="174px" />
                        <asp:CheckBox Text="Conservar Actual" runat="server" ID="chkDesc" Font-Overline="True" Font-Size="12pt" />

                    </div>
                    <div>
                        <asp:Label Text="URL Imagen: " runat="server" />
                        <asp:TextBox runat="server" ID="tbxImagen" Height="25px" OnTextChanged="TbxImagen_TextChanged" Width="164px" />
                        <asp:CheckBox Text="Conservar Actual" runat="server" ID="chkImagen" Font-Italic="True" Font-Size="12pt" />

                    </div>
                    <div>
                        <asp:Image runat="server" ID="newImagen" Height="200px" OnDataBinding="TbxImagen_TextChanged" />
                    </div>
                    <div>
                        <asp:Label Text="Stock: " runat="server" />
                        <asp:TextBox runat="server" ID="tbxStock" Height="25px" />
                        <asp:CheckBox Text="Conservar Actual" runat="server" ID="chkStock" Font-Italic="True" Font-Size="12pt" />

                    </div>
                    <div>
                        <asp:Label Text="Precio: " runat="server" />
                        <asp:TextBox runat="server" ID="tbxPrecio" Height="25px" />
                        <asp:CheckBox Text="Conservar Actual" runat="server" Font-Bold="False" Font-Italic="True" Font-Size="12pt" ID="chkPrecio" />

                    </div>

                </div>
            </td>
        </tr>
    </table>

    <asp:Button Text="Modificar" runat="server" OnClientClick="return validar()" OnClick="Click_Modificar" />
</asp:Content>

