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
        private Direccion aux = new Direccion();
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
                ddlTarjeta.SelectedItem.Value = "0";
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
            else
            {
                ddlTarjeta.SelectedValue = "0";
                ddlTarjeta.Enabled = false;
            }


        }

        protected void ddlTarjeta_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnContinuar_Click(object sender, EventArgs e)
        {
            switch (ddlTipo.SelectedItem.Value)
            {
                case "1":
                    {
                        Session["MetodoPago"] = new Tarjeta();
                        ((Tarjeta)Session["MetodoPago"]).IDTarjeta = -1;
                        Response.Redirect("Compra.aspx");

                    }
                    break;
                case "2":
                    {
                        Session["MetodoPago"] = negocio.CargarTarjeta(Convert.ToInt32(ddlTarjeta.SelectedItem.Value));
                        Response.Redirect("Compra.aspx");
                    }
                    break;
                default: break;
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Session["DireccionUsuario"] = null;
            Response.Redirect("Elegir_Envio.aspx");
        }

        protected void btnGyC_Click(object sender, EventArgs e)
        {
            Tarjeta nTarj = new Tarjeta();
            nTarj.IDUsuario = Convert.ToInt32(Session["IDUsuario"]);
            nTarj.Numero = txbNumero.Text;
            nTarj.Clave = txbCodigo.Text;
            nTarj.Alias = txbAlias.Text;
            nTarj.tipoTarjeta = Convert.ToInt32(ddlNtipo.SelectedItem.Value);
            negocio.GuardarTarjeta(nTarj);
            Session["MetodoPago"] = nTarj;
            Response.Redirect("Compra.aspx");


        }
    }
}