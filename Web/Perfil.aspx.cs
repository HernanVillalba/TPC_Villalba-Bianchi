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
        RegistrarUsuario usuario = new RegistrarUsuario();
        UsuarioNegocio negocio = new UsuarioNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["NombreUsuario"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            

                cargarUsuarioEnTextBox();
        }

        private void cargarUsuarioEnTextBox()
        {
            string nombreUsuario = (string)Session["NombreUsuario"];
            usuario = negocio.GetUsuario(nombreUsuario);

            tbNombreUsuario.Text = usuario.usuario.user;
            tbContraseña.Text = usuario.usuario.pass;
            
            tbApellido.Text = usuario.DPUsuario.Apellido;
            tbNombre.Text = usuario.DPUsuario.Nombre;
            tbMail.Text = usuario.DPUsuario.Mail;
            tbTelefono.Text = usuario.DPUsuario.Telefono.ToString();
            tbTelefonoAlter.Text = usuario.DPUsuario.TelefonAlter.ToString();

            tbDireccion.Text = usuario.DPUsuario.Direccion;
            tbAltura.Text = usuario.DPUsuario.Altura.ToString();
            tbCP.Text = usuario.DPUsuario.CP.ToString();

        }
    }
}