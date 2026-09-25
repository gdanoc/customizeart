using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CustomizeArt
{
    public partial class _30_Update_seller : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Load_Products();
            }
        }

        protected void Load_Products()
        {
            DataTable myTable = metodos.Fetch_Products(true);
            ProductsList.DataSource = myTable;
            ProductsList.DataBind();
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
                    txtquantity.Text = respuesta.Quantity;
                }
                else
                {
                    alerta.Text = "<script>Swal.fire('Something went wrong', 'Verify the ID', 'error') </script>";
                }
            }
            catch (Exception exc)
            {
                alerta.Text = "<script>Swal.fire('Something went wrong', 'Verify the ID', 'error') </script>";
            }
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtid.Text))
            {
                alerta.Text = "<script>Swal.fire('OOPS', 'Don´t leave blank spaces', 'error');</script>";
            }
            else
            {
                int id = Convert.ToInt32(txtid.Text);
                Fetch_product(id);
            }
        }

        protected void Unnamed2_Click(object sender, EventArgs e)
        {

            try
            {
                int id = Convert.ToInt32(txtid.Text);


                string quantity = txtquantity.Text.Trim();

                if (!string.IsNullOrEmpty(quantity))
                {
                    int newQuantity = Convert.ToInt32(quantity);


                    // Fetch the current product details including current quantity
                    Add productDetails = metodos.Search_Product(id);

                    if (productDetails.Id != 0)
                    {
                        int currentQuantity = int.Parse(productDetails.Quantity);
                        // Validación para asegurar que no se reduzca la cantidad


                        // Calculate the new total quantity
                        int updatedQuantity = currentQuantity + newQuantity;

                        // Update the product in the database with the new quantity
                        int guardado = metodos.Update_Product_Seller(id, updatedQuantity.ToString());

                        if (guardado != 0)
                        {
                            alerta.Text = "<script>Swal.fire('Products added successfully', 'Thanks for choosing us!', 'success'); </script>";
                            Load_Products();

                        }
                        else
                        {
                            alerta.Text = "<script>Swal.fire('Something went wrong', 'Try again', 'error') </script>";
                        }
                    }
                    else
                    {
                        alerta.Text = "<script>Swal.fire('Product not found', 'Verify the ID', 'error') </script>";
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

        protected void Unnamed3_Click(object sender, EventArgs e)
        {
            string script = "Swal.fire('Logged Out', 'You logged out', 'info').then(function() { window.location.href = '01_Login.aspx'; });";
            ScriptManager.RegisterStartupScript(this, GetType(), "logout", script, true);
            Session.Clear();
        }
    }
}