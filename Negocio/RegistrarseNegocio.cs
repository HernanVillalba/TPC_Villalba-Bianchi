using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Dominio;

namespace Negocio
{
    public class RegistrarseNegocio
    {
        private string DSUsuario = "data source=.\\SQLEXPRESS; initial catalog=DB_VILLALBA_BIANCHI; integrated security=sspi;";
                                 //"data source=.\\SQLEXPRESS; initial catalog=DB_VILLALBA_BIANCHI; integrated security=sspi;"
        public RegistrarUsuario RegistrarseEnDB(RegistrarUsuario reg)
        {
            SqlConnection conexion = new SqlConnection(DSUsuario);
            SqlCommand comando = new SqlCommand("SP_Registrarse", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@nombre", reg.DPUsuario.Nombre);
            comando.Parameters.AddWithValue("@apellido", reg.DPUsuario.Apellido);
            comando.Parameters.AddWithValue("@mail", reg.DPUsuario.Mail);
            comando.Parameters.AddWithValue("@CP", reg.DPUsuario.CP);
            comando.Parameters.AddWithValue("@nombreUsuario", reg.usuario.user);
            comando.Parameters.AddWithValue("@contraseña", reg.usuario.pass);
            SqlDataReader lector;
            try
            {
                conexion.Open();
                lector = comando.ExecuteReader();
                if (!lector.Read())
                {

                }
                else
                {
                    reg.usuario.ID = 0;
                }
                conexion.Close();

            }
            catch (Exception ex)
            {

                throw ex;
            }

            return reg;
        }
    }
}
