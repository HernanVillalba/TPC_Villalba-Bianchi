using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Juego
    {
        public int ID { get; set; }
        public string Nombre { get; set; }
        public Plataforma PlataformaJuego { get; set; }
        public string Descripcion { get; set; }
        public Desarrollador DesarrolladorJuego { get; set; }
        public SqlMoney Precio{ get; set; }
        public int Stock { get; set; }
        public string ImagenURL { get; set; }

        public Juego()
        {

        }

    }
}