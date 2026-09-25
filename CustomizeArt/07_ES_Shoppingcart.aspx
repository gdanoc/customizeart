<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="07_ES_Shoppingcart.aspx.cs" Inherits="CustomizeArt._07_ES_Shoppingcart" %>

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
         text-align: right;
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
                                            <a href="category.html">
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
</header><!-- End .header -->

        <main class="main">
        	<div class="page-header text-center" style="background-image: url('assets/images/page-header-bg.jpg')">
        		<div class="container">
        			<h1 class="page-title">Carrito de compras<span>Compra de productos</span></h1>
        		</div><!-- End .container -->
        	</div><!-- End .page-header -->
            <nav aria-label="breadcrumb" class="breadcrumb-nav">
                <div class="container">
                    <ol class="breadcrumb">
                        
                    </ol>
                </div><!-- End .container -->
            </nav><!-- End .breadcrumb-nav -->

                     <form id="form2" runat="server">
      <asp:ScriptManager runat="server"></asp:ScriptManager>
      <div class="flex flex-1">
          <main class="bg-white-500 flex-1 p-3 overflow-hidden">
              <div class="flex flex-col">
                  <div class="flex flex-1 flex-col md:flex-row lg:flex-row mx-2">
                      <div class="mb-2 border-solid border-gray-300 rounded border shadow-sm w-full">
                          <div class="bg-gray-200 px-2 py-3 border-solid border-gray-200 border-b">
                              Carrito de Compra
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
        <HeaderStyle HorizontalAlign="Center" Width="100px" />
        <ItemTemplate>
            <%# Eval("ID") %>
        </ItemTemplate>
    </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Imagen">
                                      <ItemTemplate>
                                          <%# Eval("Image") %>
                                      </ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Imagen Personalizada">
                                      <ItemTemplate>
                                          <%# Eval("CustomizeImage") %>
                                      </ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Producto">
        <ItemStyle HorizontalAlign="Center" />
        <HeaderStyle HorizontalAlign="Center" Width="100px" />
        <ItemTemplate>
            <%# Eval("Producto") %>
        </ItemTemplate>
    </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Talla">
                                      <ItemTemplate>
                                          <ItemStyle HorizontalAlign="Center" />
        <HeaderStyle HorizontalAlign="Center" Width="100px" />
                                          <%# Eval("Size") %>
                                      </ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Cantidada">
                                      <ItemTemplate>
                                          <ItemStyle HorizontalAlign="Center" />
        <HeaderStyle HorizontalAlign="Center" Width="100px" />
                                          <%# Eval("Quantity") %>
                                      </ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Tipo de impresion">
                                      <ItemTemplate>
                                          <ItemStyle HorizontalAlign="Center" />
        <HeaderStyle HorizontalAlign="Center" Width="100px" />
                                          <%# Eval("Face") %>
                                      </ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Color">
                                      <ItemTemplate>
                                          <ItemStyle HorizontalAlign="Center" />
        <HeaderStyle HorizontalAlign="Center" Width="100px" />
                                          <%# Eval("Color") %>
                                      </ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Precio">
                                      <ItemTemplate>
                                          <ItemStyle HorizontalAlign="Center" />
        <HeaderStyle HorizontalAlign="Center" Width="100px" />
                                          <%# Eval("UnitPrice") %>
                                      </ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Total">
                                      <ItemTemplate>
                                          <%# "$" + Convert.ToDouble(Eval("Quantity")) * Convert.ToDouble(Eval("UnitPrice")) %>
                                      </ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Eliminar">
                                      <ItemTemplate>
                                          <a href='35_ES_deletefromcart.aspx?productId=<%# Eval("ProductId") %>&customizeId=<%# Eval("CustomizeId") %>' class="btn btn-danger center">Eliminar</a>
                                      </ItemTemplate>
                                  </asp:TemplateField>
                              </Columns>
                          </asp:GridView>
                                              <div class="row">
                                                  <div class="col-sm-12 col-lg-11 col-md-11">
                                                      <asp:Label ID="Total" CssClass="form-label" runat="server" Text="" Font-Bold="True"></asp:Label>
                                                  </div>
                                                  <div class="col-sm-12 col-md-1 col-lg-1">
                                                      <asp:Button ID="CheckOut" CssClass="btn btn-primary" runat="server" Text="Comprar con PayPal" OnClick="CheckOut_Click" />
                                                      <br />
                                                      <br />
                                                      <asp:Button ID="CheckOutToken" CssClass="btn btn-primary custom-button" runat="server" Text="Comprar con Token" OnClick="CheckOutToken_Click" />
                                                      <asp:Literal ID="alerta" runat="server" Text=""></asp:Literal>
                                                  </div>
                                              </div>
                                              <asp:HyperLink ID="QRUrl" title="Click aquí para descargar el código" download runat="server">
                                                  <asp:Image ID="QRImage" runat="server" />
                                              </asp:HyperLink>
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
	                			<div class="cart-bottom">
			            			<div class="cart-discount">
			            				<form action="#">
			            					<div class="input-group">
				        						
			        						</div><!-- End .input-group -->
			            				</form>
			            			</div><!-- End .cart-discount -->

		            			</div><!-- End .cart-bottom -->
	                		

	                				<table class="table table-summary">
	                					<tbody>
	                						

	                						<tr class="summary-shipping-row">
	                							<td>
													<div class="custom-control custom-radio">
														
														
													</div><!-- End .custom-control -->
	                							</td>
	                							
	                						</tr><!-- End .summary-shipping-row -->

	                						<tr class="summary-shipping-row">
	                							<td>
	                								<!-- End .custom-control -->
	                							</td>
	                							
	                						</tr><!-- End .summary-shipping-row -->

	                						
	                						<!-- End .summary-shipping-row -->

	                						<!-- End .summary-shipping-estimate -->

	                						<!-- End .summary-total -->
	                					</tbody>
	                				</table><!-- End .table table-summary -->

	                			</div><!-- End .summary -->

	                		

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
    <!-- Main JS File -->
    <script src="assets/js/main.js"></script>
</body>


<!-- molla/cart.html  22 Nov 2019 09:55:06 GMT -->
</html>
