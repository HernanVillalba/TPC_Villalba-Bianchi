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
    public partial class Carrito : System.Web.UI.Page
    {
        private JuegoNegocio negocio = new JuegoNegocio();
        public List<Juego> listaCarrito = new List<Juego>();
        public Juego articuloBuscado = new Juego();
        public List<Juego> listaAux = new List<Juego>();

        int IDAux;
        int agregar;
        int eliminar;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            ExisteListaCarrito();
            CargarDgv();


            IDAux = Convert.ToInt32(Request.QueryString["ID"]);
            agregar = Convert.ToInt32(Request.QueryString["add"]);
            eliminar = Convert.ToInt32(Request.QueryString["delete"]);

            try
            {
                articuloBuscado = (listaAux = negocio.ListarTodosLosCampos()).Find(i => i.ID == IDAux);

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
        }

        private void AgregarItemLista() 
        {
            if(Session["ListaCarrito"] == null)
            {
                listaCarrito.Add(articuloBuscado);
                Session["ListaCarrito"] = listaCarrito;
            }
            else
            {
                ((List<Juego>)Session["ListaCarrito"]).Add(articuloBuscado);
                listaCarrito = ((List<Juego>)Session["ListaCarrito"]);
            }
        }

        private void EliminarItemLista()
            {
                ((List<Juego>)Session["ListaCarrito"]).Remove(articuloBuscado);
                listaCarrito = ((List<Juego>)Session["ListaCarrito"]);

            }
        

        private void ExisteListaCarrito()
        {
            if(Session["ListaCarrito"] == null)
            {
                Session["ListaCarrito"] = new List<Juego>();
            }
            else
            {
                listaCarrito = (List<Juego>)Session["ListaCarrito"];
            }
        }
        
        private void CargarDgv()
        {
            dgvCarrito.DataSource = listaCarrito;
            dgvCarrito.DataBind();
        }
    }
}