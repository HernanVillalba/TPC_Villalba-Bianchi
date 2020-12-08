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






    }
}