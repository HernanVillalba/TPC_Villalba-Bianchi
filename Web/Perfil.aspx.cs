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

            if(Session["CargoUsuario"] == null)
            {
                cargarUsuarioEnTextBox();
                Session["CargoUsuario"] = true;
            }
            else
            {
                Session["CargoUsuario"] = null;
            }
            
        }

        private void cargarUsuarioEnTextBox()
        {
            string nombreUsuario = (string)Session["NombreUsuario"];
            usuario = negocio.GetearUsuario(nombreUsuario);
            if (Session["IDUsuario"] == null)
            {
                Session["IDUsuario"] = usuario.Usuario.ID;
            }


            tbNombreUsuario.Text = usuario.Usuario.nombreUsuario;
            tbContraseña.Text = usuario.Usuario.pass;
            lblContra.Text = usuario.Usuario.pass;

            tbApellido.Text = usuario.DPUsuario.Apellido;
            tbNombre.Text = usuario.DPUsuario.Nombre;
            tbMail.Text = usuario.DPUsuario.Mail;
            tbTelefono.Text = usuario.DPUsuario.Telefono.ToString();
            tbTelefonoAlter.Text = usuario.DPUsuario.TelefonAlter.ToString();

            tbDireccion.Text = usuario.DatosEnvio.Direccion;
            tbAltura.Text = usuario.DatosEnvio.Altura.ToString();
            tbCP.Text = usuario.DatosEnvio.CP.ToString();

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            CargarUsuarioAUX();

            if (negocio.GuardarCambiosPerfil(usuarioAux))
            {
                Session["GuardardoExitoso"] = true;
            }
            else
            {
                Session["GuardardoExitoso"] = false;
            }
            usuario = usuarioAux;
            Response.Redirect("Perfil.aspx");
        }

        private void CargarUsuarioAUX()
        {
            usuarioAux.Usuario.ID = (int)Session["IDUsuario"]; //esto por en los TB no cargo el ID
            usuarioAux.Usuario.nombreUsuario = tbNombreUsuario.Text;
            usuarioAux.Usuario.pass = tbContraseña.Text;
            usuarioAux.DPUsuario.Apellido = tbApellido.Text;
            usuarioAux.DPUsuario.Nombre = tbNombre.Text;
            usuarioAux.DPUsuario.Mail = tbMail.Text;
            usuarioAux.DPUsuario.Telefono = Convert.ToInt32(tbTelefono.Text);
            usuarioAux.DPUsuario.TelefonAlter = Convert.ToInt32(tbTelefonoAlter.Text);
            usuarioAux.DatosEnvio.Direccion = tbDireccion.Text;
            usuarioAux.DatosEnvio.Altura = Convert.ToInt32(tbAltura.Text);
            usuarioAux.DatosEnvio.CP = Convert.ToInt32(tbCP.Text);
        }
    }
}