using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class AccesoDatos
    {
        public SqlDataReader Lector { get; set; }
        public SqlConnection Conexion { get; set; }
        public SqlCommand Comando { get; set; }

        public AccesoDatos()
        {
            Conexion = new SqlConnection("data source =.\\SQLEXPRESS; initial catalog =Villalba-Bianchi_DB; integrated security=sspi");
            Comando = new SqlCommand();
            Comando.Connection = Conexion;
        }
    }
}
