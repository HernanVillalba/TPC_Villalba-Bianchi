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
        protected void Page_Load(object sender, EventArgs e)
        {
            cargarDrop();
            

            /*
            ---------------------FALTA QUE SOLO PUEDA VER LOS JUEGOS AL LOGEARSE EN LOGGIN CON SESSION--------------------
            Usuario user = new Usuario();
            user = (Usuario)Session["InicioSesion"];
            if ( user.ID == 0)
            {
                Response.Redirect("Login.aspx");
            }
            */
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
        { List<Juego>  aux = new List<Juego>();
            aux = ((List<Dominio.Juego>)Session["Productos"]).FindAll(i => i.Nombre.ToUpper().Contains(txtBuscar.Text.ToUpper()) && i.PlataformaJuego.ID == int.Parse(dropCat.SelectedValue));
            Session.Add("Productos",aux);
        }

       
    }
}