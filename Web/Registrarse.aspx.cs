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
    public partial class Registrarse : System.Web.UI.Page
    {
        RegistrarUsuario regAux;
        UsuarioNegocio negocio;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["NombreUsuario"] != null)
            {
                Response.Redirect("CatalogoJuegos.aspx");
            }
        }

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            regAux = new RegistrarUsuario();
            negocio = new UsuarioNegocio();

            cargarReg();
            regAux = negocio.RegistrarseEnDB(regAux);

            if(regAux.usuario.ID == 0)
            {
                Response.Redirect("Error.aspx");
            }
            else
            {
                Response.Redirect("CatalogoJuegos.aspx");
                Session["NombreUsuario"] = regAux.usuario.user; //guardo el nombre de usuario para saber si puede ver el perfil del mismo.
            }
        }

        private void cargarReg()
        {
            regAux.DPUsuario.Nombre = txtNombre.Text;
            regAux.DPUsuario.Apellido = txtApellido.Text;
            regAux.DPUsuario.Mail = txtMail.Text;
            regAux.DPUsuario.Telefono = Convert.ToInt32(txtTelefono.Text);
            regAux.usuario.user = txtUser.Text;
            regAux.usuario.pass = txtContra.Text;
        }
    }
}