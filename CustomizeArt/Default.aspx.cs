using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CustomizeArt
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
        }

        
        protected void btonCart_Click(object sender, EventArgs e)
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
    }
}