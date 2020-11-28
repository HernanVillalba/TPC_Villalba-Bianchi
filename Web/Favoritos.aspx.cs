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
    public partial class Favoritos : System.Web.UI.Page
    {
        public List<Juego> listaFav = new List<Juego>();
        private Juego juegoBuscado = new Juego();
        JuegoNegocio negocio = new JuegoNegocio();
        private int IDAux;
        private int add;
        private int delete;
        protected void Page_Load(object sender, EventArgs e)
        {
            ExisteFav();

            IDAux = Convert.ToInt32(Request.QueryString["IDJuego"]);
            add = Convert.ToInt32(Request.QueryString["add"]);
            delete = Convert.ToInt32(Request.QueryString["delete"]);
            juegoBuscado = (negocio.ListarTodosLosCampos()).Find(i => i.ID == IDAux);

            if (IDAux != 0 && juegoBuscado != null)
            {
                if (add == 1)
                {
                    agregarItem();
                    Response.Redirect("Favoritos.aspx");
                }
                if (delete == 1)
                {
                    eliminarItem();
                    Response.Redirect("Favoritos.aspx");
                }
            }

        }

        private void eliminarItem()
        {
            foreach (Juego item in listaFav)
            {
                if (item.ID == IDAux)
                {
                    listaFav.Remove(item);
                    Session["listaFav"] = listaFav;
                    return;
                }
            }
        }

        private void agregarItem()
        {
            ((List<Juego>)Session["listaFav"]).Add(juegoBuscado);
        }

        public void ExisteFav()
        {
            if (Session["listaFav"] == null)
            {
                Session["listaFav"] = new List<Juego>();
            }
            else
            {
                listaFav = (List<Juego>)Session["listaFav"];
            }
        }
    }
}