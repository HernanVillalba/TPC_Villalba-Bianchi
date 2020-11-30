using Negocio;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web
{
    public partial class SiteMaster : MasterPage
    {
        private JuegoNegocio negocio;
        protected void Page_Load(object sender, EventArgs e)
        {
            negocio = new JuegoNegocio();
            Session["Productos"] = negocio.ListarTodosLosCampos();
            Session["busqueda"] = new List<Juego>();
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["NombreUsuario"] = null;
            Session["ListaFav"] = null;
            Session["ListaCarrito"] = null;

            Response.Redirect("Login.aspx");
        }
    }
}