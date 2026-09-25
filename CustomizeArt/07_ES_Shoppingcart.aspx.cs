using PayPal.Api;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CustomizeArt
{
    public partial class _07_ES_Shoppingcart : System.Web.UI.Page
    {
        private int userId;
        private int productId;
        private int customizeId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    if (HttpContext.Current.Session["userID"] == null)
                    {
                        string script = "Swal.fire('¡Inicia Sesión!', 'Necesitas iniciar sesión para ver el carrito', 'info').then(function() { window.location.href = '01_ES_Login.aspx'; });";
                        ScriptManager.RegisterStartupScript(this, GetType(), "logout", script, true);
                        Session.Clear();
                        return;
                    }
                }
                catch (Exception ex)
                {
                    // Log exception if necessary
                    Response.Redirect("01_ES_Login.aspx");
                    return;
                }

                if (int.TryParse(HttpContext.Current.Session["userID"]?.ToString(), out userId))
                {
                    // Verificar si se debe eliminar los productos comprados del carrito
                    string action = Request.QueryString["action"];
                    if (action == "removePurchased")
                    {
                        // Elimina los productos comprados del carrito
                        metodos.Delete_From_Cart(userId, productId, customizeId);

                        // Recarga la página para mostrar el carrito actualizado
                        Response.Redirect("07_ES_ShoppingCart.aspx");
                    }
                    else
                    {
                        Load_Cart(userId);
                        Load_Total(userId);
                    }
                }
                else
                {
                    // Handle case where userID is not valid
                    Response.Redirect("01_ES_Login.aspx");
                }
            }
        }

        protected void Load_Cart(int userId)
        {
            DataTable myTable = metodos.Fetch_Cart(userId);
            ShoppingCart.DataSource = myTable;
            ShoppingCart.DataBind();
        }

        protected void Load_Total(int userId)
        {
            double total = metodos.Cart_Total(userId);
            Total.Text = "Total: $" + Math.Round(total, 2).ToString();
        }


        protected void CheckOut_Click(object sender, EventArgs e)
        {
            // Configuración de PayPal
            var clientId = "AdYdJDj0e0M467JdootgS5YO3GOZrS3_H-BFEJcau4KTp1uRJb3JSRyVMD13ThlMy5ojBz-__S5hVTb9";
            var clientSecret = "EGhYPUZa5nlJEdRJZttZwYRKCfuotlwjTQxaZVeCGxoikvVoUb1YZO-FJHRFxhlpN-pdhgW98HVL9DKU";

            var config = ConfigManager.Instance.GetProperties();
            var accessToken = new OAuthTokenCredential(clientId, clientSecret, config).GetAccessToken();
            var apiContext = new APIContext(accessToken);

            // Crear un pago
            var payment = new Payment
            {
                intent = "sale",
                payer = new Payer
                {
                    payment_method = "paypal"
                },
                transactions = new List<Transaction>
            {
                new Transaction
                {
                    amount = new Amount
                    {
                        currency = "USD",
                        total = "50.00"
                    },
                    description = "Compra de productos", // Agrega una descripción para la transacción
                    item_list = new ItemList
                    {
                        items = new List<Item>
                        {
                            new Item
                            {
                                name = metodos.Fetch_Cart(userId).ToString(),
                                currency = "USD",
                                price = metodos.Cart_Total(userId).ToString(),
                                quantity = "1"
                            }
                        }
                    }
                }
            },
                redirect_urls = new RedirectUrls
                {
                    return_url = Request.Url.Scheme + "://" + Request.Url.Authority + "/36_ES_complete.aspx",
                    cancel_url = Request.Url.Scheme + "://" + Request.Url.Authority + "/07_ES_ShoppingCart.aspx"
                }
            };

            // Realizar el pago
            var createdPayment = payment.Create(apiContext);

            // Redirigir al usuario a PayPal
            var approvalUrl = createdPayment.links.FirstOrDefault(link => link.rel.Equals("approval_url"));
            if (approvalUrl != null)
            {
                Response.Redirect(approvalUrl.href);
            }
        }

        protected void CheckOutToken_Click(object sender, EventArgs e)
        {
            Response.Redirect("33_ES_CheckOut.aspx");
        }
    }
}
