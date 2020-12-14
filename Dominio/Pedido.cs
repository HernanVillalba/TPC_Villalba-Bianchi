using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlTypes;

namespace Dominio
{
    public class Pedido

    {
        public int ID { set; get; }

        public int IDUsuario { set; get; }

        public List<Juego> Productos { get; set; }

        public DateTime Fecha { get; set; }

        public Chango Carro { get; set; }

        public Direccion Destino { get; set; } //se va  a seleccionar de una list datos de envio proveniente del usuario

        public bool TipoEnvio { get; set; } // define si se envia o se retira

        public bool Pagado { get; set; }

        public string Estado { get; set; } //Hacer Droplist


    }
}
