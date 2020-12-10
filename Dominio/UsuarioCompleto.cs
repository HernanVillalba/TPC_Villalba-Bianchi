using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class UsuarioCompleto
    {
        public Usuario Usuario { set; get; }
        public DatosPersonales DPUsuario { set; get; }

        public UsuarioCompleto()
        {
            Usuario = new Usuario();
            DPUsuario = new DatosPersonales();
        }
    }
}
