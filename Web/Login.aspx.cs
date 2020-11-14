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
    public partial class Login : System.Web.UI.Page
    {
        Usuario usuario = new Usuario();
        UsuarioNegocio negocio = new UsuarioNegocio();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnAcceder_Click(object sender, EventArgs e)
        {
            usuario.user = tbUsuario.Text;
            usuario.pass = tbPassword.Text;

            usuario = negocio.login(usuario);

            //logeo si el user y pass son correctos
            if (usuario.ID != 0)
            {
                /*
                 ---------------------FALTA QUE SOLO PUEDA VER LOS JUEGOS AL LOGEARSE--------------------
                Session["InicioSesion"] = new Usuario();
                Session["InicioSesion"] = usuario;
                */
                Response.Redirect("CatalogoJuegos.aspx"); 
            }
            else{ Response.Redirect("Error.aspx"); }
        }
    }
}