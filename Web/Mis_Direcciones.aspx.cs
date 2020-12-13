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
    public partial class Mis_Direcciones : System.Web.UI.Page
    {
        private UsuarioNegocio negocio = new UsuarioNegocio();
        protected List<Direccion> listaDirecciones = new List<Direccion>();
        int delete;
        int IDDireccion;
        int IDUsuario;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["NombreUsuario"] == null || Session["NombreUsuario"].ToString() == "admin") { Response.Redirect("Login.aspx"); }

            CargarVariables();
            if(IDDireccion>0 && delete == 1)
            {
                EliminarDireccion();
                Response.Redirect("Mis_Direcciones.aspx");
            }

        }
        private void CargarVariables()
        {
            IDUsuario = (int)Session["IDUsuario"];
            IDDireccion = Convert.ToInt32(Request.QueryString["IDDireccion"]);
            delete = Convert.ToInt32(Request.QueryString["delete"]);

            listaDirecciones = negocio.ListarDirecciones((int)Session["IDUsuario"]);
        }
        private void EliminarDireccion()
        {
            negocio.EliminarDireccion(IDUsuario, IDDireccion);
        }
    }
}