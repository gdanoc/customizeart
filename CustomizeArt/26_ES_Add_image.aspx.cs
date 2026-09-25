using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CustomizeArt
{
    public partial class _26_ES_Add_image : System.Web.UI.Page
    {
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

        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            Response.Redirect("32_ES_Update_image.aspx");
        }

        protected void btonlogout_Click(object sender, EventArgs e)
        {
            Session.Remove("usermane");
            Response.Redirect("01_ES_Login.aspx");
        }

        protected void btnAgregar_click(object sender, EventArgs e)
        {
            string strFileName;
            string strFilePath;
            string strFolder;
            string extension;
            strFileName = PhotoFile.PostedFile.FileName;
            strFileName = Path.GetFileName(strFileName);
            extension = Path.GetExtension(strFileName);
            strFolder = Server.MapPath("./images/");
            // Retrieve the name of the file that is posted.
            if (extension == ".jpg" || extension == ".png")
            {
                if (PhotoFile.HasFile)
                {
                    strFileName = PhotoFile.PostedFile.FileName;
                    strFileName = Path.GetFileName(strFileName);


                    if (!Directory.Exists(strFolder))
                    {
                        Directory.CreateDirectory(strFolder);
                    }

                    // Save the uploaded file to the server.
                    strFilePath = strFolder + strFileName;
                    if (!File.Exists(strFilePath))
                    {
                        PhotoFile.PostedFile.SaveAs(strFilePath);
                    }

                    string texto = TextoImagen.Text.Trim();
                    string foto = strFileName;
                    int guardado = 0;
                    try
                    {
                        guardado = metodos.AgregarImagen(foto, texto);
                    }
                    catch (Exception exc)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "console.log('" + exc.Message + "');", true);
                    }

                    if (guardado != 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "Swal.fire('Imagen agregada exitosamente', '', 'success');", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "Swal.fire('Algo salió mal', '', 'error');", true);
                    }

                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "Swal.fire('Selecciona una imagen', 'No has seleccionado una imagen', 'error');", true);
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "Swal.fire('Formato de imagen incorrecto', 'El formato debe de ser jpg o png', 'error');", true);

            }
        }

        protected void Unnamed2_Click(object sender, EventArgs e)
        {
            string script = "Swal.fire('Sesión Cerrada', 'Cerraste Sesíón', 'info').then(function() { window.location.href = '01_ES_Login.aspx'; });";
            ScriptManager.RegisterStartupScript(this, GetType(), "logout", script, true);
            Session.Clear();
        }
    }
}