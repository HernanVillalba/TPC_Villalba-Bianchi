using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlTypes;

namespace Dominio
{
    public class Chango
    {
        public SqlMoney Total { get; set; }
        public int Cantidad { get; set; }

        public Chango()
        {
            Total = 0;
            Cantidad = 0;
        }
    }
}
