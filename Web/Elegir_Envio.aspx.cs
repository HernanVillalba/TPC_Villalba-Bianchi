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
    public partial class Elegir_Envio : System.Web.UI.Page
    {
        UsuarioNegocio negocio = new UsuarioNegocio();
        public List<DatosEnvio> listaDirecciones = new List<DatosEnvio>();
        private int IDEnvio;

        protected void Page_Load(object sender, EventArgs e)
        {
            cargarVariable();
            cargarDGV();
        }

        private void cargarDGV()
        {
            listaDirecciones = negocio.ListarDirecciones(Convert.ToInt32(Session["IDUsuario"]));

        }

        private void cargarVariable()
        {
            IDEnvio = Convert.ToInt32(Request.QueryString["IDenvio"]);
            Session["DireccionUsuario"] = negocio.ListarDireccionXID(IDEnvio);
        }
    }
}