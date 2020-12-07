<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Elegir_Envio.aspx.cs" Inherits="Web.Elegir_Envio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <table>
        <tr>
            <td>Seleccionar</td>
            <td>Direccion</td>
            <td>Altura</td>
            <td>Codigo Postal</td>
        </tr>
        <%foreach (var item in listaDirecciones)
            {
        %>
        <tr>

            <td>
                <label><a href="Elegir_Envio.aspx?IDenvio=<%=item.ID %>"> Seleccionar</a> </label>
            </td>
            <td><%= item.Direccion%></td>
            <td><%= item.Altura %></td>
            <td><%= item.CP %></td>

        </tr>
        <%         } %>
    </table>

</asp:Content>
