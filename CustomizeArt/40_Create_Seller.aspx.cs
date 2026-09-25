using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics.Contracts;
using System.Linq;
using System.Security.Cryptography;
using System.Security.Policy;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CustomizeArt
{
    public partial class _40_Create_Seller : System.Web.UI.Page
    {
        MySqlConnection conec = new MySqlConnection("server=127.0.0.1; database=customizeart; Uid=root; pwd=TU_PASSWORD_DE_BASE_DE_DATOS;");
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                bool logged_in = Convert.ToBoolean(Session["logged_in"]);
                bool isAdmin = Convert.ToBoolean(Session["isAdmin"]);

                if (!isAdmin)
                    Response.Redirect("Default.aspx");

            }
            catch (Exception ex)
            {
                Response.Redirect("01_login.aspx");
            }

            conec.Open();
            MySqlCommand cmd = conec.CreateCommand();
            cmd.CommandText = "select * from products";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            da.Fill(dt);
            //gvdlist.DataSource = dt;
            //gvdlist.DataBind();
            conec.Close();
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
        protected void SingUpS_Click(object sender, EventArgs e)
        {
            bool policyAccepted = Convert.ToBoolean(Request.Form["policyAccepted"]);

            if (policyAccepted)
            {
                if (TxtUsuario.Text.Trim() != "" && txtclave.Text.Trim() != "" && txtconfirm.Text.Trim() != "" && txtstore.Text.Trim() != "" && txtgmail.Text.Trim() != "" && txtdescription.Text.Trim() != "")
                {
                    if (txtclave.Text == txtconfirm.Text)
                    {
                        string nombre;
                        string encriptada;
                        string usuario;
                        string descripcion;
                        string tienda;
                        string correo;
                        int edadp;
                        string rol;
                        string telefono;
                       

                        nombre = TxtUsuario.Text;

                        telefono = txtTelefono.Text;
                        tienda = txtstore.Text;

                        encriptada = sha256_hash(txtclave.Text);
                        descripcion = txtdescription.Text;
                        correo = txtgmail.Text;
                       
                        rol = "3";

                        if (metodos.SellerRepetidos(nombre, encriptada, tienda, descripcion, correo, telefono, rol) == 0)
                        {
                            if (metodos.CorreosRepetidosS(nombre, encriptada, tienda, descripcion, correo, telefono, rol) == 0)
                            {
                                string script = "Swal.fire('Successfully registered!', 'Thanks for choosing us!', 'success').then(function() { window.location.href = '01_Login.aspx'; });";
                                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);

                                TxtUsuario.Text = "";
                                txtclave.Text = "";
                                txtstore.Text = "";
                                txtdescription.Text = "";
                                txtconfirm.Text = "";
                                txtgmail.Text = "";
                                txtTelefono.Text = "";
                                
                            }
                            else
                            {
                                string script = "Swal.fire('This email already exists', 'Choose another email', 'error');";
                                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                            }
                        }
                        else
                        {
                            string script = "Swal.fire('This user already exists', 'Choose another user', 'error');";
                            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                        }
                    }
                    else
                    {
                        string script = "Swal.fire('Incorrect password', 'Repeat Please', 'error');";
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                    }
                }
                else
                {
                    string script = "Swal.fire('Do not leave blank spaces', 'Try again', 'error');";
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                }
            }
            else
            {
                string script = "Swal.fire('OOPS', 'You need accept the privacy policy', 'error')";
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
            }
        }
        protected void txtclave_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btonlogout_Click(object sender, EventArgs e)
        {
            string script = "Swal.fire('Log Out', 'You logged out', 'info').then(function() { window.location.href = '01_Login.aspx'; });";
            ScriptManager.RegisterStartupScript(this, GetType(), "logout", script, true);
            Session.Clear();
        }
    }
}