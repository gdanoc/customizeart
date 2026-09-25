using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CustomizeArt
{
    public partial class _05_ES_Technology : System.Web.UI.Page
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
                    Response.Redirect("01_ES_Login.aspx");

            }
            catch (Exception ex)
            {
                Response.Redirect("01_ES_Login.aspx");
            }
        }

        protected void bton_Cart_Click(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session["userID"] == null)
            {
                string script = "Swal.fire('¡Inicia sesión!', 'Necesitas tener una sesión abierta para ver el carrito de compras', 'info').then(function() { window.location.href = '01_ES_Login.aspx'; });";
                ScriptManager.RegisterStartupScript(this, GetType(), "logout", script, true);
                Session.Clear();
            }
            else
            {
                Response.Redirect("07_ES_Shoppingcart.aspx");
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
                                        "<p class='card-text'> Descripción: <strong>" + row["Descripcion"] + "</strong> <br> Cantidad: <strong>" + row["Quantity"] + " </strong>" + " </strong> <br> Precio: <strong>$" + row["Price"] + "</strong> <br> Categoría: <strong>" + row["Category"] + " </strong>" + "</p>" +
                                        "<a href='42_customize_technology.aspx?itemId=" + row["ID"] + "' class='btn btn-primary style='margin-top: 5px;'>Agregar al Carrito con Personalización</a>" +
                                    "</div>" +
                                "</div>" +
                            "</div>";
            }
            ProductsLiteralTechnology.Text = template;
        }
    }
}
