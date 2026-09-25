using MySql.Data.MySqlClient;
using PayPal.Api;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CustomizeArt
{
    public partial class _39_ES_Sales_register : System.Web.UI.Page
    {
        private string connectionString = "Server=127.0.0.1;Database=customizeart;Uid=root;Pwd=Info2024/*-;";
        public static MySqlConnection conexion0 = new MySqlConnection("Server= 127.0.0.1; database=customizeart; Uid=root; pwd=TU_PASSWORD_DE_BASE_DE_DATOS;");
        private int userId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    if (HttpContext.Current.Session["userID"] == null)
                    {
                        string script = "Swal.fire('¡Inicia Sesión!', 'Necesitas iniciar sesion para ver el carrito', 'info').then(function() { window.location.href = '01_ES_Login.aspx'; });";
                        ScriptManager.RegisterStartupScript(this, GetType(), "logout", script, true);
                        Session.Clear();
                        return;
                    }
                }
                catch (Exception ex)
                {
                    // Log exception if necessary
                    Response.Redirect("01_ES_Login.aspx");
                    return;
                }

                if (int.TryParse(HttpContext.Current.Session["userID"]?.ToString(), out userId))
                {
                    Load_Sales();

                }
                else
                {
                    // Handle case where userID is not valid
                    Response.Redirect("01_ES_Login.aspx");
                }
            }

        }
        protected void Load_Sales()
        {
            int userId = Convert.ToInt32(Session["userID"]);
            DataTable myTable = metodos.Get_Sales2(userId); // Asegúrate de que 'metodos' sea la clase correcta
            Sale.DataSource = myTable;
            Sale.DataBind();
        }
        protected void Sale_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string status = e.Row.Cells[5].Text; // Asumiendo que la columna Status es la 5ª columna
                switch (status)
                {
                    case "Waiting":
                        e.Row.Cells[5].BackColor = System.Drawing.Color.FromArgb(240, 242, 123);
                        break;
                    case "Ready for pickup":
                        e.Row.Cells[5].BackColor = System.Drawing.Color.FromArgb(130, 208, 223);
                        break;
                    case "Arrived":
                        e.Row.Cells[5].BackColor = System.Drawing.Color.FromArgb(196, 240, 189);
                        break;
                    default:
                        e.Row.Cells[5].BackColor = System.Drawing.Color.White;
                        break;
                }
            }
        }

        protected void Sale_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
