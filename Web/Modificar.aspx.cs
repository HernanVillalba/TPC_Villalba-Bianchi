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
    public partial class Modificar : System.Web.UI.Page
    {
        int idJuego, idPlat;
        public Juego juego;
        protected void Page_Load(object sender, EventArgs e)
        {

            idJuego = Convert.ToInt32(Request.QueryString["IDJ"]);
            idPlat = Convert.ToInt32(Request.QueryString["IDP"]);
            juego = ((List<Juego>)Session["Productos"]).Find(i => i.ID == idJuego && i.PlataformaJuego.ID == idPlat);
            CargarJuego();
            cargarDDLS();

        }

        void CargarJuego()
        {
            lblNombre.Text = "Nombre: " + juego.Nombre.ToString();
            lblDesarrolladora.Text = "Desarrolladora: " + juego.DesarrolladorJuego.Nombre.ToString();
            lblDescripcion.Text = "Descripcion: " + juego.Descripcion.ToString();
            lblImagen.Text = "URL Imagen: " + juego.ImagenURL.ToString();
            urlImage.ImageUrl = juego.ImagenURL.ToString();
            lblPlataforma.Text = "Plataforma: " + juego.PlataformaJuego.Nombre.ToString();
            lblPrecio.Text = "Precio: " + juego.PlataformaJuego.Precio.ToString();
            lblStock.Text = "Stock: " + juego.PlataformaJuego.Stock.ToString();
        }
        void cargarDDLS()
        {
            JuegoNegocio datos = new JuegoNegocio();
            ddlDesarrolladora.DataSource = datos.GetDesarrolladres();
            ddlDesarrolladora.DataValueField = "ID";
            ddlDesarrolladora.DataTextField = "Nombre";
            ddlDesarrolladora.DataBind();
            ddlPlataforma.DataSource = datos.GetPlataformas();
            ddlPlataforma.DataValueField = "ID";
            ddlPlataforma.DataTextField = "Nombre";
            ddlPlataforma.DataBind();
        }
    }
}