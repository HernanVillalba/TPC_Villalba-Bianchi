using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Dominio;
using System.Data.SqlTypes;

namespace Web
{
    public partial class Agregar : System.Web.UI.Page
    {
        Juego juego = new Juego();
        JuegoNegocio negocio;
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

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            CargarJuego();
            negocio = new JuegoNegocio();
            juego = negocio.GuardarJuego(juego);
            Response.Redirect("Detalles.aspx");
        }

        private void CargarJuego()
        {
            juego.Nombre = txtNombre.Text;
            juego.Descripcion = txtDesc.Text;
            juego.ImagenURL = txtImagenUrl.Text;
            juego.DesarrolladorJuego.ID = Convert.ToInt32(ddlDesarrollador.SelectedValue);
            juego.DesarrolladorJuego.Nombre = ddlDesarrollador.Text;
            juego.PlataformaJuego.ID = Convert.ToInt32(ddlPlataforma.SelectedValue);
            juego.PlataformaJuego.Nombre = ddlPlataforma.Text;
            juego.PlataformaJuego.Precio = Convert.ToDecimal(txtPrecio.Text);
            juego.PlataformaJuego.Stock = Convert.ToInt32(txtStock.Text);
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Administrador.aspx");
        }
    }
}