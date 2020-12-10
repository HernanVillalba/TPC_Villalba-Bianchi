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
    public partial class Perfil : System.Web.UI.Page
    {
        UsuarioCompleto usuario = new UsuarioCompleto();
        UsuarioCompleto usuarioAux = new UsuarioCompleto();
        UsuarioNegocio negocio = new UsuarioNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["NombreUsuario"] == null || Session["NombreUsuario"].ToString() == "admin")
            {
                Response.Redirect("Login.aspx");
            }


            cargarUsuarioEnTextBox();
        }

        private void cargarUsuarioEnTextBox()
        {
            int IDUsuario = (int)Session["IDUsuario"];
            usuario = negocio.GetearUsuario(IDUsuario);

            if (usuario == null)
            {
                Response.Redirect("Error.aspx");
            }


            lblNombreUsuario.Text = usuario.Usuario.nombreUsuario;
            lblApellido.Text = usuario.DPUsuario.Apellido;
            lblNombre.Text = usuario.DPUsuario.Nombre;
            lblMail.Text = usuario.DPUsuario.Mail;
            lblTelefono.Text = usuario.DPUsuario.Telefono.ToString();
            lblTelefonoAlter.Text = usuario.DPUsuario.TelefonAlter.ToString();

        }
    }
}