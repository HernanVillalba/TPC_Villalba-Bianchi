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
    public partial class Administrador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["NombreUsuario"] == null || Session["NombreUsuario"].ToString() != "admin")
            {
                Response.Redirect("CatalogoJuegos.aspx");
            }
            CargarGV();
        }


        protected void CargarGV()
        {
            JuegoNegocio negocio = new JuegoNegocio();
            List<Juego> lista = new List<Juego>();
            lista = negocio.ListarTodosLosCampos();

            gvJuegos.DataSource = lista;
            gvJuegos.DataBind();

        }



        protected void Agregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Agregar.aspx");
        }
    }
}