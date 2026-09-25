<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="01_ES_Login.aspx.cs" Inherits="CustomizeArt._01_ES_Login" %>

<!DOCTYPE html>
<html lang="es">

<!-- molla/login.html  22 Nov 2019 10:04:03 GMT -->
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Iniciar sesión - Customize Art</title>
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
       <script type="text/javascript">
           function validar(e) { // 1
               tecla = (document.all) ? e.keyCode : e.which; // 2
               if (tecla == 8) return true; // 3
               patron = /[A-Za-z\s]/; // 4
               te = String.fromCharCode(tecla); // 5
               return patron.test(te); // 6
           }
       </script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>
<script>
    $('.phone_with_ddd').mask('0000-0000');
</script>
<%--   <%-- MASCARA PARA TELEFONO --%>
<script>
    $(document).ready(function () {
        $('#<%= txtTelefono.ClientID %>').mask('0000-000');
    });
</script>   
    <div class="page-wrapper">
        <header class="header">
    <div class="header-top">
        <div class="container">
            <div class="header-left">
                <div class="header-dropdown">
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
                            
                            <li><a href="09_ES_About_Us.aspx">Sobre nosotros</a></li>
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
                                            <div class="menu-title">Productos</div><!-- End .menu-title -->
                                            <ul>
                                                <li><a href="03_ES_Clothes.aspx">Ropa</a></li>
                                                <li><a href="04_ES_Accesories.aspx"><span>Accesorios<span class="tip tip-new">¡Nuevo!</span></span></a></li>
                                                <li><a href="05_ES_Technology.aspx">Tecnología</a></li>
                                               
                                            </ul>
                                        </div><!-- End .menu-col -->
                                    </div><!-- End .col-md-6 -->

                                    <div class="col-md-6">
                                        <div class="banner banner-overlay">
                                            <a href="#">
                                                <img src="img/logo2.png" alt="Banner">

                                                <div class="banner-content banner-content-bottom">
                                                    <div class="banner-title text-white">Customize Art<br><span><strong>Products</strong></span></div><!-- End .banner-title -->
                                                </div><!-- End .banner-content -->
                                            </a>
                                        </div><!-- End .banner -->
                                    </div><!-- End .col-md-6 -->
                                </div><!-- End .row -->
                            </div><!-- End .megamenu megamenu-sm -->
                        </li>
                        <li>
                            <a href="#" class="sf-with-ul"f>Páginas</a>

                            <ul>
                                <li>
                                    <a href="09_ES_About_Us.aspx">Sobre nosotros</a>
                                </li>
                                <li>
                                
                                </li>
                                <li><a href="01_ES_Login.aspx">Sesión</a></li>
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
                        <li class="breadcrumb-item"><a href="Default_Spanish.aspx">Menú</a></li>
                        <li class="breadcrumb-item"><a href="#">Páginas</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Sesión</li>
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
                        <li class="nav-item">
                            <a class="nav-link" id="signin-tab-2" data-toggle="tab" href="#signin-2" role="tab" aria-controls="signin-2" aria-selected="false">Iniciar sesión</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" id="register-tab-2" data-toggle="tab" href="#register-2" role="tab" aria-controls="register-2" aria-selected="true">Registrarse</a>
                        </li>
                    </ul>
                    <form runat="server" action="#">
                        <div class="tab-content">
                            <%----------------------------Log in---------------------------%>
                            <div class="tab-pane fade" id="signin-2" role="tabpanel" aria-labelledby="signin-tab-2">

                                <div class="col-md-12 form-group p_star">
                                    <label for="singin-email-2">Nombre de usuario o dirección de correo electrónico </label>
                                    <asp:TextBox ID="TxtUsuario" runat="server" placeholder="Usuario..." type="text" class="form-control" onpaste="return false" minlength="4" MaxLength="250" onkeypress="return SignCheck(this)" />
                                </div>
                                <!-- End .form-group -->

                                <div class="col-md-12 form-group p_star">
                                    <label for="singin-password-2">Contraseña </label>
                                    <asp:TextBox ID="Txtpassword" runat="server" placeholder="Contraseña..." type="password" class="form-control" onpaste="return false" minlength="8" MaxLength="250" />
                                </div>
                                <!-- End .form-group -->

                                <div class="form-footer">
                                    <asp:Button runat="server" Text="Iniciar sesión" margin-top="50px" CssClass="btn btn-outline-primary-2" OnClick="LogIn_Click"></asp:Button>
                                    <%--<button type="submit" class="btn btn-outline-primary-2">
	                					<span>INICIAR SESIÓN</span>
	            						<i class="icon-long-arrow-right"></i>
	                				</button>--%>

                                    <div class="custom-control custom-checkbox">
                                       
                                    </div>
                                    <!-- End .custom-checkbox -->

                                    <a href="10_ES_forgotpassword.aspx" class="forgot-linK">¿Olvidó su contraseña?</a>
                                </div>
                                <!-- End .form-footer -->
                                <!-- End .form-choice -->
                            </div>
                            <!-- .End .tab-pane -->
                            <%----------------------------Register---------------------------%>
                            <div class="tab-pane fade show active" id="register-2" role="tabpanel" aria-labelledby="register-tab-2">
                              
                                <div class="form-group">
                                    <label for="register-email-2">Tu nombre </label>
                                    <asp:TextBox ID="txtfirst" runat="server" placeholder="Nombres..." type="text" class="form-control" onpaste="return false" minlength="4" MaxLength="30" onkeypress="return validar(event)"></asp:TextBox>
                                </div>
                                <!-- End .form-group -->

                                <div class="form-group">
                                    <label for="register-password-2">Tu apellido </label>
                                    <asp:TextBox ID="txtapellido" runat="server" placeholder="Apellidos..." type="text" class="form-control" onpaste="return false" minlength="4" MaxLength="30" onkeypress="return validar(event)"></asp:TextBox>
                                </div>
                                <!-- End .form-group -->
                                <div class="form-group">
                                    <label for="register-password-2">Tu nombre de usuario </label>
                                    <asp:TextBox ID="txtusuarioR" runat="server" placeholder="Usuario..." type="text" class="form-control" onpaste="return false" minlength="7" MaxLength="15" onkeypress="return SignCheck(this)"  />
                                </div>
                                <!-- End .form-group -->
                                        <div class="form-group">
                                    <label for="register-password-2">Tu contraseña </label>
                                    <asp:TextBox ID="txtclave" runat="server" placeholder="Contraseña..." type="password" class="form-control" onpaste="return false" minlength="8" MaxLength="25" />
                                </div>
                                <!-- End .form-group -->
                                <div class="form-group">
                                    <label for="register-password-2">Repite contraseña </label>
                                    <asp:TextBox ID="txtconfirm" runat="server" placeholder="Repite contraseña..." type="password" class="form-control" onpaste="return false" minlength="8" MaxLength="25" />
                                </div>
                                <!-- End .form-group -->
                                <div class="form-group">
                                    <label for="register-password-2">Tu correo electrónico </label>
                                    <asp:TextBox ID="txtgmail" runat="server" placeholder="Correo electrónico..." type="email" class="form-control" onpaste="return false" minlength="10" MaxLength="50" />
                                </div>
                                <div style="margin-top: 20px;">
                                    <label for="register-password-2">Tu fecha de nacimiento </label>
                                    <asp:TextBox ID="txtfecha" runat="server" placeholder="Fecha de nacimiento..." type="date" CssClass="form-control" onpaste="return false" minlength="5" MaxLength="15" />
                                </div>
                                <div class="form-group">
                                    <label for="register-password-2">Tu número de teléfono </label>
                                    <asp:TextBox ID="txtTelefono" runat="server" placeholder="Número de teléfono..." type="text" class="form-control phone_with_ddd" onpaste="return false" minlength="8" MaxLength="8" autocomplete="off" onkeypress="return NumCheck(event, this)" onkeypress2="return mask(this)" /> 
                                </div>
                                <!-- End .form-group -->
                                <!-- End .form-group -->
                                <div class="form-footer">
                                    <asp:Button runat="server" Text="Registrarse" CssClass="btn btn-outline-primary-2" OnClick="SingUp_Click" ID="registerButton"></asp:Button>
                                    <div class="custom-control custom-checkbox">
                                        <input type="hidden" id="policyAccepted" name="policyAccepted" value="false" />
                                        <input type="checkbox" class="custom-control-input" id="register-policy-2" onchange="toggleRegisterButton()">
                                        <label class="custom-control-label" for="register-policy-2">Acepto la <a href="#">política de privacidad</a> *</label>
                                    </div>
                                </div>
                                <!-- End .form-footer -->
                            </div>
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
                            <li><a href="09_About_Us.aspx">Acerca de Customize Art</a></li>
                            <li><a href="https://www.instagram.com/customizeart24/">Contáctenos</a></li>
<li><a >O por medio de nuestro correo profesional: customizeart2024@gmail.com</a></li>
                            <li><a href="01_ES_Login.aspx">Iniciar sesión</a></li>
                        </ul>
                        <!-- End .widget-list -->
                    </div>
                    <!-- End .widget -->
                </div>
                <!-- End .col-sm-6 col-lg-3 -->

               
                        <!-- End .widget-title -->

                       
                        <!-- End .widget-list -->
                    </div>
                    <!-- End .widget -->
                </div>
                <!-- End .col-sm-6 col-lg-3 -->

               
                        <!-- End .widget-title -->

                        <ul class="widget-list">
                            <li><a href="01_ES_Login.aspx">Iniciar sesión</a></li>
                            <li><a href="07_ES_ShoppingCart.aspx">Ver carrito</a></li>
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
            <p class="footer-copyright">Copyright © 2024 Customize Art Store. Todos los derechos reservados.</p>
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
        <div href="Default_Spanish.aspx">
            <img src="img/logo2.png" class="centerlogo" alt="logo" width="82" height="20">
        </div>

        <nav class="mobile-nav">
            <ul class="mobile-menu">
                <li class="active">
                    <a href="Default_Spanish.aspx">Inicio</a>
                </li>

                <li>
                    <a href="#" class="sf-with-ul">Productos</a>
                    <ul>
                        <li><a href="03_ES_Clothes.aspx">Ropa</a></li>
                        <li><a href="04_ES_Accesories.aspx"><span>Accesorios<span class="tip tip-new">Nuevo</span></span></a></li>
                        <li><a href="05_ES_Technology.aspx">Tecnología</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">Páginas</a>
                    <ul>
                        <li>
                            <a href="09_ES_About_Us.aspx">Sobre nosotros</a>
                        </li>
                        <li>
                            <a href="01_ES_Login.aspx">Iniciar sesión</a>

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
    <!-- Main JS File -->
    <script src="assets/js/main.js"></script>
    <!-- SweetAlert File -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
</body>


<!-- molla/login.html  22 Nov 2019 10:04:03 GMT -->
</html>
