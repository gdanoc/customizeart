using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CustomizeArt
{
    public partial class _11_ES_Token : System.Web.UI.Page
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
                    alerta.Text = "<script>Swal.fire('Código de verificación correcto!', '', 'success') </script>";
                    Response.AddHeader("REFRESH", "3;URL=12_ES_ChangePassword.aspx"); //Nos redirecciona al formulario para actualizar contraseñas
                    txtToken.Text = "";
                }
                else
                {
                    alerta.Text = "<script>Swal.fire('Código incorrecto!', 'El código no es similar, por favor revise el correo de nuevo', 'error') </script>";
                    txtToken.Text = "";
                }
            }
            else
            {
                alerta.Text = "<script>Swal.fire('OOPS!', 'No dejes espacios en blanco', 'warning') </script>";
                txtToken.Text = "";
            }
        }

        protected void btonCart_Click(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session["userID"] == null)
            {
                string script = "Swal.fire('Inicia sesión!', 'Necesitas tener una sesión iniciada para ver el carrito de compras', 'info').then(function() { window.location.href = '01_ES_Login.aspx'; });";
                ScriptManager.RegisterStartupScript(this, GetType(), "logout", script, true);
                Session.Clear();
            }
            else
            {
                Response.Redirect("07_ES_Shoppingcart.aspx");
            }
        }
    }
}