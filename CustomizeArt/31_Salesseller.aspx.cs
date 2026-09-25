using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CustomizeArt
{
    public partial class _31_Salesseller : System.Web.UI.Page
    {
        public static MySqlConnection conexion0 = new MySqlConnection("Server= 127.0.0.1; database=customizeart; Uid=root; pwd=TU_PASSWORD_DE_BASE_DE_DATOS;");
        private int userId;
        protected void Page_Load(object sender, EventArgs e)
        {
            Load_Sales();
        }
        protected void Load_Sales()
        {
            if (int.TryParse(HttpContext.Current.Session["userID"]?.ToString(), out userId))
            {
                DataTable myTable = metodos.Get_SalesCustomize(userId);

                Sale.DataSource = myTable;
                Sale.DataBind();
            }
        }
        protected void Sale_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Table buttonTable = new Table();
                buttonTable.Width = Unit.Percentage(100);

                TableRow buttonRow1 = new TableRow();
                TableCell buttonCell1 = new TableCell();
                LinkButton btnWaiting = new LinkButton();
                btnWaiting.Text = "Waiting";
                btnWaiting.CssClass = "btn btn-primary btn-sm vertical-button solid-button-yellow";
                btnWaiting.CommandArgument = e.Row.Cells[0].Text;
                btnWaiting.Click += new EventHandler(btnWaiting_Click);
                buttonCell1.Controls.Add(btnWaiting);
                buttonCell1.Style.Add("padding", "5px");
                buttonRow1.Cells.Add(buttonCell1);
                buttonTable.Rows.Add(buttonRow1);

                TableRow buttonRow2 = new TableRow();
                TableCell buttonCell2 = new TableCell();
                LinkButton btnReady = new LinkButton();
                btnReady.Text = "Ready for pickup";
                btnReady.CssClass = "btn btn-success btn-sm vertical-button solid-button-blue";
                btnReady.CommandArgument = e.Row.Cells[0].Text;
                btnReady.Click += new EventHandler(btnReady_Click);
                buttonCell2.Controls.Add(btnReady);
                buttonCell2.Style.Add("padding", "5px");
                buttonRow2.Cells.Add(buttonCell2);
                buttonTable.Rows.Add(buttonRow2);

                TableRow buttonRow3 = new TableRow();
                TableCell buttonCell3 = new TableCell();
                LinkButton btnArrived = new LinkButton();
                btnArrived.Text = "Arrived";
                btnArrived.CssClass = "btn btn-info btn-sm vertical-button solid-button-green";
                btnArrived.CommandArgument = e.Row.Cells[0].Text;
                btnArrived.Click += new EventHandler(btnArrived_Click);
                buttonCell3.Controls.Add(btnArrived);
                buttonCell3.Style.Add("padding", "5px");
                buttonRow3.Cells.Add(buttonCell3);
                buttonTable.Rows.Add(buttonRow3);

                e.Row.Cells.Add(new TableCell { Controls = { buttonTable } });
            }
        }
        protected void btnWaiting_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int saleId;
            if (int.TryParse(btn.CommandArgument, out saleId))
            {
                int Result = UpdateSaleStatus(saleId, "Waiting");
                if (Result != 0)
                {
                    // Si se cambió correctamente, mostrar alerta de éxito
                    string script = "Swal.fire('Success', 'Sale status updated successfully', 'success').then(function() { window.location.href = '31_Salesseller.aspx'; });";
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                }
                else
                {
                    // Si no se cambió, mostrar alerta de error
                    string script = "Swal.fire('Error', 'Failed to update sale status', 'error').then(function() { window.location.href = '31_Salesseller.aspx'; });";
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                }
            }
            else
            {
                string script = "Swal.fire('Error', 'Failed to use arg', 'error').then(function() { window.location.href = '31_Salesseller.aspx'; });";
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
            }
        }

        protected void btnReady_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int saleId;
            if (int.TryParse(btn.CommandArgument, out saleId))
            {
                int Result = UpdateSaleStatus(saleId, "Ready for pickup");
                if (Result != 0)
                {
                    // Si se cambió correctamente, mostrar alerta de éxito
                    string script = "Swal.fire('Success', 'Sale status updated successfully', 'success').then(function() { window.location.href = '31_Salesseller.aspx'; });";
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                }
                else
                {
                    // Si no se cambió, mostrar alerta de error
                    string script = "Swal.fire('Error', 'Failed to update sale status', 'error').then(function() { window.location.href = '31_Salesseller.aspx'; });";
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                }
            }
            else
            {
                string script = "Swal.fire('Error', 'Failed to use arg', 'error').then(function() { window.location.href = '31_Salesseller.aspx'; });";
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
            }

        }
        protected void btnArrived_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int saleId;
            if (int.TryParse(btn.CommandArgument, out saleId))
            {
                int Result = UpdateSaleStatus(saleId, "Arrived");
                if (Result != 0)
                {
                    // Si se cambió correctamente, mostrar alerta de éxito
                    string script = "Swal.fire('Success', 'Sale status updated successfully', 'success').then(function() { window.location.href = '31_Salesseller.aspx'; });";
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                }
                else
                {
                    // Si no se cambió, mostrar alerta de error
                    string script = "Swal.fire('Error', 'Failed to update sale status', 'error').then(function() { window.location.href = '31_Salesseller.aspx'; });";
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                }
            }
            else
            {
                string script = "Swal.fire('Error', 'Failed to use arg', 'error').then(function() { window.location.href = '31_Salesseller.aspx'; });";
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
            }
        }
        private int UpdateSaleStatus(int saleId, string status)
        {
            conexion0.Open();
            int retorno = 0;
            string query = "UPDATE sales_details SET ";
            query += "Status = @status ";
            query += "WHERE Id = @id;";

            MySqlCommand cmd = new MySqlCommand(query, conexion0);
            cmd.Parameters.AddWithValue("@status", status);
            cmd.Parameters.AddWithValue("@id", saleId);

            retorno = cmd.ExecuteNonQuery() == 1 ? 1 : 0;

            conexion0.Close();
            return retorno;
        }
        protected void btonlogout_Click(object sender, EventArgs e)
        {
            string script = "Swal.fire('Logged Out', 'You logged out', 'info').then(function() { window.location.href = '01_Login.aspx'; });";
            ScriptManager.RegisterStartupScript(this, GetType(), "logout", script, true);
            Session.Clear();
        }
    }
}