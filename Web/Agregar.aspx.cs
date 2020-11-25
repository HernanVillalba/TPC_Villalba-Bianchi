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
    public partial class Agregar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarDDLS();
            

        }

        void CargarDDLS()
        {
            JuegoNegocio listas = new JuegoNegocio();
            ddlDesarrollador.DataSource = listas.GetDesarrolladres();
            ddlDesarrollador.DataTextField = "Nombre";
            ddlDesarrollador.DataValueField = "Id";
            ddlDesarrollador.DataBind();

            ddlPlataforma.DataSource = listas.GetPlataformas();
            ddlPlataforma.DataTextField = "Nombre";
            ddlPlataforma.DataValueField = "Id";
            ddlPlataforma.DataBind();


        }
    }
}