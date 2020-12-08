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
    public partial class SeleccionarPago : System.Web.UI.Page
    {
        public DatosEnvio aux = new DatosEnvio();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["DireccionUsuario"] == null)
            {
                Response.Redirect("Elegir_Envio.aspx");
            }


        }

        protected void ddlTipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            int tipoPago = int.Parse(ddlTipo.SelectedItem.Value);
            if (tipoPago == 2)
            { ddlTarjeta.Enabled = true; }
            else { ddlTarjeta.Enabled = false; }

        }


    }
}