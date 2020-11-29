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
        public List<Juego> ListarTodosLosCampos()
        {
            //Vista creada en la base de datos
            string query = "select * from VW_ListarTodosLosCampos";

            SqlConnection Conexion = new SqlConnection(UsuarioDS);
            SqlCommand Comando = new SqlCommand(query,Conexion);
            SqlDataReader Lector;
            List<Juego> Lista = new List<Juego>();

            try
            {
                Conexion.Open();
                Lector = Comando.ExecuteReader();

                while (Lector.Read())
                {
                    Juego aux = new Juego();
                    
                    aux.ID = Lector.GetInt32(0);
                    aux.Nombre = Lector.GetString(1);
                    aux.Descripcion = Lector.GetString(2);
                    aux.ImagenURL = Lector.GetString(3);
                    aux.PlataformaJuego.Precio = Lector.GetSqlMoney(4);
                    aux.PlataformaJuego.Stock = Lector.GetInt32(5);
                    aux.PlataformaJuego.ID = Lector.GetInt32(6);
                    aux.PlataformaJuego.Nombre = Lector.GetString(7);
                    aux.DesarrolladorJuego.ID = Lector.GetInt32(8);
                    aux.DesarrolladorJuego.Nombre = Lector.GetString(9);

                    Lista.Add(aux);
                }
                Conexion.Close();
                return Lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public List<Plataforma> GetPlataformas()
        {
            string query = "select * from Plataformas";

            SqlConnection Conexion = new SqlConnection(UsuarioDS);
            SqlCommand Comando = new SqlCommand(query, Conexion);
            SqlDataReader Lector;
            List<Plataforma> lista = new List<Plataforma>();
            try
            { 
                Conexion.Open();
                Lector = Comando.ExecuteReader();

                while (Lector.Read())
                {
                    Plataforma aux = new Plataforma();
                    aux.ID = Lector.GetInt32(0);
                    aux.Nombre = Lector.GetString(1);
                    lista.Add(aux);
                }

                Conexion.Close();
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
            

            SqlConnection Conexion = new SqlConnection(UsuarioDS);
            SqlCommand Comando = new SqlCommand(query, Conexion);
            SqlDataReader Lector;
            List<Plataforma> lista = new List<Plataforma>();
            try
            {
                Conexion.Open();
                Lector = Comando.ExecuteReader();

                while (Lector.Read())
                {
                    Plataforma aux = new Plataforma();
                    aux.ID = Lector.GetInt32(0);
                    aux.Nombre = Lector.GetString(1);
                    lista.Add(aux);
                }

                Conexion.Close();
                return lista;

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        public Juego GuardarJuego( Juego aux)
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


    }
}
