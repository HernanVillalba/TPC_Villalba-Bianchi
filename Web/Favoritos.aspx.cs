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
        UsuarioNegocio negocioUsuario = new UsuarioNegocio(); // para cargar el id de usuario en la session
        UsuarioCompleto user = new UsuarioCompleto();


        public int cantidadItemsListaFav;
        public List<Juego> listaFav = new List<Juego>();
        private Juego juegoBuscado = new Juego();
        JuegoNegocio negocio = new JuegoNegocio();
        private int IDJuego;
        private int IDPlat;
        private int IDUsuario;
        private int add;
        private int delete;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["NombreUsuario"] == null)
            {
                Response.Redirect("");
            }

            CargarVariables();
            ExisteFav();

            if (IDJuego != 0 && juegoBuscado != null)
            {
                if (add == 1 && juegoBuscado.PlataformaJuego.Stock > 0)
                {
                    agregarItem();
                    Response.Redirect("Favoritos.aspx");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('No hay stock para agregar el juego!');", true);

                }
                if (delete == 1)
                {
                    eliminarItem();
                    Response.Redirect("Favoritos.aspx");
                }
            }

        }

        private void CargarListaFav()
        {
            //cargar desde la DB
           Session["listaFav"] = listaFav = negocio.ListarFavortitos(IDUsuario);
        }

        private void CargarVariables()
        {
            string nombreUser = Session["NombreUsuario"].ToString();
            user = negocioUsuario.GetearUsuario(nombreUser);
            IDUsuario = user.Usuario.ID;


            IDJuego = Convert.ToInt32(Request.QueryString["IDJuego"]);
            IDPlat = Convert.ToInt32(Request.QueryString["IDPlataforma"]);
            add = Convert.ToInt32(Request.QueryString["add"]);
            delete = Convert.ToInt32(Request.QueryString["delete"]);
            juegoBuscado = (negocio.ListarTodosLosCampos()).Find(i => i.ID == IDJuego && i.PlataformaJuego.ID == IDPlat);
        }

        private void eliminarItem()
        {
            negocio.EliminarFavorito(IDUsuario, IDJuego, IDPlat);
        }

        private void agregarItem()
        {

            bool existe = false;
            foreach (var item in (List<Juego>)Session["listaFav"])
            {
                if (item.ID == juegoBuscado.ID && item.PlataformaJuego.ID == juegoBuscado.PlataformaJuego.ID)
                {
                    existe=true; //
                }
            }
            if (!existe)
            {
                negocio.AgregarFavorito(IDUsuario, IDJuego, IDPlat); //agrega en la DB
                ((List<Juego>)Session["listaFav"]).Add(juegoBuscado); //agrega a la session
            }
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
            
            CargarListaFav();
            cantidadItemsListaFav = ((List<Dominio.Juego>)Session["listaFav"]).Count(); //para mostrar cartel de fav vacio
        }
    }
}