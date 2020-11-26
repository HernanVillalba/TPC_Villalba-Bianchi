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
       
        public List<Juego> ListarTodosLosCampos()
        {
            //Vista creada en la base de datos
            string query = "select * from VW_ListarTodosLosCampos";
            string UsuarioDS = "data source=.\\SQLEXPRESS; initial catalog=DB_VILLALBA_BIANCHI; integrated security=sspi;";

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
            string UsuarioDS = "data source=.\\SQLEXPRESS; initial catalog=DB_VILLALBA_BIANCHI; integrated security=sspi;";

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
            string UsuarioDS = "data source=.\\SQLEXPRESS; initial catalog=DB_VILLALBA_BIANCHI; integrated security=sspi;";

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



    }
}
