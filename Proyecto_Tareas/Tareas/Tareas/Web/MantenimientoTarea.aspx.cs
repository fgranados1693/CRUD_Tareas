using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Tareas.Business;
using Tareas.DataAccess;
using Tareas.Entidades;

namespace Tareas.Web
{
    public partial class MantenimientoTareaaspx : System.Web.UI.Page
    {
        public void LimpiarCampos()
        {            
            txtTitulo.Text = "";
            txtDescripcion.Text = "";            
        }

        public void SetIdTarea(int idTarea)
        {
            Session["idTarea"] = idTarea;
        }

        public void CrearTarea()
        {
            try
            {
                Tarea tarea = new Tarea();
                TareaLO tareaLO = new TareaLO();

                if (txtTitulo.Text == "")
                {
                    divMensajeInfo.Visible = true;
                    lblMensajeInfo.Text = "Debe incluir un título";
                }
                else
                {
                    tarea.Titulo = txtTitulo.Text;                    
                    tarea.Descripcion = txtDescripcion.Text;
                    tarea.FechaRegistro = DateTime.Today;
                    tarea.FechaFinalizacion = Convert.ToDateTime("1900-01-01");
                    tarea.Completada = ddlCompletadaAdd.SelectedValue;
                   
                    string resultado = tareaLO.CrearTarea(tarea);

                    if (resultado == "Registro almacenado correctamente")
                    {
                        LimpiarCampos();
                        divMensajeSuccess.Visible = true;
                        lblMensajeSuccess.Text = resultado;
                    }
                    else
                    {
                        divMensajeInfo.Visible = true;
                        lblMensajeInfo.Text = "Hubo un error en la transacción";

                    }
                }

            }
            catch (Exception ex)
            {
                divMensajeError.Visible = true;
                lblMensajeError.Text = "Hubo un error en la transacción. Error: " + ex;

            }
        }
        public void ModificarTarea()
        {
            try
            {
                Tarea tarea = new Tarea();
                TareaLO tareaLO = new TareaLO();

                if (txtTitulo_Edit.Text == "")
                {
                    divMensajeInfo.Visible = true;
                    lblMensajeInfo.Text = "Debe incluir un título";
                }
                else
                {
                    tarea.Id = Convert.ToInt16(txtId_Edit.Text);
                    tarea.Titulo = txtTitulo_Edit.Text;
                    tarea.Descripcion = txtDescripcion_Edit.Text;
                    tarea.FechaFinalizacion = Convert.ToDateTime(txtFechaFinalizacion_Edit.Text);
                    tarea.Completada = ddlCompletadaEdit.SelectedValue;

                    string resultado = tareaLO.ModificarTarea(tarea);

                    if (resultado == "Registro modificado correctamente")
                    {
                        LimpiarCampos();
                        divMensajeSuccess.Visible = true;
                        lblMensajeSuccess.Text = resultado;
                    }
                    else
                    {
                        divMensajeInfo.Visible = true;
                        lblMensajeInfo.Text = "Hubo un error en la transacción";

                    }
                }
                
            }
            catch (Exception ex)
            {
                divMensajeError.Visible = true;
                lblMensajeError.Text = "Hubo un error en la transacción. Error: " + ex;
            }
        }

        public void EliminarTarea()
        {
            try
            {
                TareaLO tareaLO = new TareaLO();
                int idTarea = Convert.ToInt16(HfDeleteID.Value);
                string resultado = tareaLO.EliminarTarea(idTarea);

                if (resultado == "Registro eliminado correctamente")
                {
                    LimpiarCampos();
                    divMensajeSuccess.Visible = true;
                    lblMensajeSuccess.Text = resultado;
                }
                else
                {
                    divMensajeInfo.Visible = true;
                    lblMensajeInfo.Text = "Hubo un error en la transacción";

                }
            }
            catch (Exception ex)
            {
                divMensajeError.Visible = true;
                lblMensajeError.Text = "Hubo un error en la transacción. Error: " + ex;
            }
        }

        protected void dgvTareas_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Encuentra el índice de la columna "FechaFinalizacion"
                int fechaFinalizacionIndex = GetColumnIndexByName(e.Row, "FechaFinalizacion");

                if (fechaFinalizacionIndex != -1)
                {                    
                    string fechaValor = e.Row.Cells[fechaFinalizacionIndex].Text;

                    if (fechaValor == "01-01-1900")
                    {
                        e.Row.Cells[fechaFinalizacionIndex].Text = "-";
                    }
                }
            }
        }

        // Función para obtener el índice de una columna por nombre
        private int GetColumnIndexByName(GridViewRow row, string columnName)
        {
            for (int i = 0; i < row.Cells.Count; i++)
            {
                if (row.Cells[i].Text.ToLower().Trim() == columnName.ToLower().Trim())
                {                   
                    return i;
                }
            }
            return -1;
        }
        protected void dgvTareas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            lblMensajeInfo.Text = "";
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow gvrow = dgvTareas.Rows[index];

            if (e.CommandName.Equals("editRow"))
            {
                txtId_Edit.Text = HttpUtility.HtmlDecode(gvrow.Cells[2].Text).ToString();
                txtTitulo_Edit.Text = HttpUtility.HtmlDecode(gvrow.Cells[3].Text).ToString();
                txtDescripcion_Edit.Text = HttpUtility.HtmlDecode(gvrow.Cells[4].Text).ToString();
                ddlCompletadaEdit.SelectedValue = HttpUtility.HtmlDecode(gvrow.Cells[6].Text).ToString();
                string fechaX = HttpUtility.HtmlDecode(gvrow.Cells[7].Text).ToString();
                DateTime fechaY = Convert.ToDateTime(fechaX);
                txtFechaFinalizacion_Edit.Text = fechaY.ToString("yyyy-MM-dd");

                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#editModal').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditModalScript", sb.ToString(), false);
            }
            if (e.CommandName.Equals("deleteRow"))
            {
                HfDeleteID.Value = HttpUtility.HtmlDecode(gvrow.Cells[3].Text).ToString();

                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#deleteModal').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditModalScript", sb.ToString(), false);
            }

            if (e.CommandName.Equals("goToTaskRow"))
            {
                int idTarea = Convert.ToInt32(HttpUtility.HtmlDecode(gvrow.Cells[3].Text).ToString());
                SetIdTarea(idTarea);
                Response.Redirect("AgregarObjetivosSprint.aspx");
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#addModal').modal('show');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditModalScript", sb.ToString(), false);
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            CrearTarea();
            dgvTareas.DataBind();

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#addModal').modal('hide');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditModalScript", sb.ToString(), false);
        }

        protected void btnGuardarEdit_Click(object sender, EventArgs e)
        {
            ModificarTarea();
            dgvTareas.DataBind();

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#editModal').modal('hide');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditModalScript", sb.ToString(), false);
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            EliminarTarea();
            dgvTareas.DataBind();

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#deleteModal').modal('hide');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditModalScript", sb.ToString(), false);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            divMensajeInfo.Visible = false;
            divMensajeSuccess.Visible = false;
            divMensajeError.Visible = false;
        }
    }
}