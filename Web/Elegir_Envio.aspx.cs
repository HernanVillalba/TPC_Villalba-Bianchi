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
            gvDirecciones.DataSource = negocio.ListarDirecciones(Convert.ToInt32(Session["IDUsuario"]));
            gvDirecciones.DataBind();
        }

        private void cargarVariable()
        {

            IDEnvio = Convert.ToInt32(Request.QueryString["IDenvio"]);
            Session["DireccionUsuario"] = negocio.ListarDireccionXID(IDEnvio);
        }

        protected void Continuar_Click(object sender, EventArgs e)
        {
            Response.Redirect("SeleccionarPago.aspx");
        }

        protected void gvDirecciones_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            DatosEnvio aux = new DatosEnvio();
            int index = Convert.ToInt32(e.CommandArgument);
            aux.ID = Convert.ToInt32(gvDirecciones.Rows[index].Cells[0].Text.ToString());
            aux.Direccion = gvDirecciones.Rows[index].Cells[1].Text;
            aux.Altura = Convert.ToInt32(gvDirecciones.Rows[index].Cells[2].Text);
            aux.CP = Convert.ToInt32(gvDirecciones.Rows[index].Cells[3].Text);
            if(e.CommandName == "Seleccion")
            {
                Session["DireccionUsuario"] = aux;
                Response.Redirect("SeleccionarPago.aspx");
            }
            else if (e.CommandName == "Eliminar")
            {
                negocio.BorrarDireccion(aux.ID);
                Response.Redirect("Elegir_Envio.aspx");
            }
        }

        protected void btnAgregar_Command(object sender, CommandEventArgs e)
        {

            Response.Redirect("Agregar_Direccion.aspx");
        }
    }
}