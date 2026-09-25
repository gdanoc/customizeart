using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CustomizeArt
{
    public partial class _01_ES_Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                bool logged_in = Convert.ToBoolean(Session["logged_in"]);
                bool isAdmin = Convert.ToBoolean(Session["isAdmin"]);
                if (logged_in)
                {
                    if (isAdmin)
                        Response.Redirect("21_ES_Crud.aspx");
                    Response.Redirect("Default_Spanish.aspx");
                }

            }
            catch (Exception ex)
            {
                Response.Redirect("Default_Spanish.aspx");
            }
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
        protected void LogIn_Click(object sender, EventArgs e)
        {
            alerta.Text = "";

            if (Txtpassword.Text != "" && TxtUsuario.Text != "")
            {
                string username = TxtUsuario.Text.Trim();
                string password = Txtpassword.Text.Trim();
                int isSeller = metodos.CheckSeller(username);

                int login = metodos.login(username, password);
                int isAdmin = metodos.Check_Admin(username);

                if (login != 1)
                {
                    Session["logged_in"] = true;
                    Session["username"] = username;
                    Session["userID"] = login;
                    Session["addedToCart"] = false;
                    metodos.SetCartId();
                    if (isSeller == 3)
                    {
                        string script = "Swal.fire('Bienvenido vendedor', '¡Accceso confirmado!', 'success').then(function() { window.location.href = '29_ES_Sellerview.aspx'; });";
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                        Session["isSeller"] = true;
                    }
                    if (isAdmin == 2)
                    {
                        string script = "Swal.fire('Bienvenido administrador', '¡Acceso confirmado!', 'success').then(function() { window.location.href = '21_ES_Crud.aspx'; });";
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                        Session["isAdmin"] = true;
                    }
                    else
                    {
                        Session["isAdmin"] = false;
                        string script = "Swal.fire('Bienvenido ', '¡Acceso confirmado!', 'success').then(function() { window.location.href = 'Default_Spanish.aspx'; });";
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                    }
                }
                else
                {
                    // Usuario o contraseña incorrectos
                    string script = "Swal.fire('Algo salió mal', 'Tu usuario o contraseña son incorrectos', 'error')";
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                }
            }
            else
            {
                // Campos en blanco
                string script = "Swal.fire('OOPS', 'No dejes espacios en blanco', 'error')";
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
            }
        }
        protected void SingUp_Click(object sender, EventArgs e)
        {
            bool policyAccepted = Convert.ToBoolean(Request.Form["policyAccepted"]);

            if (policyAccepted)
            {
                if (txtusuarioR.Text.Trim() != "" && txtclave.Text.Trim() != "" && txtconfirm.Text.Trim() != "" && txtfirst.Text.Trim() != "" && txtgmail.Text.Trim() != "" && txtapellido.Text.Trim() != "")
                {
                    if (txtclave.Text == txtconfirm.Text)
                    {
                        DateTime birthDate;
                        //DateTime.TryParse(txtfecha.Text, out birthDate);
                        if (DateTime.TryParse(txtfecha.Text, out birthDate))
                        {
                            int age = CalculateAge(birthDate);
                            if (age > 18)
                            {
                                string nombre;
                                string apellido;
                                string encriptada;
                                string usuario;
                                string correo;
                                int edadp;
                                string fecha;
                                string rol;
                                string telefono;

                                nombre = txtfirst.Text;
                                apellido = txtapellido.Text;
                                usuario = txtusuarioR.Text;
                                telefono = txtTelefono.Text;

                                encriptada = sha256_hash(txtclave.Text);
                                correo = txtgmail.Text;

                                fecha = txtfecha.Text;
                                rol = "1";

                                if (metodos.UsuariosRepetidos(usuario, encriptada, nombre, apellido, correo, fecha, rol, telefono) == 0 && metodos.CorreosRepetidos(usuario, encriptada, nombre, apellido, correo, fecha, rol, telefono) == 0)
                                {
                                    // Registro de usuario solo si no hay duplicados
                                    metodos.AgregarUsuario(nombre, apellido, usuario, encriptada, correo, fecha, rol, telefono);

                                    string script = "Swal.fire('¡Registrado exitosamente!', '¡Gracias por elegirnos!', 'success').then(function() { window.location.href = '01_ES_Login.aspx'; });";
                                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);

                                    // Limpiar campos
                                    txtfirst.Text = "";
                                    txtapellido.Text = "";
                                    txtusuarioR.Text = "";
                                    txtclave.Text = "";
                                    txtconfirm.Text = "";
                                    txtgmail.Text = "";
                                    txtTelefono.Text = "";

                                }
                                else
                                {
                                    string script = "Swal.fire('Este usuario ya existe', 'Elige otro usuario', 'error');";
                                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                                }
                            }
                            else
                            {
                                string script = "Swal.fire('Oops', 'Tienes que ser mayor de 18 años', 'error');";
                                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                            }
                        }
                        else
                        {
                            string script = "Swal.fire('Oops', 'Fecha de nacimiento inválida', 'error');";
                            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                        }
                    }
                    else
                    {
                        string script = "Swal.fire('Usuario o contraseña incorrectos', 'Repíte por favor', 'error');";
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                    }
                }
                else
                {
                    string script = "Swal.fire('No dejes espacios en blanco', 'Intenta de nuevo', 'error');";
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                }
            }
            else
            {
                string script = "Swal.fire('OOPS', 'Necesitas aceptar los términos y condiciones', 'error')";
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
            }
        }
        
        private int CalculateAge(DateTime birthDate)
        {
            DateTime today = DateTime.Today;
            int age = today.Year - birthDate.Year;
            if (birthDate.Date > today.AddYears(-age)) age--;
            return age;
        }

        protected void LogOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("01_ES_Login.aspx");
        }
    }
}