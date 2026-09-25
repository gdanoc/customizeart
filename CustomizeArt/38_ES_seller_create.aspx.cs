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
    public partial class _38_ES_seller_create : System.Web.UI.Page
    {
        MySqlConnection conec = new MySqlConnection("server=127.0.0.1; database=customizeart; Uid=root; pwd=TU_PASSWORD_DE_BASE_DE_DATOS;");
        public static MySqlConnection conexion0 = new MySqlConnection("Server= 127.0.0.1; database=customizeart; Uid=root; pwd=TU_PASSWORD_DE_BASE_DE_DATOS;");
        protected void Page_Load(object sender, EventArgs e)
        {

            //try
            //{
            //    bool logged_in = Convert.ToBoolean(Session["logged_in"]);
            //    bool isAdmin = Convert.ToBoolean(Session["isAdmin"]);

            //    if (!isAdmin)
            //        Response.Redirect("Default.aspx");

            //}
            //catch (Exception ex)
            //{
            //    Response.Redirect("01_login.aspx");
            //}

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
                    alerta.Text = "<script>Swal.fire('Producto seleccionado con éxito', '', 'success'); </script>";
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
                    alerta.Text = "<script>Swal.fire('Algo salió mal', 'Verificar el ID', 'error') </script>";

            }
            catch (Exception exc)
            {
                alerta.Text = "<script>Swal.fire('Algo salió mal', 'Verificar el ID', 'error') </script>";
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
                    if (txtproduct.Text.Trim() != "" && txtquantity.Text.Trim() != "" && txtprice.Text.Trim() != "" && txtdate.Text.Trim() != "" && txtDescription.Text.Trim() != "" && txtcategory.Text.Trim() != "")
                    {
                        double.TryParse(txtprice.Text, out double price);
                        if (price > 2000)
                        {
                            string script = "Swal.fire('Precio demasiado alto', 'El precio no puede ser mayor que 2000', 'warning');";
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

                        // Obtén el userId del usuario logueado
                        int userId = Convert.ToInt32(Session["UserId"]); // Asegúrate de que el userId esté almacenado en la sesión

                        // Usando el userId para obtener el sellerName (o Id_Usuario)
                        int SellerId = userId; //Cambie aqui

                        string product = txtproduct.Text;
                        string qty = txtquantity.Text;
                        string date = txtdate.Text;
                        string description = txtDescription.Text;
                        string category = txtcategory.Text;
                        string image = strFileName;

                        int guardado = metodos.AgregarProductosSeller(product, qty, price.ToString(), date, description, category, image, SellerId);

                        if (guardado != 0)
                        {
                            alerta.Text = "<script>Swal.fire('Producto agregado con éxito', 'Gracias por elegirnos!', 'success'); </script>";
                            Load_Products();
                        }
                        else
                        {
                            alerta.Text = "<script>Swal.fire('Algo salió mal', 'Inténtalo de nuevo', 'error') </script>";
                        }
                    }
                    else
                    {
                        alerta.Text = "<script>Swal.fire('OOPS', 'No dejes espacios en blanco', 'error') </script>";
                    }
                }
                else
                {
                    alerta.Text = "<script>Swal.fire('OOPS', 'Seleccione una imagen', 'error') </script>";
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "Swal.fire('Formato de imagen incorrecto', 'El formato debe ser jpg o png', 'error');", true);
            }
        }

        //Cambie aqui

        //private string GetSellerNameByUserId(int username)
        //{
        //    // Aquí obtienes el nombre del usuario de la base de datos usando el userId
        //    conexion0.Open();
        //    string sellerName = "";
        //    MySqlCommand comando = new MySqlCommand("SELECT nombre FROM seller WHERE id_Seller = @userId", conexion0);
        //    comando.Parameters.AddWithValue("@userId", username);
        //    object result = comando.ExecuteScalar();
        //    if (result != null)
        //    {
        //        sellerName = result.ToString();
        //    }
        //    conexion0.Close();
        //    return sellerName;
        //}
        protected void btonlogout_Click(object sender, EventArgs e)
        {
            string script = "Swal.fire('Sesión cerrada', 'Ha cerrado sesión', 'info').then(function() { window.location.href = '01_ES_Login.aspx'; });";
            ScriptManager.RegisterStartupScript(this, GetType(), "logout", script, true);
            Session.Clear();
        }
    }
}
