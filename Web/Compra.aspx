<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Compra.aspx.cs" Inherits="Web.Compra" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        td {
            border-color: black;
            border: groove;
        }

        .auto-style1 {
            width: 113px;
        }

        .auto-style2 {
            width: 99px;
        }

        .auto-style3 {
            width: 125px;
        }

        .auto-style4 {
            width: 135px;
        }

        .auto-style5 {
            width: 167px;
            border-top-left-radius: calc(.25rem - 1px);
            border-top-right-radius: calc(.25rem - 1px);
            height: 103px;
        }
    </style>
    <div class="centrado">

        <div class="card" style="background-color: khaki">
            <div>

                <div class="form-group" style="font-size:20px">
                    <asp:Label Text ="Metodo de pago: " runat="server" />
                    <asp:Label ID="lblPago" runat="server"  />
                </div>

                <% if (((Dominio.Tarjeta)Session["MetodoPago"]).IDTarjeta != -1)
                    {%><div style="font-size:18px">
                    <asp:Label Text="Cantidad de Cuotas: " runat="server" />
                    <asp:Label ID="lblCant" runat="server" />
                </div>
                <%} %>
            </div>
            <br />
            <br />
            <div class="card-body">
                <div class="form-group" style="font-size:18px">

                <asp:Label ID="lblDireccion" runat="server" />
                    <div>

                <asp:Label ID="lblCP" runat="server" />
                    </div>

                <asp:Label id="lblLocalidad" runat="server" />

                <asp:Label id="lblProvincia" runat="server" />


                </div>

            </div>
            <div class="card-footer" style="left: auto">
                <%foreach (Dominio.Juego item in (List<Dominio.Juego>)Session["ListaCarrito"])

                    {%>
                <table>
                    <tr style="border: groove;">

                        <td>
                            <img src="<%= item.ImagenURL %>" class="auto-style5" alt="Imagen del <%=item.Nombre %>"></td>
                        <td class="auto-style4"><%= item.Nombre %></td>
                        <td class="auto-style3"><%= item.PlataformaJuego.Nombre %></td>

                        <td class="auto-style2"><%=item.PlataformaJuego.Precio %></td>
                        <td class="auto-style1"><%=item.Cantidad %></td>
                    </tr>

                    <%     } %>
                </table>
            </div>



        </div>
    </div>
</asp:Content>
