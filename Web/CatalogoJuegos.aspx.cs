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
    public partial class CatalogoJuegos : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            /*
            ---------------------FALTA QUE SOLO PUEDA VER LOS JUEGOS AL LOGEARSE EN LOGGIN CON SESSION--------------------
            Usuario user = new Usuario();
            user = (Usuario)Session["InicioSesion"];
            if ( user.ID == 0)
            {
                Response.Redirect("Login.aspx");
            }
            */
        }
    }
}