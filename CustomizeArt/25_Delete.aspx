<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="25_Delete.aspx.cs" Inherits="CustomizeArt._25_Delete" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="icon" type="image/x-icon" href="CA/assets/img/favicon/favicon.ico">

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

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="CA/assets/js/config.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- Css -->
    <link rel="stylesheet" href="CA/dist/styles.css">
    <link rel="stylesheet" href="CA/dist/all.css">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,400i,600,600i,700,700i" rel="stylesheet">
    <title>Tables | Admin - Delete</title>
    <script src="SweetAlert/sweetalert2.js"></script>
    <script src="SweetAlert/sweetalert2.all.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
   

</head>

<body>
    <style>
        .button-container {
            display: flex;
            justify-content: space-between;
            margin-top: 50px; /* Ajusta según necesites */
        }

            .button-container .btn {
                padding: 5px 10px;
                font-size: 16px;
                width: 10px;
                margin-right: 50px; /* Ajusta el margen entre los botones */
                margin-left: 50px;
            }
    </style>

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
    <script>
        function SignCheck(input) {
            var regex = /^[a-zA-Z0-9]*$/; // Expresión regular que permite solo letras y números
            var valido = regex.test(input.value);
            if (!valido) {
                alert("Only numbers and letters.");
                input.value = input.value.replace(/[^a-zA-Z0-9]/g, ''); // Eliminar caracteres no permitidos
            }
        }
</script>
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
 <a  class="text-white p-2 no-underline hidden md:block lg:block">CustomizeArt</a>
                            <div id="ProfileDropDown" class="rounded hidden shadow-md bg-white absolute pin-t mt-12 mr-1 pin-r">
                                <ul class="list-reset">
                                    <li><a href="#" class="no-underline px-4 py-2 block text-black hover:bg-grey-light">My account</a></li>
                                    <li><a href="#" class="no-underline px-4 py-2 block text-black hover:bg-grey-light">Notifications</a></li>
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
                        <div class="flex">
                        </div>
                        <ul class="list-reset flex flex-col">
                            <li class=" w-full h-full py-3 px-2 border-b border-light-border ">
                                <a href="21_Crud.aspx"
                                    class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
                                    <i class="fas fa-tachometer-alt float-left mx-2" href="21_Crud.aspx"></i>
                                    Dashboard
                           
                                    <span><i class="fas fa-angle-left float-right"></i></span>
                                </a>
                            </li>
                            <li class="w-full h-full py-3 px-2 border-b border-light-border">
                                <a href="22_Crud_Products.aspx"
                                    class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
                                    <i class="fab fa-wpforms float-left mx-2"></i>
                                    Manage Products
       
                <span><i class="fa fa-angle-left float-right"></i></span>
                                </a>
                            </li>
                            <li class="w-full h-full py-3 px-2 border-b border-light-border">
                                <a href="23_Create.aspx"
                                    class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
                                    <i class="fab fa-wpforms float-left mx-2"></i>
                                    Create Products
       
                <span><i class="fa fa-angle-left float-right"></i></span>
                                </a>
                            </li>
                            <li class="w-full h-full py-3 px-2 border-b border-light-border">
                                <a href="24_Update.aspx"
                                    class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
                                    <i class="fab fa-wpforms float-left mx-2"></i>
                                    Update Products
       
                <span><i class="fa fa-angle-left float-right"></i></span>
                                </a>
                            </li>
                            <li class="w-full h-full py-3 px-2 border-b border-light-border">
                                <a href="26_Add_image.aspx"
                                    class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
                                    <i class="fab fa-wpforms float-left mx-2"></i>
                                    Add Image to Carousel
       
                                    <span><i class="fa fa-angle-right float-right"></i></span>
                                </a>
                            </li>
                          
                             <li class="w-full h-full py-3 px-2 border-b border-light-border">
     <a href="28_Sales.aspx"
         class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
         <i class="fab fa-wpforms float-left mx-2"></i>
         Sales
       
         <span><i class="fa fa-angle-right float-right"></i></span>
     </a>
 </li>
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
                            <%-- <li class="w-full h-full py-3 px-2 border-b border-light-border">
                                <a href="forms.html"
                                    class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
                                    <i class="fab fa-wpforms float-left mx-2"></i>
                                    Forms
                           
                                    <span><i class="fa fa-angle-right float-right"></i></span>
                                </a>
                            </li>
                            <li class="w-full h-full py-3 px-2 border-b border-light-border">
                                <a href="buttons.html"
                                    class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
                                    <i class="fas fa-grip-horizontal float-left mx-2"></i>
                                    Buttons
                           
                                    <span><i class="fa fa-angle-right float-right"></i></span>
                                </a>
                            </li>
                            <li class="w-full h-full py-3 px-2 border-b border-light-border">
                                <a href="Crud_Products.aspx"
                                    class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
                                    <i class="fas fa-table float-left mx-2" href="Crud_Products.aspx"></i>
                                    Tables
                           
                                    <span><i class="fa fa-angle-right float-right"></i></span>
                                </a>
                            </li>
                            <li class="w-full h-full py-3 px-2 border-b border-light-border">
                                <a href="ui.html"
                                    class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
                                    <i class="fab fa-uikit float-left mx-2"></i>
                                    Ui components
                           
                                    <span><i class="fa fa-angle-right float-right"></i></span>
                                </a>
                            </li>
                            <li class="w-full h-full py-3 px-2 border-b border-300-border">
                                <a href="modals.html" class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
                                    <i class="fas fa-square-full float-left mx-2"></i>
                                    Modals
                           
                                    <span><i class="fa fa-angle-right float-right"></i></span>
                                </a>
                            </li>
                            <li class="w-full h-full py-3 px-2">
                                <a href="#"
                                    class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
                                    <i class="far fa-file float-left mx-2"></i>
                                    Pages
                           
                                    <span><i class="fa fa-angle-down float-right"></i></span>
                                </a>
                                <ul class="list-reset -mx-2 bg-white-medium-dark">
                                    <li class="border-t mt-2 border-light-border w-full h-full px-2 py-3">
                                        <a href="login.html"
                                            class="mx-4 font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">Login Page
                                   
                                            <span><i class="fa fa-angle-right float-right"></i></span>
                                        </a>
                                    </li>
                                    <li class="border-t border-light-border w-full h-full px-2 py-3">
                                        <a href="register.html"
                                            class="mx-4 font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">Register Page
                                   
                                            <span><i class="fa fa-angle-right float-right"></i></span>
                                        </a>
                                    </li>
                                    <li class="border-t border-light-border w-full h-full px-2 py-3">
                                        <a href="404.html"
                                            class="mx-4 font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">404 Page
                                   
                                            <span><i class="fa fa-angle-right float-right"></i></span>
                                        </a>
                                    </li>
                                </ul>
                            </li>--%>
                        </ul>

                    </aside>
                    <!--/Sidebar-->
                    <!--Main-->
                    <main class="bg-white-500 flex-1 p-3 overflow-hidden">

                        <div class="flex flex-col">
                            <!-- Card Sextion Starts Here -->
                            <div class="flex flex-1  flex-col md:flex-row lg:flex-row mx-2">
                            </div>
                            <!-- /Cards Section Ends Here -->

                            <!--Grid Form-->
                            <div class="flex flex-1  flex-col md:flex-row lg:flex-row mx-2">
                                <div class="mb-2 border-solid border-gray-300 rounded border shadow-sm w-full">
                                    <div class="bg-gray-200 px-2 py-3 border-solid border-gray-200 border-b">
                                        Delete Products
                                   
                                    </div>
                                    <div class="p-3">
                                        <%--Input--%>
                                        <div class="myform-top">
    <asp:Image ID="ImagePreview" Width="90%" CssClass="py-3" runat="server" />
</div>
                                        <div class="mb-3">
                                            <label class="form-label" for="basic-default-fullname">ID</label>
                                            <asp:TextBox ID="txtid" runat="server" placeholder="Select Product's ID..." MaxLength="4" type="text" class="form-control"  onkeypress="return NumCheck(event, this)"></asp:TextBox>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label" for="basic-default-fullname">Product</label>
                                            <asp:TextBox ID="txtproduct" runat="server" placeholder="Product..." type="text" onkeypress="return validar(event)" class="form-control"></asp:TextBox>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label" for="basic-default-company">Quantity</label>
                                            <asp:TextBox ID="txtquantity" runat="server" placeholder="50..." type="text" class="form-control " onkeypress="return NumCheck(event, this)" />
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label" for="basic-default-email">Price</label>
                                        </div>
                                        <div class="input-group input-group-merge">
                                            <asp:TextBox ID="txtprice" runat="server" placeholder="3.66$..." onkeypress="return NumCheck(event, this)" type="text" class="form-control " />
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label" for="basic-default-phone">Date</label>
                                            <asp:TextBox ID="txtdate" runat="server" placeholder="27/6/2024..." type="date" class="form-control "></asp:TextBox>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label" for="basic-default-company">Description</label>
                                            <asp:TextBox ID="txtDescription" runat="server" placeholder="Description..." type="text" onkeypress="return SignCheck(this)" class="form-control " />
                                        </div>
                                                                                                                            <div class="mb-3">
    <label class="form-label" for="basic-default-company">Category</label>
   <asp:DropDownList ID="txtcategory" runat="server" class="form-control ">
       <asp:ListItem Value="Clothes"> Clothes </asp:ListItem>
       <asp:ListItem Value="Technology"> Technology </asp:ListItem>
       <asp:ListItem Value="Accesories"> Accesories </asp:ListItem>
       
       </asp:DropDownList>
</div>
                                       
                                        <div class="mb-3">
                                            <label class="form-label" for="basic-default-message">Image Product</label>
                                            <asp:FileUpload ID="PhotoFile" class="form-label" runat="server" />
                                        </div>
                                       
                                        <%--End input--%>

                                        <%--Button--%>
                                        <div class="button-container">
                                            <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Select" Style="width: 150px; padding: 10px; margin: 0 auto; display: block;" OnClick="Button1_Click"></asp:Button>
                                            <asp:Button ID="Button2" runat="server" CssClass="btn btn-primary" Text="Delete" Style="width: 150px; padding: 10px; margin: 0 auto; display: block;" OnClick="Button2_Click"></asp:Button>
                                        </div>
                                        <%--End button--%>

                                        <%--Table--%>
                                        <asp:GridView ID="ProductsList" runat="server" Style="margin-top:50px;" AutoGenerateColumns="False" Width="1004px" Height="80px" CellPadding="4" ForeColor="#333333" GridLines="None">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <%--<asp:BoundField DataField="ID" HeaderText="ID" />
    <asp:BoundField DataField="Product" HeaderText="Product" />
    <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
    <asp:BoundField DataField="Price" HeaderText="Price" />
    <asp:BoundField DataField="Date" HeaderText="Date" />
    <asp:BoundField DataField="Size" HeaderText="Size" />
    <asp:BoundField DataField="Color" HeaderText="Color" />
    <asp:BoundField DataField="Image" HeaderText="Image" />
    <ItemTemplate>
        <%# Eval ("Image") %>
    </ItemTemplate>
    <asp:BoundField DataField="Description" HeaderText="Description" />--%>
                                                <asp:TemplateField HeaderText="ID">
                                                    <ItemTemplate>
                                                        <%# Eval ("ID") %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Product">
                                                    <ItemTemplate>
                                                        <%# Eval ("Product") %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Quantity">
                                                    <ItemTemplate>
                                                        <%# Eval ("Quantity") %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Price">
                                                    <ItemTemplate>
                                                        <%# Eval ("Price") %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Date">
                                                    <ItemTemplate>
                                                        <%# Eval ("Date") %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Description">
                                                    <ItemTemplate>
                                                        <%# Eval ("Descripcion") %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Category">
     <ItemTemplate>
         <%# Eval ("Category") %>
     </ItemTemplate>
 </asp:TemplateField>
                                               
                                                <asp:TemplateField HeaderText="Image">
                                                    <ItemTemplate>
                                                        <%# Eval ("Image") %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <EditRowStyle BackColor="#2461BF" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                            <RowStyle BackColor="#EFF3FB" />
                                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                        </asp:GridView>
                                        <%--End table--%>
                                        <asp:Literal ID="alerta" runat="server" Text=""></asp:Literal>
                                    </div>
                                </div>
                            </div>
                            <!--/Grid Form-->
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
</body>

</html>

