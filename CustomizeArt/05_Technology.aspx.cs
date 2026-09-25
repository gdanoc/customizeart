using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CustomizeArt
{
    public partial class _05_Technology : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            Load_Technology();
            cargarCarrusel();
        }

        protected void cargarCarrusel()
        {
            string[] datos = metodos.ObtenerImagenes();
            IndicatorsLiteral.Text = datos[1];
            ImagesLiteral.Text = datos[0];
        }
        protected void Addcart_Click(object sender, EventArgs e)
        {
            try
            {
                bool logged_in = Convert.ToBoolean(Session["logged_in"]);


                if (!logged_in)
                    Response.Redirect("01_Login.aspx");

            }
            catch (Exception ex)
            {
                Response.Redirect("01_Login.aspx");
            }
        }

        protected void bton_Cart_Click(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session["userID"] == null)
            {
                string script = "Swal.fire('Log In!', 'You need to be logged in to watch the shopping cart', 'info').then(function() { window.location.href = '01_Login.aspx'; });";
                ScriptManager.RegisterStartupScript(this, GetType(), "logout", script, true);
                Session.Clear();
            }
            else
            {
                Response.Redirect("07_Shoppingcart.aspx");
            }
        }


        protected void Load_Technology()
        {
            string template = "";

            DataTable products = metodos.Fetch_Technology(false);

            foreach (DataRow row in products.Rows)
            {

                template += "<div class='col-sm-12 col-md-3 col-lg-3' style='text-align: center'>" +
                            "<div class='card' style='text-align: center'> " +
                                "<img src='images/" + row["Image"] + "' class='card-img-top'/>" +
                                "<div class='card-body'> " +
                                    "<h5 class='card-title'>" + row["Product"] + " </h5>" +
                                    "<p class='card-text'> Description: <strong>" + row["Descripcion"] + " </strong> <br> Price: <strong>$" + row["Price"] + "</strong> <br> Category: <strong>" + row["Category"] + "</strong> <br> Stock: <strong>" + row["Quantity"] + " </strong>" + "</p>" +
                                    "<a href='42_customize_technology.aspx?itemId=" + row["ID"] + "' class='btn btn-primary style='margin-top: 5px;'>Add to Shopping Cart With Customization</a>" +
                                "</div>" +
                            "</div>" +
                        "</div>";
            }
            ProductsLiteralTechnology.Text = template;
        }
    }
}
