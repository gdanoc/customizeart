using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CustomizeArt
{
    public partial class _32_Update_image : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            int id;
            var isNumber = int.TryParse(IdImagen.Text.Trim(), out id);
            if (isNumber)
            {
                int eliminado = metodos.EliminarRegistro(id);
                if (eliminado != 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "Swal.fire('Image deleted successfully', '', 'success');", true);
                    cargar_datos();
                    Texto.Text = String.Empty;
                    IdImagen.Text = String.Empty;
                    ImagePreview.ImageUrl = null;
                }
            }
            else
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "Swal.fire('Something went wrong', '', 'error');", true);
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            try
            {
                string strFileName;
                string strFilePath;
                string strFolder;
                string extension;
                strFileName = PhotoFile.PostedFile.FileName;
                strFileName = Path.GetFileName(strFileName);
                extension = Path.GetExtension(strFileName);
                strFolder = Server.MapPath("./images/");
                int id = Convert.ToInt32(IdImagen.Text);
                string texto = Texto.Text.Trim();

                if (extension == ".jpg" || extension == ".png")
                {
                    if (!Directory.Exists(strFolder))
                    {
                        Directory.CreateDirectory(strFolder);
                    }
                    if (PhotoFile.HasFile) //Verifica si se ha subido un archivo
                    {
                        // Obtener el nombre del archivo subido.
                        strFileName = PhotoFile.PostedFile.FileName;
                        strFileName = Path.GetFileName(strFileName);
                        string foto = strFileName;
                        // Guardando el archivo en el servidor
                        strFilePath = strFolder + strFileName;
                        if (!File.Exists(strFilePath)) //Si el archivo subido no existe, lo crea en el servidor
                        {
                            PhotoFile.PostedFile.SaveAs(strFilePath);
                        }
                        int guardado = metodos.ActualizarImagen(id, texto, foto);
                        if (guardado != 0)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "Swal.fire('Image updated successfully.', '', 'success');",
                            true);
                            cargar_datos();

                            cargar_registro(id);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "Swal.fire('Something went wrong', '', 'error');",
                            true);
                        }
                    }
                    else //En caso de que no se actualice la foto que posee el registro
                    {
                        string foto = String.Empty;
                        int guardado = metodos.ActualizarImagen(id, texto, foto);
                        if (guardado != 0)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "Swal.fire('Image updated successfully', '', 'success');",
                            true);
                            cargar_datos();
                            cargar_registro(id);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "Swal.fire('Something went wrong', '', 'error');",
                            true);
                        }
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "Swal.fire('Image format incorrect', 'The format must be jpg or png', 'error');", true);
                }
            }
            catch
            {
                alerta.Text = "<script>Swal.fire('OOPS', 'Don´t leave blank spaces', 'error');</script>";

            }

        }

        protected void btnSeleccionar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(IdImagen.Text))
            {
                // Mostrar una alerta al usuario usando SweetAlert
                alerta.Text = "<script>Swal.fire('OOPS', 'Don´t leave blank spaces', 'error');</script>";
            }
            else
            {
                int id = Convert.ToInt32(IdImagen.Text);
                cargar_registro(id);
            }
        }
        //Este método se encarga de mostrar los registros cuando se accede al formulario Editar Imagen.
        protected void cargar_datos()
        {
            DataTable myTable = metodos.ListarImagenes();
            ListaImagenes.DataSource = myTable;
            ListaImagenes.DataBind();
        }
        //Este método se encarga de mostrar los registro cuando se selecciona individualmente.
        protected void cargar_registro(int id)
        {
            try
            {
                string[] respuesta = metodos.SeleccionarRegistroImagen(id);
                if (respuesta[0] != null && respuesta[0] != String.Empty && respuesta[0] != "")
                {
                    ImagePreview.ImageUrl = "/images/" + respuesta[0];
                    Texto.Text = respuesta[1];
                }
                else
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "Swal.fire('Something went wrong', '', 'error');",
                    true);
            }
            catch (Exception exc)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "Swal.fire('Something went wrong', '', 'error');",
                true);
            }
        }

        protected void btonlogout_Click(object sender, EventArgs e)
        {
            string script = "Swal.fire('Logged Out', 'You logged Out', 'info').then(function() { window.location.href = '01_Login.aspx'; });";
            alerta.Text = $"<script>{script}</script>";
            Session.Clear();
        }
    }
}