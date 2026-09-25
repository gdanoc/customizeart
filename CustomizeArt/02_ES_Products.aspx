<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="02_ES_Products.aspx.cs" Inherits="CustomizeArt._02_ES_Products" %>

<!DOCTYPE html>
<html lang="en">


<!-- molla/category-2cols.html  22 Nov 2019 10:02:52 GMT -->
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Products - Customize Art</title>
    <meta name="keywords" content="HTML5 Template">
    <meta name="description" content="Customize Art">
    <meta name="author" content="p-themes">
    <!-- Favicon -->
    <link rel="apple-touch-icon" sizes="180x180" href="img/logo2.png">
    <link rel="icon" type="image/png" sizes="32x32" href="img/logo2.png">
    <link rel="icon" type="image/png" sizes="16x16" href="img/logo2.png">
    <link rel="manifest" href="img/logo2.png">
    <link rel="mask-icon" href="img/logo2.png" color="#666666">
    <link rel="shortcut icon" href="img/logo2.png">
    <meta name="apple-mobile-web-app-title" content="Molla">
    <meta name="application-name" content="Customizeart logo">
    <meta name="msapplication-TileColor" content="#cc9966">
    <meta name="msapplication-config" content="assets/images/icons/browserconfig.xml">
    <meta name="theme-color" content="#ffffff">
    <link rel="stylesheet" href="assets/css/plugins/owl-carousel/owl.carousel.css">
    <link rel="stylesheet" href="assets/css/plugins/magnific-popup/magnific-popup.css">
    <!-- Plugins CSS File -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <!-- Main CSS File -->
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/plugins/nouislider/nouislider.css">

</head>

<body>

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
                                                    <div class="banner-title text-white">Customize Art<br><span><strong>Productos</strong></span></div><!-- End .banner-title -->
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
</header><!-- End .header -->

        <main class="main">
        	<div class="page-header text-center" style="background-image: url('assets/images/page-header-bg.jpg')">
        		<div class="container">
        			<h1 class="page-title">Productos<span>Lista de productos</span></h1>
                                    <!-- Indicators -->
<ul class="carousel-indicators">
    <asp:Literal ID="Literal1" Text="" runat="server"></asp:Literal>
</ul>
<!-- The slideshow -->
<div class="carousel-inner">
    <asp:Literal ID="Literal2" Text="" runat="server"></asp:Literal>
</div>
        		</div><!-- End .container -->
        	</div><!-- End .page-header -->
            <nav aria-label="breadcrumb" class="breadcrumb-nav mb-2">
                <div class="container">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="01_ES_Login.aspx">Inicio de Sesión</a></li>
                    </ol>
                </div><!-- End .container -->
            </nav><!-- End .breadcrumb-nav -->

            <div class="page-content">
                <div class="container">
                	<div class="row">
                		<div class="col-lg-9">
                			<div class="toolbox">
                				<div class="toolbox-left">
                					<div class="toolbox-info">
                						
                					</div><!-- End .toolbox-info -->
                                                                            <section class="single_product_list">
    <div class="carousel-inner">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div id="demo" class="carousel slide" data-ride="carousel" data-interval="6000">
                        <!-- Indicators -->
                        <ul class="carousel-indicators">
                            <asp:Literal ID="IndicatorsLiteral" Text="" runat="server"></asp:Literal>
                        </ul>
                        <!-- The slideshow -->
                        <div class="carousel-inner">
                            <asp:Literal ID="ImagesLiteral" Text="" runat="server"></asp:Literal>
                        </div>
                        <!-- Left and right controls -->
                        <a class="carousel-control-prev" href="#demo" data-slide="prev">
                            <span class="carousel-control-prev-icon"></span>
                        </a>
                        <a class="carousel-control-next" href="#demo" data-slide="next">
                            <span class="carousel-control-next-icon"></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</section>
                				</div><!-- End .toolbox-left -->

                				
                			</div><!-- End .toolbox -->

                             <section class="product_list section_padding">
     <div class="container">
         <div class="row">
             <div class="col-md-4">
                 <div class="product_sidebar">
                     <div class="single_sedebar">
                         <form action="#">
                         </form>
                     </div>
                 </div>
             </div>
         </div>
     </div>
     <div class="col-lg-12 col-sm-12">
    
         <div class="row">
             <asp:Literal ID="ProductsLiteral" runat="server"></asp:Literal>
         </div>
     </div>
      
     <asp:Literal ID="alerta" runat="server" Text=""></asp:Literal>
 </section>

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

                        <ul class="widget-list">
                            <li><a href="07_ES_Shoppingcart.aspx">Carrito de Compra</a></li>
<li><a href="#">Productos</a></li>
                        </ul>
                        <!-- End .widget-list -->
                    </div>
                    <!-- End .widget -->
                </div>
                <!-- End .col-sm-6 col-lg-3 -->

                <div class="col-sm-6 col-lg-3">
                   
                        
                        <!-- End .widget-title -->

                        <ul class="widget-list">
                            <li><a href="01_ES_Login.aspx">Iniciar sesión</a></li>
                           
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
</footer><!-- End .footer -->
    </div><!-- End .page-wrapper -->
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
</div><!-- End .mobile-menu-container -->

 

    <!-- Plugins JS File -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/jquery.hoverIntent.min.js"></script>
    <script src="assets/js/jquery.waypoints.min.js"></script>
    <script src="assets/js/superfish.min.js"></script>
    <script src="assets/js/owl.carousel.min.js"></script>
    <script src="assets/js/bootstrap-input-spinner.js"></script>
    <script src="assets/js/jquery.magnific-popup.min.js"></script>
    <script src="assets/js/wNumb.js"></script>
    <script src="assets/js/nouislider.min.js"></script>
    <!-- Main JS File -->
    <script src="assets/js/main.js"></script>
</body>


<!-- molla/category-2cols.html  22 Nov 2019 10:02:52 GMT -->
</html>
