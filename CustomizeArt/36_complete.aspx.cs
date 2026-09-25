using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using Newtonsoft.Json;
using System.Threading.Tasks;
using PayPal.Api;
using System.Data;
using System.Transactions;
using MySql.Data.MySqlClient;
using System.Diagnostics;

namespace CustomizeArt
{
    public partial class _36_complete : System.Web.UI.Page
    {
        protected string ShoppingCartUrl;
        private int userId;
        private int productId;
        private int customizeId;
        public static MySqlConnection conexion0 = new MySqlConnection("Server=127.0.0.1; database=customizeart; Uid=root; pwd=TU_PASSWORD_DE_BASE_DE_DATOS;");

        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (HttpContext.Current.Session["userID"] == null)
                {
                    string script = "Swal.fire('Log In!', 'You need to be logged in to add products to the shopping cart!', 'info').then(function() { window.location.href = '01_Login.aspx'; });";
                    ScriptManager.RegisterStartupScript(this, GetType(), "logout", script, true);
                    Session.Clear();
                    return;
                }
                string token = Request.QueryString["token"];
                ShoppingCartUrl = ResolveUrl("~/07_ShoppingCart.aspx");

                try
                {
                    bool status = false;
                    string idTransaccion = string.Empty;

                    using (var client = new HttpClient())
                    {
                        // Claves de la API de PayPal
                        var userName = "AdYdJDj0e0M467JdootgS5YO3GOZrS3_H-BFEJcau4KTp1uRJb3JSRyVMD13ThlMy5ojBz-__S5hVTb9";
                        var passwd = "EGhYPUZa5nlJEdRJZttZwYRKCfuotlwjTQxaZVeCGxoikvVoUb1YZO-FJHRFxhlpN-pdhgW98HVL9DKU";

                        client.BaseAddress = new Uri("https://api-m.sandbox.paypal.com");

                        var authToken = Encoding.ASCII.GetBytes($"{userName}:{passwd}");
                        client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Basic", Convert.ToBase64String(authToken));

                        var data = new StringContent("{}", Encoding.UTF8, "application/json");

                        HttpResponseMessage response = await client.PostAsync($"/v2/checkout/orders/{token}/capture", data);

                        status = response.IsSuccessStatusCode;

                        if (status)
                        {
                            var jsonRespuesta = await response.Content.ReadAsStringAsync();
                            Debug.WriteLine($"Response from PayPal: {jsonRespuesta}");

                            PaypalTransaction objeto = JsonConvert.DeserializeObject<PaypalTransaction>(jsonRespuesta);
                            idTransaccion = objeto.purchase_units[0].payments.captures[0].id;

                            if (int.TryParse(HttpContext.Current.Session["userID"]?.ToString(), out int userId))
                            {
                                int checkedOut = metodos.Check_OutPayPal(userId, idTransaccion);
                                if (checkedOut != 0)
                                {
                                    string script = "Swal.fire('OK', 'Product purchased successfully', 'success');";
                                    alerta.Text = $"<script>{script}</script>";
                                }
                                else
                                {
                                    string script = "Swal.fire('Oops', 'Something went wrong with the purchase', 'error');";
                                    alerta.Text = $"<script>{script}</script>";
                                }
                            }
                            else
                            {
                                string script = $"Swal.fire('Oops', 'Invalid user ID', 'error').then(function() {{ window.location.href = '03_Clothes.aspx'; }});";
                                alerta.Text = $"<script>{script}</script>";
                            }
                        }
                        else
                        {
                            var error = await response.Content.ReadAsStringAsync();
                            string script = $"Swal.fire('Oops', 'Something went wrong with PayPal: {error}', 'error').then(function() {{ window.location.href = '03_Clothes.aspx'; }});";
                            alerta.Text = $"<script>{script}</script>";
                        }
                    }

                    ViewState["Status"] = status;
                    ViewState["IdTransaccion"] = idTransaccion;
                }
                catch (Exception ex)
                {
                    string script = $"Swal.fire('Oops', 'An error occurred: {ex.Message}', 'error').then(function() {{ window.location.href = '03_Clothes.aspx'; }});";
                    alerta.Text = $"<script>{script}</script>";
                }
            }
        }



    }

    public class PaypalTransaction
    {
        public List<PurchaseUnit> purchase_units { get; set; }
    }

    public class PurchaseUnit
    {
        public Payments payments { get; set; }
    }

    public class Payments
    {
        public List<Capture> captures { get; set; }
    }

    public class Capture
    {
        public string id { get; set; }
    }
}