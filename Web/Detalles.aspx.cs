using System;
using Dominio;
using Negocio;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public Juego juegoDetalles { set; get; }

        protected void Page_Load(object sender, EventArgs e)
        {
            juegoDetalles = new Juego();
            int IDjuego = Convert.ToInt32(Request.QueryString["IDJ"]);
            int IDPlataforma = Convert.ToInt32(Request.QueryString["IDP"]);

            try
            {
                if (Request.QueryString["IDJ"] == "" || Request.QueryString["IDP"] == "")
                {
                    Response.Redirect("CatalogoJuegos.aspx");
                }

                juegoDetalles = ((List<Dominio.Juego>)Session["Productos"]).Find(i => i.ID == IDjuego && i.PlataformaJuego.ID == IDPlataforma);


            }
            catch(Exception)
            {

            }

        } 
    }
}