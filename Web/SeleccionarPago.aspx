<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SeleccionarPago.aspx.cs" Inherits="Web.SeleccionarPago" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="card" style="background-color: khaki">
        <div class="card-header">
            <h3>Elija el Metodo de Pago:</h3>
            <div class="card-body">
                <div class="row">

                    <div class="col" style="left: 15px; top: 0px">

                        <asp:DropDownList runat="server" ID="ddlTipo" AutoPostBack="true" OnSelectedIndexChanged="ddlTipo_SelectedIndexChanged" Width="200px">

                            <asp:ListItem Text="Seleccione" Value="0" />
                            <asp:ListItem Text="Efectivo" Value="1" />
                            <asp:ListItem Text="Tarjeta" Value="2" />
                            <asp:ListItem Text="Otro" Value="3" />

                        </asp:DropDownList>
                    </div>

                    <div class="col" style="left: auto; top: 0px">
                        <asp:DropDownList runat="server" ID="ddlTipoTarjeta" AutoPostBack="true" OnSelectedIndexChanged="ddlTipoTarjeta_SelectedIndexChanged" Enabled="false" Width="200px">
                            <asp:ListItem Text="Seleccione" Value="0" />
                            <asp:ListItem Text="Debito" Value="1" />
                            <asp:ListItem Text="Credito" Value="2" />


                        </asp:DropDownList>
                    </div>
                    <div class="col" style="left: auto">
                        <asp:DropDownList runat="server" ID="ddlTarjeta" Enabled="false" Width="200px" AutoPostBack="true" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlTarjeta_SelectedIndexChanged">
                            <asp:ListItem Text="Seleccione" Value="0" />
                            <asp:ListItem Text="Nueva Tarjeta" Value="-1" />

                        </asp:DropDownList>




                    </div>

                </div>
                <%if (Convert.ToInt32(ddlTarjeta.SelectedItem.Value) == -1)
                    { %>
                <div class="card-body">
                    <div class="form-group">
                        <asp:Label Text="text" runat="server" />
                        <asp:TextBox runat="server" CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <asp:Label Text="text" runat="server" />
                        <asp:TextBox runat="server" CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <asp:Label Text="text" runat="server" />
                        <asp:TextBox runat="server" CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <asp:Label Text="text" runat="server" />
                        <asp:DropDownList runat="server" CssClass="form-control" />
                    </div>

                </div>
                <%} %>

                <div class="float-right">
                    <asp:Button Text="Continuar" CssClass="btn-success" ID="btnContinuar" OnClick="btnContinuar_Click"  runat="server" />
                    <asp:Button Text="Cancelar" CssClass="btn-danger" ID="btnCancelar" runat="server" />

                </div>

            </div>


        </div>





    </div>
</asp:Content>
