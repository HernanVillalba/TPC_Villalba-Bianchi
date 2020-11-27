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

        private string UsuarioDS = "data source=.\\SQLEXPRESS; initial catalog=DB_VILLALBA_BIANCHI; integrated security=sspi;";

        public RegistrarUsuario GetUsuario(string nombreUsuario)
        {
            RegistrarUsuario aux = new RegistrarUsuario(); ;
            SqlConnection conexion = new SqlConnection(UsuarioDS);
            SqlCommand comando = new SqlCommand("SP_DatosUsuario", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@nombreUsuario", nombreUsuario);
            SqlDataReader lector;
            try
            {
                conexion.Open();
                lector = comando.ExecuteReader();
                if (lector.Read())
                {
                    /*
                    aux.usuario.ID = lector.GetInt32(0);
                    aux.usuario.user = lector.GetString(1);
                    aux.usuario.pass = lector.GetString(2);
                    aux.DPUsuario.Apellido = lector.GetString(3);
                    aux.DPUsuario.Nombre = lector.GetString(4);
                    aux.DPUsuario.Mail = lector.GetString(5);
                    aux.DPUsuario.Telefono = lector.GetInt32(6);
                    aux.DPUsuario.Direccion = lector.GetString(7);
                    aux.DPUsuario.Altura = lector.GetInt32(8);
                    aux.DPUsuario.CP = lector.GetInt32(9);
                    */

                    aux.usuario.ID = lector.GetInt32(0);
                    aux.usuario.user = lector.GetString(1);
                    aux.usuario.pass = lector.GetString(2);
                    aux.DPUsuario.Apellido = lector.GetString(3);
                    aux.DPUsuario.Nombre = lector.GetString(4);
                    aux.DPUsuario.Mail = lector.GetString(5);
                    aux.DPUsuario.Telefono = lector.GetInt32(6);
                    aux.DPUsuario.TelefonAlter = lector.GetInt32(7);
                    aux.DPUsuario.Direccion = lector.GetString(8);
                    aux.DPUsuario.Altura = lector.GetInt32(9);
                    aux.DPUsuario.CP = lector.GetInt32(10);
                }
                else
                {
                    aux = null;
                }
                conexion.Close();
                
            }
            catch (Exception)
            {
                aux = null;
            }

            return aux;
        }

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

        public RegistrarUsuario RegistrarseEnDB(RegistrarUsuario reg)
        {
            SqlConnection conexion = new SqlConnection(UsuarioDS);
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
                conexion.Close();

            }
            catch (Exception)
            {
                reg.usuario.ID = 0;
                return reg;
            }

            reg.usuario.ID = 1;
            return reg;
        }
    }

}
