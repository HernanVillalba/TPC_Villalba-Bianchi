using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Tarjeta
    {
        public int IDTarjeta { get; set; }
        public int IDUsuario { get; set; }
        public string Numero { get; set; }
        public int Clave { get; set; }
        public int tipoTarjeta { get; set; }
        public string Alias { get; set; }
       
    }
}
