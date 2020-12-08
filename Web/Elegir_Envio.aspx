<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Elegir_Envio.aspx.cs" Inherits="Web.Elegir_Envio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="centrado">

        <div class="jumbotron" style="width: 592px; height: 100px;">
            <div>
                <h3 style="text-align: center; height: auto">Elija una Direccion Para continuar </h3>
            </div>

        </div>
    </div>

    <div class="centrado">

        <asp:GridView runat="server" ID="gvDirecciones" OnRowCommand="gvDirecciones_RowCommand" AutoGenerateColumns="false" Width="592px" BackColor="White" BorderColor="Black" BorderStyle="Dashed" HorizontalAlign="Center">
            <Columns>

                <asp:BoundField DataField="ID" ItemStyle-ForeColor="White">
                    <ItemStyle HorizontalAlign="Center" ForeColor="White" Width="0px"></ItemStyle>
                </asp:BoundField>

                <asp:BoundField HeaderText="Direccion" DataField="Direccion" ItemStyle-Height="30px" HeaderStyle-HorizontalAlign="Center">
                    <ItemStyle HorizontalAlign="Center" Height="30px"></ItemStyle>
                </asp:BoundField>

                <asp:BoundField HeaderText="Altura" DataField="Altura" ItemStyle-Height="30px">
                    <ItemStyle HorizontalAlign="Center" Height="30px"></ItemStyle>
                </asp:BoundField>

                <asp:BoundField HeaderText="Codigo Postal" DataField="CP" ItemStyle-Width="100">
                    <ItemStyle HorizontalAlign="Center" Width="100px"></ItemStyle>
                </asp:BoundField>

                <asp:ButtonField HeaderText="Seleccione" ButtonType="Button" CommandName="Seleccion" Text="Aqui" ItemStyle-CssClass="btn-outline-info">
                    <ItemStyle HorizontalAlign="Center" Width="60px" CssClass="btn-outline-info"></ItemStyle>
                </asp:ButtonField>


            </Columns>
            <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <HeaderStyle HorizontalAlign="Center" />
        </asp:GridView>
    </div>
    <div class="centrado">
        <div class="jumbotron" style="width: 592px; height: 200px;">

            <h3 style="text-align: center">No es ninguna de estas?</h3>
            <h3 style="text-align: center">🠟🠟🠟Agrega otra direccion apretando Aqui 🠟🠟🠟</h3>
            <hr class="my-4">
            <div style="text-align:center">
    
            <asp:Button  style="width:100px; height:50px;" ID="btnAgregar" OnCommand="btnAgregar_Command"  Text="Agregar Direccion" runat="server" />
            </div>

        </div>
    </div>
</asp:Content>
