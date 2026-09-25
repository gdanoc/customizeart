using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CustomizeArt
{
    public partial class _34_ES_Token_Compra : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Purchase_Click(object sender, EventArgs e)
        {
            if (txttoken.Text.Trim() != "")
            {
                string tokenusu = txttoken.Text; // Valor del TextBox
                MySqlConnection connection = conexion.ObtenerConexion();
                var cmd = "SELECT Id_Usuario FROM usuarios WHERE Token_Compra=@tokenCompra;"; // Usar parámetros para evitar inyecciones SQL
                MySqlCommand comando = new MySqlCommand(cmd, connection);
                comando.Parameters.AddWithValue("@tokenCompra", tokenusu);

                int retorno = 0;
                try
                {
                    object result = comando.ExecuteScalar();
                    if (result != null && int.TryParse(result.ToString(), out retorno) && retorno != 0)
                    {
                        int checkedOut = metodos.Check_Out(retorno);
                        if (checkedOut != 0)
                        {
                            string script = "Swal.fire('OK', '¡Tu compra fue hecha!', 'success').then(function() { window.location.href = '03_ES_Clothes.aspx'; });";
                            alerta.Text = $"<script>{script}</script>";
                        }
                        else
                        {
                            string script = "Swal.fire('Oops', 'Algo salió mal con tu compra', 'error').then(function() { window.location.href = '03_ES_Clothes.aspx'; });";
                            alerta.Text = $"<script>{script}</script>";
                        }
                    }
                    else
                    {
                        alerta.Text = "<script>Swal.fire('¡Token incorrecto!', 'El token no coincide, revisa tu email', 'error') </script>";
                        txttoken.Text = "";
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Error: {ex.Message}");
                    alerta.Text = "<script>Swal.fire('Oops', 'Un error ocurrió mientras se procesaban los datos', 'error') </script>";
                }
            }
            else
            {
                alerta.Text = "<script>Swal.fire('OOPS!', 'No dejes espacios en blanco', 'warning') </script>";
                txttoken.Text = "";
            }
        }
    }
}
