using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class RegistrarUsuario
    {
        public Usuario usuario { set; get; }
        public DatosPersonales DPUsuario { set; get; }

        public RegistrarUsuario()
        {
            usuario = new Usuario();
            DPUsuario = new DatosPersonales();
        }
    }
}
