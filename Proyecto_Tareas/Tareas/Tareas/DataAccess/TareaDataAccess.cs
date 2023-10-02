using Tareas.Conexion;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Tareas.Entidades;
using System.Data;

namespace Tareas.DataAccess
{
    public class TareaDataAccess
    {
         SqlCommand sqlCommand = new SqlCommand();

         ConexionBD conexion = new ConexionBD();

        public string CrearTarea(Tarea tarea)
        {
            string mensaje = string.Empty;
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "sp_CrearTarea";
            sqlCommand.Connection = conexion.m_ObtenerConexion();            
            sqlCommand.Parameters.Add("@Titulo", SqlDbType.NVarChar).Value = tarea.Titulo;
            sqlCommand.Parameters.Add("@Descripcion", SqlDbType.NVarChar).Value = tarea.Descripcion;
            sqlCommand.Parameters.Add("@FechaRegistro", SqlDbType.DateTime).Value = tarea.FechaRegistro;
            sqlCommand.Parameters.Add("@Completada", SqlDbType.NVarChar).Value = tarea.Completada;
            sqlCommand.Parameters.Add("@FechaFinalizacion", SqlDbType.DateTime).Value = tarea.FechaFinalizacion;

            int registros;
            registros = sqlCommand.ExecuteNonQuery();
            if (registros == 1)
            {
                mensaje = "Registro almacenado correctamente";
            }
            else
            {
                mensaje = "Error en la transaccion";
            }
            sqlCommand.Parameters.Clear();
            conexion.m_ObtenerConexion().Close();
            return mensaje;
        }

        public string ModificarTarea(Tarea tarea)
        {
            string mensaje;
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "sp_ModificarTarea";
            sqlCommand.Connection = conexion.m_ObtenerConexion();
            sqlCommand.Parameters.Add("@Id", SqlDbType.Int).Value = tarea.Id;
            sqlCommand.Parameters.Add("@Titulo", SqlDbType.NVarChar).Value = tarea.Titulo;
            sqlCommand.Parameters.Add("@Descripcion", SqlDbType.NVarChar).Value = tarea.Descripcion;
            sqlCommand.Parameters.Add("@FechaFinalizacion", SqlDbType.NVarChar).Value = tarea.FechaFinalizacion;
            int registros;
            registros = sqlCommand.ExecuteNonQuery();
            if (registros == 1)
            {
                mensaje = "Registro modificado correctamente";
            }
            else
            {
                mensaje = "Error en la transaccion";
            }
            sqlCommand.Parameters.Clear();
            conexion.m_ObtenerConexion().Close();
            return mensaje;
        }


        public string CompletarTarea(int idTarea, string completada)
        {
            string mensaje;
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "sp_CompletarTarea";
            sqlCommand.Connection = conexion.m_ObtenerConexion();
            sqlCommand.Parameters.Add("@Id", SqlDbType.Int).Value = idTarea;
            sqlCommand.Parameters.Add("@Completada", SqlDbType.Int).Value = completada;

            int registros;
            registros = sqlCommand.ExecuteNonQuery();
            if (registros == 1)
            {
                mensaje = "Registro eliminado correctamente";
            }
            else
            {
                mensaje = "Error en la transaccion";
            }
            sqlCommand.Parameters.Clear();
            conexion.m_ObtenerConexion().Close();
            return mensaje;
        }

        public string EliminarTarea(int idTarea)
        {
            string mensaje;
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "sp_EliminarTarea";
            sqlCommand.Connection = conexion.m_ObtenerConexion();
            sqlCommand.Parameters.Add("@Id", SqlDbType.Int).Value = idTarea;
            
            int registros;
            registros = sqlCommand.ExecuteNonQuery();
            if (registros == 1)
            {
                mensaje = "Registro eliminado correctamente";
            }
            else
            {
                mensaje = "Error en la transaccion";
            }
            sqlCommand.Parameters.Clear();
            conexion.m_ObtenerConexion().Close();
            return mensaje;
        }

        public List<Tarea> ListarTarea(string filtro)
        {
            List<Tarea> lista = new List<Tarea>();
            SqlDataReader dr;
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "sp_ListaTareas";
            sqlCommand.Connection = conexion.m_ObtenerConexion();
            sqlCommand.Parameters.Add("@Filtro", SqlDbType.NVarChar).Value = filtro;            
            dr = sqlCommand.ExecuteReader();
            while (dr.Read())
            {
                Tarea tarea = new Tarea();
                tarea.Id = Convert.ToInt32(dr.GetValue(0));
                tarea.Titulo = Convert.ToString(dr.GetValue(1));
                tarea.Descripcion = Convert.ToString(dr.GetValue(2));
                tarea.FechaRegistro = Convert.ToDateTime(dr.GetValue(3));
                tarea.Completada = Convert.ToString(dr.GetValue(4));
                tarea.FechaFinalizacion = Convert.ToDateTime(dr.GetValue(5)); 

                lista.Add(tarea);
            }
            return lista;
        }

    }
}
