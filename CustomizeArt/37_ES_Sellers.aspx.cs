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
    public partial class _37_ES_Sellers : System.Web.UI.Page
    {
        private string connectionString = "Server=127.0.0.1;Database=customizeart;Uid=root;Pwd=Info2024/*-;";

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                bool logged_in = Convert.ToBoolean(Session["logged_in"]);
                bool isAdmin = Convert.ToBoolean(Session["isAdmin"]);

                if (!isAdmin)
                    Response.Redirect("Default_Spanish.aspx");

            }
            catch (Exception ex)
            {
                Response.Redirect("01_ES_Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadSellers();
            }
        }

        protected void LoadSellers()
        {
            using (MySqlConnection conexion0 = new MySqlConnection(connectionString))
            {
                try
                {
                    conexion0.Open();
                    MySqlCommand cmd = new MySqlCommand(
                        "SELECT id_Seller, nombre, Tienda, Descripcion, Correo, Telefono, ID_ROL FROM seller",
                        conexion0);

                    MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    SellerGridView.DataSource = dt;
                    SellerGridView.DataBind();
                }
                catch (Exception ex)
                {
                    // Manejo de excepciones
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
            }
        }

        protected void Unnamed2_Click(object sender, EventArgs e)
        {
            string script = "Swal.fire('Logged Out', 'You logged out', 'info').then(function() { window.location.href = '01_ES_Login.aspx'; });";
            ScriptManager.RegisterStartupScript(this, GetType(), "logout", script, true);
            Session.Clear();
        }
    }
}