using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CustomizeArt
{
    public partial class _25_Delete : System.Web.UI.Page
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
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "Swal.fire('Error', 'Por favor inicia sesión', 'error');", true);
                Response.Redirect("01_Login.aspx");

            }

            conec.Open();
            MySqlCommand cmd = conec.CreateCommand();
            cmd.CommandText = "select * from products";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            da.Fill(dt);
            Load_Products();
            //gvdlist.DataSource = dt;
            //gvdlist.DataBind();
            conec.Close();
            if (Request.QueryString["eliminar"] != null)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "Swal.fire('Product deleted', 'Product deleted successfully', 'success');", true);
                EliminarProducto((Request.QueryString["eliminar"].ToString()));
            }
            
        }

        protected void Button1_Click(object sender, EventArgs e)
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

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (txtid.Text.Trim() != "" && txtproduct.Text.Trim() != "" && txtquantity.Text.Trim() != "" && txtprice.Text.Trim() != "" && txtdate.Text.Trim() != "" && txtDescription.Text.Trim() != "" && txtcategory.Text.Trim() != "")
            {
                string script = @"<script>
              Swal.fire({
               title: 'Are you sure to delete the product?',
                 showCancelButton: true,
                   confirmButtonText: 'Yes',
                     cancelButtonText: 'No'
                           }).then((result) => {
                        console.log(result);
                         if (result.value == true) {
                     Swal.fire('Product deleted', '', 'success').then(function() { window.location.href = '25_Delete.aspx?eliminar=" + txtid.Text + @"'; });
                      } else {
                         Swal.fire('Deletion cancelled', '', 'info');
                        }
                          });
                         </script>";

                ScriptManager.RegisterStartupScript(this, this.GetType(), "SweetAlert", script, false);
                int id;
                var isNumber = int.TryParse(txtproduct.Text.Trim(), out id);

                if (isNumber)
                {
                    int eliminado = metodos.Eliminar(id);
                    if (eliminado != 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "Swal.fire('Product deleted successfully', '', 'success');", true);
                        txtproduct.Text = string.Empty;
                        txtquantity.Text = string.Empty;
                        txtprice.Text = string.Empty;
                        txtdate.Text = string.Empty;
                        txtDescription.Text = string.Empty;
                        txtcategory.Text = string.Empty;
                        ImagePreview.ImageUrl = null;
                        Load_Products();
                    }
                    else
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "Swal.fire('Something went wrong', '', 'error');", true);
                }
            }
        }



        public void EliminarProducto(string Id)
        {
            metodos.Eliminar(Convert.ToInt32(Id));
            conec.Open();
            MySqlCommand cmd = conec.CreateCommand();
            cmd.CommandText = "select * from products";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            da.Fill(dt);
            Load_Products();

        }



        protected void Unnamed2_Click(object sender, EventArgs e)
        {
            string script = "Swal.fire('Logged Out', 'You logged out', 'info').then(function() { window.location.href = '01_Login.aspx'; });";
            ScriptManager.RegisterStartupScript(this, GetType(), "logout", script, true);
            Session.Clear();
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
    }
}