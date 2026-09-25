using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CustomizeArt
{
    public partial class _35_ES_deletefromcart : System.Web.UI.Page
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
                    alerta.Text = "<script>Swal.fire('Producto eliminado del carrito', '', 'success').then(function() { window.location.href = 'Default_Spanish.aspx'; }); </script>";

                }
                else
                {
                    alerta.Text = "<script>Swal.fire('OOPS', 'No fue posible eliminar el producto del carrito', 'error') </script>";
                }
            }
            else
            {
                alerta.Text = "<script>Swal.fire('OOPS', 'No deje espacios en blanco', 'error') </script>";
            }
        }
    }
}