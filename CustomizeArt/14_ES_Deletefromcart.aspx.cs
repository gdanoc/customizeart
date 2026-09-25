using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CustomizeArt
{
    public partial class _14_ES_Deletefromcart : System.Web.UI.Page
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
                    string script = "Swal.fire('Producto removido del carrito', '', 'success').then(function() { window.location.href = 'Default_Spanish.aspx'; });";
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                    Session.Clear();


                }
                else
                {
                    string script = "Swal.fire('OOPS', 'No fue posible remover el producto del carrito', 'error').then(function() { window.location.href = '07_ES_Shoppingcart.aspx'; });";
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                    Session.Clear();
                }
            }
            else
            {
                string script = "Swal.fire('OOPS', 'No dejes espacios en blanco', 'error').then(function() { window.location.href = '07_ES_Shoppingcart.aspx'; });";
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", script, true);
                Session.Clear();
            }
        }
    }
}
