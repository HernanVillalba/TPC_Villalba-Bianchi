<%@ Page Title="Mis Direcciones" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Mis_Direcciones.aspx.cs" Inherits="Web.Mis_Direcciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:DataGrid runat="server" ID="dgDirecciones" CssClass="table" BackColor="Black"></asp:DataGrid>

    <%if (listaDirecciones.Count == 0 || listaDirecciones == null)
        { %>
    <div class="centrado">
        <div class="jumbotron" style="height:auto;">
            <h1>No hay direcciones agregadas.</h1>
        </div>
    </div>
    <%}

        else
        {%>
    <div class="table-responsive">
        <table class="table table-dark" style="border-collapse:collapse;">
            <tr style="background-color:#4e8d7c">
                <td style="width:10px;"></td>
                <td >Dirección</td>
                <td>Altura</td>
                <td>Código postal</td>
                <td>Localidad</td>
            </tr>
            <%
                foreach (var item in listaDirecciones)
                {%>
            <tr>
                <td class="centrado"><a href="Mis_Direcciones.aspx?IDDireccion=<%=item.ID %>&delete=1" style="color:red;">Eliminar</a></td>
                <td><%=item.NombreDireccion %></td>
                <td><%=item.Altura %></td>
                <td><%=item.CP %></td>
                <td><%=item.Localidad %></td>
            </tr>

            <%}

                } %>
        </table>
        <a href="Agregar_Direccion.aspx" class="btn btn-primary">Agregar dirección</a>
    </div>
</asp:Content>
