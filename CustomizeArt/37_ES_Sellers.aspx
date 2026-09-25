<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="37_ES_Sellers.aspx.cs" Inherits="CustomizeArt._37_ES_Sellers" %>

<!DOCTYPE html>
<html lang="en">

<head>
     <!-- Fonts -->
 <link rel="preconnect" href="https://fonts.googleapis.com" />
 <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
 <link
     href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
     rel="stylesheet" />
      <!-- Icons. Uncomment required icon fonts -->
  <link rel="stylesheet" href="CA/assets/vendor/fonts/boxicons.css" />

  <!-- Core CSS -->
  <link rel="stylesheet" href="CA/assets/vendor/css/core.css" class="template-customizer-core-css" />
  <link rel="stylesheet" href="CA/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
  <link rel="stylesheet" href="CA/assets/css/demo.css" />

    <link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
  <!-- Vendors CSS -->
  <link rel="stylesheet" href="CA/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- Css -->
    <link rel="stylesheet" href="CA/dist/styles.css">
    <link rel="stylesheet" href="CA/dist/all.css">
    <link href="https://fonts.googleapis.com/css?family=Raleway:100,400&display=swap" rel="stylesheet" />
    <script src="SweetAlert/sweetalert2.js"></script>
    <script src="SweetAlert/sweetalert2.all.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <title>Crud | Admin</title>
    <style type="text/css">
        .auto-style1 {
            height: 24px;
        }
        .auto-style3 {
            left: 700px;
        }
    </style>
</head>
<body>
    <form runat="server">
<!--Container -->
<div class="mx-auto bg-grey-lightest">
    <!--Screen-->
    <div class="min-h-screen flex flex-col">
        <!--Header Section Starts Here-->
        <header class="bg-nav">
            <div class="flex justify-between">
                <div class="p-1 mx-3 inline-flex items-center">
                    <i class="fas fa-bars pr-2 text-white" onclick="sidebarToggle()"></i>
                    <asp:Button ID="btonlogout" class="btn btn-primary" runat="server" Text="Log Out" OnClick="Unnamed2_Click" />



                </div>
                <div class="p-1 flex flex-row items-center">
                    <img onclick="profileToggle()" class="inline-block h-8 w-8 rounded-full" src="img/customize-art.png" alt="">
                    <a class="text-white p-2 no-underline hidden md:block lg:block">CustomizeArt</a>
                    <div id="ProfileDropDown" class="rounded hidden shadow-md bg-white absolute pin-t mt-12 mr-1 pin-r">
                        <ul class="list-reset">
                            <li><a href="#" class="no-underline px-4 py-2 block text-black hover:bg-grey-light">My account</a></li>
                            <li><a href="#" class="no-underline px-4 py-2 block text-black hover:bg-grey-light">Notifications</a></li>
                          <li><hr class="border-t mx-2 border-grey-ligght"></li>
                          <li><a href="#" class="no-underline px-4 py-2 block text-black hover:bg-grey-light">Logout</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </header>
        <!--/Header-->

        <div class="flex flex-1">
            <!--Sidebar-->
            <aside id="sidebar" class="bg-side-nav w-1/2 md:w-1/6 lg:w-1/6 border-r border-side-nav hidden md:block lg:block">
                <div class="flex">

                </div>
                <ul class="list-reset flex flex-col">
                    <li class=" w-full h-full py-3 px-2 border-b border-light-border ">
                        <a href="21_ES_Crud.aspx"
                           class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
                            <i class="fas fa-tachometer-alt float-left mx-2" href="21_ES_Crud.aspx"></i>
                            Dashboard
                            <span><i class="fas fa-angle-left float-right"></i></span>
                        </a>
                    </li>
                 
                    <%--<li class="w-full h-full py-3 px-2 border-b border-light-border">
                        <a href="buttons.html"
                           class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
                            <i class="fas fa-grip-horizontal float-left mx-2"></i>
                            Buttons
                            <span><i class="fa fa-angle-right float-right"></i></span>
                        </a>
                    </li>--%>
                   <%-- <li class="w-full h-full py-3 px-2 border-b border-light-border">
                        <a href="Crud_Products.aspx"
                            class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
                            <i class="fas fa-table float-left mx-2" href="Crud_Products.aspx"></i>
                            Tables
                            <span><i class="fa fa-angle-right float-right"></i></span>
                        </a>
                    </li>--%>
                    <%--<li class="w-full h-full py-3 px-2 border-b border-light-border">
                        <a href="ui.html"
                           class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
                            <i class="fab fa-uikit float-left mx-2"></i>
                            Ui components
                            <span><i class="fa fa-angle-right float-right"></i></span>
                        </a>
                    </li>--%>
                    <%--<li class="w-full h-full py-3 px-2 border-b border-300-border">
                        <a href="modals.html" class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
                            <i class="fas fa-square-full float-left mx-2"></i>
                            Modals
                            <span><i class="fa fa-angle-right float-right"></i></span>
                        </a>
                    </li>--%>
                   <%-- <li class="w-full h-full py-3 px-2">
                        <a href="#"
                           class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
                            <i class="far fa-file float-left mx-2"></i>
                            Pages
                            <span><i class="fa fa-angle-down float-right"></i></span>
                        </a>--%>
                        <%--<ul class="list-reset -mx-2 bg-white-medium-dark">
                            <li class="border-t mt-2 border-light-border w-full h-full px-2 py-3">
                                <a href="login.html"
                                   class="mx-4 font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
                                    Login Page
                                    <span><i class="fa fa-angle-right float-right"></i></span>
                                </a>
                            </li>
                            <li class="border-t border-light-border w-full h-full px-2 py-3">
                                <a href="register.html"
                                   class="mx-4 font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
                                    Register Page
                                    <span><i class="fa fa-angle-right float-right"></i></span>
                                </a>
                            </li>
                            <li class="border-t border-light-border w-full h-full px-2 py-3">
                                <a href="404.html"
                                   class="mx-4 font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
                                    404 Page
                                    <span><i class="fa fa-angle-right float-right"></i></span>
                                </a>
                            </li>--%>
                        </ul>
                    </li>
                </ul>

            </aside>
            <!--/Sidebar-->
            <!--Main-->
            <main class="bg-white-500 flex-1 p-3 overflow-hidden">
                <div class="container mt-4">
    <h2 class="text-center">Lista de Gerentes</h2>
    <asp:GridView ID="SellerGridView" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="id_Seller" HeaderText="ID Gerente" />
            <asp:BoundField DataField="nombre" HeaderText="Nombre" />
            <asp:BoundField DataField="Tienda" HeaderText="Tienda" />
            <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
            <asp:BoundField DataField="Correo" HeaderText="Correo" />
            <asp:BoundField DataField="Telefono" HeaderText="Teléfono" />
            <asp:BoundField DataField="ID_ROL" HeaderText="Rol ID" />
        </Columns>
    </asp:GridView>
</div>
            </main>
            <!--/Main-->
        </div>
        <!--Footer-->
        <footer class="bg-grey-darkest text-white p-2">
            <div class="flex flex-1 mx-auto">&copy; My Design</div>
        </footer>
        <!--/footer-->

    </div>

        </div>

        <script src="./main.js"></script>
    </form>
</body>

</html>