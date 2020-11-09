using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Plataforma
    {
        public int ID{ get; set; }
        public string Nombre { get; set; }
        public int Stock { get; set; }
        public SqlMoney Precio { get; set; }

        public Plataforma()
        {

        }
    }
}
