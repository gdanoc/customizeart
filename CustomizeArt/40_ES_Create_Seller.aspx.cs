using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CustomizeArt
{
    public partial class _40_ES_Create_Seller : System.Web.UI.Page
    {
        MySqlConnection conec = new MySqlConnection("server=127.0.0.1; database=customizeart; Uid=root; pwd=TU_PASSWORD_DE_BASE_DE_DATOS;");
        protected void Page_Load(object sender, EventArgs e)
        {
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
                                string script = "Swal.fire('Registrado exitosamente!', 'Gracias por escogernos', 'success').then(function() { window.location.href = '01_ES_Login.aspx'; });";
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
                                string script = "Swal.fire('Este email ya existe', 'Escoje otro email', 'error');";
                                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                            }
                        }
                        else
                        {
                            string script = "Swal.fire('Este usuario ya existe', 'Elije otro usuario', 'error');";
                            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                        }
                    }
                    else
                    {
                        string script = "Swal.fire('Contraseña incorrecta', 'Repítela por favor', 'error');";
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                    }
                }
                else
                {
                    string script = "Swal.fire('No deje espacios en blanco', 'Inténtelo de nuevo', 'error');";
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                }
            }
            else
            {
                string script = "Swal.fire('OOPS', 'Necesitas aceptar la políyica de privacidad', 'error')";
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
            }
        }

        protected void btonlogout_Click(object sender, EventArgs e)
        {
            string script = "Swal.fire('Cerrar Sesión', 'Cerraste Sesión', 'info').then(function() { window.location.href = '01_ES_Login.aspx'; });";
            ScriptManager.RegisterStartupScript(this, GetType(), "logout", script, true);
            Session.Clear();
        }
    }
}