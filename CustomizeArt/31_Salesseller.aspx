<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="31_Salesseller.aspx.cs" Inherits="CustomizeArt._31_Salesseller" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="icon" type="image/x-icon" href="CA/assets/img/favicon/favicon.ico" />

    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
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
    <title>Tables | Seller - Sales</title>
    <script src="SweetAlert/sweetalert2.js"></script>
    <script src="SweetAlert/sweetalert2.all.min.js"></script>
    <script src="SweetAlert/sweetalert2.js"></script>
    <script src="SweetAlert/sweetalert2.all.min.js"></script>
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
        .vertical-button {
            display: block;
            width: 60%; /* Hace que el botón ocupe el 100% del ancho de la celda */
            margin-bottom: 10px; /* Espacio entre los botones */
            padding: 5px 10px; /* Reduce el relleno interno del botón */
            font-size: 12px; /* Reduce el tamaño de la fuente */
            line-height: 1.2; /* Ajusta la altura de la línea para un mejor ajuste */
            border-radius: 3px; /* Opcional: hace que los bordes del botón sean más pequeños y redondeados */
        }
    </style>
    <style>
        .solid-button-yellow {
            background-color: #F5D300; /* Amarillo más fuerte */
            color: black; /* Color del texto */
        }
    </style>
    <style>
        .solid-button-blue {
            background-color: #0091A2; /* Azul más sólido */
            color: white; /* Color del texto */
        }
    </style>
    <style>
        .solid-button-green {
            background-color: #8BC34A; /* Verde más fuerte */
            color: white; /* Color del texto */
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
                            <asp:Button ID="btonlogout" class="btn btn-primary" runat="server" Text="Log Out" OnClick="btonlogout_Click" />
                        </div>
                        <div class="p-1 flex flex-row items-center">
                            <img onclick="profileToggle()" class="inline-block h-8 w-8 rounded-full" src="img/customize-art.png" alt="">
                            <a class="text-white p-2 no-underline hidden md:block lg:block">CustomizeArt</a>

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
                            <li class="w-full h-full py-3 px-2 border-b border-light-border">
                                <a href="29_SellerView.aspx"
                                    class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
                                    <i class="fab fa-wpforms float-left mx-2"></i>
                                    Manage Products
 
                                    <span><i class="fa fa-angle-left float-right"></i></span>
                                </a>
                            </li>

                            <li class="w-full h-full py-3 px-2 border-b border-light-border">
                                <a href="30_Update_Seller.aspx"
                                    class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
                                    <i class="fab fa-wpforms float-left mx-2"></i>
                                    Update Products
 

                                    <span><i class="fa fa-angle-left float-right"></i></span>
                                </a>
                            </li>
                    </aside>
                    <!--/Sidebar-->
                    <!--Main-->
                    <main class="bg-white-500 flex-1 p-3 overflow-hidden">
                        <asp:GridView ID="Sale" CssClass="table table-light table-striped table-hover table-bordered my-3" runat="server" AutoGenerateColumns="False" OnRowDataBound="Sale_RowDataBound">
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Id" />
                                <asp:BoundField DataField="Producto" HeaderText="Product" />
                                <asp:BoundField DataField="Cantidad" HeaderText="Quantity" />
                                <asp:BoundField DataField="Precio Unidad" HeaderText="Price" />
                                <asp:BoundField DataField="Total" HeaderText="Total" />
                                <asp:BoundField DataField="Fecha" HeaderText="Date" />
                                <asp:BoundField DataField="Comprador" HeaderText="Customer" />
                                <asp:BoundField DataField="Status" HeaderText="Status" />
                                <asp:BoundField DataField="Talla" HeaderText="Size" />
                                <asp:BoundField DataField="Cara" HeaderText="Face" />
                                <asp:BoundField DataField="Color" HeaderText="Color" />
                                <asp:TemplateField HeaderText="Image">
                                    <ItemTemplate>
                                        <asp:Literal ID="ImageLiteral" runat="server"
                                            Text='<%# "<img src=\"" + Eval("ImagePath") + "\" width=\"100px\" height=\"100px\" />" %>'>
                                        </asp:Literal>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

                        <%--End table--%>
                        <asp:Literal ID="alerta" runat="server" Text=""></asp:Literal>
                    </main>
                </div>


                <!-- / Content -->
                <!--/Grid Form-->
            </div>


            <!--/Main-->
        </div>
        <!--Footer-->
        <footer class="bg-grey-darkest text-white p-2">
            <div class="flex flex-1 mx-auto">&copy; My Design</div>
        </footer>
        <!--/footer-->

        <script src="./main.js"></script>
    </form>
</body>

</html>
