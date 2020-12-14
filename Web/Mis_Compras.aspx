<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Mis_Compras.aspx.cs" Inherits="Web.Mis_Compras" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <div class="table-responsive">
        <table class="table table-dark" style="border-collapse:collapse;">
            <tr style="background-color:#4e8d7c">
                <td style="width:10px;"></td>
            <td>IDPedido</td>
            <td>Cantidad de Productos</td>
            <td>ImporteTotal</td>
            <td>Estado del Pedido</td>
            <td>Detalles</td>
                 <%
                     foreach (var item in listaPedido)
                     {

                     
                     %>
            <tr>
                <td style="width:10px;"></td>

                <td><%=item.ID %></a></td>
                <td><%=item.Carro.Cantidad %></td>
                <td><%=item.Carro.Total %></td>
                <td><%=item.Estado %></td>
                <td><a href="DetallesPedido.aspx?ID=<%=item.ID %>" style="color:greenyellow; ">Detalles</a></td>
            </tr>

            <%}

                 %>
        </table>
        </tr>
    </table>

    </div>
</asp:Content>
