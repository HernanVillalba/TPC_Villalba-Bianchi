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
    public partial class CatalogoJuegos : System.Web.UI.Page
    {
        public List<Juego> busqueda;    
        public int fav;
        public int cantidadJuegos;
        List<Juego> lista = new List<Juego>();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
            cargarDrop();

            }
            
        }



        void cargarDrop()
        {
            JuegoNegocio aux = new JuegoNegocio();
            dropCat.DataSource = aux.GetPlataformas();
            dropCat.DataTextField = "Nombre";
            dropCat.DataValueField = "Id";
            dropCat.DataBind();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        { 

            if (int.Parse(dropCat.SelectedValue) > 0)
            {
                lista = ((List<Dominio.Juego>)Session["Productos"]).FindAll(i => i.Nombre.ToUpper().Contains(txtBuscar.Text.ToUpper()) && i.PlataformaJuego.ID == int.Parse(dropCat.SelectedValue));
                Session.Add("Productos", lista);
            }
            else 
            {
                lista = ((List<Dominio.Juego>)Session["Productos"]).FindAll(i => i.Nombre.ToUpper().Contains(txtBuscar.Text.ToUpper()));
                Session.Add("Productos", lista);

            }
         
        }

       
    }
}