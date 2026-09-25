using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CustomizeArt
{
    public partial class _13_ES_Account : System.Web.UI.Page
    {
        private string connectionString = "Server=127.0.0.1;Database=customizeart;Uid=root;Pwd=Info2024/*-;";
        private int userId;

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack) // Verifica si es la primera vez que se carga la página
            //{
            try
            {
                if (HttpContext.Current.Session["userId"] == null)
                {
                    string script = "Swal.fire('¡Inicia sesión!', 'Necesitas tener una sesión iniciada para ver los datos', 'info').then(function() { window.location.href = '01_ES_Login.aspx'; });";
                    ScriptManager.RegisterStartupScript(this, GetType(), "logout", script, true);
                    Session.Clear();
                }
                else
                {
                    if (int.TryParse(HttpContext.Current.Session["userId"].ToString(), out userId))
                    {
                        LoadUser_DataES(userId);
                    }
                    else
                    {
                        string script = "Swal.fire('Error', 'ID de usuario inválido', 'error')";
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                    }
                }
            }
            catch (Exception ex)
            {
                string script = "Swal.fire('Algo salió mal', 'Ocurrió un error', 'error')";
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
            }
            //}
        }
        private void LoadUser_DataES(int userId)
        {
            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT Nombre, Apellido, Nombre_Usuario, Password, Correo, fecha, Telefono FROM usuarios WHERE Id_Usuario = @Id_Usuario";
                MySqlCommand command = new MySqlCommand(query, connection);
                command.Parameters.AddWithValue("@Id_Usuario", Session["userId"]);

                using (MySqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        txtfirst.Text = reader["Nombre"].ToString();
                        txtapellido.Text = reader["Apellido"].ToString();
                        txtusuario.Text = reader["Nombre_Usuario"].ToString();
                        txtclave.Text = reader["Password"].ToString();
                        txtgmail.Text = reader["Correo"].ToString();
                        txtfecha.Text = reader["fecha"].ToString();
                        txtTelefono.Text = reader["Telefono"].ToString();
                    }
                }
            }
        }



        protected void btonLogOut_Click(object sender, EventArgs e)
        {
            string script = "Swal.fire('Sesión Cerrada', 'Cerraste Sesión', 'info').then(function() { window.location.href = 'Default_Spanish.aspx'; });";
            alerta.Text = $"<script>{script}</script>";
            Session.Clear();
        }

        protected void btonSales_Click(object sender, EventArgs e)
        {
            Response.Redirect("39_ES_Sales_register.aspx");
        }
    }
}