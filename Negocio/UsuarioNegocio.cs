using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using System.Data.SqlTypes;
using System.Data.SqlClient;

namespace Negocio
{
    public class UsuarioNegocio
    {
        string UsuarioDS = "data source=.\\SQLEXPRESS; initial catalog=DB_VILLALBA_BIANCHI; integrated security=sspi;";
        //string query = "select * from Usuarios where NombreUsuario = @user and Contraseña = @pass";
        public Usuario login(Usuario user)
        {
            //necesito una conexion, un comando y un lector.
            SqlConnection conexion = new SqlConnection(UsuarioDS);
            SqlCommand comando = new SqlCommand("select * from Usuarios where NombreUsuario = @user and Contraseña = @pass", conexion);
            comando.Parameters.AddWithValue("@user", user.user);
            comando.Parameters.AddWithValue("@pass", user.pass);
            SqlDataReader lector;

            try
            {
                conexion.Open();
                lector = comando.ExecuteReader();

                if (lector.Read()) //si lee un registro, asigno los valores
                {
                    //asigno los valores de las columnas de la consulta
                    user.ID = lector.GetInt32(0);
                    user.user = lector.GetString(1);
                    user.pass = lector.GetString(2);
                }
                else { user.ID = 0; }

                conexion.Close();
                return user;

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
