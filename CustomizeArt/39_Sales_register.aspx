<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="39_Sales_register.aspx.cs" Inherits="CustomizeArt._39_Sales_register" %>

<%@ Import Namespace="MySql.Data.MySqlClient" %>
<!DOCTYPE html>
<html lang="en">


<!-- molla/login.html  22 Nov 2019 10:04:03 GMT -->
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Sales Register - Customize Art</title>
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
    <script src="SweetAlert/sweetalert2.all.min.js"></script>
    <script src="SweetAlert/sweetalert2.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style type="text/css">
        .auto-style1 {
            height: 24px;
        }

        .auto-style2 {
            height: 25px;
        }
    </style>
    <style>
        .center-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 10px; /* Ajusta según tus necesidades */
        }
    </style>
    <style>
        .map-container {
            width: 100%;
            max-width: 1200px;
            margin: 40px auto;
        }

        #map {
            display: flex;
            flex-direction: column;
            align-items: center;
            background: #f0f2f5;
            padding: 20px 0;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

            #map p {
                font-size: 1.5em;
                margin: 10px 0;
                font-weight: bold;
            }

        .login-page {
            background-image: url('img/checkout.png');
            background-size: contain; /* Asegura que la imagen cubra todo el fondo */
            background-position: center center; /* Centra la imagen */
            background-repeat: no-repeat; /* Evita que la imagen se repita */
        }
    </style>

</head>

<body>
    <script>
        function SignCheck(input) {
            var regex = /^[a-zA-Z0-9]*$/; // Expresión regular que permite solo letras y números
            var valido = regex.test(input.value);
            if (!valido) {
                alert("Solo se permiten números y letras, sin signos ni espacios.");
                input.value = input.value.replace(/[^a-zA-Z0-9]/g, ''); // Eliminar caracteres no permitidos
            }
        }
 </script>
    <script type="text/javascript">
        function validar(e) { // 1
            tecla = (document.all) ? e.keyCode : e.which; // 2
            if (tecla == 8) return true; // 3
            patron = /[A-Za-z\s]/; // 4
            te = String.fromCharCode(tecla); // 5
            return patron.test(te); // 6
        }
 </script>
    <script type="text/javascript">
        function numeros(nu) { // 1
            tecla = (document.all) ? e.keyCode : e.which; // 2
            if (tecla == 8) return true; // 3
            ppatron = /\d/; // Solo acepta números// 4
            te = String.fromCharCode(tecla); // 5
            return patron.test(te); // 6
        }
 </script>

    <script>
        function NumCheck(e, field) {
            var key = e.keyCode ? e.keyCode : e.which;
            if (key == 8) return true;
            if (key >= 48 && key <= 57) return true;
            if (key == 46) {
                if (field.value.DefaultOf('.') == -1) return true;
                else return false;
            }
            return false;
        }
 </script>
    <script type="text/javascript">
        function toggleRegisterButton() {
            var registerButton = document.getElementById("registerButton");
            var policyCheckbox = document.getElementById("register-policy-2");
            var policyAcceptedField = document.getElementById("policyAccepted");

            if (policyCheckbox.checked) {
                registerButton.disabled = false;
                policyAcceptedField.value = "true";
            } else {
                registerButton.disabled = true;
                policyAcceptedField.value = "false";
            }
        }
    </script>
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
                                                    <a href="#">
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
            <nav aria-label="breadcrumb" class="breadcrumb-nav border-0 mb-0">
                <div class="container">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Pages</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Login</li>
                    </ol>
                </div>
                <!-- End .container -->
            </nav>
            <!-- End .breadcrumb-nav -->

            <asp:Literal ID="alerta" runat="server" Text=""></asp:Literal>

            <div class="login-page bg-image pt-8 pb-8 pt-md-12 pb-md-12 pt-lg-17 pb-lg-17" style="background-image: url('img/checkout.png')">
                <div class="container">
                    <div class="form-box">
                        <div class="form-tab">
                            <ul class="nav nav-pills nav-fill" role="tablist">
                                <li class="nav-item"></li>
                                <li class="nav-item"></li>
                            </ul>
                            <form runat="server" action="#">
                                <asp:ScriptManager ID="ScriptManager1" runat="server" />
                                <div class="tab-content">
                                    <%---------------------------- Table ---------------------------%>
                                    <div>
                                        <div class="flex flex-1  flex-col md:flex-row lg:flex-row mx-2">
                                            <div class="mb-2 border-solid border-gray-300 rounded border shadow-sm w-full">
                                                <div class="bg-gray-200 px-2 py-3 border-solid border-gray-200 border-b">
                                                    <h5 class="mb-0">User Sales</h5>
                                                </div>
                                                <div class="card-body">
                                                    <asp:GridView ID="Sale" CssClass="table table-light table-striped table-hover table-bordered my-3" runat="server" AutoGenerateColumns="False" OnRowDataBound="Sale_RowDataBound">
                                                        <Columns>
                                                            <asp:BoundField DataField="Id" HeaderText="Id" />
                                                            <asp:BoundField DataField="Product" HeaderText="Product" />
                                                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                                                            <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" />
                                                            <asp:BoundField DataField="Total" HeaderText="Total" />
                                                            <asp:BoundField DataField="Status" HeaderText="Status" />
                                                            <asp:BoundField DataField="Fecha" HeaderText="Fecha" />
                                                            <asp:TemplateField HeaderText="Image">
                                                                <ItemTemplate>
                                                                    <asp:Literal ID="ImageLiteral" runat="server"></asp:Literal>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                    <asp:GridView ID="Sales" CssClass="table table-striped table-hover table-bordered" runat="server"></asp:GridView>
                                                </div>
                                            </div>
                                        </div>
                                        <editrowstyle backcolor="#2461BF" />
                                        <footerstyle backcolor="#507CD1" font-bold="True" forecolor="White" />
                                        <headerstyle backcolor="#507CD1" font-bold="True" forecolor="White" />
                                        <pagerstyle backcolor="#2461BF" forecolor="White" horizontalalign="Center" />
                                        <rowstyle backcolor="#EFF3FB" />
                                        <selectedrowstyle backcolor="#D1DDF1" font-bold="True" forecolor="#333333" />
                                        <sortedascendingcellstyle backcolor="#F5F7FB" />
                                        <sortedascendingheaderstyle backcolor="#6D95E1" />
                                        <sorteddescendingcellstyle backcolor="#E9EBEF" />
                                        <sorteddescendingheaderstyle backcolor="#4870BE" />
                                    </div>
                                    <%--End table--%>

                                    <asp:Literal ID="Literal1" runat="server" Text=""></asp:Literal>
                                </div>
                            </form>
                            <ul class="top-menu top-link-menu">
                                <li>
                                    <a href="#">Links</a>
                                    <ul>
                                    </ul>
                                </li>
                            </ul>
                            <!-- End .top-menu -->

                            <!-- End .form-footer -->
                        </div>
                        <!-- .End .tab-pane -->
                    </div>

                    <!-- End .tab-content -->
                </div>

                <!-- End .form-tab -->
            </div>
            <!-- End .form-box -->
    </div>
    <!-- End .main -->
    <div id="map" class="animate__animated animate__fadeInUp">
        <p><strong>Where can I pick up my products?</strong></p>
        <h3>right here</h3>
        <div class="map-container">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3876.672116687657!2d-89.28994862462913!3d13.67769069900445!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8f632efe53778fb3%3A0x21f34da7f1473fd3!2sColegio%20Salesiano%20Santa%20Cecilia!5e0!3m2!1ses!2ssv!4v1721312493373!5m2!1ses!2ssv" width="100%" height="700" style="border: 0;" allowfullscreen="true" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
    </div>

    <footer class="footer">
        <div class="footer-middle">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-lg-3">
                        <div class="widget widget-about">
                            <img src="img/logo.png" class="footer-logo" alt="Footer Logo" width="105" height="25">


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

                            <!-- End .widget-title -->


                            <!-- End .widget-list -->
                        </div>
                        <!-- End .widget -->
                    </div>
                    <!-- End .col-sm-6 col-lg-3 -->

                    <div class="col-sm-6 col-lg-3">
                        <div class="widget">

                            <!-- End .widget-title -->

                            <!-- End .widget-list -->
                        </div>
                        <!-- End .widget -->
                    </div>
                    <!-- End .col-sm-6 col-lg-3 -->

                    <div class="col-sm-6 col-lg-3">
                        <div class="widget">

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

        <!-- Log in / Register Modal -->

        <!-- End .form-group -->


        <!-- End .form-group -->

        <div class="form-footer">



            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="register-policy" required>
                <label class="custom-control-label" for="register-policy">I agree to the <a href="#">privacy policy</a> *</label>
            </div>

            <!-- End .custom-checkbox -->
        </div>
        <!-- End .form-footer -->
        <div class="form-choice">
            <div class="">
                <div class="col-sm-6">


                    <!-- End .col-6 -->
                    <div class="col-sm-6">
                    </div>
                    <!-- End .col-6 -->
                </div>
                <!-- End .row -->
            </div>
            <!-- End .form-choice -->
        </div>
        <!-- .End .tab-pane -->
    </div>
    <!-- End .tab-content -->

    <!-- Plugins JS File -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/jquery.hoverIntent.min.js"></script>
    <script src="assets/js/jquery.waypoints.min.js"></script>
    <script src="assets/js/superfish.min.js"></script>
    <script src="assets/js/owl.carousel.min.js"></script>
    <!-- Main JS File -->
    <script src="assets/js/main.js"></script>
    <!-- SweetAlert File -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
</body>

<!-- molla/login.html  22 Nov 2019 10:04:03 GMT -->
</html>


