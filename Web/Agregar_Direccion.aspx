<%@ Page Title="Agregar dirección" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Agregar_Direccion.aspx.cs" Inherits="Web.Agregar_Direccion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="centrado">
        <div  style="background-color: #4e8d7c; width: 600px; opacity:0.9;">
            <div class="card-header" style="font-size: 20px">Ingrese su nueva Dirección:</div>
            <div class="card-body">

                <table style="width: 600px;font-size:20px;">
                    <tr >
                        <td>
                            <strong>Nombre de Calle:</strong>

                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txbCalle" Width="308px" CssClass="form-control" required="true" />

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>Altura: </strong>
                        <td>
                            <asp:TextBox runat="server" ID="txbAltura" Width="122px" CssClass="form-control" required="true" /></td>
                    </tr>
                    <tr>
                        <td>
                            <strong>Código postal: </strong>
                        <td>
                            <asp:TextBox runat="server" ID="txbCP" Width="122px" CssClass="form-control" required="true" /></td>
                    </tr>
                    <tr>
                        <td>
                            <strong>Localidad</strong>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txbLocalidad" Width="122px" CssClass="form-control" required="true" />
                        </td>
                    </tr>

                </table>
                <br />
                <br />
                <div class="centrado">
                    <div class="row">
                        <div class="col">
                            <asp:Button Text="Cancelar" CssClass="btn btn-primary btn-block" BackColor="Red" BorderColor="Red" runat="server" OnClick="btnCancelar_Click" ID="btnCancelar" />
                        </div>
                        <div class="col"> 
                            <asp:Button Text="Agregar" CssClass="btn btn-primary btn-block" OnClick="btnAgregar_Click" BackColor="Green" BorderColor="Green" runat="server" ID="btnContinuar" />
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
