using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Tareas.Entidades
{
    public class Tarea
    {
        public int Id { get; set; }
        public String Titulo { get; set; }
        public String Descripcion { get; set; }
        public DateTime FechaRegistro { get; set; }
        public String Completada{ get; set; }
        public DateTime FechaFinalizacion { get; set; }
        public String Estado { get; set; }

    }
}