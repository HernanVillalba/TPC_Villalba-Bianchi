using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace Web
{
    public partial class Compra : System.Web.UI.Page
    {
        private Pedido compra = new Pedido();
        private PedidoNegocio Pnegocio = new PedidoNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarLblPago();
            CargarLblEnvio();
        }




        private void CargarLblPago()
        {
            Tarjeta aux = (Tarjeta)Session["MetodoPago"];
            string tipo, alias = aux.Alias;
            if (aux.tipoTarjeta == 1)
            {
                tipo = "Debito";
            }
            else { tipo = "Credito"; }

            if (aux.IDTarjeta != -1)
            {
                lblPago.Text = "Tarjeta de  " + tipo; 
                lblTarjeta.Text = alias;
            }
            else lblPago.Text = "Pago en Efectivo";


        }

        private void CargarLblEnvio()
        {
            Direccion aux = (Direccion)Session["DireccionUsuario"];
            string calle = aux.NombreDireccion, altura = aux.Altura.ToString();
            lblDireccion.Text = "Direccion: " + calle + " " + altura;
            lblCP.Text = "Codigo Postal: " + aux.CP;
            lblLocalidad.Text = "Localidad: " + aux.Localidad;
        }

        protected void Cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("SeleccionarPago.aspx");
        }

        protected void Confirmar_Click(object sender, EventArgs e)
        {
            compra.IDUsuario = Convert.ToInt32(Session["IDUsuario"]);
            compra.Productos = (List<Juego>)Session["ListaCarrito"];
            compra.Pagado = false;
            compra.Carro = (Chango)Session["Carro"];
            compra.Destino = (Direccion)Session["DireccionUsuario"];
            if (((Direccion)Session["DireccionUsuario"]).ID > 0)
            {
                compra.TipoEnvio = true;
            }
            else { compra.TipoEnvio = false; }

            Pnegocio.GuardarPedido(compra);
            compra.ID = Pnegocio.GetearIDPedido();
            foreach (var item in compra.Productos)
            {
            Pnegocio.ProductosPedido(compra.ID,item);

            }
            Response.Redirect("CatalogoJuegos.aspx");
            
            
        }
    }
}