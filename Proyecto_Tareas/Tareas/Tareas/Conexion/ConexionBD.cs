using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Tareas.Conexion
{
    public class ConexionBD
    {
        private string stringConexion = "Data Source=localhost;Initial Catalog=BD_Tareas;Integrated Security=True;";

        public SqlConnection m_ObtenerConexion()
        {
            SqlConnection conexion = new SqlConnection(stringConexion);
            try
            {
                if (conexion.State == System.Data.ConnectionState.Open)
                {
                    conexion.Close();
                }
                else
                {
                    conexion.Open();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return conexion;

        }

        public string m_ObtenerCadenaConexion()
        {
            SqlConnection cadenaConexion =
                new SqlConnection(stringConexion);
            return cadenaConexion.ConnectionString;
        }

    }
}