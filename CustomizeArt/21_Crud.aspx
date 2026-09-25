<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="21_Crud.aspx.cs" Inherits="CustomizeArt._21_Crud" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="keywords" content="tailwind,tailwindcss,tailwind css,css,starter template,free template,admin templates, admin template, admin dashboard, free tailwind templates, tailwind example">
    <!-- Css -->
    <link rel="stylesheet" href="CA/dist/styles.css">
    <link rel="stylesheet" href="CA/dist/all.css">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,400i,600,600i,700,700i" rel="stylesheet">
    <script src="SweetAlert/sweetalert2.js"></script>
    <script src="SweetAlert/sweetalert2.all.min.js"></script>
    <script src="SweetAlert/sweetalert2.js"></script>
    <script src="SweetAlert/sweetalert2.all.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <title>Dashboard | Admin - Crud</title>

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

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="CA/assets/vendor/js/helpers.js"></script>

</head>


<body>
    <form id="form1" runat="server">
        <!--Container -->
        <div class="mx-auto bg-grey-400">
            <!--Screen-->
            <div class="min-h-screen flex flex-col">
                <!--Header Section Starts Here-->
                <header class="bg-nav">
                    <div class="flex justify-between">
                        <div class="p-1 mx-3 inline-flex items-center">
                            <i class="fas fa-bars pr-2 text-white" onclick="sidebarToggle()"></i>
                            <asp:Button ID="btonlogout" runat="server" CssClass="btn btn-primary" Text="Log Out" OnClick="btonlogout_Click" />

                        </div>

                        <div class="header-dropdown">
                            <a href="#">Eng</a>
                            <div class="header-menu">
                                <ul>
                                    <li><a href="21_ES_Crud.aspx">Spanish</a></li>
                                </ul>
                            </div>
                            <!-- End .header-menu -->
                        </div>

                        <div class="p-1 flex flex-row items-center">
                            <img onclick="profileToggle()" class="inline-block h-8 w-8 rounded-full" src="img/logo2.png" alt="">
                            <a href="#" onclick="profileToggle()" class="text-white p-2 no-underline hidden md:block lg:block">Customize Art</a>
                            <div id="ProfileDropDown" class="rounded hidden shadow-md bg-white absolute pin-t mt-12 mr-1 pin-r">
                                <ul class="list-reset">
                                    <li>
                                        <hr class="border-t mx-2 border-grey-ligght">
                                    </li>
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
                        <ul class="list-reset flex flex-col">
                            <ul class="w-full h-full py-3 px-2 border-b border-light-border">
                                <li class="w-full h-full py-3 px-2 border-b border-light-border">
                                    <a href="23_Create.aspx"
                                        class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
                                        <i class="fab fa-wpforms float-left mx-2"></i>
                                        Create Products
 
       

                                        <span><i class="fa fa-angle-right float-right"></i></span>
                                    </a>
                                </li>
                            </ul>

                            <ul class="list-reset flex flex-col">
                                <ul class="w-full h-full py-3 px-2 border-b border-light-border">
                                    <li class="w-full h-full py-3 px-2 border-b border-light-border">
                                        <a href="24_Update.aspx"
                                            class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
                                            <i class="fab fa-wpforms float-left mx-2"></i>
                                            Update Products
 
       

                                            <span><i class="fa fa-angle-right float-right"></i></span>
                                        </a>
                                    </li>
                                </ul>
                                <ul class="list-reset flex flex-col">
                                    <ul class="w-full h-full py-3 px-2 border-b border-light-border">
                                        <li class="w-full h-full py-3 px-2 border-b border-light-border">
                                            <a href="25_Delete.aspx"
                                                class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
                                                <i class="fab fa-wpforms float-left mx-2"></i>
                                                Delete Products
 
       

                                                <span><i class="fa fa-angle-right float-right"></i></span>
                                            </a>
                                        </li>
                                    </ul>
                                    <ul class="list-reset flex flex-col">
                                        <ul class="w-full h-full py-3 px-2 border-b border-light-border">
                                            <li class="w-full h-full py-3 px-2 border-b border-light-border">
                                                <a href="26_Add_image.aspx"
                                                    class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
                                                    <i class="fab fa-wpforms float-left mx-2"></i>
                                                    Add image to Carousel
 
       

                                                    <span><i class="fa fa-angle-right float-right"></i></span>
                                                </a>
                                            </li>
                                        </ul>
                                        <ul class="w-full h-full py-3 px-2 border-b border-light-border">
                                            <li class="w-full h-full py-3 px-2 border-b border-light-border">
                                                <a href="28_Sales.aspx"
                                                    class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
                                                    <i class="fab fa-wpforms float-left mx-2"></i>
                                                    Sales Products
 
       

                                                    <span><i class="fa fa-angle-right float-right"></i></span>
                                                </a>
                                            </li>
                                        </ul>
                                        <ul class="w-full h-full py-3 px-2 border-b border-light-border">
                                            <li class="w-full h-full py-3 px-2 border-b border-light-border">
                                                <a href="40_Create_Seller.aspx"
                                                    class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
                                                    <i class="fab fa-wpforms float-left mx-2"></i>
                                                    Create sellers
 
       

                                                    <span><i class="fa fa-angle-right float-right"></i></span>
                                                </a>
                                            </li>
                                        </ul>
                                        <li class="w-full h-full py-3 px-2 border-b border-light-border">
                                            <a href="22_Crud_Products.aspx"
                                                class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
                                                <i class="fab fa-wpforms float-left mx-2"></i>
                                                Watch Products
 
       

                                                <span><i class="fa fa-angle-right float-right"></i></span>
                                            </a>
                                        </li>
                                    </ul>
                                    <ul class="w-full h-full py-3 px-2 border-b border-light-border">
                                        <li class="w-full h-full py-3 px-2 border-b border-light-border">
                                            <a href="37_Sellers.aspx"
                                                class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
                                                <i class="fab fa-wpforms float-left mx-2"></i>
                                                Sellers List
 
       

                                                <span><i class="fa fa-angle-right float-right"></i></span>
                                            </a>
                                        </li>
                                    </ul>
                    </aside>
                    <!--/Sidebar-->
                    <!--Main-->
                    <main class="bg-white-300 flex-1 p-3 overflow-hidden">

                        <div class="flex flex-col">
                            <!-- Stats Row Starts Here -->
                            <div class="flex flex-1 flex-col md:flex-row lg:flex-row mx-2">
                                <div class="shadow-lg bg-red-vibrant border-l-8 hover:bg-red-vibrant-dark border-red-vibrant-dark mb-2 p-2 md:w-1/4 mx-2">
                                    <div class="p-4 flex flex-col">
                                        <a href="#" class="no-underline text-white text-2xl">
                                            <%: Get_Total_Sales() %>
                                        </a>
                                        <a href="#" class="no-underline text-white text-lg">Total Sales
                                        </a>
                                    </div>
                                </div>

                                <div class="shadow bg-warning border-l-8 hover:bg-warning-dark border-warning-dark mb-2 p-2 md:w-1/4 mx-2">
                                    <div class="p-4 flex flex-col">
                                        <a href="#" class="no-underline text-white text-2xl">
                                            <%: Get_Total_Users() %>
                                        </a>
                                        <a href="#" class="no-underline text-white text-lg">Total Users
                                        </a>
                                    </div>
                                </div>

                                <div class="shadow bg-success border-l-8 hover:bg-success-dark border-success-dark mb-2 p-2 md:w-1/4 mx-2">
                                    <div class="p-4 flex flex-col">
                                        <a href="#" class="no-underline text-white text-2xl">
                                            <%: Get_Total_Products() %>
                                        </a>
                                        <a href="#" class="no-underline text-white text-lg">Total Products
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <!-- /Stats Row Ends Here -->
                            <asp:GridView ID="GridViewUsuarios" runat="server" AutoGenerateColumns="True" CssClass=" table-responsive  bg-grey-dark text-white text-normal table text-grey-darkest table table-striped text-white font-light py-1 px-2  "></asp:GridView>


                            <!-- /Cards Section Ends Here -->
                            <asp:Literal ID="alerta" runat="server" Text=""></asp:Literal>
                            <!-- Progress Bar -->

                            <!--Profile Tabs-->
                    </main>
                    <!--/Main-->
                </div>
                <!--Footer-->
                <footer class="bg-grey-darkest text-white p-2">
                    <div class="flex flex-1 mx-auto">&copy; My Design</div>
                    <div class="flex flex-1 mx-auto">Distributed by:  <a href="https://themewagon.com/" target=" _blank">Themewagon</a></div>
                </footer>
                <!--/footer-->

            </div>

        </div>
        <script src="./main.js"></script>
    </form>
</body>

</html>

