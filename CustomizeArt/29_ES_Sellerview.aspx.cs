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
    public partial class _29_ES_Sellerview : System.Web.UI.Page
    {
        MySqlConnection conec = new MySqlConnection("server=127.0.0.1; database=customizeart; Uid=root; pwd=TU_PASSWORD_DE_BASE_DE_DATOS;");
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                bool logged_in = Convert.ToBoolean(Session["logged_in"]);
                bool isAdmin = Convert.ToBoolean(Session["isAdmin"]);
                bool isSeller = Convert.ToBoolean(Session["isSeller"]);

                if (!isSeller)
                    Response.Redirect("Default_Spanish.aspx");
            }
            catch (Exception ex)
            {
                Response.Redirect("01_ES_Login.aspx");
            }
            conec.Open();
            MySqlCommand cmd = conec.CreateCommand();
            cmd.CommandText = "select * from products";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            da.Fill(dt);
            //gvdlist.DataSource = dt;
            //gvdlist.DataBind();
            conec.Close();
        }

        protected void Unnamed2_Click(object sender, EventArgs e)
        {
            string script = "Swal.fire('Sesión Cerrada', 'Cerraste Sesión', 'info').then(function() { window.location.href = '01_ES_Login.aspx'; });";
            ScriptManager.RegisterStartupScript(this, GetType(), "logout", script, true);
            Session.Clear();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("30_ES_Update_Seller.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("31_ES_Salesseller.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("38_ES_seller_create.aspx");
        }
    }
}