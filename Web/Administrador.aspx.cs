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
            if (Session["NombreUsuario"] == null || Session["NombreUsuario"].ToString() != "admin")
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

            dgvJuegos.DataSource = lista;
            dgvJuegos.DataBind();

        }



        protected void Agregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Agregar.aspx");
        }

        protected void gvJuegos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            string idJuego = dgvJuegos.Rows[index].Cells[0].Text;
            string idPlat = dgvJuegos.Rows[index].Cells[5].Text;
            if (e.CommandName == "Modify")
            {
                Response.Redirect("Modificar.aspx?IDJ=" + idJuego + "&IDP=" + idPlat);
            } else if(e.CommandName=="Delete")
            {
                Response.Redirect("Error.aspx");

            }

        }
    }
}