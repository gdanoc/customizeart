using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CustomizeArt
{
    public partial class _14_Deletefromcart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string rawId = Request.QueryString["productId"];
            string cusId = Request.QueryString["customizeId"];
            int productId;
            if (!String.IsNullOrEmpty(rawId) && int.TryParse(rawId, out productId))
            {
                int userId = (int)HttpContext.Current.Session["userID"];
                int customizeId = Convert.ToInt32(cusId);
                int deleted = metodos.Delete_From_Cart(productId, userId, customizeId);

                if (deleted != 0)
                {
                    string script = "Swal.fire('Product removed from cart', '', 'success').then(function() { window.location.href = 'Default.aspx'; });";
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                    Session.Clear();


                }
                else
                {
                    string script = "Swal.fire('OOPS', 'It was not possible to remove the product from the cart', 'error').then(function() { window.location.href = '07_Shoppingcart.aspx'; });";
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                    Session.Clear();
                }
            }
            else
            {
                string script = "Swal.fire('OOPS', 'Don't leave blank spaces', 'error').then(function() { window.location.href = '07_Shoppingcart.aspx'; });";
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                Session.Clear();
            }
        }
    }
}
