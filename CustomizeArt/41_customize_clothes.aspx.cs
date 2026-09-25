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
    public partial class _41_customize_clothes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string productId = Request.QueryString["itemId"];
                string rawId = Request.QueryString["itemId"];

                if (!string.IsNullOrEmpty(productId))
                {
                    LoadProductDetails(Convert.ToInt32(productId));
                    if (HttpContext.Current.Session["userID"] == null)
                    {
                        string script = "Swal.fire('Log In!', 'You need to be logged in to add products to shopping cart', 'info').then(function() { window.location.href = '01_Login.aspx'; });";
                        ScriptManager.RegisterStartupScript(this, GetType(), "logout", script, true);
                        Session.Clear();
                        return;
                    }
                }
            }
        }

        protected void LoadProductDetails(int productId)
        {
            // Aquí puedes agregar la lógica para obtener los detalles del producto según el ID
            DataTable productDetails = ObtenerDetallesDelProducto(productId);

            if (productDetails.Rows.Count > 0)
            {
                DataRow row = productDetails.Rows[0];
                string imageUrl = "images/" + row["Image"].ToString();
                string description = row["Description"].ToString();
                string price = "$" + row["Price"].ToString();
                string stock = row["Quantity"].ToString();
                string name = row["Product"].ToString();

                // Actualizar los controles en la página con los detalles del producto
                productImage.ImageUrl = imageUrl;
                descriptionLabel.Text = description;
                priceLabel.Text = price;
                stockLabel.Text = stock;
                nameLabel.Text = name;
            }
        }

        public static DataTable ObtenerDetallesDelProducto(int productId)
        {
            string connectionString = "server=127.0.0.1; database=customizeart; Uid=root; pwd=TU_PASSWORD_DE_BASE_DE_DATOS;"; // Tu cadena de conexión
            DataTable productDetails = new DataTable();

            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                conn.Open();

                MySqlCommand comando = new MySqlCommand($"SELECT Product, Image, Description, Price, Quantity FROM products WHERE ID = {productId}", conn);

                using (MySqlDataAdapter adapter = new MySqlDataAdapter(comando))
                {
                    adapter.Fill(productDetails);
                }
            }

            return productDetails;
        }
        protected void RadioButton_CheckedChanged(object sender, EventArgs e)
        {
            Color = Request.Form["radioGroup"];
        }
        public string Color { get; set; }
        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            string rawId = Request.QueryString["itemId"];
            int productId;

            if (!String.IsNullOrEmpty(rawId) && int.TryParse(rawId, out productId))
            {
                string CartId = metodos.GetCartId();
                int userId = (int)HttpContext.Current.Session["userID"];
                if (CusImage.FileName == "" && impresion.SelectedValue == "Select face")
                {
                    // Sin personalizar
                    if (DropDownList1.SelectedValue == "Select size" || colorRadioButtonList.SelectedValue == "")
                    {
                        string script = "Swal.fire('OOPS', 'Please select size and color', 'error')";
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);

                    }
                    string size = DropDownList1.SelectedValue;
                    string color = colorRadioButtonList.SelectedValue;

                    int customizeId = metodos.AddNoCustomize(size, color, productId, userId);
                    if (customizeId != 0)
                    {
                        int agregado = metodos.AddToCart(productId, CartId, userId, customizeId);
                        if (agregado != 0)
                        {
                            string script = "Swal.fire('Product added to cart!', '', 'success').then(function() { window.location.href = 'Default.aspx'; });";
                            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                            Session["addedToCart"] = true;
                        }
                        else
                        {
                            string script = "Swal.fire('OOPS', 'It was not possible to add the product to cart', 'error');";
                            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                        }
                    }
                    else
                    {
                        string script = "Swal.fire('OOPS', 'It was not possible to customize the product', 'error');";
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                    }

                }
                else
                {
                    // Con personalizar
                    if (DropDownList1.SelectedValue == "Select size" || colorRadioButtonList.SelectedValue == "" || CusImage.FileName == "" || impresion.SelectedValue == "Select face")
                    {
                        string script = "Swal.fire('OOPS', 'Please select size, color, image and face', 'error')";
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                        return;
                    }
                    string strFileName;
                    string strFilePath;
                    string strFolder;
                    strFolder = Server.MapPath("./cusimages/");
                    strFileName = CusImage.PostedFile.FileName;
                    strFileName = Path.GetFileName(strFileName);

                    if (!Directory.Exists(strFolder))
                    {
                        Directory.CreateDirectory(strFolder);
                    }
                    // Save the uploaded file to the server.
                    strFilePath = strFolder + strFileName;
                    if (!File.Exists(strFilePath))
                    {
                        CusImage.PostedFile.SaveAs(strFilePath);
                    }

                    string size = DropDownList1.SelectedValue;
                    string image = strFileName;
                    string face = impresion.SelectedValue;
                    string color = colorRadioButtonList.SelectedValue;

                    int customizeId = metodos.AddCustomize(size, image, face, color, productId, userId);
                    if (customizeId != 0)
                    {
                        int agregado = metodos.AddToCart(productId, CartId, userId, customizeId);
                        if (agregado != 0)
                        {
                            string script = "Swal.fire('Product added to cart!', '', 'success').then(function() { window.location.href = 'Default.aspx'; });";
                            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                            Session["addedToCart"] = true;
                        }
                        else
                        {
                            string script = "Swal.fire('OOPS', 'It was not possible to add the product to cart', 'error');";
                            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                        }
                    }
                    else
                    {
                        string script = "Swal.fire('OOPS', 'It was not possible to customize the product', 'error');";
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                    }

                }
            }
            else
            {
                string script = "Swal.fire('OOPS', 'Invalid item ID', 'error').then(function() { window.location.href = 'Default.aspx'; });";
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
            }
        }
    }
}