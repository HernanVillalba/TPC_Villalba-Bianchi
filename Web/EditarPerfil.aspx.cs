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
    public partial class EditarPerfil : System.Web.UI.Page
    {
        UsuarioNegocio negocio;
        UsuarioCompleto usuario;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IDUsuario"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                CargarTextBox();
            }
        }

        private void CargarTextBox()
        {
            negocio = new UsuarioNegocio();
            usuario = new UsuarioCompleto();
            int IDU = (int)Session["IDUsuario"];
            usuario = negocio.GetearUsuario(IDU);

            tbNombreUsuario.Text = usuario.Usuario.nombreUsuario;
            tbMail.Text = usuario.DPUsuario.Mail;
            tbNombre.Text = usuario.DPUsuario.Nombre;
            tbApellido.Text = usuario.DPUsuario.Apellido;
            tbTel.Text = usuario.DPUsuario.Telefono.ToString();
            tbTelAlter.Text = usuario.DPUsuario.TelefonAlter.ToString();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            negocio = new UsuarioNegocio();
            usuario = new UsuarioCompleto();
            Usuario UsuarioAux = new Usuario();

            CargarDatosTBEnUsuario(usuario, UsuarioAux);


            if (negocio.chequearContraseña(UsuarioAux)) //devuelve true si la contraseña es correcta
            {
                negocio.GuardarCambiosPerfil(usuario);
                Session["GuardoUsuario"] = true; //para mostrar un mensaje en " PERFIL" si guardo correctamente
            }
            else
            {
                Session["GuardoUsuario"] = false;//para mostrar un mensaje en " PERFIL" si guardo correctamente
            }
            Response.Redirect("Perfil.aspx");

        }

        private void CargarDatosTBEnUsuario(UsuarioCompleto usuario, Usuario aux)
        {
            //usuario que comprueba el id y la contra
            aux.ID = (int)Session["IDUsuario"];
            aux.pass = tbContraseña.Text;

            //usuario que se va a guardar
            usuario.Usuario.ID = (int)Session["IDUsuario"];
            usuario.Usuario.pass = tbContraseña.Text;
            usuario.Usuario.nombreUsuario = tbNombreUsuario.Text;
            usuario.DPUsuario.Mail = tbMail.Text;
            usuario.DPUsuario.Nombre = tbNombre.Text;
            usuario.DPUsuario.Apellido = tbApellido.Text;
            usuario.DPUsuario.Telefono = Convert.ToInt32(tbTel.Text);
            usuario.DPUsuario.TelefonAlter = Convert.ToInt32(tbTelAlter.Text);
        }
    }
}