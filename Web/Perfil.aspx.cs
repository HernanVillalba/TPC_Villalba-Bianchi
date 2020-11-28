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
        RegistrarUsuario usuarioAux = new RegistrarUsuario();
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

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            CargarUsuarioAUX();

            /*
             //esto es para validar si hubo cambios, pero aún no funca
            if (usuarioAux != usuario)
            {
                //guardo
                Response.Redirect("Perfil.aspx");
            }
            else
            {
                //no guardo
                Response.Redirect("Error.aspx");
            }
            */
        }

        private void CargarUsuarioAUX()
        {
            usuarioAux.usuario.ID = usuario.usuario.ID; //esto por en los TB no cargo el ID
            usuarioAux.usuario.user = tbNombreUsuario.Text;
            usuarioAux.usuario.pass = tbContraseña.Text;
            usuarioAux.DPUsuario.Apellido = tbApellido.Text;
            usuarioAux.DPUsuario.Nombre = tbNombre.Text;
            usuarioAux.DPUsuario.Mail = tbMail.Text;
            usuarioAux.DPUsuario.Telefono = Convert.ToInt32(tbTelefono.Text);
            usuarioAux.DPUsuario.TelefonAlter = Convert.ToInt32(tbTelefonoAlter.Text);
            usuarioAux.DPUsuario.Direccion = tbDireccion.Text;
            usuarioAux.DPUsuario.Altura = Convert.ToInt32(tbAltura.Text);
            usuarioAux.DPUsuario.CP = Convert.ToInt32(tbCP.Text);
        }
    }
}