<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="39_ES_Sales_register.aspx.cs" Inherits="CustomizeArt._39_ES_Sales_register" %>

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
</head>
<body>
    <script>
        function VerificarFirma(input) {
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
        function VerificarNumero(e, field) {
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
                            <!--<a href="#">Usd</a>
                            <div class="header-menu">
                                <ul>
                                    <li><a href="#">Eur</a></li>
                                    <li><a href="#">Usd</a></li>
                                </ul>
                            </div>-->
                            <!-- End .header-menu -->
                        </div>
                        <!-- End .header-dropdown -->

                        <div class="header-dropdown">
                            <a href="#">Esp</a>
                            <div class="header-menu">
                                <ul>
                                    <li><a href="01_Login.aspx">Inglés</a></li>
                                    <li><a href="01_ES_Login.aspx">Español</a></li>
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
                                <a href="#">Enlaces</a>
                                <ul>
                                    <!--<li><a href="tel:#"><i class="icon-phone"></i>Llamar: +0123 456 789</a></li>-->
                                    <li><a href="09_ES_About_Us.aspx">Acerca de nosotros</a></li>
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

                        <a href="Default_Spanish.aspx" class="logo">
                            <img src="img/logo.png" alt="Molla Logo" width="105" height="25">
                        </a>

                        <nav class="main-nav">
                            <ul class="menu sf-arrows">
                                <li class="megamenu-container active">
                                    <a href="Default_Spanish.aspx">Inicio</a>
                                </li>
                                <li>
                                    <a href="#" class="sf-with-ul">Productos</a>

                                    <div class="megamenu megamenu-sm">
                                        <div class="row no-gutters">
                                            <div class="col-md-6">
                                                <div class="menu-col">
                                                    <div class="menu-title">Productos</div>
                                                    <!-- End .menu-title -->
                                                    <ul>
                                                        <li><a href="03_ES_Clothes.aspx">Ropa</a></li>
                                                        <li><a href="04_ES_Accesories.aspx"><span>Accesorios<span class="tip tip-new">Nuevo!</span></span></a></li>
                                                        <li><a href="05_ES_Technology.aspx">Tecnología</a></li>

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
                                                                Personaliza tu arte<br>
                                                                <span><strong>Productos</strong></span>
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
                                    <a href="#" class="sf-with-ul" f>Páginas</a>

                                    <ul>
                                        <li>
                                            <a href="09_ES_About_Us.aspx">Acerca de nosotros</a>
                                        </li>
                                        <li></li>
                                        <li><a href="01_ES_Login.aspx">Iniciar sesión</a></li>
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
                            <a href="07_ES_Shoppingcart.aspx" f>Carrito de compras</a>
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
                        <li class="breadcrumb-item"><a href="Default_Spanish.aspx">Inicio</a></li>
                        <li class="breadcrumb-item"><a href="#">Páginas</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Iniciar sesión</li>
                    </ol>
                </div>
                <!-- End .container -->
            </nav>
            <!-- End .breadcrumb-nav -->

            <asp:Literal ID="alerta" runat="server" Text=""></asp:Literal>

            <div class="login-page bg-image pt-8 pb-8 pt-md-12 pb-md-12 pt-lg-17 pb-lg-17" style="background-image: url('img/about_img_2_2.png')">
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
                                    <%----------------------------Iniciar sesión---------------------------%>
                                    <div>
                                        <div class="flex flex-1  flex-col md:flex-row lg:flex-row mx-2">
                                            <div class="mb-2 border-solid border-gray-300 rounded border shadow-sm w-full">
                                                <div class="bg-gray-200 px-2 py-3 border-solid border-gray-200 border-b">
                                                    <h5 class="mb-0">Ventas de usuario</h5>
                                                </div>
                                                <div class="card-body">
                                                    <asp:GridView ID="Sale" CssClass="table table-light table-striped table-hover table-bordered my-3" runat="server" OnSelectedIndexChanged="Sale_SelectedIndexChanged" OnRowDataBound="Sale_RowDataBound"></asp:GridView>
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
                                    <a href="#">Enlaces</a>
                                    <ul>
                                    </ul>
                                </li>
                            </ul>
                            <!-- End .top-menu -->

                            <!-- End .form-footer -->
                        </div>
                        <!-- End .tab-pane -->
                    </div>
                    <!-- End .form-box -->
                </div>
                <!-- End .container -->
            </div>
            <!-- End .login-page -->

            <footer class="footer">
                <div class="footer-middle">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-6 col-lg-3">
                                <div class="widget widget-about">
                                    <img src="img/logo.png" class="footer-logo" alt="Footer Logo" width="105" height="25">
                                    <p>Customize Art es un sitio web donde puedes personalizar tus productos con tu propio estilo.</p>

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
                                    <h4 class="widget-title">Enlaces útiles</h4>
                                    <!-- End .widget-title -->

                                    <ul class="widget-list">
                                        <li><a href="09_ES_About_Us.aspx">Acerca de Customize Art</a></li>
                                        <li><a href="https://www.instagram.com/customizeart24/">Contacto</a></li>
                                        <li><a>O a través de nuestro correo electrónico profesional: customizeart2024@gmail.com</a></li>
                                        <li><a href="01_ES_Login.aspx">Iniciar sesión</a></li>
                                    </ul>
                                    <!-- End .widget-list -->
                                </div>
                                <!-- End .widget -->
                            </div>
                            <!-- End .col-sm-6 col-lg-3 -->

                            <div class="col-sm-6 col-lg-3">
                                <div class="widget">
                                    
                                    <!-- End .widget-title -->

                                   
                                <!-- End .widget -->
                            </div>
                            <!-- End .col-sm-6 col-lg-3 -->

                            <div class="col-sm-6 col-lg-3">
                                <div class="widget">
                                  
                                    <!-- End .widget-title -->

                                   

                                   
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
                        <p class="footer-copyright">Copyright 2024 Customize Art. Todos los derechos reservados.</p>
                        <!-- End .footer-copyright -->

                        
                        <!-- End .footer-menu -->
                    </div>
                    <!-- End .container -->
                </div>
                <!-- End .footer-bottom -->
            </footer>
            <!-- End .footer -->

            <!-- Start of LiveChat (www.livechatinc.com) code -->
            <script type="text/javascript">
                window.__lc = window.__lc || {};
                window.__lc.license = 1234567;
                (function () {
                    var lc = document.createElement('script');
                    lc.type = 'text/javascript';
                    lc.async = true;
                    lc.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'cdn.livechatinc.com/tracking.js';
                    var s = document.getElementsByTagName('script')[0];
                    s.parentNode.insertBefore(lc, s);
                })();
            </script>
            <!-- End of LiveChat code -->

            <!-- Start of Google Analytics code -->
            <script>
                (function (i, s, o, g, r, a, m) {
                    i['GoogleAnalyticsObject'] = r;
                    i[r] = i[r] || function () {
                        (i[r].q = i[r].q || []).push(arguments)
                    }, i[r].l = 1 * new Date();
                    a = s.createElement(o),
                        m = s.getElementsByTagName(o)[0];
                    a.async = 1;
                    a.src = g;
                    m.parentNode.insertBefore(a, m)
                })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

                ga('create', 'UA-1234567-1', 'auto');
                ga('send', 'pageview');
            </script>
            <!-- End of Google Analytics code -->

        </main>
        <!-- End .main -->

    </div>
    <!-- End .page-wrapper -->

</body>
</html><!-- molla/login.html  22 Nov 2019 10:04:03 GMT -->
