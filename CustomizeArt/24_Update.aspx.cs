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
    public partial class _24_Update : System.Web.UI.Page
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
                Response.Redirect("01_Login.aspx");
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
            Load_Products();
            ;
        }
        protected void Unnamed2_Click(object sender, EventArgs e)
        {
            alerta.Text = "";
            string strFileName;
            string strFilePath;
            string strFolder;
            string extension;
            strFileName = PhotoFile.PostedFile.FileName;
            strFileName = Path.GetFileName(strFileName);
            extension = Path.GetExtension(strFileName);
            strFolder = Server.MapPath("./images/");
            try
            {
                int id = Convert.ToInt32(txtid.Text);
                string product = txtproduct.Text.Trim();
                string quantity = txtquantity.Text.Trim();
                string price = txtprice.Text.Trim();
                string date = txtdate.Text.Trim();
                string description = txtDescription.Text.Trim();
                string category = txtcategory.Text.Trim();


                if (txtid.Text.Trim() != "" && txtquantity.Text.Trim() != "" && txtprice.Text.Trim() != "" && txtdate.Text.Trim() != "" && txtDescription.Text.Trim() != "" && txtcategory.Text.Trim() != "")
                {
                    if (extension == ".jpg" || extension == ".png")
                    {

                        if (!Directory.Exists(strFolder))
                        {
                            Directory.CreateDirectory(strFolder);
                        }
                        if (PhotoFile.HasFile)
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
                            int guardado = metodos.Update_ProductImage(id, product, quantity, price, date, description, category, foto);
                            if (guardado != 0)
                            {
                                alerta.Text = "<script>Swal.fire('Product updated successfully', 'Thanks for choosing us!', 'success'); </script>";
                                Load_Products();

                            }
                            else
                                alerta.Text = "<script>Swal.fire('Something went wrong', 'Try again', 'error') </script>";
                        }
                        else
                        {
                            int guardado = metodos.Update_Product(id, product, quantity, price, date, description, category);
                            if (guardado != 0)
                            {
                                alerta.Text = "<script>Swal.fire('Product updated successfully', 'Thanks for choosing us!', 'success'); </script>";
                                Load_Products();

                            }
                            else
                                alerta.Text = "<script>Swal.fire('Something went wrong', 'Try again', 'error') </script>";
                        }
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "Swal.fire('Image format incorrect', 'The format must be jpg or png', 'error');", true);

                    }
                }
                else
                {
                    alerta.Text = "<script>Swal.fire('OOPS', 'Don´t leave blank spaces', 'error') </script>";

                }
            }

            catch (Exception ex)
            {
                alerta.Text = "<script>Swal.fire('Something went wrong', 'Try again', 'error') </script>";
            }
        }
        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtid.Text))
            {
                // Mostrar una alerta al usuario usando SweetAlert
                alerta.Text = "<script>Swal.fire('OOPS', 'Don´t leave blank spaces', 'error');</script>";
            }
            else
            {
                int id = Convert.ToInt32(txtid.Text);
                Fetch_product(id);
            }
        }
        protected void Fetch_product(int id)
        {
            try
            {
                Add respuesta = metodos.Search_Product(id);

                if (respuesta.Id != 0)
                {
                    alerta.Text = "<script>Swal.fire('Product selected successfully', '', 'success'); </script>";
                    ImagePreview.ImageUrl = "/images/" + respuesta.Image;
                    txtproduct.Text = respuesta.Product;
                    txtquantity.Text = respuesta.Quantity.ToString();
                    txtprice.Text = respuesta.Price.ToString();
                    txtdate.Text = respuesta.Date.ToString();
                    txtDescription.Text = respuesta.Description.ToString();
                    txtcategory.Text = respuesta.Category.ToString();
                }
                else
                    alerta.Text = "<script>Swal.fire('Something went wrong', 'Verify the ID', 'error') </script>";

            }
            catch (Exception exc)
            {
                alerta.Text = "<script>Swal.fire('Something went wrong', 'Verify the ID', 'error') </script>";
            }
        }
        protected void Load_Products()
        {
            DataTable myTable = metodos.Fetch_Products(true);
            ProductsList.DataSource = myTable;
            ProductsList.DataBind();
        }

        protected void Unnamed3_Click(object sender, EventArgs e)
        {
            string script = "Swal.fire('Logged Out', 'You logged out', 'info').then(function() { window.location.href = '01_Login.aspx'; });";
            ScriptManager.RegisterStartupScript(this, GetType(), "logout", script, true);
            Session.Clear();
        }
    }
}