using Dominio;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class JuegoNegocio
    {
        string UsuarioDS = "data source=.\\SQLEXPRESS; initial catalog=DB_VILLALBA_BIANCHI; integrated security=sspi;";
        SqlConnection conexion;
        SqlCommand comando;
        SqlDataReader lector;
        public List<Juego> ListarTodosLosCampos()
        {
            //Vista creada en la base de datos
            string query = "select * from VW_ListarTodosLosCampos";

            conexion = new SqlConnection(UsuarioDS);
            comando = new SqlCommand(query, conexion);
            List<Juego> Lista = new List<Juego>();

            try
            {
                conexion.Open();
                lector = comando.ExecuteReader();

                while (lector.Read())
                {
                    Juego aux = new Juego();

                    aux.ID = lector.GetInt32(0);
                    aux.Nombre = lector.GetString(1);
                    aux.Descripcion = lector.GetString(2);
                    aux.ImagenURL = lector.GetString(3);
                    aux.PlataformaJuego.Precio = lector.GetSqlMoney(4);
                    aux.PlataformaJuego.Stock = lector.GetInt32(5);
                    aux.PlataformaJuego.ID = lector.GetInt32(6);
                    aux.PlataformaJuego.Nombre = lector.GetString(7);
                    aux.DesarrolladorJuego.ID = lector.GetInt32(8);
                    aux.DesarrolladorJuego.Nombre = lector.GetString(9);

                    Lista.Add(aux);
                }
                conexion.Close();
                return Lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public void EliminarItemCarrito(int IDU, int IDJ, int IDP)
        {
            conexion = new SqlConnection(UsuarioDS);
            comando = new SqlCommand("SP_EliminarItemCarrito", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@idUsuario", IDU);
            comando.Parameters.AddWithValue("@idJuego", IDJ);
            comando.Parameters.AddWithValue("@idPlataforma", IDP);
            try
            {
                conexion.Open();
                comando.ExecuteReader();
                conexion.Close();
            }
            catch (Exception)
            {

                throw;
            }
        }

        public List<Juego> ListarCarrito(int IDU)
        {
            conexion = new SqlConnection(UsuarioDS);
            comando = new SqlCommand("SP_ListarCarrito", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@idUsuario", IDU);
            List<Juego> lista = new List<Juego>();

            try
            {
                conexion.Open();
                lector = comando.ExecuteReader();
                while (lector.Read())
                {
                    Juego aux = new Juego();

                    aux.ID = lector.GetInt32(0);
                    aux.Nombre = lector.GetString(1);
                    aux.Descripcion = lector.GetString(2);
                    aux.ImagenURL = lector.GetString(3);
                    aux.PlataformaJuego.Precio = lector.GetSqlMoney(4);
                    aux.PlataformaJuego.Stock = lector.GetInt32(5);
                    aux.PlataformaJuego.ID = lector.GetInt32(6);
                    aux.PlataformaJuego.Nombre = lector.GetString(7);
                    aux.DesarrolladorJuego.ID = lector.GetInt32(8);
                    aux.DesarrolladorJuego.Nombre = lector.GetString(9);
                    aux.Cantidad = lector.GetInt32(10);

                    lista.Add(aux);
                }

                conexion.Close();
            }
            catch (Exception)
            {
                lista = null;
            }

            return lista;
        }

        public void AgregarFavorito(int IDU, int IDJ, int IDP)
        {
            conexion = new SqlConnection(UsuarioDS);
            comando = new SqlCommand("SP_AgregarFavorito", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@idUsuario", IDU);
            comando.Parameters.AddWithValue("@idJuego", IDJ);
            comando.Parameters.AddWithValue("@idPlataforma", IDP);

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
        public void VaciarCarrito(int IDU)
        {
            conexion = new SqlConnection(UsuarioDS);
            comando = new SqlCommand("SP_VaciarCarrito", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@idUsuario", IDU);
            try
            {
                conexion.Open();
                comando.ExecuteReader();
                conexion.Close();
            }
            catch (Exception)
            {

                throw;
            }
        }

        public void AgregarItemCarrito(int IDU, int IDJ, int IDP)
        {
            conexion = new SqlConnection(UsuarioDS);
            comando = new SqlCommand("SP_AgregarItemCarrito", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@idUsuario", IDU);
            comando.Parameters.AddWithValue("@idJuego", IDJ);
            comando.Parameters.AddWithValue("@idPlataforma", IDP);

            try
            {
                conexion.Open();
                comando.ExecuteReader();
                conexion.Close();
            }
            catch (Exception)
            {

                throw;
            }
        }

        public void SumarCantidadItemCarrito(int IDU, int IDJ, int IDP)
        {
            conexion = new SqlConnection(UsuarioDS);
            comando = new SqlCommand("SP_SumarCantidadItemCarrito", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@idUsuario", IDU);
            comando.Parameters.AddWithValue("@idJuego", IDJ);
            comando.Parameters.AddWithValue("@idPlataforma", IDP);

            try
            {
                conexion.Open();
                comando.ExecuteReader();
                conexion.Close();
            }
            catch (Exception)
            {

                throw;
            }
        }

        public void EliminarFavorito(int IDU, int IDJ, int IDP)
        {
            conexion = new SqlConnection(UsuarioDS);
            comando = new SqlCommand("SP_EliminarFavorito", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@idUsuario", IDU);
            comando.Parameters.AddWithValue("@idJuego", IDJ);
            comando.Parameters.AddWithValue("@idPlataforma", IDP);

            try
            {
                conexion.Open();
                comando.ExecuteReader();
                conexion.Close();
            }
            catch (Exception)
            {

                throw;
            }
        }

        public List<Juego> ListarFavortitos(int IDU)
        {
            conexion = new SqlConnection(UsuarioDS);
            comando = new SqlCommand("SP_ListarFavUsuario", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@idUsuario", IDU);
            List<Juego> lista = new List<Juego>();

            try
            {
                conexion.Open();
                lector = comando.ExecuteReader();

                while (lector.Read())
                {
                    Juego aux = new Juego();

                    aux.ID = lector.GetInt32(0);
                    aux.Nombre = lector.GetString(1);
                    aux.Descripcion = lector.GetString(2);
                    aux.ImagenURL = lector.GetString(3);
                    aux.PlataformaJuego.Precio = lector.GetSqlMoney(4);
                    aux.PlataformaJuego.Stock = lector.GetInt32(5);
                    aux.PlataformaJuego.ID = lector.GetInt32(6);
                    aux.PlataformaJuego.Nombre = lector.GetString(7);
                    aux.DesarrolladorJuego.ID = lector.GetInt32(8);
                    aux.DesarrolladorJuego.Nombre = lector.GetString(9);

                    lista.Add(aux);
                }
                conexion.Close();
            }
            catch (Exception)
            {
                lista = null;
            }
            return lista;
        }

        public List<Plataforma> GetPlataformas()
        {
            string query = "select * from Plataformas";

            conexion = new SqlConnection(UsuarioDS);
            comando = new SqlCommand(query, conexion);
            List<Plataforma> lista = new List<Plataforma>();
            try
            {
                conexion.Open();
                lector = comando.ExecuteReader();

                while (lector.Read())
                {
                    Plataforma aux = new Plataforma();
                    aux.ID = lector.GetInt32(0);
                    aux.Nombre = lector.GetString(1);
                    lista.Add(aux);
                }

                conexion.Close();
                return lista;

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        public List<Plataforma> GetDesarrolladres()
        {
            string query = "select * from Desarrolladores";


            conexion = new SqlConnection(UsuarioDS);
            comando = new SqlCommand(query, conexion);
            List<Plataforma> lista = new List<Plataforma>();
            try
            {
                conexion.Open();
                lector = comando.ExecuteReader();

                while (lector.Read())
                {
                    Plataforma aux = new Plataforma();
                    aux.ID = lector.GetInt32(0);
                    aux.Nombre = lector.GetString(1);
                    lista.Add(aux);
                }

                conexion.Close();
                return lista;

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        public Juego GuardarJuego(Juego aux)
        {
            SqlConnection conexion = new SqlConnection(UsuarioDS);
            SqlCommand comando = new SqlCommand("SP_NuevoJuego", conexion);
            SqlDataReader lector;
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@nombre", aux.Nombre);
            comando.Parameters.AddWithValue("@descripcion", aux.Descripcion);
            comando.Parameters.AddWithValue("@imagenurl", aux.ImagenURL);
            comando.Parameters.AddWithValue("@idplataforma", aux.PlataformaJuego.ID);
            comando.Parameters.AddWithValue("@importe", aux.PlataformaJuego.Precio);
            comando.Parameters.AddWithValue("@stock", aux.PlataformaJuego.Stock);
            comando.Parameters.AddWithValue("@iddesarrollador", aux.DesarrolladorJuego.ID);

            try
            {
                conexion.Open();
                lector = comando.ExecuteReader();
                conexion.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return aux;
        }
        public bool ActualizarJuego(Juego aux)
        {
            SqlConnection conexion = new SqlConnection(UsuarioDS);
            SqlCommand comando = new SqlCommand("SP_ActualizarJuego", conexion);
            SqlDataReader lector;
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@IDJUEGO", aux.ID);
            comando.Parameters.AddWithValue("@Nombre", aux.Nombre);
            comando.Parameters.AddWithValue("@Descripcion", aux.Descripcion);
            comando.Parameters.AddWithValue("@ImagenURL", aux.ImagenURL);
            comando.Parameters.AddWithValue("@IDPlataforma", aux.PlataformaJuego.ID);
            comando.Parameters.AddWithValue("@Importe", aux.PlataformaJuego.Precio);
            comando.Parameters.AddWithValue("@Stock", aux.PlataformaJuego.Stock);
            try
            {
                conexion.Open();
                lector = comando.ExecuteReader();
                conexion.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }

            return true;
        }

        public void BorrarJuego(int IDJ, int IDP)
        {
            string query = "delete Plataforma_x_Juego where IDPlataforma=@IDP and IDJuego=@IDJ";
            conexion = new SqlConnection(UsuarioDS);
            comando = new SqlCommand(query, conexion);
            comando.Parameters.AddWithValue("@IDJ", IDJ);
            comando.Parameters.AddWithValue("IDP", IDP);
            try
            {
                conexion.Open();
                comando.ExecuteReader();
            }
            catch (Exception)
            {

                
            }
            conexion.Close();

        }

    }
}
