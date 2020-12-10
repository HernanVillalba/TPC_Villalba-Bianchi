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
                        <asp:Label Text="Tipo Tarjeta" runat="server"/>
                        <asp:DropDownList runat="server" CssClass="form-control"  ID="ddlNtipo" >
                            <asp:ListItem Value="0" Text="Seleccione"></asp:ListItem>
                            <asp:ListItem Value="1" Text="Debito"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Credito"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Label Text="Numero de Tarjeta:" runat="server" />
                        <asp:TextBox runat="server" CssClass="form-control" id="txbNumero"/>
                    </div>
                    <div class="form-group">
                        <asp:Label Text="Codigo de Seguridad:" runat="server" />
                        <asp:TextBox runat="server"  CssClass="form-control" ID="txbCodigo" TextMode="Password" />
                    </div>
                    <div class="form-group">
                        <asp:Label Text="Alias: " runat="server" />
                        <asp:TextBox runat="server" ID="txbAlias" CssClass="form-control" />
                    </div>

                </div>
                <div class="float-right">
                    <asp:Button Text="Guardar y Continuar" CssClass="btn-success" ID="btnGyC" OnClick="btnGyC_Click" runat="server" />
                    <asp:Button Text="Cancelar" CssClass="btn-danger" ID="Button2" OnClick="btnCancelar_Click" runat="server" />

                </div>
                <%} %>

                <%else
                    {
                %>
                <div class="float-right">
                    <asp:Button Text="Continuar" CssClass="btn-success" ID="btnContinuar" OnClick="btnContinuar_Click" runat="server" />
                    <asp:Button Text="Cancelar" CssClass="btn-danger" ID="btnCancelar" OnClick="btnCancelar_Click" runat="server" />

                </div>
                <%} %>
            </div>


        </div>





    </div>
</asp:Content>
