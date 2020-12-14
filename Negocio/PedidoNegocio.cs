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
    public class PedidoNegocio
    {
        private string UsuarioDS = "data source=.\\SQLEXPRESS; initial catalog=DB_VILLALBA_BIANCHI; integrated security=sspi;";
        SqlConnection conexion;
        SqlCommand comando;
        SqlDataReader lector;

        public void GuardarPedido(Pedido compra)
        {
            conexion = new SqlConnection(UsuarioDS);
            comando = new SqlCommand("SP_CrearPedido", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@IDU", compra.IDUsuario);
            comando.Parameters.AddWithValue("@IT", compra.Carro.Total);
            comando.Parameters.AddWithValue("@EPC", compra.TipoEnvio);
            comando.Parameters.AddWithValue("@IDD", compra.Destino.ID);
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

        public int GetearIDPedido()
        {
            string query = "select max(id) from pedidos";
            conexion = new SqlConnection(UsuarioDS);
            comando = new SqlCommand(query, conexion);
            try
            {
                int aux;

                conexion.Open();
                lector = comando.ExecuteReader();
                if (lector.Read())
                {
                    aux = lector.GetInt32(0);
                    conexion.Close();
                    return aux;
                }

            }
            catch (Exception)
            {

            }
            return -1;
        }

        public void GuardarProductosPedido(int IDP, Juego item)
        {
            conexion = new SqlConnection(UsuarioDS);
            comando = new SqlCommand("SP_GuardarProductos", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@IDPedido", IDP);
            comando.Parameters.AddWithValue("@IDJ", item.ID);
            comando.Parameters.AddWithValue("@Precio", item.PlataformaJuego.Precio);
            comando.Parameters.AddWithValue("@Cantidad", item.Cantidad);
            comando.Parameters.AddWithValue("@IDP", item.PlataformaJuego.ID);
            try
            {
                conexion.Open();
                comando.ExecuteReader();
                conexion.Close();
            }
            catch (Exception)
            {
                conexion.Close();
            }

        }

        public List<Pedido> ListarPedidos(int IDU)
        {
            List<Pedido> lista = new List<Pedido>();
            string query = "select * from Pedidos where IDUsuario = @IDU";
            conexion = new SqlConnection(UsuarioDS);
            comando = new SqlCommand(query, conexion);
            comando.Parameters.AddWithValue("@IDU", IDU);
            try
            {
                conexion.Open();
                lector = comando.ExecuteReader();
                while (lector.Read())
                {
                    Pedido aux = new Pedido();
                    aux.ID = lector.GetInt32(0);
                    aux.IDUsuario = lector.GetInt32(1);
                    aux.Carro.Total = lector.GetSqlMoney(2);
                    aux.Fecha = lector.GetDateTime(3);
                    aux.TipoEnvio = lector.GetBoolean(4);
                    aux.Destino.ID = lector.GetInt32(5);
                    aux.Pagado = lector.GetBoolean(6);
                    aux.Estado = lector.GetString(7);
                    aux.Productos = ListarProductosxPedidos(aux.ID);
                    foreach (var item in aux.Productos)
                    {
                        aux.Carro.Cantidad += item.Cantidad;
                    }
                    lista.Add(aux);
                
                }
                
            }
            catch (Exception)
            {

           
            }


            return lista;
        }


        public List<Juego> ListarProductosxPedidos(int IDPed)
        {
            List<Juego> Lista = new List<Juego>();
            conexion = new SqlConnection(UsuarioDS);
            comando = new SqlCommand("SP_ListarProductosxPedido", conexion);
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@IDP", IDPed);
            SqlDataReader reader;
            try
            {
                conexion.Open();
                reader = comando.ExecuteReader();

                while (reader.Read())
                {
                    Juego aux = new Juego();

                    aux.ID = reader.GetInt32(0);
                    aux.Nombre = reader.GetString(1);
                    aux.Cantidad = reader.GetInt32(2);
                    aux.Descripcion = reader.GetString(3);
                    aux.ImagenURL = reader.GetString(4);
                    aux.PlataformaJuego.Precio = reader.GetSqlMoney(5);
                    aux.PlataformaJuego.ID = reader.GetInt32(6);
                    aux.PlataformaJuego.Nombre = reader.GetString(7);
                    aux.DesarrolladorJuego.ID = reader.GetInt32(8);
                    aux.DesarrolladorJuego.Nombre = reader.GetString(9);
                    Lista.Add(aux);
                }
                conexion.Close();
            }
            catch (Exception ex)
            {
                               
            }
            return Lista;

        }
    }

}



