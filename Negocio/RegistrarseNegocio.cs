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
            comando.Parameters.AddWithValue("@telefono", reg.DPUsuario.Telefono);
            comando.Parameters.AddWithValue("@nombreUsuario", reg.usuario.user);
            comando.Parameters.AddWithValue("@contraseña", reg.usuario.pass);
            SqlDataReader lector;
            try
            {
                conexion.Open();
                lector = comando.ExecuteReader();
                //reg.usuario.ID = ObtenerIDUsuarioRegistrado(reg.usuario.user);
                conexion.Close();

            }
            catch (Exception )
            {
                reg.usuario.ID = 0;
                return reg;
            }

            reg.usuario.ID = 1;
            return reg;
        }

        private int ObtenerIDUsuarioRegistrado( string nombreUsuario) 
        {
            //no funca aun
            int id;
            SqlConnection conexion = new SqlConnection(DSUsuario);
            SqlCommand comando = new SqlCommand("select * from Usuarios where NombreUsuario = @nombreusuario");
            comando.Parameters.AddWithValue("@nombreusuario", nombreUsuario);
            SqlDataReader lector;
            try
            {
                conexion.Open();
                lector = comando.ExecuteReader();
                lector.Read();
                id = lector.GetInt32(0);

                conexion.Close();
                return id;
            }
            catch (Exception)
            {
                return 0;
                throw;
            }

        }
    }
}
