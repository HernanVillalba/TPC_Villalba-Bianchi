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
            if(Session["NombreUsuario"] != null)
            {
                Response.Redirect("CatalogoJuegos.aspx");
            }
        }

        protected void btnAcceder_Click(object sender, EventArgs e)
        {
            usuario.user = tbUsuario.Text;
            usuario.pass = tbPassword.Text;

            usuario = negocio.login(usuario);
            IniciarSessionLogin(usuario.ID);



        }
        protected void IniciarSessionLogin(int ID)
        {
            if (ID != 0)
            {
                Session["NombreUsuario"] = usuario.user;
                Response.Redirect("CatalogoJuegos.aspx");
            }
            else
            {
                Session["Login"] = 0;
                Response.Redirect("Error.aspx");
            }
        }
    }
}