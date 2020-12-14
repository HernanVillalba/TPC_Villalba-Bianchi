using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Dominio;

namespace Web
{
    public partial class Mis_Compras : System.Web.UI.Page
    {
        List<Pedido> listaPedido = new List<Dominio.Pedido>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["NombreUsuario"] == null || Session["NombreUsuario"].ToString() == "admin")
            {
                Response.Redirect("Login.aspx");
            }

        }
    }
}