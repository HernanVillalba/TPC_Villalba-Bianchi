using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlTypes;

namespace Dominio
{
    class Pedido

    {
        public int ID { set; get; }
        
        public int IDUsuario { set; get; }

        public List<Juego> Productos { get; set; }

        public SqlMoney TotalImporte { get; set; }
        
        public DateTime Fecha { get; set; }

        public bool TipoEnvio { get; set; }

        public DatosEnvio Destino { get; set; }

        public bool Pagado { get; set; }

        public string Estado { get; set; }
        

    }
}
