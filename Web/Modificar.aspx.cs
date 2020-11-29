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

        protected void TbxImagen_TextChanged(object sender, EventArgs e)
        {
            newImagen.ImageUrl = tbxImagen.Text;
            newImagen.AlternateText = tbxImagen.Text;
           
        }

     

        private void ActualizarJuego()
        {
            if (!chkDesc.Checked) juego.Descripcion = tbxDescripcion.Text;
            if (!chkImagen.Checked) juego.ImagenURL = tbxImagen.Text;
            if (!chkNombre.Checked) juego.Nombre = tbxNombre.Text;
            if (!chkStock.Checked) juego.PlataformaJuego.Stock = Convert.ToInt32(tbxStock.Text);
            if (!chkPrecio.Checked) juego.PlataformaJuego.Precio = Convert.ToDecimal(tbxPrecio.Text);
        }

        protected void Click_Modificar(object sender, EventArgs e)
        {
            ActualizarJuego();
            GuardarCambios();
            Response.Redirect("Administrador.aspx");
        }

        private void GuardarCambios()
        {
            JuegoNegocio aux = new JuegoNegocio();
            aux.ActualizarJuego(juego);
        }
    }
}