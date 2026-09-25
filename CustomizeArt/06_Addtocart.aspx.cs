using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CustomizeArt
{
    public partial class _06_Addtocart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string rawId = Request.QueryString["itemId"];
                int productId;

                if (!String.IsNullOrEmpty(rawId) && int.TryParse(rawId, out productId))
                {
                    // Verificar si el usuario está autenticado
                    if (HttpContext.Current.Session["userID"] == null)
                    {
                        string script = "Swal.fire('Log In!', 'You need to be logged in to add products to shopping cart', 'info').then(function() { window.location.href = '01_Login.aspx'; });";
                        ScriptManager.RegisterStartupScript(this, GetType(), "logout", script, true);
                        Session.Clear();
                    }
                    else
                    {
                        string CartId = metodos.GetCartId();
                        int userId = (int)HttpContext.Current.Session["userID"];

                        int agregado = metodos.AddTonormalCart(productId, CartId, userId);

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
                }
                else
                {
                    string script = "Swal.fire('OOPS', 'Invalid item ID', 'error').then(function() { window.location.href = 'Default.aspx'; });";
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                }
            }
        }
    }
}