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
        private JuegoNegocio negocio;
        public List<Juego> Lista;
        protected void Page_Load(object sender, EventArgs e)
        {
            negocio = new JuegoNegocio();
            Lista = new List<Juego>();
            Lista = negocio.ListarTodosLosCampos();
        }
    }
}