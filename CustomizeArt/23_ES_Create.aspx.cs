using MySql.Data.MySqlClient;
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
    public partial class _23_ES_Create : System.Web.UI.Page
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
        protected void Fetch_product(int id)
        {
            try
            {
                Add respuesta = metodos.Search_Product(id);
                if (respuesta.Id != 0)
                {
                    alerta.Text = "<script>Swal.fire('Producto seleccionado exitosamente', '', 'success'); </script>";
                    ImagePreview.ImageUrl = "/images/" + respuesta.Image;
                    txtproduct.Text = respuesta.Product;
                    txtprice.Text = respuesta.Price.ToString();
                    txtquantity.Text = respuesta.Quantity.ToString();
                    txtdate.Text = respuesta.Date.ToString();
                    txtDescription.Text = respuesta.Description.ToString();
                    txtcategory.Text = respuesta.Category.ToString();
                    Load_Products();
                    Fetch_product(id);
                }
                else
                    alerta.Text = "<script>Swal.fire('Algo salió mal', 'Verifique el ID', 'error') </script>";

            }
            catch (Exception exc)
            {
                alerta.Text = "<script>Swal.fire('Algo salió mal', 'Verifique el ID', 'error') </script>";
            }
        }
        protected void Load_Products()
        {
            DataTable myTable = metodos.Fetch_Products(true);
            ProductsList.DataSource = myTable;
            ProductsList.DataBind();
        }
        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            string strFileName;
            string strFilePath;
            string strFolder;
            string extension;
            strFileName = PhotoFile.PostedFile.FileName;
            strFileName = Path.GetFileName(strFileName);
            extension = Path.GetExtension(strFileName);
            strFolder = Server.MapPath("./images/");


            if (extension == ".jpg" || extension == ".png")
            {

                if (PhotoFile.HasFile)
                {
                    if (txtproduct.Text.Trim() != "" && txtquantity.Text.Trim() != "" && txtquantity.Text.Trim() != "" && txtprice.Text.Trim() != "" && txtdate.Text.Trim() != "" && txtDescription.Text.Trim() != "" && txtcategory.Text.Trim() != "")
                    {
                        double.TryParse(txtprice.Text, out double price);
                        if (price > 10000)
                        {
                            string script = "Swal.fire('Precio muy alto', 'El precio no puede ser mayor a $10000', 'warning');";
                            ScriptManager.RegisterStartupScript(this, GetType(), "warning", script, true);
                            return;
                        }
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
                        string product = txtproduct.Text;
                        string qty = txtquantity.Text;
                        string date = txtdate.Text;
                        string description = txtDescription.Text;
                        string category = txtcategory.Text;
                        string image = strFileName;

                        int guardado = metodos.AgregarProductos(product, qty, price.ToString(), date, description, category, image);

                        if (guardado != 0)
                        {
                            alerta.Text = "<script>Swal.fire('Producto agregado exitosamente', 'Gracias por escogernos', 'success'); </script>";
                            Load_Products();

                        }
                        else
                        {
                            alerta.Text = "<script>Swal.fire('SAlgo salió mal', 'Inténtalo otra vez', 'error') </script>";
                        }
                    }
                    else
                    {
                        alerta.Text = "<script>Swal.fire('OOPS', 'No deje espacios en blanco', 'error') </script>";
                    }
                }
                else
                {
                    alerta.Text = "<script>Swal.fire('OOPS', 'Elige una imagen', 'error') </script>";
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "Swal.fire('Formato de imagen incorrecto', 'El formato debe de ser jpg o png', 'error');", true);

            }
        }
        protected void btonlogout_Click(object sender, EventArgs e)
        {
            string script = "Swal.fire('Sesión Cerrada', 'Cerraste Sesión', 'info').then(function() { window.location.href = '01_ES_Login.aspx'; });";
            ScriptManager.RegisterStartupScript(this, GetType(), "logout", script, true);
            Session.Clear();
        }
    }
}