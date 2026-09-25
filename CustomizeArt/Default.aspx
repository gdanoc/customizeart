<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CustomizeArt.Default" %>

<!DOCTYPE html>
<html lang="en">


<!-- molla/index-6.html  22 Nov 2019 09:56:18 GMT -->
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Index - Customize Art</title>
    <meta name="keywords" content="Customize Art">
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
    <link rel="stylesheet" href="assets/vendor/line-awesome/line-awesome/line-awesome/css/line-awesome.min.css">
    <!-- Plugins CSS File -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/plugins/owl-carousel/owl.carousel.css">
    <link rel="stylesheet" href="assets/css/plugins/magnific-popup/magnific-popup.css">
    <link rel="stylesheet" href="assets/css/plugins/jquery.countdown.css">
    <!-- Main CSS File -->
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/skins/skin-demo-6.css">
    <link rel="stylesheet" href="assets/css/demos/demo-6.css">
    <!-- SweetAlert File -->


    <script src="SweetAlert/sweetalert2.all.min.js"></script>
    <script src="SweetAlert/sweetalert2.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
</head>

<body>
    <form id="form1" runat="server">
        <div class="page-wrapper">
            <header class="header header-6">
                <div class="header-top">
                    <div class="container">
                        <div class="header-left">
                            <ul class="top-menu top-link-menu d-none d-md-block">
                                <%--<li>
                                    <a href="#">Links</a>
                                    <ul>
                                        <li><a href="tel:#"><i class="icon-phone"></i>Call: +0123 456 789</a></li>
                                    </ul>
                                </li>--%>
                            </ul>
                            <!-- End .top-menu -->
                        </div>
                        <!-- End .header-left -->

                        <div class="header-right">
                            <ul class="top-menu top-link-menu">
                                <li>
                                    <a href="#">Links</a>
                                    <ul>
                                        <li><a href="13_Account.aspx"><i class="icon-user"></i>Account</a></li>
                                    </ul>
                                </li>
                            </ul>
                            <!-- End .top-menu -->

                            <div class="header-dropdown">
                                <div class="header-menu">
                                </div>
                                <!-- End .header-menu -->
                            </div>
                            <!-- End .header-dropdown -->

                            <div class="header-dropdown">
                                <a href="#">Eng</a>
                                <div class="header-menu">
                                    <ul>
                                        <li><a href="Default_Spanish.aspx">Spanish</a></li>
                                    </ul>
                                </div>
                                <!-- End .header-menu -->
                            </div>
                            <!-- End .header-dropdown -->
                        </div>
                        <!-- End .header-right -->
                    </div>
                </div>
                <div class="header-middle">
                    <div class="container">
                        <div class="header-left">
                            <div class="header-search header-search-extended header-search-visible d-none d-lg-block">
                                <a href="#" class="search-toggle" role="button"><i class="icon-search"></i></a>
                                <div action="#" method="get">
                                    
                                    <!-- End .header-search-wrapper -->
                                </div>
                            </div>
                            <!-- End .header-search -->
                        </div>
                        <div class="header-center" runat="server">
                            <a href="Default.aspx" class="logo">
                                <img href="Default.aspx" src="img/logo.png" alt="logo" width="82" height="20">
                            </a>
                            <%--                   <button class="navbar-toggler collapsed" type="button" data-toggle="collapse"
     data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
     aria-expanded="false" aria-label="Toggle navigation">
     <span class="menu_icon"><i class="fas fa-bars"></i></span>
 </button>
 <img href="index.aspx" src="img/logo.png" alt="logo">--%>
                        </div>
                        <!-- End .header-left -->

                        <div class="header-right">
                            <div class=" cart-dropdown" runat="server">
                                <i class="icon-shopping-cart"></i>
                                <a href="07_Shoppingcart.aspx" f>Shopping Cart</a>

                                <div class="">
                                    <div class="">
                                        <div class="product" href="01_Login.aspx">
                                            <div class="product-cart-details" href="01_Login.aspx">
                                                <a href="01_Login.aspx" class="sf-with-ul"></a>

                                            </div>
                                            <!-- End .product-cart-details -->


                                        </div>
                                        <!-- End .product -->

                                        <div class="product">
                                            <div class="" href="01_Login.aspx">
                                            </div>
                                            <!-- End .product-cart-details -->


                                        </div>
                                        <!-- End .product -->
                                    </div>
                                    <!-- End .cart-product -->

                                    <div class="">
                                    </div>
                                    <!-- End .dropdown-cart-total -->

                                    <div class="">
                                    </div>
                                    <!-- End .dropdown-cart-total -->
                                </div>
                                <!-- End .dropdown-menu -->
                            </div>
                            <!-- End .cart-dropdown -->
                        </div>
                    </div>
                    <!-- End .container -->
                </div>
                <!-- End .header-middle -->

                <div class="header-bottom sticky-header">
                    <div class="container">
                        <div class="header-left">
                            <nav class="main-nav">
                                <ul class="menu sf-arrows">
                                    <li class="megamenu-container active">
                                        <a href="Default.aspx"">Home</a>
                                    </li>
                                    
                                    <li>
                                        <a href="03_Clothes.aspx" class="sf-with-ul">Product</a>

                                        <div class="megamenu megamenu-sm">
                                            <div class="row no-gutters">
                                                <div class="col-md-6">
                                                    <div class="menu-col">
                                                        <div class="menu-title">Products</div>
                                                        <!-- End .menu-title -->
                                                        <ul>
                                                            <li><a href="03_Clothes.aspx">Clothes</a></li>
                                                            <li><a href="04_Accesories.aspx"><span>Accesories<span class="tip tip-new">New</span></span></a></li>
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
                                                                <div class="banner-title text-white">Customize Art<br>
                                                                    <span><strong>Products</strong></span></div>
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
                                        <a class="sf-with-ul" f>Pages</a>

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

                            <button class="mobile-menu-toggler">
                                <span class="sr-only">Toggle mobile menu</span>
                                <i class="icon-bars"></i>
                            </button>
                        </div>
                        <!-- End .header-left -->

                        <div class="header-right">
                            <i class="la la-lightbulb-o"></i>
                            <p>Look at the products that are available!</span></p>
                        </div>
                    </div>
                    <!-- End .container -->
                </div>
                <!-- End .header-bottom -->
            </header>
            <!-- End .header -->
            

            <%--<section class="single_product_list">
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

            </section>--%>

            <main class="main">
 <div class="intro-slider-container">
     <div class="intro-slider owl-carousel owl-theme owl-nav-inside owl-light" data-toggle="owl" data-owl-options='{
            "dots": false,
            "nav": false, 
            "responsive": {
                "992": {
                    "nav": true
                 }
             }
         }'>
         <div class="intro-slide" style="background-image: url(img/....jfif);">
             <div class="container intro-content text-center">
                 <h3 class="intro-subtitle text-white">You need to look good</h3><!-- End .h3 intro-subtitle -->
                 <h1 class="intro-title text-white">New customize</h1><!-- End .intro-title -->

                 <a href="04_Accesories.aspx" class="btn btn-outline-white-4">
                     <span>Discover More</span>
                 </a>
             </div><!-- End .intro-content -->
         </div><!-- End .intro-slide -->

         <div class="intro-slide" style="background-image: url(img/descarga.jfif);">
             <div class="container intro-content text-center">
                 <h3 class="intro-subtitle text-white">Diferents products</h3><!-- End .h3 intro-subtitle -->
                 <h1 class="intro-title text-white">Found your own style </h1><!-- End .intro-title -->

                 <a href="03_Clothes.aspx" class="btn btn-outline-white-4">
                     <span>Discover More</span>
                 </a>
             </div><!-- End .intro-content -->
         </div><!-- End .intro-slide -->
     </div><!-- End .intro-slider owl-carousel owl-theme -->

     <span class="slider-loader"></span><!-- End .slider-loader -->
 </div><!-- End .intro-slider-container -->
               

            <div class="pt-2 pb-3">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="banner banner-overlay">
                                <a href="#">
                                    <img src="img/shirts.png" alt="#">
                                </a>

                                <div class="banner-content banner-content-center">
                                    <h4 class="banner-subtitle text-white"><a href="03_Clothes.aspx">New products</a></h4>
                                    <!-- End .banner-subtitle -->
                                    <h3 class="banner-title text-white"><a href="03_Clothes.aspx"><strong>You need to customize</strong></h3>
                                    <!-- End .banner-title -->
                                    <a href="03_Clothes.aspx" class="btn btn-outline-white banner-link underline">Shop Now</a>
                                </div>
                                <!-- End .banner-content -->
                            </div>
                            <!-- End .banner -->
                        </div>
                        <!-- End .col-sm-6 -->

                        <div class="col-sm-6">
                            <div class="banner banner-overlay">
                                <a href="#">
                                    <img src="img/headphones.png" alt="#">
                                </a>

                                <div class="banner-content banner-content-center">
                                    <h4 class="banner-subtitle text-white"><a href="04_Accesories.aspx">Diferents Products</a></h4>
                                    <!-- End .banner-subtitle -->
                                    <h3 class="banner-title text-white"><a href="04_Accesories.aspx"><strong>Found your own style</strong></a></h3>
                                    <!-- End .banner-title -->
                                    <a href="04_Accesories.aspx" class="btn btn-outline-white banner-link underline">Shop Now</a>
                                </div>
                                <!-- End .banner-content -->
                            </div>
                            <!-- End .banner -->
                        </div>
                        <!-- End .col-sm-6 -->
                    </div>
                    <!-- End .row -->
                    <hr class="mt-0 mb-0">
                </div>
                <!-- End .container -->
            </div>
            <!-- End .bg-gray -->

            <div class="mb-5"></div>
            <!-- End .mb-5 -->
            <div class="container">
                <div class="heading heading-center mb-3">
                    <h2 class="title">Some products</h2>
                    <!-- End .title -->

                    <ul class="nav nav-pills justify-content-center" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="trending-all-link" data-toggle="tab" href="#trending-all-tab" role="tab" aria-controls="trending-all-tab" aria-selected="true">All</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="trending-women-link" data-toggle="tab" href="#trending-women-tab" role="tab" aria-controls="trending-women-tab" aria-selected="false">Clothing</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="trending-men-link" data-toggle="tab" href="#trending-men-tab" role="tab" aria-controls="trending-men-tab" aria-selected="false">Accesories</a>
                        </li>
                    </ul>
                </div>
                <!-- End .heading -->

                <div class="tab-content tab-content-carousel">
                    <div class="tab-pane p-0 fade show active" id="trending-all-tab" role="tabpanel" aria-labelledby="trending-all-link">
                        <div class="owl-carousel owl-simple carousel-equal-height carousel-with-shadow" data-toggle="owl"
                            data-owl-options='{
                                "nav": false, 
                                "dots": true,
                                "margin": 20,
                                "loop": true,
                                "responsive": {
                                    "0": {
                                        "items":2
                                    },
                                    "480": {
                                        "items":2
                                    },
                                    "768": {
                                        "items":3
                                    },
                                    "992": {
                                        "items":4
                                    },
                                    "1200": {
                                        "items":4,
                                        "nav": true,
                                        "dots": false
                                    }
                                }
                            }'>
                            <div class="product product-7 text-center">
                                <figure class="product-media">
                                    <a href="04_Accesories.aspx">
                                        <img src="img/Tazaa.png" alt="Product image" class="product-image">
                                        <img src="img/TAZA.png" alt="Product image" class="product-image-hover">
                                    </a>

                                    <%--<div class="product-action-vertical">
                                        <a href="#" class="btn-product-icon btn-wishlist btn-expandable"><span>add to wishlist</span></a>
                                    </div><!-- End .product-action-vertical -->--%>

                                    <div class="product-action">
                                        <a href="04_Accesories.aspx" class="btn-product btn-cart"><span>See the product</span></a>
                                    </div>
                                    <!-- End .product-action -->
                                </figure>
                                <!-- End .product-media -->

                                <div class="product-body">
                                    <div class="product-cat">
                                        <a href="#">Accessory</a>
                                    </div>
                                    <!-- End .product-cat -->
                                    <h3 class="product-title"><a href="04_Accesories.aspx">Taza</a></h3>
                                    <!-- End .product-title -->
                                    <div class="product-price">
                                        $3.99
                                   
                                    </div>
                                    <!-- End .product-price -->

                                    
                                    <!-- End .product-nav -->
                                </div>
                                <!-- End .product-body -->
                            </div>
                            <!-- End .product -->

                            <div class="product product-7 text-center">
                                <figure class="product-media">
                                    <a href="04_Accesories.aspx">
                                        <img src="img/messi.png" alt="Product image" class="product-image">
                                        <img src="img/slv.jfif" alt="Product image" class="product-image-hover">
                                    </a>

                                    
                                    <!-- End .product-action-vertical -->

                                    <div class="product-action">
                                        <a href="04_Accesories.aspx" class="btn-product btn-cart"><span>See the product</span></a>
                                    </div>
                                    <!-- End .product-action -->
                                </figure>
                                <!-- End .product-media -->

                                <div class="product-body">
                                    <div class="product-cat">
                                        <a href="03_Clothes.aspx">T_shirts</a>
                                    </div>
                                    <!-- End .product-cat -->
                                    <h3 class="product-title"><a href="03_Clothes.aspx">Shirts</a></h3>
                                    <!-- End .product-title -->
                                    <div class="product-price">
                                        $5.99
                                   
                                    </div>
                                    <!-- End .product-price -->
                                </div>
                                <!-- End .product-body -->
                            </div>
                            <!-- End .product -->

                            <div class="product product-7 text-center">
                                <figure class="product-media">
                                    <span class="product-label label-sale">sale</span>
                                    <a href="05_Technology.aspx">
                                        <img src="img/hdp.png" alt="Product image" class="product-image">
                                        <img src="img/verde.jpg" alt="Product image" class="product-image-hover">
                                    </a>

                                    
                                    <!-- End .product-action-vertical -->

                                    <div class="product-action">
                                        <a href="05_Technology.aspx" class="btn-product btn-cart"><span>See the product</span></a>
                                    </div>
                                    <!-- End .product-action -->
                                </figure>
                                <!-- End .product-media -->

                                <div class="product-body">
                                    <div class="product-cat">
                                        <a href="05_Technology.aspx">Technology</a>
                                    </div>
                                    <!-- End .product-cat -->
                                    <h3 class="product-title"><a href="05_Technology.aspx">Headphones</a></h3>
                                    <!-- End .product-title -->
                                    <div class="product-price">
                                        <span class="new-price">$7.99</span>

                                    </div>
                                    <!-- End .product-price -->
                                </div>
                                <!-- End .product-body -->
                            </div>
                            <!-- End .product -->

                            <div class="product product-7 text-center">
                                <figure class="product-media">
                                    <a href="04_Accesories.aspx">
                                        <img src="img/Wallet.jfif" alt="Product image" class="product-image">
                                        <img src="img/hola..jpg" alt="Product image" class="product-image-hover">
                                    </a>

                                    
                                    <!-- End .product-action-vertical -->

                                    <div class="product-action">
                                        <a href="04_Accesories.aspx" class="btn-product btn-cart"><span>See the product</span></a>
                                    </div>
                                    <!-- End .product-action -->
                                </figure>
                                <!-- End .product-media -->

                                <div class="product-body">
                                    <div class="product-cat">
                                        <a href="04_Accesories.aspx">Accesories</a>
                                    </div>
                                    <!-- End .product-cat -->
                                    <h3 class="product-title"><a href="04_Accesories.aspx">Wallet</a></h3>
                                    <!-- End .product-title -->
                                    <div class="product-price">
                                        $5.99
                                   
                                    </div>
                                    <!-- End .product-price -->


                                </div>
                                <!-- End .product-body -->
                            </div>
                            <!-- End .product -->

                            <div class="product product-7 text-center">
                                <figure class="product-media">
                                    <a href="04_Accesories.aspx">
                                        <img src="assets/images/demos/demo-6/products/product-1-1.jpg" alt="Product image" class="product-image">
                                        <img src="assets/images/demos/demo-6/products/product-1-2.jpg" alt="Product image" class="product-image-hover">
                                    </a>

                                    
                                    <!-- End .product-action-vertical -->

                                    <div class="product-action">
                                        <a href="04_Accesories.aspx" class="btn-product btn-cart"><span>See the product</span></a>
                                    </div>
                                    <!-- End .product-action -->
                                </figure>
                                <!-- End .product-media -->

                                <div class="product-body">
                                    <div class="product-cat">
                                        <a href="#">Clothing</a>
                                    </div>
                                    <!-- End .product-cat -->
                                    <h3 class="product-title"><a href="03_Clothes.aspx">Denim jacket</a></h3>
                                    <!-- End .product-title -->
                                    <div class="product-price">
                                        $19.99
                                   
                                    </div>
                                    <!-- End .product-price -->

                                    
                                    <!-- End .product-nav -->
                                </div>
                                <!-- End .product-body -->
                            </div>
                            <!-- End .product -->

                        </div>
                        <!-- End .owl-carousel -->
                    </div>
                    <!-- .End .tab-pane -->
                    <div class="tab-pane p-0 fade" id="trending-women-tab" role="tabpanel" aria-labelledby="trending-women-link">
                        <div class="owl-carousel owl-simple carousel-equal-height carousel-with-shadow" data-toggle="owl"
                            data-owl-options='{
                                "nav": false, 
                                "dots": true,
                                "margin": 20,
                                "loop": false,
                                "responsive": {
                                    "0": {
                                        "items":0
                                    },
                                    "480": {
                                        "items":2
                                    },
                                    "768": {
                                        "items":3
                                    },
                                    "992": {
                                        "items":4
                                    },
                                    "1200": {
                                        "items":4,
                                        "nav": true,
                                        "dots": false
                                    }
                                }
                            }'>
                            <div class="product product-7 text-center">
                                <figure class="product-media">
                                    <span class="product-label label-sale">sale</span>
                                    <a href="03_Clothes.aspx">
                                        <img src="img/messi.png" alt="Product image" class="product-image">
                                        <img src="img/slv.jfif" alt="Product image" class="product-image-hover">
                                    </a>

                                    
                                    <!-- End .product-action-vertical -->

                                    <div class="product-action">
                                        <a href="03_Clothes.aspx" class="btn-product btn-cart"><span>See the product</span></a>
                                    </div>
                                    <!-- End .product-action -->
                                </figure>
                                <!-- End .product-media -->

                                <div class="product-body">
                                    <div class="product-cat">
                                        <a href="03_Clothes.aspx">Clothing</a>
                                    </div>
                                    <!-- End .product-cat -->
                                    <h3 class="product-title"><a href="03_Clothes.aspx">Diferent shirt</a></h3>
                                    <!-- End .product-title -->
                                    <div class="product-price">
                                        <span class="new-price">Now $7.99</span>





                                    </div>
                                    <!-- End .product-price -->
                                </div>
                                <!-- End .product-body -->
                            </div>
                            <!-- End .product -->

                            <div class="product product-7 text-center">
                                <figure class="product-media">
                                    <a href="04_Accesories.aspx">
                                        <img src="img/hdp.png" alt="Product image" class="product-image">
                                        <img src="img/verde.jpg" alt="Product image" class="product-image-hover">
                                    </a>

                                    
                                    <!-- End .product-action-vertical -->

                                    <div class="product-action">
                                        <a href="04_Accesories.aspx" class="btn-product btn-cart"><span>See the product</span></a>
                                    </div>
                                    <!-- End .product-action -->
                                </figure>
                                <!-- End .product-media -->

                                <div class="product-body">
                                    <div class="product-cat">
                                        <a href="04_Accesories.aspx">Accessories</a>
                                    </div>
                                    <!-- End .product-cat -->
                                    <h3 class="product-title"><a href="04_Accesories.aspx">Linen-blend paper bag trousers</a></h3>
                                    <!-- End .product-title -->
                                    <div class="product-price">
                                        $17.99
                                   
                                    </div>
                                    <!-- End .product-price -->

                                    <div class="product-nav product-nav-thumbs">
                                        <a href="#" class="active">
                                            <img src="assets/images/demos/demo-6/products/product-4-thumb.jpg" alt="product desc">
                                        </a>
                                        <a href="#">
                                            <img src="assets/images/demos/demo-6/products/product-4-2-thumb.jpg" alt="product desc">
                                        </a>
                                    </div>
                                    <!-- End .product-nav -->
                                </div>
                                <!-- End .product-body -->
                            </div>
                            <!-- End .product -->

                            <div class="product product-7 text-center">
                                <figure class="product-media">
                                    <a href="04_Accesories.aspx">
                                        <img src="assets/images/demos/demo-6/products/product-1-1.jpg" alt="Product image" class="product-image">
                                        <img src="assets/images/demos/demo-6/products/product-1-2.jpg" alt="Product image" class="product-image-hover">
                                    </a>

                                    
                                    <!-- End .product-action-vertical -->

                                    <div class="product-action">
                                        <a href="04_Accesories.aspx" class="btn-product btn-cart"><span>See the product</span></a>
                                    </div>
                                    <!-- End .product-action -->
                                </figure>
                                <!-- End .product-media -->

                                <div class="product-body">
                                    <div class="product-cat">
                                        <a href="#">Clothing</a>
                                    </div>
                                    <!-- End .product-cat -->
                                    <h3 class="product-title"><a href="03_Clothes.aspx">Denim jacket</a></h3>
                                    <!-- End .product-title -->
                                    <div class="product-price">
                                        $19.99
                                   
                                    </div>
                                    <!-- End .product-price -->

                                    <div class="product-nav product-nav-thumbs">
                                        <a href="#" class="active">
                                            <img src="assets/images/demos/demo-6/products/product-1-thumb.jpg" alt="product desc">
                                        </a>
                                        <a href="#">
                                            <img src="assets/images/demos/demo-6/products/product-1-2-thumb.jpg" alt="product desc">
                                        </a>
                                        <a href="#">
                                            <img src="assets/images/demos/demo-6/products/product-1-3-thumb.jpg" alt="product desc">
                                        </a>
                                    </div>
                                    <!-- End .product-nav -->
                                </div>
                                <!-- End .product-body -->
                            </div>
                            <!-- End .product -->
                        </div>
                        <!-- End .owl-carousel -->
                    </div>
                    <!-- .End .tab-pane -->

                    <div class="tab-pane p-0 fade" id="trending-men-tab" role="tabpanel" aria-labelledby="trending-men-link">
                        <div class="owl-carousel owl-simple carousel-equal-height carousel-with-shadow" data-toggle="owl"
                            data-owl-options='{
                                "nav": false, 
                                "dots": true,
                                "margin": 20,
                                "loop": false,
                                "responsive": {
                                    "0": {
                                        "items":0
                                    },
                                    "480": {
                                        "items":2
                                    },
                                    "768": {
                                        "items":3
                                    },
                                    "992": {
                                        "items":4
                                    },
                                    "1200": {
                                        "items":4,
                                        "nav": true,
                                        "dots": false
                                    }
                                }
                            }'>
                            <div class="product product-7 text-center">
                                <figure class="product-media">
                                    <a href="05_Technology.aspx">
                                        <img src="img/hdp.png" alt="Product image" class="product-image">
                                        <img src="img/verde.jpg" alt="Product image" class="product-image-hover">
                                    </a>

                                    
                                    <!-- End .product-action-vertical -->

                                    <div class="product-action">
                                        <a href="05_Technology.aspx" class="btn-product btn-cart"><span>See the product</span></a>
                                    </div>
                                    <!-- End .product-action -->
                                </figure>
                                <!-- End .product-media -->

                                <div class="product-body">
                                    <div class="product-cat">
                                        <a href="04_Accesories.aspx">Accesories</a>
                                    </div>
                                    <!-- End .product-cat -->
                                    <h3 class="product-title"><a href="04_Accesories.aspx">Other headphone</a></h3>
                                    <!-- End .product-title -->
                                    <div class="product-price">
                                        $17.99
        
                                    </div>
                                    <!-- End .product-price -->
                                </div>
                                <!-- End .product-body -->
                            </div>
                            <!-- End .product -->
                        </div>
                        <!-- End .owl-carousel -->
                    </div>
                    <!-- .End .tab-pane -->
                </div>
                <!-- End .tab-content -->
            </div>
            <!-- End .container -->

            <div class="mb-5"></div>
            <!-- End .mb-5 -->

            <div class="pt-4 pb-3" style="background-color: #222;">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-3 col-sm-6">
                            <div class="icon-box text-center">
                                <span class="icon-box-icon">
                                    <i class="icon-truck"></i>
                                </span>
                                <div class="icon-box-content">
                                    <h3 class="icon-box-title">Cheaper Products</h3>
                                    <!-- End .icon-box-title -->
                                    <p>You can always find products on his best offer!</p>
                                </div>
                                <!-- End .icon-box-content -->
                            </div>
                            <!-- End .icon-box -->
                        </div>
                        <!-- End .col-lg-3 col-sm-6 -->

                        <div class="col-lg-3 col-sm-6">
                            <div class="icon-box text-center">
                                <span class="icon-box-icon">
                                    <i class="icon-rotate-left"></i>
                                </span>
                                <div class="icon-box-content">
                                    <h3 class="icon-box-title">Diversity Of Options To Customize</h3>
                                    <!-- End .icon-box-title -->
                                    <p>Find a lot of options to customize!</p>
                                </div>
                                <!-- End .icon-box-content -->
                            </div>
                            <!-- End .icon-box -->
                        </div>
                        <!-- End .col-lg-3 col-sm-6 -->

                        <div class="col-lg-3 col-sm-6">
                            <div class="icon-box text-center">
                                <span class="icon-box-icon">
                                    <i class="icon-unlock"></i>
                                </span>
                                <div class="icon-box-content">
                                    <h3 class="icon-box-title">Safety Payment</h3>
                                    <!-- End .icon-box-title -->
                                    <p>100% safety payment with the token of your mail to your purchases.</p>
                                </div>
                                <!-- End .icon-box-content -->
                            </div>
                            <!-- End .icon-box -->
                        </div>
                        <!-- End .col-lg-3 col-sm-6 -->

                        <div class="col-lg-3 col-sm-6">
                            <div class="icon-box text-center">
                                <span class="icon-box-icon">
                                    <i class="icon-headphones"></i>
                                </span>
                                <div class="icon-box-content">
                                    <h3 class="icon-box-title">Quality</h3>
                                    <!-- End .icon-box-title -->
                                    <p>We always make secure that your products are in a great condition.</p>
                                </div>
                                <!-- End .icon-box-content -->
                            </div>
                            <!-- End .icon-box -->
                        </div>
                        <!-- End .col-lg-3 col-sm-6 -->
                    </div>
                    <!-- End .row -->
                </div>
                <!-- End .container -->
            </div>
            <!-- End .bg-light pt-2 pb-2 -->

            <div class="mb-6"></div>
            <!-- End .mb-5 -->

            <div class="mb-2"></div>
            <!-- End .mb-5 -->

            <div class="container">
            </div>
            <!-- End .container -->

            </main><!-- End .main -->

            <footer class="footer">
                <div class="footer-middle">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-6 col-lg-3">
                                <div class="widget widget-about">
                                    <h4 class="widget-title">about Customize Art</h4>
                                    <!-- End .widget-title -->
                                    <p>Customize Art is a web site where you can customize your products whit your own style.</p>

                                    <div class="social-icons">
                                        <a href="https://www.instagram.com/customizeart24" class="social-icon" title="Instagram" target="_blank"><i class="icon-instagram"></i></a>
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
                                        <li><a href="01_Login.aspx">Log in</a></li>
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
                        <!-- End .footer-payments -->
                        <img src="img/logo2.png" alt="Logo" width="82" height="25">
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
        <script src="assets/js/jquery.plugin.min.js"></script>
        <script src="assets/js/jquery.magnific-popup.min.js"></script>
        <script src="assets/js/jquery.countdown.min.js"></script>
        <!-- Main JS File -->
        <script src="assets/js/main.js"></script>
        <script src="assets/js/demos/demo-6.js"></script>
        <!-- SweetAlert File -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>

    </form>
</body>


<!-- molla/index-6.html  22 Nov 2019 09:56:39 GMT -->
</html>
