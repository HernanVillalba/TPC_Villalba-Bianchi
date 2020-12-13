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
        Direccion aux = new Direccion();
        int IDU;
        UsuarioNegocio negocio = new UsuarioNegocio();
        int volverAElegirEnvio;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["IDUsuario"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            volverAElegirEnvio = Convert.ToInt32(Request.QueryString["VolverElegirEnvio"]);
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            aux.NombreDireccion = txbCalle.Text;
            aux.Altura = Convert.ToInt32(txbAltura.Text);
            aux.CP = Convert.ToInt32(txbCP.Text);
            IDU = Convert.ToInt32(Session["IDUsuario"]);

            negocio.AgregarDireccion(aux, IDU);

            if (volverAElegirEnvio == 1) //si vino desde elegir envio de la compra, lo redirijo alli al tocar cancelar
            {
                Response.Redirect("Elegir_Envio.aspx");
            }
            else
            {
                Response.Redirect("Mis_Direcciones.aspx");
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            if (volverAElegirEnvio == 1) //si vino desde elegir envio de la compra, lo redirijo alli al tocar cancelar
            {
                Response.Redirect("Elegir_Envio.aspx");
            }
            else
            {
                //si vino desde mis direcciones, lo redirijo hacía allí
                Response.Redirect("Mis_Direcciones.aspx");
            }
        }
    }
}