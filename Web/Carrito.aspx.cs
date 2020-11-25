using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace Web
{
    public partial class Carrito : System.Web.UI.Page
    {
        private JuegoNegocio negocio = new JuegoNegocio();
        public Juego articuloBuscado = new Juego();
        public List<Juego> listaAux = new List<Juego>();

        Chango carro = new Chango();
        int IDAux;
        int agregar;
        int eliminar;
        int IDPlat;
        protected void Page_Load(object sender, EventArgs e)
        {
            ExisteListaCarrito();

            IDAux = Convert.ToInt32(Request.QueryString["ID"]);
            agregar = Convert.ToInt32(Request.QueryString["add"]);
            eliminar = Convert.ToInt32(Request.QueryString["delete"]);
            IDPlat = Convert.ToInt32(Request.QueryString["IDP"]);


            try
            {
                articuloBuscado = (listaAux = negocio.ListarTodosLosCampos()).Find(i => i.ID == IDAux && i.PlataformaJuego.ID == IDPlat);
                

                if(IDAux != 0 && agregar == 1 ) 
                {
                    AgregarItemLista();
                    Response.Redirect("Carrito.aspx");
                }
                if(IDAux != 0 &&  eliminar == 1)
                {
                    EliminarItemLista();
                    Response.Redirect("Carrito.aspx");
                }
            }
            catch (Exception)
            {

                throw;
            }

            CargarLblTotal();
        }
        
        private void CargarLblTotal()
        {

            foreach (Juego item in (List<Juego>)Session["ListaCarrito"])
            {
                carro.Cantidad++;
                carro.Total += item.PlataformaJuego.Precio;
            }

            lblCantidad.Text = carro.Cantidad.ToString();
            lblTotal.Text = carro.Total.ToString();
        }

        private void AgregarItemLista() 
        {
            if(Session["ListaCarrito"] == null)
            {
                Session["ListaCarrito"] = new List<Juego>();
            }
            else
            {
                ((List<Juego>)Session["ListaCarrito"]).Add(articuloBuscado);
            }
        }

        private void EliminarItemLista()
            {
                ((List<Juego>)Session["ListaCarrito"]).Remove(articuloBuscado);

            }
        

        private void ExisteListaCarrito()
        {
            if(Session["ListaCarrito"] == null)
            {
                Session["ListaCarrito"] = new List<Juego>();
            }
            else
            {
                listaAux = (List<Juego>)Session["ListaCarrito"];
            }
         
        }
       
    }
}