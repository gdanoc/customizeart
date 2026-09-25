<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="32_ES_Update_image.aspx.cs" Inherits="CustomizeArt._32_ES_Update_image" %>

<!DOCTYPE html>
<html lang="en">

<head>
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
    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- Css -->
    <link rel="stylesheet" href="CA/dist/styles.css">
    <link rel="stylesheet" href="CA/dist/all.css">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,400i,600,600i,700,700i" rel="stylesheet">
    <title>Tables | Admin - Actualizar Imagen</title>
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
</head>
<body>
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
                            <h1 class="text-white p-2">Logo
<asp:Button ID="btonlogout" runat="server" CssClass="btn btn-primary" Text="Cerrar Sesión " OnClick="btonlogout_Click" />                            </h1>
                        </div>
                        <div class="p-1 flex flex-row items-center">
                            <img onclick="profileToggle()" class="inline-block h-8 w-8 rounded-full" src="https://avatars0.githubusercontent.com/u/4323180?s=460&v=4" alt="">
                            <a href="#" onclick="profileToggle()" class="text-white p-2 no-underline hidden md:block lg:block">Adam Wathan</a>
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
                                <a href="21_ES_Crud.aspx"
                                    class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
                                    <i class="fas fa-tachometer-alt float-left mx-2" href="21_Crud.aspx"></i>
                                    Dashboard
                           
                                    <span><i class="fas fa-angle-right float-right"></i></span>
                                </a>
                            </li>
                                       <li class="w-full h-full py-3 px-2 border-b border-light-border">
                <a href="22_ES_Crud_Products.aspx"
                    class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
                    <i class="fab fa-wpforms float-left mx-2"></i>
                   Administrar Productos
       
<span><i class="fa fa-angle-left float-right"></i></span>
                </a>
            </li>
            <li class="w-full h-full py-3 px-2 border-b border-light-border">
                <a href="23_ES_Create.aspx"
                    class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
                    <i class="fab fa-wpforms float-left mx-2"></i>
                    Crear Productos
       
<span><i class="fa fa-angle-left float-right"></i></span>
                </a>
            </li>
            <li class="w-full h-full py-3 px-2 border-b border-light-border">
                <a href="24_ES_Update.aspx"
                    class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
                    <i class="fab fa-wpforms float-left mx-2"></i>
                    Actualizar Productos
       
<span><i class="fa fa-angle-left float-right"></i></span>
                </a>
            </li>
            <li class="w-full h-full py-3 px-2 border-b border-light-border">
                <a href="26_ES_Add_image.aspx"
                    class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
                    <i class="fab fa-wpforms float-left mx-2"></i>
                    Agregar imagen al carrusel
       
                    <span><i class="fa fa-angle-right float-right"></i></span>
                </a>
            </li>
                            
                                </ul>
                            </li>
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
                                        Actualizar Imagen del Carrusel
                                   
                                    </div>
                                    <div class="p-3">
                                        <%--Input--%>
                                        <div class="row">
                                            <div class="col-sm-6 col-sm-offset-3 myform-cont">
                                                <h1>Actualizar Imagen</h1>
                                                <div class="myform-top">
                                                </div>
                                                <div class="myform-bottom">
                                                    <div class="form-group center-container">
                                                        <asp:Image ID="ImagePreview" Width="90%" CssClass="py-3" runat="server" />
                                                    </div>
                                                    <div class="form-group center-container">
                                                        <asp:TextBox ID="IdImagen" runat="server" placeholder="ID Image" type="text" class="bg-teal-300 cursor-pointer rounded p-1 mx-1 text-white " MaxLength="4" Style="width: 350px; padding: 20px; margin: 0 auto; display: block;" onpaste="return false"  onkeypress="return NumCheck(event, this)"></asp:TextBox>
                                                    </div>
                                                    <div class="form-group center-container">
                                                        <asp:TextBox ID="Texto" runat="server" placeholder="Texto..." type="text" class="form-control" onpaste="return false" onkeypress="return validar(event)" minlength="3"></asp:TextBox>
                                                    </div>
                                                    <div class="form-group center-container">
                                                        <asp:Label ID="LabelFoto" runat="server" CssClass="form-label" Text="Imagen"></asp:Label>
                                                        <asp:FileUpload ID="PhotoFile" CssClass="form-control" name="File" runat="server" />
                                                    </div>
                                                    <div class="form-group center-container">
                                                        <asp:Button ID="btnSeleccionar" runat="server" Text="Seleccionar" margin-top="50px" Style="width: 150px; padding: 10px; margin: 0 auto; display: block;" CssClass="bg-teal-300 cursor-pointer rounded p-1 mx-1 text-white" OnClick="btnSeleccionar_Click"></asp:Button>
                                                        <asp:Button ID="btnEditar" runat="server" Text="Actualizar" margin-top="50px" Style="width: 150px; padding: 10px; margin: 0 auto; display: block;" CssClass="bg-teal-300 cursor-pointer rounded p-1 mx-1 text-white" OnClick="btnEditar_Click"></asp:Button>
                                                        <asp:Button ID="btnEliminar" runat="server" margin-top="50px" Style="width: 150px; padding: 10px; margin: 0 auto; display: block;" CssClass="bg-teal-300 cursor-pointer rounded p-1 mx-1 text-white" Text="Eliminar" OnClick="btnEliminar_Click" />
                                                    </div>
                                                    <asp:GridView ID="ListaImagenes" AutoGenerateColumns="False" CssClass="table table-dark table-striped table-bordered" runat="server">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Id">
                                                                <ItemTemplate>
                                                                    <%# Eval ("Id") %>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Texto">
                                                                <ItemTemplate>
                                                                    <%# Eval ("Texto") %>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Imagen">
                                                                <ItemTemplate>
                                                                    <asp:Literal ID="Literal1" runat="server" Text='<%# Eval ("Direccion") %>'></asp:Literal>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <EditRowStyle ForeColor="White" />
                                                    </asp:GridView>
                                                </div>
                                            </div>
                                        </div>


                                        <%--Button--%>
                                        <%--<asp:Button runat="server" Text="Agregar" Style="width: 150px; padding: 10px; margin: 0 auto; display: block;" CssClass="bg-teal-300 cursor-pointer rounded p-1 mx-1 text-white" <%--OnClick="Unnamed1_Click"--%>></asp:Button>
                                        <%--End button--%>


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