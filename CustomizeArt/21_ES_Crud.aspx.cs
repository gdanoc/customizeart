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
    public partial class _21_ES_Crud : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarUsuarios();
            }
            try
            {
                bool logged_in = Convert.ToBoolean(Session["logged_in"]);
                bool isAdmin = Convert.ToBoolean(Session["isAdmin"]);

                if (!isAdmin)
                    Response.Redirect("Default_Spanish.aspx");

            }
            catch (Exception ex)
            {
                Response.Redirect("01_ES_Login.aspx");
            }


        }
        private void CargarUsuarios()
        {
            string connectionString = "server=127.0.0.1; database=customizeart; Uid=root; pwd=TU_PASSWORD_DE_BASE_DE_DATOS;";
            using (MySqlConnection conec = new MySqlConnection(connectionString))
            {
                try
                {
                    conec.Open();
                    string query = "SELECT Nombre, Apellido, Nombre_Usuario, Correo, fecha, telefono, CASE WHEN ID_ROL = 2 THEN 'Admin' WHEN ID_ROL = 1 THEN 'Customer' END AS rol, Token, Token_Compra FROM usuarios";
                    MySqlCommand cmd = new MySqlCommand(query, conec);
                    MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    GridViewUsuarios.DataSource = dt;
                    GridViewUsuarios.DataBind();
                }
                catch (Exception ex)
                {
                    // Manejo de errores
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
            }
        }
        public static int Get_Total_Sales()
        {
            int totalSales = 0;
            string connectionString = "server=127.0.0.1; database=customizeart; Uid=root; pwd=TU_PASSWORD_DE_BASE_DE_DATOS;";

            using (MySqlConnection conexion0 = new MySqlConnection(connectionString))
            {
                try
                {
                    conexion0.Open();
                    MySqlCommand cmd = new MySqlCommand("SELECT COUNT(*) FROM sales", conexion0);
                    totalSales = Convert.ToInt32(cmd.ExecuteScalar());
                }
                catch (Exception ex)
                {
                    // Manejo de errores
                    Console.WriteLine("Error: " + ex.Message);
                }
                finally
                {
                    conexion0.Close();
                }
            }

            return totalSales;
        }
        public static int Get_Total_Users()
        {
            int totalUsers = 0;
            string connectionString = "server=127.0.0.1; database=customizeart; Uid=root; pwd=TU_PASSWORD_DE_BASE_DE_DATOS;";

            using (MySqlConnection conexion0 = new MySqlConnection(connectionString))
            {
                try
                {
                    conexion0.Open();
                    MySqlCommand cmd = new MySqlCommand("SELECT COUNT(*) FROM usuarios", conexion0);
                    totalUsers = Convert.ToInt32(cmd.ExecuteScalar());
                }
                catch (Exception ex)
                {
                    // Manejo de errores
                    Console.WriteLine("Error: " + ex.Message);
                }
                finally
                {
                    conexion0.Close();
                }
            }

            return totalUsers;
        }
        public static int Get_Total_Products()
        {
            int totalProducts = 0;
            string connectionString = "server=127.0.0.1; database=customizeart; Uid=root; pwd=TU_PASSWORD_DE_BASE_DE_DATOS;";

            using (MySqlConnection conexion0 = new MySqlConnection(connectionString))
            {
                try
                {
                    conexion0.Open();
                    MySqlCommand cmd = new MySqlCommand("SELECT COUNT(*) FROM products", conexion0);
                    totalProducts = Convert.ToInt32(cmd.ExecuteScalar());
                }
                catch (Exception ex)
                {
                    // Manejo de errores
                    Console.WriteLine("Error: " + ex.Message);
                }
                finally
                {
                    conexion0.Close();
                }
            }

            return totalProducts;
        }


        protected void btonlogout_Click(object sender, EventArgs e)
        {
            string script = "Swal.fire('Sesión Cerrada', 'Cerraste Sesión', 'info').then(function() { window.location.href = '01_ES_Login.aspx'; });";
            alerta.Text = $"<script>{script}</script>";
            Session.Clear();
        }
    }
}