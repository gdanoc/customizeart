<%@ Page Async="true" Language="C#" AutoEventWireup="true" CodeBehind="36_complete.aspx.cs" Inherits="CustomizeArt._36_complete" %>

<!DOCTYPE html>
<!-- molla/login.html  22 Nov 2019 10:04:03 GMT -->
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Token - Customize Art</title>
    <meta name="keywords" content="HTML5 Template">
    <meta name="description" content="Molla - Bootstrap eCommerce Template">
    <meta name="author" content="p-themes">
    <!-- Favicon -->
    <link rel="apple-touch-icon" sizes="180x180" href="assets/images/icons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="img/logo2.png">
    <link rel="icon" type="image/png" sizes="16x16" href="img/logo2.png">
    <link rel="manifest" href="assets/images/icons/site.html">
    <link rel="mask-icon" href="img/logo2.png" color="#666666">
    <link rel="shortcut icon" href="img/logo2.png">
    <meta name="apple-mobile-web-app-title" content="Molla">
    <meta name="application-name" content="Molla">
    <meta name="msapplication-TileColor" content="#cc9966">
    <meta name="msapplication-config" content="assets/images/icons/browserconfig.xml">
    <meta name="theme-color" content="#ffffff">
    <!-- Plugins CSS File -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <!-- Main CSS File -->
    <link rel="stylesheet" href="assets/css/style.css">
    <!-- SweetAlert File -->
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>Pago Completo</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
        <link href="styles.css" rel="stylesheet" />
        <script src="SweetAlert/sweetalert2.all.min.js"></script>
        <script src="SweetAlert/sweetalert2.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 text-center">
                    <% if (ViewState["Status"] != null && (bool)ViewState["Status"])
                        { %>
                    <br />
                    <h1 class="text-success">Thanks!</h1>
                    <i class="far fa-check-circle fa-9x text-success"></i>
                    <h2 class="text-success">Success Purchase</h2>
                    <h4>Transaction ID: <%= ViewState["IdTransaccion"] %></h4>
                    <asp:Literal ID="alerta" runat="server" Text=""></asp:Literal>
                    <br />
                                       <a href="07_ShoppingCart.aspx" class="btn btn-primary">Back to the Store</a>

<%--                                    <a href='35_deletefromcart.aspx?productId=<%# Eval("ProductId") %>&customizeId=<%# Eval("CustomizeId") %>' >Back to the Store</a>--%>

                      
                    <br />
                    <br />
                    <% }
                    else
                    { %>
                    <br />
                    <h1 class="text-danger">Sorry</h1>
                    <i class="fas fa-exclamation-circle fa-9x text-danger"></i>
                    <h2 class="text-danger">Error Purchase</h2>
                    <br />
                    <a href="07_ShoppingCart.aspx" class="btn btn-primary">Back to the Store</a>

                    <% } %>
                </div>
            </div>
        </div>
    </form>
</body>
</html>