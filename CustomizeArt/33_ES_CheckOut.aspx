<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="33_ES_CheckOut.aspx.cs" Inherits="CustomizeArt._33_ES_CheckOut" %>

<!DOCTYPE html>
<html lang="en">


<!-- molla/login.html  22 Nov 2019 10:04:03 GMT -->
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Proceso de Compra - Customize Art</title>
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
</head>
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
<body>
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

    <style>
        .centerlogo {
    display: block;
    margin-left: auto;
    margin-right: auto;
}
    </style>

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
                            <a href="#">ES</a>
                            <div class="header-menu">
                                <ul>
                                    
<li><a href="01_Login.aspx">Inglés</a></li>
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
                                    <li><a href="09_ES_About_Us.aspx">Sobre Nosotros</a></li>
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
                                                    <div class="menu-title">Products</div><!-- End .menu-title -->
                                                    <ul>
                                                        <li><a href="03_ES_Clothes.aspx">Ropa</a></li>
                                                        <li><a href="04_ES_Accesories.aspx"><span>Accesorios<span class="tip tip-new">New!</span></span></a></li>
                                                        <li><a href="05_ES_Technology.aspx">Tecnología</a></li>
                                                       
                                                    </ul>
                                                </div><!-- End .menu-col -->
                                            </div><!-- End .col-md-6 -->

                                            <div class="col-md-6">
                                                <div class="banner banner-overlay">
                                                    <a href="#">
                                                        <img src="img/logo2.png" alt="Banner">

                                                        <div class="banner-content banner-content-bottom">
                                                            <div class="banner-title text-white">Customize Art<br><span><strong>ProductOs</strong></span></div><!-- End .banner-title -->
                                                        </div><!-- End .banner-content -->
                                                    </a>
                                                </div><!-- End .banner -->
                                            </div><!-- End .col-md-6 -->
                                        </div><!-- End .row -->
                                    </div><!-- End .megamenu megamenu-sm -->
                                </li>
                                <li>
                                    <a href="#" class="sf-with-ul"f>Pages</a>

                                    <ul>
                                        <li>
                                            <a href="09_About_Us.aspx">About</a>
                                        </li>
                                        <li>
                                        
                                        </li>
                                        <li><a href="01_Login.aspx">Login</a></li>
                                    </ul>
                                </li>
                                <li>
                                   
                                    
                                <li>
                                   
                                </li>
                            </ul><!-- End .menu -->
                        </nav><!-- End .main-nav -->
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
                            <a href="07_ES_Shoppingcart.aspx" f>Carrito de Compra</a>
                            <!-- End .dropdown-menu -->
                        </div>
                        <!-- End .cart-dropdown -->
                    </div>
                    <!-- End .header-right -->
                </div>
                <!-- End .container -->
            </div>
            <!-- End .header-middle -->
        </header><!-- End .header -->

        <main class="main">
            <nav aria-label="breadcrumb" class="breadcrumb-nav border-0 mb-0">
                <div class="container">
                    <ol class="breadcrumb">
                       
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
                           </ul>
                           <form runat="server" action="#">
                               <div class="tab-content">
                                   <%----------------------------Log in---------------------------%>
                                   <section class="login_part section_padding ">
   
                <div class="login_part_text text-center">
                    <div class="login_part_text_iner">
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="login_part_form">
                    <div class="login_part_form_iner">
                        <h3>Proceso de Compra</h3>
                        <form class="row contact_form" action="#" method="post" novalidate="novalidate">
                                 <asp:TextBox ID="txtcuenta" runat="server" placeholder="Usuario..." onkeypress="return SignCheck(this)" type="text" class="form-control" />
                                 <asp:Button runat="server" Text="Proceso de Compra" CssClass="btn_3" OnClick="Buy_Click"></asp:Button>
                            </div>
                           
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
                                    <!-- .End .tab-pane -->
                                                        </div>
                    </form>
                    <!-- End .tab-content -->
                </div>
                <!-- End .form-tab -->
            </div>
            <!-- End .form-box -->
        </div>
        <!-- End .container -->
    </div>

    <!-- End .login-page section-bg -->
</main>
        <!-- End .main -->

        <footer class="footer">
    <div class="footer-middle">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-lg-3">
                    <div class="widget widget-about">
                        <img src="img/logo.png" class="footer-logo" alt="Footer Logo" width="105" height="25">
                        <p>CustomizeArt es un sitio web en el que puedes personalizar tus productos con tu propio estilo.</p>

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
                            <li><a href="https://www.instagram.com/customizeart24/">Contáctanos</a></li>
                            <li><a >O a nuestro email personal: customizeart2024@gmail.com</a></li>
                            <li><a href="01_ES_Login.aspx">Inicio de Sesión</a></li>
                        </ul>
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
                      
                        <!-- End .widget-title -->

                        <ul class="widget-list">
                           
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
            <p class="footer-copyright">Copyright © 2024 Customize Art. Todos los derechos reservados.</p>
            <!-- End .footer-copyright -->
        </div>
        <!-- End .container -->
    </div>
    <!-- End .footer-bottom -->
</footer>
        <!-- End .footer -->
    </div>
    <!-- End .page-wrapper -->
   

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
        <div href="Default_Spanish.aspx">
            <img src="img/logo2.png" class="centerlogo" alt="logo" width="82" height="20">
        </div>

        <nav class="mobile-nav">
            <ul class="mobile-menu">
                <li class="active">
                    <a href="Default_Spanish.aspx">Página Principal</a>
                </li>

                <li>
                    <a href="#" class="sf-with-ul">Productos</a>
                    <ul>
                        <li><a href="03_ES_Clothes.aspx">Ropa</a></li>
                        <li><a href="04_ES_Accesories.aspx"><span>Accesorios<span class="tip tip-new">Nuevo</span></span></a></li>
                        <li><a href="05_ES_Technology.aspx">Technología</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">Pages</a>
                    <ul>
                        <li>
                            <a href="09_ESAbout_Us.aspx">Sobre nosotros</a>
                        </li>
                        <li>
                            <a href="01_ES_Login.aspx">Inicio de Sesión</a>

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

    <!-- Log in / Register Modal -->
    <div class="modal fade" id="signin-modal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true"><i class="icon-close"></i></span>
                    </button>

                  
                                        <!-- End .form-group -->

                                       
                                        <!-- End .form-group -->

                                       

                                            
                                            <!-- End .custom-checkbox -->

                                           
                                        </div>
                                        <!-- End .form-footer -->
                                    </form>
                                   
                                            <!-- End .col-6 -->
                                           
                                            <!-- End .col-6 -->
                                        </div>
                                        <!-- End .row -->
                                    </div>
                                    <!-- End .form-choice -->
                                </div>
                                <!-- .End .tab-pane -->
                              
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
                        </div>
                        <!-- End .form-tab -->
                    </div>
                    <!-- End .form-box -->
                </div>
                <!-- End .modal-body -->
            </div>
            <!-- End .modal-content -->
        </div>
        <!-- End .modal-dialog -->
    </div>
    <!-- End .modal -->

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
