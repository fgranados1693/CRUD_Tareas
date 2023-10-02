using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Tareas.DataAccess;
using Tareas.Entidades;

namespace Tareas.Business
{
    public class TareaLO
    {
        private TareaDataAccess tareaDA = new TareaDataAccess();
        public string CrearTarea(Tarea tarea)
        {
            return tareaDA.CrearTarea(tarea);
        }

        public string ModificarTarea(Tarea tarea)
        {
            return tareaDA.ModificarTarea(tarea);
        }

        public string CompletarTarea(int id, string completada)
        {
            return tareaDA.CompletarTarea(id, completada);
        }

        public List<Tarea> ListarTareas(string filtro)
        {
            return tareaDA.ListarTarea(filtro);
        }

        public string EliminarTarea(int idTarea)
        {
            return tareaDA.EliminarTarea(idTarea);
        }
    }
}