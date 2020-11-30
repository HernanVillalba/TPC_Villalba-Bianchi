using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Usuario
    {
        public int ID { get; set; }
        public string nombreUsuario { get; set; }
        public string pass { get; set; }

        public Usuario()
        {
            this.ID = 0;
        }

    }
}
