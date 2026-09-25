<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="07_Shoppingcart.aspx.cs" Inherits="CustomizeArt._07_Shoppingcart" %>

<!DOCTYPE html>
<html lang="en">


<!-- molla/cart.html  22 Nov 2019 09:55:06 GMT -->
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Customize Art</title>
    <meta name="keywords" content="HTML5 Template">
    <meta name="description" content="Molla - Bootstrap eCommerce Template">
    <meta name="author" content="p-themes">
    <!-- Favicon -->
    <link rel="apple-touch-icon" sizes="180x180" href="img/logo2.png">
    <link rel="icon" type="image/png" sizes="32x32" href="img/logo2.png">
    <link rel="icon" type="image/png" sizes="16x16" href="img/logo2.png">
    <link rel="manifest" href="img/logo2.png">
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
    <script src="SweetAlert/sweetalert2.all.min.js"></script>
    <script src="SweetAlert/sweetalert2.js"></script>
    <script src="SweetAlert/sweetalert2.js"></script>
    <script src="SweetAlert/sweetalert2.all.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style type="text/css">
        .auto-style1 {
            height: 24px;
        }

        .auto-style3 {
            left: 700px;
        }
    </style>
    <style>
        #CheckOut {
            text-align: center;
        }
    </style>
    <style>
        .custom-button {
            display: inline-block;
            width: auto; /* Elimina cualquier ancho fijo */
            padding: 5px 10px; /* Ajusta el padding para que el botón no sea demasiado grande */
        }
    </style>
    <style>
        .carousel-inner img {
            width: 100%;
            height: 600px;
            margin: auto;
        }

        .carousel-control-prev-icon,
        .carousel-control-next-icon {
            background-color: #000;
        }

        .carousel-control-prev,
        .carousel-control-next {
            width: 5%;
        }

        .carousel-indicators {
            bottom: -30px;
        }

        .centerlogo {
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body>
    <div class="page-wrapper">
        <header class="header">
            <div class="header-top">
                <div class="container">
                    <div class="header-left">
                        <div class="header-dropdown">
                            <%--<a href="#">Usd</a>
                            <div class="header-menu">
                                <ul>
                                    <li><a href="#">Eur</a></li>
                                    <li><a href="#">Usd</a></li>
                                </ul>
                            </div>--%>
                            <!-- End .header-menu -->
                        </div>
                        <!-- End .header-dropdown -->

                        <div class="header-dropdown">
                            <a href="#">Eng</a>
                            <div class="header-menu">
                                <ul>
                                    <li><a href="01_Login.aspx">English</a></li>
                                    <li><a href="01_ES_Login.aspx">Spanish</a></li>
                                </ul>
                            </div>
                            <!-- End .header-menu -->
                        </div>
                        <!-- End .header-dropdown -->
                    </div>
                    <!-- End .header-left -->

                    <div class="header-right">
                        <ul class="top-menu">
                            <li>
                                <a href="#">Links</a>
                                <ul>
                                    <%--<li><a href="tel:#"><i class="icon-phone"></i>Call: +0123 456 789</a></li>--%>
                                    <li><a href="09_About_Us.aspx">About Us</a></li>
                                </ul>
                            </li>
                        </ul>
                        <!-- End .top-menu -->
                    </div>
                    <!-- End .header-right -->
                </div>
                <!-- End .container -->
            </div>
            <!-- End .header-top -->

            <div class="header-middle sticky-header">
                <div class="container">
                    <div class="header-left">
                        <button class="mobile-menu-toggler">
                            <span class="sr-only">Toggle mobile menu</span>
                            <i class="icon-bars"></i>
                        </button>

                        <a href="Default.aspx" class="logo">
                            <img src="img/logo.png" alt="Molla Logo" width="105" height="25">
                        </a>

                        <nav class="main-nav">
                            <ul class="menu sf-arrows">
                                <li class="megamenu-container active">
                                    <a href="Default.aspx">Home</a>
                                </li>
                                <li>
                                    <a href="#" class="sf-with-ul">Product</a>

                                    <div class="megamenu megamenu-sm">
                                        <div class="row no-gutters">
                                            <div class="col-md-6">
                                                <div class="menu-col">
                                                    <div class="menu-title">Products</div>
                                                    <!-- End .menu-title -->
                                                    <ul>
                                                        <li><a href="03_Clothes.aspx">Clothes</a></li>
                                                        <li><a href="04_Accesories.aspx"><span>Accesories<span class="tip tip-new">New!</span></span></a></li>
                                                        <li><a href="05_Technology.aspx">Technology</a></li>

                                                    </ul>
                                                </div>
                                                <!-- End .menu-col -->
                                            </div>
                                            <!-- End .col-md-6 -->

                                            <div class="col-md-6">
                                                <div class="banner banner-overlay">
                                                    <a href="category.html">
                                                        <img src="img/logo2.png" alt="Banner">

                                                        <div class="banner-content banner-content-bottom">
                                                            <div class="banner-title text-white">
                                                                Customize Art<br>
                                                                <span><strong>Products</strong></span>
                                                            </div>
                                                            <!-- End .banner-title -->
                                                        </div>
                                                        <!-- End .banner-content -->
                                                    </a>
                                                </div>
                                                <!-- End .banner -->
                                            </div>
                                            <!-- End .col-md-6 -->
                                        </div>
                                        <!-- End .row -->
                                    </div>
                                    <!-- End .megamenu megamenu-sm -->
                                </li>
                                <li>
                                    <a href="#" class="sf-with-ul" f>Pages</a>

                                    <ul>
                                        <li>
                                            <a href="09_About_Us.aspx">About</a>
                                        </li>
                                        <li></li>
                                        <li><a href="01_Login.aspx">Login</a></li>
                                    </ul>
                                </li>
                                <li>


                                <li></li>
                            </ul>
                            <!-- End .menu -->
                        </nav>
                        <!-- End .main-nav -->
                        <!-- End .main-nav -->
                    </div>
                    <!-- End .header-left -->

                    <div class="header-right">
                        <!-- End .header-search -->
                        <div class="dropdown compare-dropdown">


                            <!-- End .dropdown-menu -->
                        </div>
                        <!-- End .compare-dropdown -->

                        <div class="dropdown cart-dropdown">
                            <i class="icon-shopping-cart"></i>
                            <a href="07_Shoppingcart.aspx" f>Shopping Cart</a>
                            <!-- End .dropdown-menu -->
                        </div>
                        <!-- End .cart-dropdown -->
                    </div>
                    <!-- End .header-right -->
                </div>
                <!-- End .container -->
            </div>
            <!-- End .header-middle -->
        </header>
        <!-- End .header -->

        <main class="main">
            <div class="page-header text-center" style="background-image: url('assets/images/page-header-bg.jpg')">
                <div class="container">
                    <h1 class="page-title">Shopping Cart<span>Shop</span></h1>
                </div>
                <!-- End .container -->
            </div>
            <!-- End .page-header -->
            <nav aria-label="breadcrumb" class="breadcrumb-nav">
                <div class="container">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Shop</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Shopping Cart</li>
                    </ol>
                </div>
                <!-- End .container -->
            </nav>
            <!-- End .breadcrumb-nav -->

            <form id="form2" runat="server">
                <asp:ScriptManager runat="server"></asp:ScriptManager>
                <div class="flex flex-1">
                    <main class="bg-white-500 flex-1 p-3 overflow-hidden">
                        <div class="flex flex-col">
                            <div class="flex flex-1 flex-col md:flex-row lg:flex-row mx-2">
                                <div class="mb-2 border-solid border-gray-300 rounded border shadow-sm w-full">
                                    <div class="bg-gray-200 px-2 py-3 border-solid border-gray-200 border-b">
                                        Shopping Cart
                                    </div>
                                    <div class="p-3">
                                        <table class="table-responsive w-full rounded">
                                            <tbody>
                                                <tr>
                                                    <td class="auto-style1">
                                                        <asp:GridView ID="ShoppingCart" AutoGenerateColumns="False" CssClass="table table-striped table-bordered text-center" runat="server">
                                                            <AlternatingRowStyle BackColor="White" />
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="ID">
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                    <HeaderStyle HorizontalAlign="Center" Width="15%" />
                                                                    <ItemTemplate>
                                                                        <%# Eval("ID") %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Image">
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                    <HeaderStyle HorizontalAlign="Center" Width="15%" />
                                                                    <ItemTemplate>
                                                                        <%# Eval("Image") %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Customized Image">
                                                                    <ItemTemplate>
                                                                        <%# Eval("CustomizeImage") %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Product">
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                    <HeaderStyle HorizontalAlign="Center" Width="100px" />
                                                                    <ItemTemplate>
                                                                        <%# Eval("Producto") %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Size">
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                    <HeaderStyle HorizontalAlign="Center" Width="15%" />
                                                                    <ItemTemplate>
                                                                        <%# Eval("Size") %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Quantity">
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                    <HeaderStyle HorizontalAlign="Center" Width="10%" />
                                                                    <ItemTemplate>
                                                                        <%# Eval("Quantity") %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Type of printing">
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                    <HeaderStyle HorizontalAlign="Center" Width="10%" />
                                                                    <ItemTemplate>
                                                                        <%# Eval("Face") %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Color">
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                    <HeaderStyle HorizontalAlign="Center" Width="10%" />
                                                                    <ItemTemplate>
                                                                        <%# Eval("Color") %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Price">
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                    <HeaderStyle HorizontalAlign="Center" Width="10%" />
                                                                    <ItemTemplate>
                                                                        <%# Eval("UnitPrice") %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Total">
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                    <HeaderStyle HorizontalAlign="Center" Width="15%" />
                                                                    <ItemTemplate>
                                                                        <%# "$" + Convert.ToDouble(Eval("Quantity")) * Convert.ToDouble(Eval("UnitPrice")) %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Delete">
                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                    <HeaderStyle HorizontalAlign="Center" Width="5%" />
                                                                    <ItemTemplate>
                                                                        <a href='35_deletefromcart.aspx?productId=<%# Eval("ProductId") %>&customizeId=<%# Eval("CustomizeId") %>' class="btn btn-danger btn-sm">Delete</a>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                        <div class="row">
                                                            <div class="col-sm-12 col-lg-11 col-md-11">
                                                                <asp:Label ID="Total" CssClass="form-label" runat="server" Text="" Font-Bold="True"></asp:Label>
                                                            </div>
                                                            <div class="col-sm-12 col-md-1 col-lg-1">
                                                                <asp:Button ID="CheckOut" CssClass="btn btn-primary custom-button" runat="server" Text="Buy with PayPal" OnClick="CheckOut_Click" />
                                                                <br />
                                                                <br />
                                                                <asp:Button ID="CheckOutToken" CssClass="btn btn-primary custom-button" runat="server" Text="Buy with Token" OnClick="CheckOutToken_Click" />
                                                            </div>
                                                        </div>

                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </main>
            </form>









            <footer class="footer">
                <div class="footer-middle">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-6 col-lg-3">
                                <div class="widget widget-about">
                                    <img src="img/logo.png" class="footer-logo" alt="Footer Logo" width="105" height="25">
                                    <p>Customize Art is a web site where you can customize your products whit your own style.</p>

                                    <div class="social-icons">
                                        <a href="https://www.instagram.com/customizeart24/" class="social-icon" target="_blank" title="Instagram"><i class="icon-instagram"></i></a>
                                    </div>
                                    <!-- End .soial-icons -->
                                </div>
                                <!-- End .widget about-widget -->
                            </div>
                            <!-- End .col-sm-6 col-lg-3 -->

                            <div class="col-sm-6 col-lg-3">
                                <div class="widget">
                                    <h4 class="widget-title">Useful Links</h4>
                                    <!-- End .widget-title -->

                                    <ul class="widget-list">
                                        <li><a href="09_About_Us.aspx">About Customize Art</a></li>
                                        <li><a href="https://www.instagram.com/customizeart24/">Contact us</a></li>
                                        <li><a>Or through our professional email: customizeart2024@gmail.com</a></li>
                                        <li><a href="01_Login.aspx">Log in</a></li>
                                    </ul>
                                    <!-- End .widget-list -->
                                </div>
                                <!-- End .widget -->
                            </div>
                            <!-- End .col-sm-6 col-lg-3 -->

                            <div class="col-sm-6 col-lg-3">
                                <div class="widget">
                                    <h4 class="widget-title">Customer Service</h4>
                                    <!-- End .widget-title -->

                                    <ul class="widget-list">
                                        <li><a href="07_Shoppingcart.aspx">Payment Methods</a></li>
                                        <li><a href="03_Clothes.aspx">Shopping</a></li>
                                    </ul>
                                    <!-- End .widget-list -->
                                </div>
                                <!-- End .widget -->
                            </div>
                            <!-- End .col-sm-6 col-lg-3 -->

                            <div class="col-sm-6 col-lg-3">
                                <div class="widget">
                                    <h4 class="widget-title">My Account</h4>
                                    <!-- End .widget-title -->

                                    <ul class="widget-list">
                                        <li><a href="01_Login.aspx">Log In</a></li>
                                        <li><a href="07_Shoppingcart.aspx">View Cart</a></li>
                                        <li><a href="#">Track My Order</a></li>
                                    </ul>
                                    <!-- End .widget-list -->
                                </div>
                                <!-- End .widget -->
                            </div>
                            <!-- End .col-sm-6 col-lg-3 -->
                        </div>
                        <!-- End .row -->
                    </div>
                    <!-- End .container -->
                </div>
                <!-- End .footer-middle -->

                <div class="footer-bottom">
                    <div class="container">
                        <p class="footer-copyright">Copyright © 2024 Customize Art Store. All customize service Reserved.</p>
                        <!-- End .footer-copyright -->
                    </div>
                    <!-- End .container -->
                </div>
                <!-- End .footer-bottom -->
            </footer>
            <!-- End .footer -->
    </div>
    <!-- End .page-wrapper -->
    <button id="scroll-top" title="Back to Top"><i class="icon-arrow-up"></i></button>

    <!-- Mobile Menu -->
    <div class="mobile-menu-overlay"></div>
    <!-- End .mobil-menu-overlay -->

    <div class="mobile-menu-container">
        <div class="mobile-menu-wrapper">
            <span class="mobile-menu-close"><i class="icon-close"></i></span>

            <%--<div action="#" method="get" class="mobile-search">
            <label for="mobile-search" class="sr-only">Search</label>
            <input type="search" class="form-control" name="mobile-search" id="mobile-search" placeholder="Search in..." required>
            <button class="btn btn-primary" type="submit"><i class="icon-search"></i></button>
        </div>--%>
            <div href="Default.aspx">
                <img src="img/logo2.png" class="centerlogo" alt="logo" width="82" height="20">
            </div>

            <nav class="mobile-nav">
                <ul class="mobile-menu">
                    <li class="active">
                        <a href="Default.aspx">Home</a>
                    </li>

                    <li>
                        <a href="#" class="sf-with-ul">Product</a>
                        <ul>
                            <li><a href="03_Clothes.aspx">Clothes</a></li>
                            <li><a href="04_Accesories.aspx"><span>Accesories<span class="tip tip-new">New</span></span></a></li>
                            <li><a href="05_Technology.aspx">Technology</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">Pages</a>
                        <ul>
                            <li>
                                <a href="09_About_Us.aspx">About Us</a>
                            </li>
                            <li>
                                <a href="01_Login.aspx">Login</a>

                            </li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <!-- End .mobile-nav -->

            <div class="social-icons">
                <a href="https://www.instagram.com/customizeart24" class="social-icon" target="_blank" title="Instagram"><i class="icon-instagram"></i></a>
            </div>
            <!-- End .social-icons -->
        </div>
        <!-- End .mobile-menu-wrapper -->
    </div>
    <!-- End .mobile-menu-container -->



    <!-- Plugins JS File -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/jquery.hoverIntent.min.js"></script>
    <script src="assets/js/jquery.waypoints.min.js"></script>
    <script src="assets/js/superfish.min.js"></script>
    <script src="assets/js/owl.carousel.min.js"></script>
    <script src="assets/js/bootstrap-input-spinner.js"></script>
    <!-- Main JS File -->
    <script src="assets/js/main.js"></script>
</body>


<!-- molla/cart.html  22 Nov 2019 09:55:06 GMT -->
</html>

