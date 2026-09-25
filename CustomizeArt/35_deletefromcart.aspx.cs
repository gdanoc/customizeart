using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CustomizeArt
{
    public partial class _35_deletefromcart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string rawId = Request.QueryString["productId"];
            string cusId = Request.QueryString["customizeId"];
            int productId;
            int customizeId;
            if (!String.IsNullOrEmpty(rawId) && int.TryParse(rawId, out productId) && int.TryParse(cusId, out customizeId))
            {
                int userId = (int)HttpContext.Current.Session["userID"];
                int deleted = metodos.Delete_From_Cart(productId, userId, customizeId);

                if (deleted != 0)
                {
                    alerta.Text = "<script>Swal.fire('Product removed from cart', '', 'success').then(function() { window.location.href = 'Default.aspx'; }); </script>";

                }
                else
                {
                    alerta.Text = "<script>Swal.fire('OOPS', 'It was not possible to remove the product from the cart', 'error') </script>";
                }
            }
            else
            {
                alerta.Text = "<script>Swal.fire('OOPS', 'Don't leave blank spaces', 'error') </script>";
            }
        }
    }
}