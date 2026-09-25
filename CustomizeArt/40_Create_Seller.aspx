<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="40_Create_Seller.aspx.cs" Inherits="CustomizeArt._40_Create_Seller" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- Css -->
    <link rel="stylesheet" href="CA/dist/styles.css">
    <link rel="stylesheet" href="CA/dist/all.css">

        <link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">

    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,400i,600,600i,700,700i" rel="stylesheet">
    <title>Forms | Create Seller - Admin</title>
    <script src="SweetAlert/sweetalert2.all.min.js"></script>
    <script src="SweetAlert/sweetalert2.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
</head>

<body>
    <!--Container -->
    <form runat="server" action="#" class="w-full">
        <div class="mx-auto bg-grey-lightest">
            <!--Screen-->
            <div class="min-h-screen flex flex-col">
                <!--Header Section Starts Here-->
                <header class="bg-nav">
                    <div class="flex justify-between">
                        <div class="p-1 mx-3 inline-flex items-center">
                            <i class="fas fa-bars pr-2 text-white" onclick="sidebarToggle()">
                                <asp:Button ID="btonlogout" runat="server" CssClass="btn btn-primary" Text="Log Out" OnClick="btonlogout_Click" />
                            </i>
                            <h1 class="text-white p-2">Logo</h1>
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
                                <a href="21_Crud.aspx"
                                    class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline">
                                    <i class="fas fa-tachometer-alt float-left mx-2"></i>
                                    Dashboard
                            <span><i class="fas fa-angle-right float-right"></i></span>
                                </a>
                            </li>
                    </aside>
                    <!--/Sidebar-->
                    <!--Main-->
                    <main class="bg-white-500 flex-1 p-3 overflow-hidden">
                        <asp:Literal ID="alerta" runat="server" Text=""></asp:Literal>
                        <div class="flex flex-col">
                            <!-- Card Sextion Starts Here -->
                            <div class="flex flex-1  flex-col md:flex-row lg:flex-row mx-2">
                                <!--Horizontal form-->
                                <div class="mb-2 border-solid border-grey-light rounded border shadow-sm w-full md:w-1/2 lg:w-1/2">
                                    <div class="bg-gray-300 px-2 py-3 border-solid border-gray-400 border-b">
                                        Seller register
                                    </div>
                                    <div class="p-3">

                                        <div class="md:flex md:items-center mb-6">
                                            <div class="md:w-1/4">
                                                <label class="block text-gray-500 font-regular md:text-right mb-1 md:mb-0 pr-4" for="inline-full-name">Full Name </label>
                                            </div>
                                            <div class="md:w-3/4">
                                                <asp:TextBox ID="txtfirst" runat="server" placeholder="Names..." type="text" class="form-control" onpaste="return false" minlength="4" MaxLength="30" onkeypress="return validar(event)"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="md:flex md:items-center mb-6">
                                            <div class="md:w-1/4">
                                                <label class="block text-gray-500 font-regular md:text-right mb-1 md:mb-0 pr-4" for="inline-full-name">Full Name </label>
                                            </div>
                                            <div class="md:w-3/4">
                                                <asp:TextBox ID="txtapellido" runat="server" placeholder="Last Names..." type="text" class="form-control" onpaste="return false" minlength="4" MaxLength="30" onkeypress="return validar(event)"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="md:flex md:items-center mb-6">
                                            <div class="md:w-1/4">
                                                <label class="block text-gray-500 font-regular md:text-right mb-1 md:mb-0 pr-4" for="inline-full-name">User </label>
                                            </div>
                                            <div class="md:w-3/4">
                                                <asp:TextBox ID="TxtUsuario" runat="server" placeholder="Seller name..." type="text" class="form-control" onpaste="return false" minlength="4" MaxLength="250" onkeypress="return SignCheck(this)" />
                                            </div>
                                        </div>
                                        <div class="md:flex md:items-center mb-6">
                                            <div class="md:w-1/4">
                                                <label class="block text-grey font-regular md:text-right mb-1 md:mb-0 pr-4"
                                                    for="inline-username">
                                                    Password
                                                </label>
                                            </div>
                                            <div class="md:w-3/4">
                                                <asp:TextBox ID="txtclave" runat="server" placeholder="Password..." type="password" class="form-control" onpaste="return false" minlength="8" MaxLength="25" />
                                            </div>
                                        </div>
                                        <div class="md:flex md:items-center mb-6">
                                            <div class="md:w-1/4">
                                                <label class="block text-grey font-regular md:text-right mb-1 md:mb-0 pr-4"
                                                    for="inline-username">
                                                    Repeat Password
                                                </label>
                                            </div>
                                            <div class="md:w-3/4">
                                                <asp:TextBox ID="txtconfirm" runat="server" placeholder="Repeat Password..." type="password" class="form-control" onpaste="return false" minlength="8" MaxLength="25" />
                                            </div>
                                        </div>
                                        <div class="md:flex md:items-center mb-6">
                                            <div class="md:w-1/4">
                                                <label class="block text-grey font-regular md:text-right mb-1 md:mb-0 pr-4"
                                                    for="inline-username">
                                                    Store
                                                </label>
                                            </div>
                                            <div class="md:w-3/4">
                                                <asp:TextBox ID="txtstore" runat="server" placeholder="Your store..." type="text" class="form-control" onpaste="return false" minlength="4" MaxLength="30" onkeypress="return validar(event)"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="md:flex md:items-center mb-6">
                                            <div class="md:w-1/4">
                                                <label class="block text-grey font-regular md:text-right mb-1 md:mb-0 pr-4"
                                                    for="inline-username">
                                                    Description
                                                </label>
                                            </div>
                                            <div class="md:w-3/4">
                                                <asp:TextBox ID="txtdescription" runat="server" placeholder="Description..." type="text" class="form-control" onpaste="return false" minlength="4" MaxLength="30" onkeypress="return validar(event)"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="md:flex md:items-center mb-6">
                                            <div class="md:w-1/4">
                                                <label class="block text-grey font-regular md:text-right mb-1 md:mb-0 pr-4"
                                                    for="inline-username">
                                                    Email
                                                </label>
                                            </div>

                                            <div class="md:w-3/4">
                                                <asp:TextBox ID="txtgmail" runat="server" placeholder="Gmail..." type="email" class="form-control" onpaste="return false" minlength="10" MaxLength="50" />
                                            </div>
                                        </div>
                                        <div class="md:flex md:items-center mb-6">
                                            <div class="md:w-1/4">
                                                <label class="block text-grey font-regular md:text-right mb-1 md:mb-0 pr-4"
                                                    for="inline-username">
                                                    Phone Number
                                                </label>
                                            </div>

                                            <div class="md:w-3/4">
                                                <asp:TextBox ID="txtTelefono" runat="server" placeholder="Phone Number..." type="text" class="form-control phone_with_ddd" onpaste="return false" minlength="8" MaxLength="8" autocomplete="off" onkeypress="return NumCheck(event, this)" onkeypress2="return mask(this)" />
                                            </div>

                                        </div>
                                        <div class="md:flex md:items-center mb-6">
                                            <div class="md:w-1/3"></div>
                                            <label class="md:w-2/3 block text-grey font-regular">
                                                <input class="mr-2 leading-tight" type="checkbox">
                                                <span class="text-sm">Send me your newsletter!
                                                </span>
                                            </label>
                                        </div>
                                        <div class="md:flex md:items-center">
                                            <div class="md:w-1/3"></div>
                                            <div class="md:w-2/3">
                                                <asp:Button runat="server" Text="Sign Up" CssClass="btn btn-outline-primary-2" OnClick="SingUpS_Click" ID="registerButton"></asp:Button>
                                                <div class="custom-control custom-checkbox">
                                                    <input type="hidden" id="policyAccepted" name="policyAccepted" value="false" />
                                                    <input type="checkbox" class="custom-control-input" id="register-policy-2" onchange="toggleRegisterButton()">
                                                    <label class="custom-control-label" for="register-policy-2">I agree to the <a href="#">privacy policy</a> *</label>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </main>
                </div>


                <!--/Horizontal form-->




            </div>

            <!--/Main-->
        </div>
        <!--Footer-->
        <footer class="bg-grey-darkest text-white p-2">
            <div class="flex flex-1 mx-auto">&copy; My Design</div>
        </footer>
        <!--/footer-->
    </form>

    <script src="./main.js"></script>

</body>

</html>
