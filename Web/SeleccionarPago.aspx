<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SeleccionarPago.aspx.cs" Inherits="Web.SeleccionarPago" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style >
                td{border-color:black; border:groove; }
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
    <div class="card" style="background-color:khaki">

    <div class="card-header-pills">
         <%foreach (Dominio.Juego item in (List<Dominio.Juego>)Session["ListaCarrito"])
            {%>
        <table>
        <tr style="border:groove;">
            
              <td>  <img src="<%= item.ImagenURL %>" class="auto-style5" alt="Imagen del <%=item.Nombre %>"></td>
            <td class="auto-style4"><%= item.Nombre %></td>
            <td class="auto-style3"><%= item.PlataformaJuego.Nombre %></td>

            <td class="auto-style2"><%=item.PlataformaJuego.Precio %></td>
            <td class="auto-style1"><%=item.Cantidad %></td>
        </tr>

        <%     } %>

        </table>
    </div>
    </div>
</asp:Content>
