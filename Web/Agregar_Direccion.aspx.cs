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
    public partial class Agregar_Direccion : System.Web.UI.Page
    {
        DatosEnvio aux = new DatosEnvio();
        int IDU;
        UsuarioNegocio negocio = new UsuarioNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnContinuar_Click(object sender, EventArgs e)
        {
            aux.Direccion = txbCalle.Text;
            aux.Altura =Convert.ToInt32(txbAltura.Text);
            aux.CP = Convert.ToInt32(txbCP.Text);
            IDU = Convert.ToInt32(Session["IDUsuario"]);

            negocio.AgregarDireccion(aux, IDU);
            Response.Redirect("Elegir_Envio.aspx");
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Elegir_Envio.aspx");
        }
    }
}