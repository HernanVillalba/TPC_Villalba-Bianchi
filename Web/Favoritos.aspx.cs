﻿using System;
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
        public int cantidadItemsListaFav;
        public List<Juego> listaFav = new List<Juego>();
        private Juego juegoBuscado = new Juego();
        JuegoNegocio negocio = new JuegoNegocio();
        private int IDAux;
        private int IDPlat;
        private int add;
        private int delete;
        protected void Page_Load(object sender, EventArgs e)
        {


            ExisteFav();
            CargarVariables();

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

        private void CargarVariables()
        {
            IDAux = Convert.ToInt32(Request.QueryString["IDJuego"]);
            IDPlat = Convert.ToInt32(Request.QueryString["IDPlataforma"]);
            add = Convert.ToInt32(Request.QueryString["add"]);
            delete = Convert.ToInt32(Request.QueryString["delete"]);
            juegoBuscado = (negocio.ListarTodosLosCampos()).Find(i => i.ID == IDAux && i.PlataformaJuego.ID == IDPlat);
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
            int cont = 0;
            foreach (var item in (List<Juego>)Session["listaFav"])
            {
                if (item.ID == juegoBuscado.ID && item.PlataformaJuego.ID == juegoBuscado.PlataformaJuego.ID)
                {
                    cont++;
                }
            }
            if (cont==0) { ((List<Juego>)Session["listaFav"]).Add(juegoBuscado); }
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
            cantidadItemsListaFav = ((List<Dominio.Juego>)Session["listaFav"]).Count();
        }
    }
}