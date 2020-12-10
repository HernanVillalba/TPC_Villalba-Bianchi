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
        private DatosEnvio aux = new DatosEnvio();
        private UsuarioNegocio negocio = new UsuarioNegocio();
        private int IDU;
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
            {
                ddlTipoTarjeta.Enabled = true;
            }
            else
            {
                ddlTipoTarjeta.Enabled = false;
                ddlTarjeta.Enabled = false;
            }

        }

        protected void ddlTipoTarjeta_SelectedIndexChanged(object sender, EventArgs e)
        {
            IDU = Convert.ToInt32(Session["IDUsuario"]);
            List<Tarjeta> Tarjes = negocio.ListarTarjetas(IDU);
            int tipoTarjeta = Convert.ToInt32(ddlTipoTarjeta.SelectedItem.Value);
            if (tipoTarjeta > 0)
            {
                Tarjes = Tarjes.FindAll(i => i.tipoTarjeta == tipoTarjeta);
                ddlTarjeta.Enabled = true;
                ddlTarjeta.DataSource = Tarjes;
                ddlTarjeta.DataTextField = "Alias";
                ddlTarjeta.DataValueField = "IDTarjeta";
                ddlTarjeta.DataBind();
            }
            else {
                ddlTarjeta.SelectedValue = "0";
                    ddlTarjeta.Enabled = false; }
               
            
        }

        protected void ddlTarjeta_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnContinuar_Click(object sender, EventArgs e)
        {
            
        }
    }
}