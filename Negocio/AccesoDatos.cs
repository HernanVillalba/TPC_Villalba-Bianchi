using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class AccesoDatos
    {
        private SqlConnection Conexion;
        public SqlDataReader Lector { get; set; }
        public SqlCommand Comando { get; set; }

        public AccesoDatos()
        {
            // .\\SQLEXPRESS
            Conexion = new SqlConnection("data source =.; initial catalog =Villalba-Bianchi_DB; integrated security=sspi");
        }
        public void SetearConsulta(string consulta)
        {
            Comando = new SqlCommand(consulta);
        }

        public void SetearSP(string sp)
        {
            //procedimiento almacenado
            Comando = new SqlCommand();
            Comando.CommandType = System.Data.CommandType.StoredProcedure;
            Comando.CommandText = sp;
        } 

        public void AbrirConexion()
        {
            try
            {
                Conexion.Open();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void CerrarConexion()
        {
            try
            {
                Conexion.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void EjecutarAccion()
        {
            try
            {
                Comando.Connection = Conexion;
                Comando.ExecuteNonQuery();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public int EjecutarAccionReturn()
        {
            try
            {
                Comando.Connection = Conexion;
                return (int)Comando.ExecuteScalar();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void EjecutarConsulta()
        {
            try
            {
                Comando.Connection = Conexion;
                Lector = Comando.ExecuteReader();

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

    }
}
