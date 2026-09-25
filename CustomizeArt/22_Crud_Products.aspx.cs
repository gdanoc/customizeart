using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace CustomizeArt
{
    public partial class _22_Crud_Products : System.Web.UI.Page
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
            conec.Close();
        }
        protected void Load_Products()
        {
            DataTable myTable = metodos.Fetch_Products(true);
            ProductsList.DataSource = myTable;
            ProductsList.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("23_Create.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("24_Update.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("25_Delete.aspx");
        }
        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("26_Add_image.aspx");
        }

       

        protected void Unnamed2_Click(object sender, EventArgs e)
        {
            string script = "Swal.fire('Logged Out', 'You logged out', 'info').then(function() { window.location.href = '01_Login.aspx'; });";
            ScriptManager.RegisterStartupScript(this, GetType(), "logout", script, true);
            Session.Clear();
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("28_Sales.aspx");
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("40_Create_Seller.aspx");
        }
    }
}