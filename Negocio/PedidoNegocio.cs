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

        public void ProductosPedido(int IDP, Juego item)
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

    }

}



