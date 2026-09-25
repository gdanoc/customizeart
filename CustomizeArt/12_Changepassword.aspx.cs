using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CustomizeArt
{
    public partial class _12_Changepassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public static String sha256_hash(String value)
        {
            StringBuilder Sb = new StringBuilder();

            using (SHA256 hash = SHA256Managed.Create())
            {
                Encoding enc = Encoding.UTF8;
                Byte[] result = hash.ComputeHash(enc.GetBytes(value));

                foreach (Byte b in result)
                    Sb.Append(b.ToString("x2"));
            }

            return Sb.ToString();
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            if (txtpassword1.Text.Trim() != "" && txtpassword2.Text.Trim() != "")
            {
                if (txtpassword2.Text == txtpassword1.Text)
                {
                    string userforgot;
                    string contraEsencriptada;
                    userforgot = ValorGlobalOlvidoContra.valorGlobal;
                    MySqlConnection conexion = new MySqlConnection("server=127.0.0.1; database=customizeart; Uid=root; pwd=TU_PASSWORD_DE_BASE_DE_DATOS;");
                    string query = "UPDATE usuarios SET Password = @Password WHERE Nombre_Usuario = @nombre_usuario";
                    conexion.Open();
                    contraEsencriptada = sha256_hash(txtpassword2.Text);
                    MySqlCommand comando = new MySqlCommand(query, conexion);
                    comando.Parameters.AddWithValue("@Nombre_Usuario", userforgot);
                    comando.Parameters.AddWithValue("@Password", contraEsencriptada);
                    comando.ExecuteNonQuery();
                    conexion.Close();
                    alerta.Text = "<script>Swal.fire('Password successfully updated!', '', 'success'); </script>";
                    Response.AddHeader("REFRESH", "3;URL=01_Login.aspx");
                    txtpassword1.Text = "";
                    txtpassword2.Text = "";
                }
                else
                {
                    alerta.Text = "<script>Swal.fire('Different passwords!', 'Passwords do not match', 'error'); </script>";
                    txtpassword1.Text = "";
                    txtpassword2.Text = "";
                }
            }
            else
            {
                alerta.Text = "<script>Swal.fire('OOPS!', 'Do not leave empty spaces', 'warning') </script>";
                txtpassword1.Text = "";
                txtpassword2.Text = "";
            }

        }
    }
}