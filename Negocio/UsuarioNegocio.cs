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
        SqlConnection conexion;
        SqlCommand comando;

        public bool GuardarCambiosPerfil(UsuarioCompleto usuario)
        {
            conexion = new SqlConnection(UsuarioDS);
            comando = new SqlCommand("SP_GuardarDatosPersonales", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@id", usuario.Usuario.ID);
            comando.Parameters.AddWithValue("@nombreUsuario", usuario.Usuario.nombreUsuario);
            comando.Parameters.AddWithValue("@contraseña", usuario.Usuario.pass);
            comando.Parameters.AddWithValue("@nombre", usuario.DPUsuario.Nombre);
            comando.Parameters.AddWithValue("@apellido", usuario.DPUsuario.Apellido);
            comando.Parameters.AddWithValue("@mail", usuario.DPUsuario.Mail);
            comando.Parameters.AddWithValue("@telefono", usuario.DPUsuario.Telefono);
            comando.Parameters.AddWithValue("@telefonoAlter", usuario.DPUsuario.TelefonAlter);

            try
            {
                conexion.Open();
                comando.ExecuteReader();
                conexion.Close();
            }
            catch (Exception)
            {
                return false;
            }

            return true;
        }

        public UsuarioCompleto GetearUsuario(string nombreUsuario)
        {
            UsuarioCompleto aux = new UsuarioCompleto(); ;
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
                    aux.Usuario.ID = lector.GetInt32(0);
                    aux.Usuario.nombreUsuario = lector.GetString(1);
                    aux.Usuario.pass = lector.GetString(2);
                    aux.DPUsuario.Apellido = lector.GetString(3);
                    aux.DPUsuario.Nombre = lector.GetString(4);
                    aux.DPUsuario.Mail = lector.GetString(5);
                    aux.DPUsuario.Telefono = lector.GetInt32(6);
                    aux.DPUsuario.TelefonAlter = lector.GetInt32(7);
                    aux.DatosEnvio.Direccion = lector.GetString(8);
                    aux.DatosEnvio.Altura = lector.GetInt32(9);
                    aux.DatosEnvio.CP = lector.GetInt32(10);
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
            comando.Parameters.AddWithValue("@user", user.nombreUsuario);
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
                    user.nombreUsuario = lector.GetString(1);
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

        public UsuarioCompleto RegistrarseEnDB(UsuarioCompleto reg)
        {
            SqlConnection conexion = new SqlConnection(UsuarioDS);
            SqlCommand comando = new SqlCommand("SP_Registrarse", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@nombre", reg.DPUsuario.Nombre);
            comando.Parameters.AddWithValue("@apellido", reg.DPUsuario.Apellido);
            comando.Parameters.AddWithValue("@mail", reg.DPUsuario.Mail);
            comando.Parameters.AddWithValue("@telefono", reg.DPUsuario.Telefono);
            comando.Parameters.AddWithValue("@nombreUsuario", reg.Usuario.nombreUsuario);
            comando.Parameters.AddWithValue("@contraseña", reg.Usuario.pass);
            SqlDataReader lector;
            try
            {
                conexion.Open();
                lector = comando.ExecuteReader();
                conexion.Close();

            }
            catch (Exception)
            {
                reg.Usuario.ID = 0;
                return reg;
            }

            reg.Usuario.ID = 1;
            return reg;
        }

        public void ClonarUsuario(UsuarioCompleto original, UsuarioCompleto copia)
        {
            //uso esto porque no me clona solo igulando
            copia.Usuario.ID = original.Usuario.ID;
            copia.Usuario.pass = original.Usuario.pass;
            copia.DPUsuario.Apellido = original.DPUsuario.Apellido;
            copia.DPUsuario.Nombre = original.DPUsuario.Nombre;
            copia.DPUsuario.Mail = original.DPUsuario.Mail;
            copia.DPUsuario.Telefono = original.DPUsuario.Telefono;
            copia.DPUsuario.TelefonAlter = original.DPUsuario.TelefonAlter;
            copia.DatosEnvio.Direccion = original.DatosEnvio.Direccion;
            copia.DatosEnvio.Altura = original.DatosEnvio.Altura;
            copia.DatosEnvio.CP = original.DatosEnvio.CP;

        }

        public List<DatosEnvio> ListarDirecciones(int IDU)
        {
            SqlConnection conexion = new SqlConnection(UsuarioDS);
            SqlCommand comando = new SqlCommand("SP_ListarDirecciones", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@idUsuario", IDU);
            List<DatosEnvio> lista = new List<DatosEnvio>();
            SqlDataReader lector;
            try
            {
                conexion.Open();
                lector = comando.ExecuteReader();
                while (lector.Read())
                {
                    DatosEnvio aux = new DatosEnvio();
                    aux.ID = lector.GetInt32(0);
                    aux.Direccion = lector.GetString(1);
                    aux.Altura = lector.GetInt32(2);
                    aux.CP = lector.GetInt32(3);

                    lista.Add(aux);
                }
                conexion.Close();

            }
            catch (Exception)
            {

                throw;
            }

            return lista;
        }

        public DatosEnvio ListarDireccionXID(int IDenvio)
        {
            string query = "select Direccion, Altura, CP from Direcciones where idEnvio = @idEnvio";
            SqlConnection conexion = new SqlConnection(UsuarioDS);
            SqlCommand comando = new SqlCommand(query, conexion);
            comando.Parameters.AddWithValue("@idEnvio", IDenvio);
            SqlDataReader lector;
            DatosEnvio aux = new DatosEnvio();

            try
            {
                conexion.Open();
                lector = comando.ExecuteReader();
                if (lector.Read())
                {
                    aux.ID = IDenvio;
                    aux.Direccion = lector.GetString(0);
                    aux.Altura = lector.GetInt32(1);
                    aux.CP = lector.GetInt32(2);
              
                }
                conexion.Close();

            }
            catch (Exception)
            {
                aux.ID = 0;
            }



            return aux;
        }

        public void AgregarDireccion(DatosEnvio Direccion, int IDU)
        {
            conexion = new SqlConnection(UsuarioDS);
            comando = new SqlCommand("SP_AgregarDireccion", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@idUsuario", IDU);
            comando.Parameters.AddWithValue("@Direccion", Direccion.Direccion);
            comando.Parameters.AddWithValue("@Altura", Direccion.Altura);
            comando.Parameters.AddWithValue("@CP", Direccion.CP);

            try
            {
                conexion.Open();
                comando.ExecuteReader();
                conexion.Close();
            }
            catch (Exception)
            {

                
            }


        }
        
        public void BorrarDireccion(int IDD)
        {
            string query = "delete from Direcciones where IDEnvio = @IDEnvio";
            conexion = new SqlConnection(UsuarioDS);
            comando = new SqlCommand(query, conexion);
            comando.Parameters.AddWithValue("@IDEnvio", IDD);
            try
            {
                conexion.Open();
                comando.ExecuteReader();
                conexion.Close();
            }
            catch (Exception)
            {


            }
        }

    }

}
