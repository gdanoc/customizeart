using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CustomizeArt
{
    public partial class _10_ES_forgotpassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            if (txtcuenta.Text != "")
            {
                try
                {
                    string userforgot = txtcuenta.Text;
                    ValorGlobalOlvidoContra.valorGlobal = userforgot;
                    // Genera un número aleatorio de 6 dígitos
                    Random rand = new Random();
                    string randomCode = rand.Next(999999).ToString();
                    string eventorandom = randomCode + "reset_randomcode";

                    // Conexión para la inserción del token en la base de datos
                    MySqlConnection conexion2 = new MySqlConnection("server=127.0.0.1; database=customizeart; Uid=root; pwd=TU_PASSWORD_DE_BASE_DE_DATOS;");
                    conexion2.Open();

                    MySqlCommand comando = new MySqlCommand(String.Format("UPDATE usuarios SET Token = '{0}' WHERE Nombre_Usuario = '{1}'", randomCode, txtcuenta.Text), conexion2);
                    MySqlCommand evento = new MySqlCommand("CREATE EVENT eventonombre ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 2 MINUTE DO UPDATE usuarios SET Token = NULL", conexion2);
                    comando.ExecuteNonQuery();
                    evento.ExecuteNonQuery();
                    conexion2.Close();



                    string user = txtcuenta.Text;
                    MySqlConnection conexion = new MySqlConnection("Server=127.0.0.1; database=customizeart; Uid=root; pwd=TU_PASSWORD_DE_BASE_DE_DATOS;");
                    var cmd = "Select Password from usuarios where Nombre_Usuario ='" + user + "';";
                    var cmd1 = "Select Correo from usuarios where Nombre_Usuario ='" + user + "';";
                    var cmd2 = "Select Nombre from usuarios where Nombre_Usuario ='" + user + "';";


                    MySqlCommand obtenerContra = new MySqlCommand(cmd, conexion);
                    obtenerContra.Parameters.Add("@Name", MySqlDbType.VarChar);
                    MySqlCommand obtenerCorreo = new MySqlCommand(cmd1, conexion);
                    obtenerCorreo.Parameters.Add("@Name", MySqlDbType.VarChar);
                    MySqlCommand obtenerNombre = new MySqlCommand(cmd2, conexion);


                    string mail;
                    string contra;
                    string nombrecliente;
                    string contraDesencriptada;
                    conexion.Open();
                    mail = (string)obtenerCorreo.ExecuteScalar();
                    contra = (string)obtenerContra.ExecuteScalar();
                    nombrecliente = (string)obtenerNombre.ExecuteScalar();
                    //contraDesencriptada = DecryptString(contra, initVector);

                    string correo = mail;// cambiar por correo del usuario que realiza la compra
                    string nombre = "CustomizeArt";

                    var fromAddress = new MailAddress("ythmarro@gmail.com", "CustomizeArt");
                    const string fromPassword = "TU_APP_PASSWORD_DE_GMAIL"; //TU_APP_PASSWORD_DE_GMAIL
                    var toAddress = new MailAddress(correo, nombre);//Dirección de correo y nombre que se muestra				
                    const string subject = "Recuperar contraseña";//Asunto del correo
                    string body = "Estimado " + nombrecliente + ", gracias por preferirnos y confiar en nosotros. Es un placer para nosotros que sea nuestro cliente, y no queremos que sufra inconvenientes. En el presente correo le enviamos la contraseña que solicitó. Muchas gracias por ser nuestro cliente. Token: " + randomCode + "";
                    //Fin de datos del envío


                    var smtp = new SmtpClient
                    {
                        Host = "smtp.gmail.com",
                        Port = 587,
                        EnableSsl = true,
                        DeliveryMethod = SmtpDeliveryMethod.Network,
                        UseDefaultCredentials = false,
                        Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
                    };
                    using (var message = new MailMessage(fromAddress, toAddress)
                    {
                        Subject = subject,
                        Body = body
                    })
                    {
                        smtp.Send(message);//Enviar el correo
                    }
                    alerta.Text = "<script>Swal.fire('Correo enviado satisfactoriamente', 'Contraseña recuperada', 'success');</script>";
                    Response.AddHeader("REFRESH", "3;URL=11_ES_Token.aspx");
                }
                catch
                {
                    alerta.Text = "<script>Swal.fire('Algo salió mal', 'Revisa tu usuario', 'error');</script>";
                }
            }
            else
            {
                alerta.Text = "<script>Swal.fire('Error', 'No dejes espacios en blanco', 'error');</script>";
            }
        }

        protected void btonCart_Click(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session["userID"] == null)
            {
                string script = "Swal.fire('¡Inicia sesión!', 'Necesitas tener una sesión abierta para ver el carrito de compras!', 'info').then(function() { window.location.href = '01_ES_Login.aspx'; });";
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