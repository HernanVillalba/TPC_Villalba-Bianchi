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
                lblPago.Text = "Tarjeta de  " + tipo + " apodada: " + alias;
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
    }
}