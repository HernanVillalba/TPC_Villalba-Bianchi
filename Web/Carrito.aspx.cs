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
        public Juego articuloSeleccionado = new Juego();
        public List<Juego> listaAux = new List<Juego>();
        public List<Juego> listaCarrito = new List<Juego>();


        Chango carro = new Chango();
        int IDU;
        int IDAux;
        int agregar;
        int eliminar;
        int IDPlat;
        int empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            CargarVariables();
            ExisteListaCarrito();
            if (IDU == 0)
            {
                Response.Redirect("Login.aspx");
            }
            try
            {
                articuloSeleccionado = (listaAux = negocio.ListarTodosLosCampos()).Find(i => i.ID == IDAux && i.PlataformaJuego.ID == IDPlat);


                if (IDAux != 0 && agregar == 1)
                {
                    if (articuloSeleccionado.PlataformaJuego.Stock > 0)
                    {
                        AgregarItemLista();
                        Response.Redirect("Carrito.aspx");
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('No hay stock para agregar el juego!');", true);
                        Response.Redirect("Carrito.aspx");
                    }


                }

                if (IDAux != 0 && eliminar == 1)
                {
                    EliminarItemLista();
                    Response.Redirect("Carrito.aspx");
                }
                if (IDAux != 0 && eliminar == 1)
                {
                    EliminarItemLista();
                    Response.Redirect("Carrito.aspx");
                }
                if (empty == 1)
                {
                    negocio.VaciarCarrito(IDU);
                    Response.Redirect("Carrito.aspx");
                }
            }

            catch (Exception)
            {

                throw;
            }

            if (listaCarrito != null)
            {
                CargarLblTotal();
            }

        }

        private void CargarVariables()
        {
            IDU = Convert.ToInt32(Session["IDUsuario"]);
            IDAux = Convert.ToInt32(Request.QueryString["ID"]);
            agregar = Convert.ToInt32(Request.QueryString["add"]);
            eliminar = Convert.ToInt32(Request.QueryString["delete"]);
            empty = Convert.ToInt32(Request.QueryString["empty"]);
            IDPlat = Convert.ToInt32(Request.QueryString["IDP"]);
        }

        private void CargarLblTotal()
        {

            foreach (Juego item in listaCarrito)
            {

                carro.Cantidad += item.Cantidad;
                carro.Total += item.PlataformaJuego.Precio * item.Cantidad;
            }

            lblCantidad.Text = carro.Cantidad.ToString();
            lblTotal.Text = carro.Total.ToString();
        }

        private void AgregarItemLista()
        {
            
            if (listaCarrito != null) // que pregunte si es null, para no buscar con el foreach en una lista null ya que sino, tira error
            {

                //Buscamos si existe el item en la lista
                foreach (var item in listaCarrito)
                {
                    if (item.ID == articuloSeleccionado.ID && item.PlataformaJuego.ID == articuloSeleccionado.PlataformaJuego.ID)

                    {
                        // si existe le acumulamos cantidad al objeto que 
                        //alguna vez ya haya sido agregado
                        listaCarrito.Add(item);
                        negocio.SumarCantidadItemCarrito(IDU, IDAux, IDPlat);
                        return;
                    }
                }
            }
            //si no existe agrega
            negocio.AgregarItemCarrito(IDU, IDAux, IDPlat);

        }

        private void EliminarItemLista()
        {
            negocio.EliminarItemCarrito(IDU, IDAux, IDPlat);
        }


        private void ExisteListaCarrito()
        {
            if (Session["ListaCarrito"] == null)
            {
                Session["ListaCarrito"] = new List<Juego>();
            }
            else
            {

                listaCarrito = (List<Juego>)Session["ListaCarrito"];
            }


            listaCarrito = negocio.ListarCarrito(IDU);
            Session["ListaCarrito"] = listaCarrito;

        }

    }
}