<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Agregar_Direccion.aspx.cs" Inherits="Web.Agregar_Direccion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="centrado">
        <div class="card" style="background-color: khaki; width:600px">
            <div class="card-header" style="font-size:20px">Ingrese su nueva Dirección:</div>
            <div class="card-body">

                <table style="width: 600px">
                    <tr>
                        <td> <asp:Label Text="Nombre de Calle:" runat="server" /></td>
                         <td> <asp:TextBox runat="server" ID="txbCalle" Width="308px" /></td>
                    </tr>
                            <tr>
                         <td> <asp:Label Text="Altura:" runat="server" /></td>
                         <td> <asp:TextBox runat="server" ID="txbAltura" Width="122px" /></td>
                    </tr>
                    <tr>
                        <td> <asp:Label Text="Codigo Postal:" runat="server" /></td>
                         <td> <asp:TextBox runat="server" ID="txbCP" Width="122px" /></td>
                    </tr>
            
                </table>
                <br />
                <br />
                <div class="centrado"> <asp:Button Text="Continuar" CssClass="btn-danger" OnClick="btnContinuar_Click" BackColor="Green" BorderColor="Green" runat="server" ID="btnContinuar" />
                    <asp:Button Text="Cancelar" CssClass="btn-danger" runat="server"  OnClick="btnCancelar_Click" ID="btnCancelar"/>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
