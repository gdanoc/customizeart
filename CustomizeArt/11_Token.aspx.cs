using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CustomizeArt
{
    public partial class _11_Token : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            if (txtToken.Text.Trim() != "")
            {
                string tokenusu = txtToken.Text; //Valor del TextBox
                MySqlConnection connection = conexion.ObtenerConexion();
                var cmd = "SELECT Id_Usuario from usuarios WHERE Token='" + tokenusu + "';"; //Comparando el Token asignado al usuario
                MySqlCommand comando = new MySqlCommand(cmd, connection);
                //conexion.Open();
                int retorno = Convert.ToInt32(comando.ExecuteScalar());
                if (retorno != 0)
                {
                    alerta.Text = "<script>Swal.fire('Verification code correct!', '', 'success') </script>";
                    Response.AddHeader("REFRESH", "3;URL=12_ChangePassword.aspx"); //Nos redirecciona al formulario para actualizar contraseñas
                    txtToken.Text = "";
                }
                else
                {
                    alerta.Text = "<script>Swal.fire('Incorrect Code!', 'The code does not match, please check the email again', 'error') </script>";
                    txtToken.Text = "";
                }
            }
            else
            {
                alerta.Text = "<script>Swal.fire('OOPS!', 'Do not leave empty spaces', 'warning') </script>";
                txtToken.Text = "";
            }
        }

        protected void btonCart_Click(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session["userID"] == null)
            {
                string script = "Swal.fire('Log In!', 'You need to be logged in to watch the shopping cart', 'info').then(function() { window.location.href = '01_Login.aspx'; });";
                ScriptManager.RegisterStartupScript(this, GetType(), "logout", script, true);
                Session.Clear();
            }
            else
            {
                Response.Redirect("07_ShoppingCart.aspx");
            }
        }
    }
}