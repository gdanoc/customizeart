using MySql.Data.MySqlClient;
using PayPal.Api;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Security.Cryptography;
using System.Text;
using System.Transactions;
using System.Web;

namespace CustomizeArt
{
    public class metodos
    {
        public static MySqlConnection conexion0 = new MySqlConnection("Server= 127.0.0.1; database=customizeart; Uid=root; pwd=TU_PASSWORD_DE_BASE_DE_DATOS;");
        public const string CartSessionKey = "CartId";

        //**************************** Hash ****************************
        public static string Hash_SHA256(string text)
        {
            StringBuilder sb = new StringBuilder();
            using (SHA256 hash = SHA256Managed.Create())
            {
                Encoding enc = Encoding.UTF8;
                Byte[] result = hash.ComputeHash(enc.GetBytes(text));
                foreach (Byte b in result)
                    sb.Append(b.ToString("x2"));
            }
            return sb.ToString();
        }
        //**************************** Login ****************************
        public static int loginES(string usernameOrEmail, string password)
        {
            conexion0.Open();
            int retorno = 1;
            string hashedPassword = Hash_SHA256(password);
            string cmd = "SELECT Id_Usuario FROM usuarios WHERE (Nombre_Usuario = @UsernameOrEmail OR Correo = @UsernameOrEmail) AND Password = @Password;";
            MySqlCommand comando = new MySqlCommand(cmd, conexion0);
            comando.Parameters.AddWithValue("@UsernameOrEmail", usernameOrEmail);
            comando.Parameters.AddWithValue("@Password", hashedPassword);
            if (comando.ExecuteScalar() == null)
            {
                retorno = 1;
            }
            else
            retorno = (int)comando.ExecuteScalar();

            conexion0.Close();
            return retorno;
        }
        //**************************** Login ****************************
        public static int loginING(string usernameOrEmail, string password)
        {
            conexion0.Open();
            int retorno = 1;
            string hashedPassword = Hash_SHA256(password);
            string cmd = "SELECT Id_Usuario FROM usuarios WHERE (User_name = @UsernameOrEmail OR Correo = @UsernameOrEmail) AND Password = @Password;";

            MySqlCommand comando = new MySqlCommand(cmd, conexion0);
            comando.Parameters.AddWithValue("@UsernameOrEmail", usernameOrEmail);
            comando.Parameters.AddWithValue("@Password", hashedPassword);
            if (comando.ExecuteScalar() == null)
            {
                retorno = 1;
            }
            else
            
            retorno = (int)comando.ExecuteScalar();

            conexion0.Close();
            return retorno;
        }

        //**************************** Check Admin ****************************
        public static int Check_AdminES(string usernameOrEmail)
        {
            conexion0.Open();
            int userType = 1;
            string query = "SELECT ID_ROL FROM usuarios WHERE Nombre_Usuario = @UsernameOrEmail OR Correo = @UsernameOrEmail;";
            MySqlCommand cmd = new MySqlCommand(query, conexion0);
            cmd.Parameters.AddWithValue("@UsernameOrEmail", usernameOrEmail); 

            if (cmd.ExecuteScalar() == null)
            {
                userType = 1;
            }
            else
            userType = Convert.ToInt32(cmd.ExecuteScalar());

            conexion0.Close();
            return userType;
        }
        public static int Check_AdminING(string usernameOrEmail)
        {
            conexion0.Open();
            int userType = 1;
            string query = "SELECT ID_ROL FROM usuarios WHERE User_name = @UsernameOrEmail OR Correo = @UsernameOrEmail;";
            MySqlCommand cmd = new MySqlCommand(query, conexion0);
            cmd.Parameters.AddWithValue("@UsernameOrEmail", usernameOrEmail);
            if (cmd.ExecuteScalar() == null)
            {
                userType = 1;
            }
            else
            userType = Convert.ToInt32(cmd.ExecuteScalar());

            conexion0.Close();
            return userType;
        }
        //**************************** Método para los usuario ****************************
        public static int AgregarUsuario(string nombre, string apellido, string usuario, string contra, string correo, string fecha, string rol, string telefono)
        {
            int retorno = 0;
            MySqlCommand comando = new MySqlCommand(string.Format("Insert into usuarios (Nombre, Apellido,Nombre_Usuario, Password,Correo, fecha, ID_ROL, telefono) values ('{0}','{1}','{2}','{3}','{4}','{5}','{6}', '{7}')", nombre, apellido, usuario, contra, correo, fecha, rol, telefono), conexion.ObtenerConexion());
            retorno = comando.ExecuteNonQuery();

            return retorno;
        }
        //**************************** Método para los usuario ingles ****************************
        public static int AgregarUsuarioING(string nombre, string apellido, string usuario, string contra, string correo, string fecha, string rol, string telefono)
        {
            int retorno = 0;
            MySqlCommand comando = new MySqlCommand(string.Format("Insert into usuarios (Name, Last_Name,User_name, Password, Correo, Date, ID_ROL, Cell) values ('{0}','{1}','{2}','{3}','{4}','{5}','{6}', '{7}')", nombre, apellido, usuario, contra, correo, fecha, rol, telefono), conexion.ObtenerConexion());
            retorno = comando.ExecuteNonQuery();

            return retorno;
        }
        public static int AgregarUsuarioSinImagen(string nombre, string apellido, string usuario, string contra, string correo, string fecha, string rol, string telefono)
        {
            int retorno = 0;
            MySqlCommand comando = new MySqlCommand(string.Format("Insert into usuarios (Nombre, Apellido,Nombre_Usuario, Password,Correo, fecha, ID_ROL, telefono, Avatar) values ('{0}','{1}','{2}','{3}','{4}','{5}','{6}', '{7}')", nombre, apellido, usuario, contra, correo, fecha, rol, telefono), conexion.ObtenerConexion());
            retorno = comando.ExecuteNonQuery();

            return retorno;
        }

        //**************************** Método para verificar si se repiten los usuario ****************************
        public static int UsuariosRepetidos(string usuario, string contra, string nombre, string apellido, string correo, string fecha, string rol, string telefono)
        {
            int valor = 0;
            MySqlConnection conexion_usuario = conexion.ObtenerConexion();

            MySqlCommand cmd = new MySqlCommand("SELECT COUNT(*) FROM usuarios WHERE Nombre_Usuario = @Usuario", conexion_usuario);
            cmd.Parameters.AddWithValue("@Usuario", usuario);

            valor = Convert.ToInt32(cmd.ExecuteScalar());

            conexion_usuario.Close();
            return valor; // Retorna 0 si no existe el usuario duplicado, otro valor si existe
        }
        public static int UsuariosRepetidosING(string usuario, string contra, string nombre, string apellido, string correo, string fecha, string rol, string telefono)
        {
            int valor = 0;
            MySqlConnection conexion_usuario = conexion.ObtenerConexion();

            MySqlCommand cmd = new MySqlCommand("SELECT COUNT(*) FROM usuarios WHERE Nombre_Usuario = @Usuario", conexion_usuario);
            cmd.Parameters.AddWithValue("@Usuario", usuario);

            valor = Convert.ToInt32(cmd.ExecuteScalar());

            conexion_usuario.Close();
            return valor; // Retorna 0 si no existe el usuario duplicado, otro valor si existe
        }
        //**************************** Método para verificar si se repiten los correos****************************
        public static int CorreosRepetidosING(string usuario, string contra, string nombre, string apellido, string correo, string fecha, string rol, string telefono)
        {
            int valor = 0;
            MySqlConnection conexion_usuario = conexion.ObtenerConexion();

            MySqlCommand cmd = new MySqlCommand("SELECT COUNT(*) FROM usuarios WHERE Correo = @Correo", conexion_usuario);
            cmd.Parameters.AddWithValue("@Correo", correo);

            valor = Convert.ToInt32(cmd.ExecuteScalar());
            if (valor == 0)
            {
                metodos.AgregarUsuario(nombre, apellido, usuario, contra, correo, fecha, rol, telefono);
            }

            conexion_usuario.Close();
            return valor; // Retorna 0 si no existe el correo duplicado, otro valor si existe
        }
        public static int CorreosRepetidos(string usuario, string contra, string nombre, string apellido, string correo, string fecha, string rol, string telefono)
        {
            int valor = 0;
            MySqlConnection conexion_usuario = conexion.ObtenerConexion();
            MySqlCommand cmd = new MySqlCommand("SELECT COUNT(*) FROM usuarios WHERE Correo= @Correo", conexion_usuario);
            cmd.Parameters.AddWithValue("@Correo", correo);
            valor = Convert.ToInt32(cmd.ExecuteScalar());
            conexion_usuario.Close();
            return valor; // Retorna 0 si no existe el correo duplicado, otro valor si existe
        }
        //**************************** Método para agregar producto  ****************************
        public static int AgregarProductos(string product, string qty, string price, string date, string description, string category, string image)
        {
            conexion0.Open();
            int retorno = 0;
            MySqlCommand comando = new MySqlCommand("INSERT INTO products (Producto, Quantity, Price, Date, Descripcion, Category, Image) VALUES (@product, @quantity, @price, @date, @descripcion, @category, @image);", conexion0);
            comando.Parameters.AddWithValue("@product", product);
            comando.Parameters.AddWithValue("@quantity", qty);
            comando.Parameters.AddWithValue("@price", price);
            comando.Parameters.AddWithValue("@date", date);
            comando.Parameters.AddWithValue("@descripcion", description);
            comando.Parameters.AddWithValue("@category", category);
            comando.Parameters.AddWithValue("@image", image);
            
            // Agrega el nombre del vendedor
            comando.Prepare();
            retorno = comando.ExecuteNonQuery();
            conexion0.Close();
            return retorno;
        }
        public static int AgregarProductosSeller(string product, string qty, string price, string date, string description, string category, string image, int SellerId)
        {
            conexion0.Open();
            int retorno = 0;
            MySqlCommand comando = new MySqlCommand("INSERT INTO products (Producto, Quantity, Price, Date, Descripcion, Category, Image, SellerId) VALUES (@product, @quantity, @price, @date, @descripcion, @category, @image, @SellerId);", conexion0);
            comando.Parameters.AddWithValue("@product", product);
            comando.Parameters.AddWithValue("@quantity", qty);
            comando.Parameters.AddWithValue("@price", price);
            comando.Parameters.AddWithValue("@date", date);
            comando.Parameters.AddWithValue("@descripcion", description);
            comando.Parameters.AddWithValue("@category", category);
            comando.Parameters.AddWithValue("@image", image);
            comando.Parameters.AddWithValue("@SellerId", SellerId); // Agrega el nombre del vendedor
            comando.Prepare();
            retorno = comando.ExecuteNonQuery();
            conexion0.Close();
            return retorno;
        }
        //**************************** Método para eliminar productos  ****************************
        public static int Eliminar(int pId)
        {
            int retorno = 0;
            conexion0.Open();
            MySqlCommand cmd = new MySqlCommand("DELETE FROM products WHERE Id = @id", conexion0);
            cmd.Parameters.AddWithValue("@id", pId);
            retorno = cmd.ExecuteNonQuery();

            conexion0.Close();
            return retorno;
        }
        //**************************** Método para agregar imagen ****************************
        public static int AgregarImagen(string foto, string texto)
        {
            MySqlConnection conn = conexion.ObtenerConexion();
            int retorno = 0;
            MySqlCommand comando = new MySqlCommand(string.Format("INSERT INTO imagenes_carrusel (Direccion, Texto) VALUES('{0}', '{1}'); ", foto, texto), conn);

            retorno = comando.ExecuteNonQuery();
            return retorno;
        }
        //**************************** Método para obtener las imágenes ****************************
        public static string[] ObtenerImagenes()
        {
            MySqlConnection conn = conexion0;
            MySqlDataAdapter DA = new MySqlDataAdapter();
            DA.SelectCommand = new MySqlCommand("SELECT * from imagenes_carrusel;", conn);
            DataTable table = new DataTable();
            DA.Fill(table);
            string imagenes = "";
            string indicators = "";
            int contador = 0;
            foreach (DataRow row in table.Rows)
            {
                if (contador == 0)
                {
                    imagenes += $"<div class='carousel-item active'><img src='images/{row["Direccion"]}' class='d-block w-100'><div class='carousel-caption d-none d-md-block'><h5>{row["Texto"]}</h5></div></div>";
                    indicators += $"<li data-target='#demo' data-slide-to='{contador}' class='active'></li>";
                }
                else
                {
                    imagenes += $"<div class='carousel-item'><img src='images/{row["Direccion"]}' class='d-block w-100'><div class='carousel-caption d-none d-md-block'><h5>{row["Texto"]}</h5></div></div>";
                    indicators += $"<li data-target='#demo' data-slide-to='{contador}'></li>";
                }
                contador++;
            }
            return new string[] { imagenes, indicators };
        }


        //Metodo para obtener un registro
        public static string[] SeleccionarRegistroImagen(int id)
        {
            MySqlConnection conn = conexion.ObtenerConexion();
            MySqlCommand comando = new MySqlCommand(String.Format("SELECT * FROM imagenes_carrusel WHERE ID = {0}", id),
            conn);
            MySqlDataReader reader = comando.ExecuteReader();
            string[] retorno = new string[2];
            while (reader.Read())
            {
                retorno[0] = reader.GetString(1);
                retorno[1] = reader.GetString(2);
            }
            return retorno;
        }
        //**************************** Método para obtener todos los registros de imágenes ****************************
        public static DataTable ListarImagenes()
        {
            MySqlConnection conn = conexion.ObtenerConexion(); //Abrimos la conexión creada.
            MySqlDataAdapter DA = new MySqlDataAdapter();
            DA.SelectCommand = new MySqlCommand(string.Format("SELECT * FROM imagenes_carrusel"), conn);
            DataTable table = new DataTable();
            DA.Fill(table);
            foreach (DataRow row in table.Rows)
            {
                row["Direccion"] = "<img width='100px' class='thumbnail' src='./images/" + row["Direccion"] + "' />";
            }
            return table;
        }
        //**************************** Método para obtener actualizar un registro de imagen ****************************
        public static int ActualizarImagen(int id, string texto, string foto)
        {
            MySqlConnection conn = conexion.ObtenerConexion();
            int retorno = 0;
            MySqlCommand comando;
            if (foto != String.Empty)
                comando = new MySqlCommand(string.Format("UPDATE imagenes_carrusel SET Texto = '{0}', Direccion = '{1}' WHERE Id = '{2}'", texto, foto, id), conn);
            else
                comando = new MySqlCommand(string.Format("UPDATE imagenes_carrusel SET Texto = '{0}' WHERE Id = '{1}'", texto,

                id), conn);
            retorno = comando.ExecuteNonQuery();
            return retorno;
        }
        //**************************** Método para obtener eliminar un registro de imagen ****************************
        public static int EliminarRegistro(int id)
        {
            MySqlConnection conn = conexion.ObtenerConexion(); //Abrimos la conexion creada.
            MySqlCommand comando = new MySqlCommand(String.Format("DELETE FROM imagenes_carrusel WHERE Id = '{0}'", id), conn);
            int retorno = comando.ExecuteNonQuery();
            return retorno;
        }

        //**************************** METODO PARA AGREGAR UN BOTON DE AGREGAR A CARRITO ****************************

        public static DataTable Fetch_Products(bool imgElement)
        {
            conexion0.Open();
            MySqlDataAdapter DA = new MySqlDataAdapter();
            MySqlCommand cmd = new MySqlCommand("SELECT * FROM products;", conexion0);
            DA.SelectCommand = cmd;
            DataTable DT = new DataTable();

            DA.Fill(DT);

            if (imgElement)
            {
                foreach (DataRow row in DT.Rows)
                {
                    row["Image"] = "<img width='100px' class='thumbnail' src='./images/" + row["Image"] + "' />";
                }
            }
            conexion0.Close();
            return DT;
        }
        public static DataTable Fetch_Clothes(bool imgElement)
        {
            conexion0.Open();
            MySqlDataAdapter DA = new MySqlDataAdapter();
            MySqlCommand cmd = new MySqlCommand("SELECT * FROM products WHERE Category = 'Clothes';", conexion0);
            DA.SelectCommand = cmd;
            DataTable DT = new DataTable();

            DA.Fill(DT);

            if (imgElement)
            {
                foreach (DataRow row in DT.Rows)
                {
                    row["Image"] = "<img width='100px' class='thumbnail' src='./images/" + row["Image"] + "' />";
                }
            }
            conexion0.Close();
            return DT;
        }
        public static DataTable Fetch_Technology(bool imgElement)
        {
            conexion0.Open();
            MySqlDataAdapter DA = new MySqlDataAdapter();
            MySqlCommand cmd = new MySqlCommand("SELECT * FROM products WHERE Category = 'Technology';", conexion0);
            DA.SelectCommand = cmd;
            DataTable DT = new DataTable();

            DA.Fill(DT);

            if (imgElement)
            {
                foreach (DataRow row in DT.Rows)
                {
                    row["Image"] = "<img width='100px' class='thumbnail' src='./images/" + row["Image"] + "' />";
                }
            }
            conexion0.Close();
            return DT;
        }
        public static DataTable Fetch_Accesories(bool imgElement)
        {
            conexion0.Open();
            MySqlDataAdapter DA = new MySqlDataAdapter();
            MySqlCommand cmd = new MySqlCommand("SELECT * FROM products WHERE Category = 'Accesories';", conexion0);
            DA.SelectCommand = cmd;
            DataTable DT = new DataTable();

            DA.Fill(DT);

            if (imgElement)
            {
                foreach (DataRow row in DT.Rows)
                {
                    row["Image"] = "<img width='100px' class='thumbnail' src='./images/" + row["Image"] + "' />";
                }
            }
            conexion0.Close();
            return DT;
        }
        //*************** SHOPPING CART****************
        public static string GetCartId()
        {
            if (HttpContext.Current.Session[CartSessionKey] == null)
            {
                if (!string.IsNullOrWhiteSpace(HttpContext.Current.User.Identity.Name))
                {
                    HttpContext.Current.Session[CartSessionKey] = HttpContext.Current.User.Identity.Name;
                }
                else
                {
                    // Generate a new random GUID using System.Guid class.     
                    Guid tempCartId = Guid.NewGuid();
                    HttpContext.Current.Session[CartSessionKey] = tempCartId.ToString();
                }
            }
            return HttpContext.Current.Session[CartSessionKey].ToString();
        }
        public static void SetCartId()
        {
            if (HttpContext.Current.Session[CartSessionKey] == null)
            {
                if (!string.IsNullOrWhiteSpace(HttpContext.Current.User.Identity.Name))
                {
                    HttpContext.Current.Session[CartSessionKey] = HttpContext.Current.User.Identity.Name.ToString();
                }
                else
                {
                    // Generate a new random GUID using System.Guid class.     
                    Guid tempCartId = Guid.NewGuid();
                    HttpContext.Current.Session[CartSessionKey] = tempCartId.ToString();
                }
            }
        }
        public static int AddToCart(int productId, string cartId, int userId, int customizeId)
        {
            //cambie todo el addtocart practicamente
            int retorno = 0;
            conexion0.Open();

            MySqlCommand cmd = new MySqlCommand("SELECT * FROM cart WHERE ProductId = @prodId AND UserId = @userId AND customizeId = @customizeId", conexion0);
            cmd.Parameters.AddWithValue("@prodId", productId);
            cmd.Parameters.AddWithValue("@userId", userId);
            cmd.Parameters.AddWithValue("@customizeId", customizeId);
            cmd.Prepare();

            if (cmd.ExecuteScalar() == null)
            {
                MySqlCommand insertCmd = new MySqlCommand("INSERT INTO cart (ProductId, UserId, Quantity, UnitPrice, CartId, customizeId) VALUES (@prodId, @userId, 1, (SELECT Price FROM products WHERE Id = @prodId), @cartId, @customizeId);", conexion0);
                insertCmd.Parameters.AddWithValue("@prodId", productId);
                insertCmd.Parameters.AddWithValue("@userId", userId);
                insertCmd.Parameters.AddWithValue("@cartId", cartId);
                insertCmd.Parameters.AddWithValue("@customizeId", customizeId);
                insertCmd.Prepare();

                retorno = insertCmd.ExecuteNonQuery();

            }
            else
            {
                MySqlCommand updateCmd = new MySqlCommand("UPDATE cart SET Quantity = Quantity + 1 WHERE ProductId = @prodId AND UserId = @userId AND customizeId = @customizeId", conexion0);
                updateCmd.Parameters.AddWithValue("@prodId", productId);
                updateCmd.Parameters.AddWithValue("@userId", userId);
                updateCmd.Parameters.AddWithValue("@customizeId", customizeId);
                updateCmd.Prepare();

                retorno = updateCmd.ExecuteNonQuery();
            }
            conexion0.Close();
            return retorno;
        }
        public static int AddTonormalCart(int productId, string cartId, int userId)
        {

            int retorno = 0;
            conexion0.Open();

            MySqlCommand cmd = new MySqlCommand("SELECT * FROM cart WHERE ProductID = @prodId AND UserID = @userId", conexion0);
            cmd.Parameters.AddWithValue("@prodId", productId);
            cmd.Parameters.AddWithValue("@userId", userId);
            //cmd.Parameters.AddWithValue("@cartId", cartId);
            cmd.Prepare();

            if (cmd.ExecuteScalar() == null)
            {
                //MySqlCommand insertCmd = new MySqlCommand("INSERT INTO cart (ProductId, UserId, Quantity, UnitPrice, CartId) VALUES ( @prodId, @userId, 1, (SELECT Price FROM productos  WHERE Id = @prodId), @cartId);", conexion);
                //insertCmd.Parameters.AddWithValue("@prodId", productId);
                //insertCmd.Parameters.AddWithValue("@userId", userId);
                //insertCmd.Parameters.AddWithValue("@cartId", cartId);
                //insertCmd.Prepare();
                MySqlCommand insertCmd = new MySqlCommand("INSERT INTO cart (ProductId, UserId, Quantity, UnitPrice, CartId) VALUES ( @prodId, @userId, 1, (SELECT Price FROM products  WHERE Id = @prodId), @cartId);", conexion0);
                insertCmd.Parameters.AddWithValue("@prodId", productId);
                insertCmd.Parameters.AddWithValue("@userId", userId);
                insertCmd.Parameters.AddWithValue("@cartId", cartId);
                insertCmd.Prepare();

                retorno = insertCmd.ExecuteNonQuery();

            }
            else
            {
                MySqlCommand updateCmd = new MySqlCommand("UPDATE cart SET Quantity = Quantity + 1 WHERE ProductID = @prodId AND UserID = @userId", conexion0);
                updateCmd.Parameters.AddWithValue("@prodId", productId);
                updateCmd.Parameters.AddWithValue("@userId", userId);
                //updateCmd.Parameters.AddWithValue("@cartId", cartId);
                updateCmd.Prepare();

                retorno = updateCmd.ExecuteNonQuery();
            }
            conexion0.Close();
            return retorno;
        }

        public static DataTable Fetch_Cart(int userId)
        {
            try
            {
                conexion0.Open();
            }
            catch (Exception e)
            {

            }
            //cambie el cmd de aqui
            MySqlDataAdapter DA = new MySqlDataAdapter();
            MySqlCommand cmd = new MySqlCommand(@"
SELECT 
    cart.*, 
    products.Producto, 
    products.Image, 
    customize.Size, 
    customize.CustomizeImage, 
    customize.Face, 
    customize.Color 
FROM cart
INNER JOIN products ON cart.ProductId = products.ID
INNER JOIN customize ON cart.customizeId = customize.Id AND customize.UserId = cart.UserId
WHERE cart.UserId = @userId;", conexion0);
            cmd.Parameters.AddWithValue("@userId", userId);
            cmd.Prepare();
            DA.SelectCommand = cmd;
            DataTable DT = new DataTable();

            DA.Fill(DT);


            foreach (DataRow row in DT.Rows)
            {
                // Verificar si los datos están correctamente en el DataTable
                System.Diagnostics.Debug.WriteLine("ID: " + row["ID"]);
                System.Diagnostics.Debug.WriteLine("Product: " + row["Producto"]);
                System.Diagnostics.Debug.WriteLine("CustomizeImage: " + row["CustomizeImage"]);
                System.Diagnostics.Debug.WriteLine("Size: " + row["Size"]);
                System.Diagnostics.Debug.WriteLine("Face: " + row["Face"]);
                System.Diagnostics.Debug.WriteLine("Color: " + row["Color"]);
                System.Diagnostics.Debug.WriteLine("UnitPrice: " + row["UnitPrice"]);

                row["Image"] = "<img width='100px' class='thumbnail' src='./images/" + row["Image"] + "' />";
                if (!DBNull.Value.Equals(row["CustomizeImage"]))
                {
                    row["CustomizeImage"] = "<img width='100px' class='thumbnail' src='./cusimages/" + row["CustomizeImage"] + "' />";
                }
            }
            conexion0.Close();
            return DT;
        }
        public static int AddCustomize(string Size, string Image, string Face, string Color, int productId, int userId)
        {
            int retorno = 0;
            conexion0.Open();

            MySqlCommand cmd = new MySqlCommand("SELECT * FROM customize WHERE Size = @Size AND CustomizeImage = @Image AND Face = @Face AND Color = @Color AND ProductId = @productId AND UserId = @userId", conexion0);
            cmd.Parameters.AddWithValue("@Size", Size);
            cmd.Parameters.AddWithValue("@Image", Image);
            cmd.Parameters.AddWithValue("@Face", Face);
            cmd.Parameters.AddWithValue("@Color", Color);
            cmd.Parameters.AddWithValue("@productId", productId);
            cmd.Parameters.AddWithValue("@userId", userId);
            cmd.Prepare();

            if (cmd.ExecuteScalar() == null)
            {
                if (conexion0.State == ConnectionState.Open)
                {
                    MySqlCommand comado = new MySqlCommand("Insert into customize (Size, CustomizeImage, Face, Color, ProductID, UserId) values(@Size, @Image, @Face, @Color, @productId, @userId); SELECT LAST_INSERT_ID();", conexion0);
                    comado.Parameters.AddWithValue("@Size", Size);
                    comado.Parameters.AddWithValue("@Image", Image);
                    comado.Parameters.AddWithValue("@Face", Face);
                    comado.Parameters.AddWithValue("@Color", Color);
                    comado.Parameters.AddWithValue("@productId", productId);
                    comado.Parameters.AddWithValue("@userId", userId);
                    comado.Prepare();

                    retorno = Convert.ToInt32(comado.ExecuteScalar());
                    //retorno = comado.ExecuteNonQuery();
                }
            }
            else
            {
                MySqlCommand selectCmd = new MySqlCommand("SELECT Id FROM customize WHERE Size = @Size AND CustomizeImage = @Image AND Face = @Face AND Color = @Color AND ProductId = @productId AND UserId = @userId;", conexion0);
                selectCmd.Parameters.AddWithValue("@Size", Size);
                selectCmd.Parameters.AddWithValue("@Image", Image);
                selectCmd.Parameters.AddWithValue("@Face", Face);
                selectCmd.Parameters.AddWithValue("@Color", Color);
                selectCmd.Parameters.AddWithValue("@productId", productId);
                selectCmd.Parameters.AddWithValue("@userId", userId);
                selectCmd.Prepare();

                retorno = Convert.ToInt32(selectCmd.ExecuteScalar());
            }
            conexion0.Close();
            return retorno;
        }
        public static int AddNoCustomize(string Size, string Color, int productId, int userId)
        {
            int retorno = 0;
            conexion0.Open();

            MySqlCommand cmd = new MySqlCommand("SELECT * FROM customize WHERE Size = @Size AND Color = @Color AND ProductId = @productId AND UserId = @userId", conexion0);
            cmd.Parameters.AddWithValue("@Size", Size);
            cmd.Parameters.AddWithValue("@Color", Color);
            cmd.Parameters.AddWithValue("@productId", productId);
            cmd.Parameters.AddWithValue("@userId", userId);
            cmd.Prepare();

            if (cmd.ExecuteScalar() == null)
            {
                if (conexion0.State == ConnectionState.Open)
                {
                    MySqlCommand comado = new MySqlCommand("Insert into customize (Size, Color, ProductID, UserId) values(@Size, @Color, @productId, @userId); SELECT LAST_INSERT_ID();", conexion0);
                    comado.Parameters.AddWithValue("@Size", Size);
                    comado.Parameters.AddWithValue("@Color", Color);
                    comado.Parameters.AddWithValue("@productId", productId);
                    comado.Parameters.AddWithValue("@userId", userId);
                    comado.Prepare();

                    retorno = Convert.ToInt32(comado.ExecuteScalar());
                    //retorno = comado.ExecuteNonQuery();
                }
            }
            else
            {
                MySqlCommand selectCmd = new MySqlCommand("SELECT Id FROM customize WHERE Size = @Size AND Color = @Color AND ProductId = @productId AND UserId = @userId;", conexion0);
                selectCmd.Parameters.AddWithValue("@Size", Size);
                selectCmd.Parameters.AddWithValue("@Color", Color);
                selectCmd.Parameters.AddWithValue("@productId", productId);
                selectCmd.Parameters.AddWithValue("@userId", userId);
                selectCmd.Prepare();

                retorno = Convert.ToInt32(selectCmd.ExecuteScalar());
            }
            conexion0.Close();
            return retorno;
        }

        //public static int Delete_From_Cart(int productId, int userId, int cusId)
        //{
        //    int retorno = 0;
        //    conexion0.Open();

        //    MySqlCommand cmd = new MySqlCommand("DELETE FROM cart WHERE ProductID = @productID AND @userId AND customizeId = @cusId;", conexion0);
        //    cmd.Parameters.AddWithValue("@productId", productId);
        //    cmd.Parameters.AddWithValue("@userId", userId);
        //    cmd.Parameters.AddWithValue("@userId", userId);
        //    retorno = cmd.ExecuteNonQuery();

        //    conexion0.Close();
        //    return retorno;
        //}
        public static int Delete_From_Cart(int productId, int userId, int customizeId)
        {
            int retorno = 0;
            conexion0.Open();

            MySqlCommand cmd = new MySqlCommand("DELETE FROM cart WHERE ProductId = @productId AND UserId = @userId AND customizeId = @cusId;" +
                                                "DELETE FROM customize WHERE ProductId = @productId AND UserId = @userId AND Id = @cusId", conexion0);

            cmd.Parameters.AddWithValue("@productId", productId);
            cmd.Parameters.AddWithValue("@userId", userId);
            cmd.Parameters.AddWithValue("@cusId", customizeId);

            retorno = cmd.ExecuteNonQuery();

            conexion0.Close();
            return retorno;
        }

        public static double Cart_Total(int userId)
        {
            conexion0.Open();
            double total = 0;
            MySqlCommand cmd = new MySqlCommand("SELECT SUM(cart.quantity * cart.UnitPrice) FROM cart WHERE UserId = @userid", conexion0);
            cmd.Parameters.AddWithValue("@userid", userId);
            cmd.Prepare();
            if (!double.TryParse(cmd.ExecuteScalar().ToString(), out total))
            {
                conexion0.Close();
                return 0;
            }

            conexion0.Close();
            return total;
        }

        public static int Check_OutPayPal(int userId, string IdTransaccion)
        {
            int retorno = 0;
            List<CartItem> items = new List<CartItem>();
            Guid QRText = Guid.NewGuid();

            try
            {
                using (var conexion0 = new MySqlConnection("Server=127.0.0.1; database=customizeart; Uid=root; pwd=TU_PASSWORD_DE_BASE_DE_DATOS;"))
                {
                    conexion0.Open();

                    // Leer los items del carrito y los detalles de personalización
                    string query = "SELECT c.Id, c.ProductID, c.UserId, c.Quantity, c.UnitPrice, c.CartId, c.customizeId, " +
                                   "cu.Size, cu.CustomizeImage, cu.Face, cu.Color " +
                                   "FROM cart c " +
                                   "INNER JOIN customize cu ON c.customizeId = cu.Id " +
                                   "WHERE c.UserId = @userId";
                    double totalPurchase = 0;
                    int purchasedItems = 0;

                    using (var readCmd = new MySqlCommand(query, conexion0))
                    {
                        readCmd.Parameters.AddWithValue("@userId", userId);
                        using (var reader = readCmd.ExecuteReader())
                        {
                            if (!reader.HasRows)
                            {
                                return 0;
                            }
                            else
                            {
                                retorno = 1;
                            }

                            while (reader.Read())
                            {
                                CartItem item = new CartItem
                                {
                                    ItemId = reader.GetInt32("Id"),
                                    ProductID = reader.GetInt32("ProductID"),
                                    UserId = reader.GetInt32("UserId"),
                                    Quantity = reader.GetInt32("Quantity").ToString(),
                                    UnitPrice = reader.GetDouble("UnitPrice"),
                                    CartId = reader.GetString("CartId"),
                                    customizeId = reader.GetInt32("customizeId")
                                };

                                totalPurchase += item.UnitPrice * int.Parse(item.Quantity);
                                purchasedItems += int.Parse(item.Quantity);

                                items.Add(item);
                            }
                        }
                    }

                    using (var scope = new TransactionScope())
                    {
                        // Insertar Venta
                        string saleQuery = "INSERT INTO sales (UserId, Total, Items, IDTransaccion, Date) VALUES (@userId, @total, @items, @idtransaccion, NOW());";
                        int saleID;

                        using (var saleCmd = new MySqlCommand(saleQuery, conexion0))
                        {
                            saleCmd.Parameters.AddWithValue("@userId", userId);
                            saleCmd.Parameters.AddWithValue("@total", totalPurchase);
                            saleCmd.Parameters.AddWithValue("@items", purchasedItems);
                            saleCmd.Parameters.AddWithValue("@idtransaccion", IdTransaccion);
                            int result = saleCmd.ExecuteNonQuery();
                            if (result != 1)
                            {
                                return 0;
                            }
                            else
                            {
                                retorno = 1;
                            }

                            saleID = (int)saleCmd.LastInsertedId;
                        }

                        string checkInventoryQuery = "SELECT Quantity FROM products WHERE Id = @itemId;";
                        string insertSalesDetailsQuery = "INSERT INTO sales_details (SalesId, ItemId, Quantity, UnitPrice, TotalPrice, id_seller, Status, customizeId) VALUES (@salesID, @itemId, @qty, @unitPrice, @totalPrice, @idseller, 'Waiting', @customizeId);";
                        string updateInventoryQuery = "UPDATE products SET Quantity = (Quantity - @itemsSold) WHERE Id = @itemId;";
                        string deleteCartItemQuery = "DELETE FROM cart WHERE Id = @entryId;";
                        string insertCustomizeDetailsQuery = "INSERT INTO customize_details (Id_customize, SalesId, Size, CustomizeImage, Face, Color, ProductId, UserId) VALUES (@customizeId, @salesID, @size, @customizeImage, @face, @color, @productId, @userId);";
                        string selectSellerIdQuery = "SELECT SellerId FROM products WHERE ID = @productId;";
                        string deleteCustomizeItemQuery = "DELETE FROM Customize WHERE Id = @entryId;";

                        foreach (CartItem item in items)
                        {
                            // Consultar detalles de personalización
                            string customizeQuery = "SELECT Size, CustomizeImage, Face, Color FROM customize WHERE Id = @customizeId;";
                            string size = "", customizeImage = "", face = "", color = "";

                            using (var customizeCmd = new MySqlCommand(customizeQuery, conexion0))
                            {
                                customizeCmd.Parameters.AddWithValue("@customizeId", item.customizeId);
                                using (var customizeReader = customizeCmd.ExecuteReader())
                                {
                                    if (customizeReader.Read())
                                    {
                                        size = customizeReader.GetString("Size");
                                        customizeImage = customizeReader.GetString("CustomizeImage");
                                        face = customizeReader.GetString("Face");
                                        color = customizeReader.GetString("Color");
                                    }
                                }
                            }

                            using (var checkInventory = new MySqlCommand(checkInventoryQuery, conexion0))
                            using (var insertSalesDetails = new MySqlCommand(insertSalesDetailsQuery, conexion0))
                            using (var updateInventory = new MySqlCommand(updateInventoryQuery, conexion0))
                            using (var deleteCartItem = new MySqlCommand(deleteCartItemQuery, conexion0))
                            using (var insertCustomizeDetails = new MySqlCommand(insertCustomizeDetailsQuery, conexion0))
                            using (var selectSellerId = new MySqlCommand(selectSellerIdQuery, conexion0))
                            using (var deleteCustomizeItem = new MySqlCommand(deleteCustomizeItemQuery, conexion0))
                            {
                                // Verificar existencia del item
                                checkInventory.Parameters.AddWithValue("@itemId", item.ProductID);
                                var inventoryObject = checkInventory.ExecuteScalar();

                                if (inventoryObject == DBNull.Value || inventoryObject == null)
                                {
                                    return 0;
                                }
                                else
                                {
                                    retorno = 1;
                                }

                                int currentInventory = Convert.ToInt32(inventoryObject);
                                int newInventory = currentInventory - int.Parse(item.Quantity);

                                if (newInventory < 0)
                                {
                                    return 0;
                                }
                                else
                                {
                                    retorno = 1;
                                }

                                // Obtener id_seller
                                selectSellerId.Parameters.AddWithValue("@productId", item.ProductID);
                                var sellerId = selectSellerId.ExecuteScalar();

                                if (sellerId == DBNull.Value || sellerId == null)
                                {
                                    return 0;
                                }
                                else
                                {
                                    retorno = 1;
                                }

                                // Insertar en detalles de venta
                                insertSalesDetails.Parameters.AddWithValue("@salesID", saleID);
                                insertSalesDetails.Parameters.AddWithValue("@itemId", item.ProductID);
                                insertSalesDetails.Parameters.AddWithValue("@qty", item.Quantity);
                                insertSalesDetails.Parameters.AddWithValue("@unitPrice", item.UnitPrice);
                                insertSalesDetails.Parameters.AddWithValue("@totalPrice", item.UnitPrice * int.Parse(item.Quantity));
                                insertSalesDetails.Parameters.AddWithValue("@idseller", sellerId);
                                insertSalesDetails.Parameters.AddWithValue("@customizeId", item.customizeId); // Incluir el customizeId

                                if (insertSalesDetails.ExecuteNonQuery() != 1)
                                {
                                    return 0;
                                }
                                else
                                {
                                    retorno = 1;
                                }

                                // Actualizar inventario
                                updateInventory.Parameters.AddWithValue("@itemsSold", item.Quantity);
                                updateInventory.Parameters.AddWithValue("@itemId", item.ProductID);

                                if (updateInventory.ExecuteNonQuery() != 1)
                                {
                                    return 0;
                                }
                                else
                                {
                                    retorno = 1;
                                }

                                // Eliminar item del carrito
                                deleteCartItem.Parameters.AddWithValue("@entryId", item.ItemId);

                                if (deleteCartItem.ExecuteNonQuery() != 1)
                                {
                                    return 0;
                                }
                                else
                                {
                                    retorno = 1;
                                }

                                // Insertar en detalles de personalización
                                insertCustomizeDetails.Parameters.AddWithValue("@customizeId", item.customizeId);
                                insertCustomizeDetails.Parameters.AddWithValue("@salesID", saleID);
                                insertCustomizeDetails.Parameters.AddWithValue("@size", size);
                                insertCustomizeDetails.Parameters.AddWithValue("@customizeImage", customizeImage);
                                insertCustomizeDetails.Parameters.AddWithValue("@face", face);
                                insertCustomizeDetails.Parameters.AddWithValue("@color", color);
                                insertCustomizeDetails.Parameters.AddWithValue("@productId", item.ProductID);
                                insertCustomizeDetails.Parameters.AddWithValue("@userId", userId);

                                if (insertCustomizeDetails.ExecuteNonQuery() != 1)
                                {
                                    return 0;
                                }
                                else
                                {
                                    retorno = 1;
                                }

                                deleteCustomizeItem.Parameters.AddWithValue("@entryId", item.ItemId);

                                if (deleteCustomizeItem.ExecuteNonQuery() != 1)
                                {
                                    return 0;
                                }
                                else
                                {
                                    retorno = 1;
                                }

                            }
                        }

                        // Llamar al método Check_OutCustomize
                        //int customizeResult = Check_OutCustomize(userId, saleID);
                        //if (customizeResult != 1)
                        //{
                        //    return 0;
                        //}
                        //else
                        //{
                        //    retorno = 1;
                        //}
                        retorno = 1;
                    }
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error: {ex.Message}");
                retorno = 0;
            }

            return retorno;
        }
        public static int Check_Out(int userId)
        {
            int retorno = 0;
            List<CartItem> items = new List<CartItem>();
            Guid QRText = Guid.NewGuid();

            try
            {
                using (var conexion0 = new MySqlConnection("Server=127.0.0.1; database=customizeart; Uid=root; pwd=TU_PASSWORD_DE_BASE_DE_DATOS;"))
                {
                    conexion0.Open();

                    // Leer los items del carrito y los detalles de personalización
                    string query = "SELECT c.Id, c.ProductID, c.UserId, c.Quantity, c.UnitPrice, c.CartId, c.customizeId, " +
                                   "cu.Size, cu.CustomizeImage, cu.Face, cu.Color " +
                                   "FROM cart c " +
                                   "INNER JOIN customize cu ON c.customizeId = cu.Id " +
                                   "WHERE c.UserId = @userId";
                    double totalPurchase = 0;
                    int purchasedItems = 0;

                    using (var readCmd = new MySqlCommand(query, conexion0))
                    {
                        readCmd.Parameters.AddWithValue("@userId", userId);
                        using (var reader = readCmd.ExecuteReader())
                        {
                            if (!reader.HasRows)
                            {
                                return 0;
                            }
                            else
                            {
                                retorno = 1;
                            }

                            while (reader.Read())
                            {
                                CartItem item = new CartItem
                                {
                                    ItemId = reader.GetInt32("Id"),
                                    ProductID = reader.GetInt32("ProductID"),
                                    UserId = reader.GetInt32("UserId"),
                                    Quantity = reader.GetInt32("Quantity").ToString(),
                                    UnitPrice = reader.GetDouble("UnitPrice"),
                                    CartId = reader.GetString("CartId"),
                                    customizeId = reader.GetInt32("customizeId")
                                };

                                totalPurchase += item.UnitPrice * int.Parse(item.Quantity);
                                purchasedItems += int.Parse(item.Quantity);

                                items.Add(item);
                            }
                        }
                    }

                    using (var scope = new TransactionScope())
                    {
                        // Insertar Venta
                        string saleQuery = "INSERT INTO sales (UserId, Total, Items, Date) VALUES (@userId, @total, @items, NOW());";
                        int saleID;

                        using (var saleCmd = new MySqlCommand(saleQuery, conexion0))
                        {
                            saleCmd.Parameters.AddWithValue("@userId", userId);
                            saleCmd.Parameters.AddWithValue("@total", totalPurchase);
                            saleCmd.Parameters.AddWithValue("@items", purchasedItems);
                            int result = saleCmd.ExecuteNonQuery();
                            if (result != 1)
                            {
                                return 0;
                            }
                            else
                            {
                                retorno = 1;
                            }

                            saleID = (int)saleCmd.LastInsertedId;
                        }

                        string checkInventoryQuery = "SELECT Quantity FROM products WHERE Id = @itemId;";
                        string insertSalesDetailsQuery = "INSERT INTO sales_details (SalesId, ItemId, Quantity, UnitPrice, TotalPrice, id_seller, Status, customizeId) VALUES (@salesID, @itemId, @qty, @unitPrice, @totalPrice, @idseller, 'Waiting', @customizeId);";
                        string updateInventoryQuery = "UPDATE products SET Quantity = (Quantity - @itemsSold) WHERE Id = @itemId;";
                        string deleteCartItemQuery = "DELETE FROM cart WHERE Id = @entryId;";
                        string insertCustomizeDetailsQuery = "INSERT INTO customize_details (Id_customize, SalesId, Size, CustomizeImage, Face, Color, ProductId, UserId) VALUES (@customizeId, @salesID, @size, @customizeImage, @face, @color, @productId, @userId);";
                        string selectSellerIdQuery = "SELECT SellerId FROM products WHERE ID = @productId;";
                        string deleteCustomizeItemQuery = "DELETE FROM Customize WHERE Id = @entryId;";

                        foreach (CartItem item in items)
                        {
                            // Consultar detalles de personalización
                            string customizeQuery = "SELECT Size, CustomizeImage, Face, Color FROM customize WHERE Id = @customizeId;";
                            string size = "", customizeImage = "", face = "", color = "";

                            using (var customizeCmd = new MySqlCommand(customizeQuery, conexion0))
                            {
                                customizeCmd.Parameters.AddWithValue("@customizeId", item.customizeId);
                                using (var customizeReader = customizeCmd.ExecuteReader())
                                {
                                    if (customizeReader.Read())
                                    {
                                        size = customizeReader.GetString("Size");
                                        customizeImage = customizeReader.GetString("CustomizeImage");
                                        face = customizeReader.GetString("Face");
                                        color = customizeReader.GetString("Color");
                                    }
                                }
                            }

                            using (var checkInventory = new MySqlCommand(checkInventoryQuery, conexion0))
                            using (var insertSalesDetails = new MySqlCommand(insertSalesDetailsQuery, conexion0))
                            using (var updateInventory = new MySqlCommand(updateInventoryQuery, conexion0))
                            using (var deleteCartItem = new MySqlCommand(deleteCartItemQuery, conexion0))
                            using (var insertCustomizeDetails = new MySqlCommand(insertCustomizeDetailsQuery, conexion0))
                            using (var selectSellerId = new MySqlCommand(selectSellerIdQuery, conexion0))
                            using (var deleteCustomizeItem = new MySqlCommand(deleteCustomizeItemQuery, conexion0))
                            {
                                // Verificar existencia del item
                                checkInventory.Parameters.AddWithValue("@itemId", item.ProductID);
                                var inventoryObject = checkInventory.ExecuteScalar();

                                if (inventoryObject == DBNull.Value || inventoryObject == null)
                                {
                                    return 0;
                                }
                                else
                                {
                                    retorno = 1;
                                }

                                int currentInventory = Convert.ToInt32(inventoryObject);
                                int newInventory = currentInventory - int.Parse(item.Quantity);

                                if (newInventory < 0)
                                {
                                    return 0;
                                }
                                else
                                {
                                    retorno = 1;
                                }

                                // Obtener id_seller
                                selectSellerId.Parameters.AddWithValue("@productId", item.ProductID);
                                var sellerId = selectSellerId.ExecuteScalar();

                                if (sellerId == DBNull.Value || sellerId == null)
                                {
                                    return 0;
                                }
                                else
                                {
                                    retorno = 1;
                                }

                                // Insertar en detalles de venta
                                insertSalesDetails.Parameters.AddWithValue("@salesID", saleID);
                                insertSalesDetails.Parameters.AddWithValue("@itemId", item.ProductID);
                                insertSalesDetails.Parameters.AddWithValue("@qty", item.Quantity);
                                insertSalesDetails.Parameters.AddWithValue("@unitPrice", item.UnitPrice);
                                insertSalesDetails.Parameters.AddWithValue("@totalPrice", item.UnitPrice * int.Parse(item.Quantity));
                                insertSalesDetails.Parameters.AddWithValue("@idseller", sellerId);
                                insertSalesDetails.Parameters.AddWithValue("@customizeId", item.customizeId); // Incluir el customizeId

                                if (insertSalesDetails.ExecuteNonQuery() != 1)
                                {
                                    return 0;
                                }
                                else
                                {
                                    retorno = 1;
                                }

                                // Actualizar inventario
                                updateInventory.Parameters.AddWithValue("@itemsSold", item.Quantity);
                                updateInventory.Parameters.AddWithValue("@itemId", item.ProductID);

                                if (updateInventory.ExecuteNonQuery() != 1)
                                {
                                    return 0;
                                }
                                else
                                {
                                    retorno = 1;
                                }

                                // Eliminar item del carrito
                                deleteCartItem.Parameters.AddWithValue("@entryId", item.ItemId);

                                if (deleteCartItem.ExecuteNonQuery() != 1)
                                {
                                    return 0;
                                }
                                else
                                {
                                    retorno = 1;
                                }

                                // Insertar en detalles de personalización
                                insertCustomizeDetails.Parameters.AddWithValue("@customizeId", item.customizeId);
                                insertCustomizeDetails.Parameters.AddWithValue("@salesID", saleID);
                                insertCustomizeDetails.Parameters.AddWithValue("@size", size);
                                insertCustomizeDetails.Parameters.AddWithValue("@customizeImage", customizeImage);
                                insertCustomizeDetails.Parameters.AddWithValue("@face", face);
                                insertCustomizeDetails.Parameters.AddWithValue("@color", color);
                                insertCustomizeDetails.Parameters.AddWithValue("@productId", item.ProductID);
                                insertCustomizeDetails.Parameters.AddWithValue("@userId", userId);

                                if (insertCustomizeDetails.ExecuteNonQuery() != 1)
                                {
                                    return 0;
                                }
                                else
                                {
                                    retorno = 1;
                                }

                                deleteCustomizeItem.Parameters.AddWithValue("@entryId", item.ItemId);

                                if (deleteCustomizeItem.ExecuteNonQuery() != 1)
                                {
                                    return 0;
                                }
                                else
                                {
                                    retorno = 1;
                                }

                            }
                        }

                        retorno = 1;
                    }
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error: {ex.Message}");
                retorno = 0;
            }

            return retorno;
        }
        public static DataTable Get_Salesseller(int userId)
        {
            conexion0.Open();
            MySqlDataAdapter DA = new MySqlDataAdapter();
            MySqlCommand cmd = new MySqlCommand("SELECT sales_details.Id, sales_details.SalesId as 'Id Venta', products.Producto as 'Producto', sales_details.Quantity as 'Cantidad', sales_details.UnitPrice as 'Precio Unidad', " +
            "sales_details.TotalPrice as 'Total',  DATE_FORMAT(sales.Date, '%d/%c/%Y') as 'Fecha', usuarios.Nombre_usuario as 'Comprador',  sales_details.Status as 'Status' FROM sales_details " +
            "INNER JOIN products ON sales_details.ItemId = products.Id INNER JOIN sales ON sales.Id = sales_details.SalesId INNER JOIN usuarios ON sales.UserId = usuarios.Id_usuario " +
            "WHERE sales_details.id_Seller = @userId ORDER BY sales_details.SalesId; ", conexion0);

            cmd.Parameters.AddWithValue("@userId", userId);

            DA.SelectCommand = cmd;
            DataTable DT = new DataTable();

            DA.Fill(DT);

            conexion0.Close();
            return DT;
        }
        public static DataTable Get_SalesCustomize(int userId)
        {
            conexion0.Open();
            MySqlDataAdapter DA = new MySqlDataAdapter();
            MySqlCommand cmd = new MySqlCommand(
            @"SELECT 
                sd.Id, 
                sd.SalesId as 'Id Venta', 
                p.Producto as 'Producto', 
                sd.Quantity as 'Cantidad', 
                sd.UnitPrice as 'Precio Unidad', 
                sd.TotalPrice as 'Total', 
                DATE_FORMAT(s.Date, '%d/%c/%Y') as 'Fecha', 
                u.Nombre_usuario as 'Comprador', 
                sd.Status as 'Status', 
                cd.Size as 'Talla', 
                cd.Face as 'Cara', 
                cd.Color as 'Color',
                CONCAT('images/', cd.CustomizeImage) as 'ImagePath'
            FROM sales_details sd
            INNER JOIN products p ON sd.ItemId = p.Id
            INNER JOIN sales s ON s.Id = sd.SalesId
            INNER JOIN usuarios u ON s.UserId = u.Id_usuario
            LEFT JOIN customize_details cd ON sd.SalesId = cd.SalesId AND sd.ItemId = cd.ProductId
            WHERE sd.id_Seller = @userId
            ORDER BY sd.SalesId;", conexion0);

            cmd.Parameters.AddWithValue("@userId", userId);

            DA.SelectCommand = cmd;
            DataTable DT = new DataTable();

            DA.Fill(DT);

            conexion0.Close();
            return DT;
        }
        public static DataTable Get_Sales()
        {
            conexion0.Open();
            MySqlDataAdapter DA = new MySqlDataAdapter();
            MySqlCommand cmd = new MySqlCommand("SELECT sales_details.Id, sales_details.SalesId as 'Id Venta', products.Producto as 'Producto', sales_details.Quantity as 'Cantidad', sales_details.UnitPrice as 'Precio Unidad', " +
            "sales_details.TotalPrice as 'Total',  DATE_FORMAT(sales.Date, '%d/%c/%Y') as 'Fecha', usuarios.Nombre_usuario as 'Comprador' FROM sales_details " +
            "INNER JOIN products ON sales_details.ItemId = products.Id INNER JOIN sales ON sales.Id = sales_details.SalesId INNER JOIN usuarios ON sales.UserId = usuarios.Id_usuario ORDER BY sales_details.SalesId; ", conexion0);
            DA.SelectCommand = cmd;
            DataTable DT = new DataTable();

            DA.Fill(DT);

            conexion0.Close();
            return DT;
        }
        public static DataTable Get_Sales2(int userId)
        {
            conexion0.Open();
            MySqlDataAdapter DA = new MySqlDataAdapter();
            MySqlCommand cmd = new MySqlCommand(
                "SELECT sales_details.Id, products.Producto as 'Product', " +
                "sales_details.Quantity as 'Quantity', sales_details.UnitPrice as 'UnitPrice', " +
                "sales_details.TotalPrice as 'Total', sales_details.Status as 'Status', " +
                "DATE_FORMAT(sales.Date, '%d/%c/%Y') as 'Fecha' , " +
                "CONCAT('images/', products.Image) as 'ImagePath' " + // Aquí concatenamos la ruta de la imagen
                "FROM sales_details " +
                "INNER JOIN products ON sales_details.ItemId = products.Id " +
                "INNER JOIN sales ON sales.Id = sales_details.SalesId " +
                "WHERE sales.UserId = @userId " +
                "ORDER BY sales_details.SalesId;", conexion0);

            cmd.Parameters.AddWithValue("@userId", userId);

            DA.SelectCommand = cmd;
            DataTable DT = new DataTable();

            DA.Fill(DT);

            conexion0.Close();
            return DT;
        }
        public static Add Search_Product(int id)
        {
            Add product = new Add();
            conexion0.Open();
            MySqlCommand cmd = new MySqlCommand("SELECT Id, Producto, Quantity, Price, Date, Descripcion, Category, Image FROM products WHERE Id = @id;", conexion0); cmd.Parameters.AddWithValue("@id", id);
            MySqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                product.Id = reader.GetInt32(0);
                product.Product = reader.GetString(1);
                product.Quantity = reader.GetString(2);
                product.Price = reader.GetString(3);
                product.Date = reader.GetString(4);
                product.Description = reader.GetString(5);
                product.Category = reader.GetString(6);
                product.Image = reader.GetString(7);

            }
            conexion0.Close();
            return product;
        }

        public static int Update_ProductImage(int id, string producto, string quantity, string price, string date, string description, string category, string image)
        {
            conexion0.Open();
            int retorno = 0;
            string query = "UPDATE products SET ";
            query += "Product = @product, ";
            query += "Quantity = @quantity, ";
            query += "Price = @price, ";
            query += "Date = @date, ";
            query += "Descripcion = @descripcion, ";
            query += "Category = @category, ";
            query += "Image = @image ";
            query += "WHERE Id = @id;";

            MySqlCommand cmd = new MySqlCommand(query, conexion0);
            cmd.Parameters.AddWithValue("@product", producto);
            cmd.Parameters.AddWithValue("@quantity", quantity);
            cmd.Parameters.AddWithValue("@price", price);
            cmd.Parameters.AddWithValue("@date", date);
            cmd.Parameters.AddWithValue("@descripcion", description);
            cmd.Parameters.AddWithValue("@category", category);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@image", image);


            retorno = cmd.ExecuteNonQuery();

            conexion0.Close();
            return retorno;
        }
        public static int Update_Product(int id, string producto, string quantity, string price, string date, string description, string category)
        {
            conexion0.Open();
            int retorno = 0;
            string query = "UPDATE products SET ";
            query += "Product = @product, ";
            query += "Quantity = @quantity, ";
            query += "Price = @price, ";
            query += "Date = @date, ";
            query += "Descripcion = @descripcion, ";
            query += "Category = @category, ";
            query += "WHERE Id = @id;";

            MySqlCommand cmd = new MySqlCommand(query, conexion0);
            cmd.Parameters.AddWithValue("@product", producto);
            cmd.Parameters.AddWithValue("@quantity", quantity);
            cmd.Parameters.AddWithValue("@price", price);

            cmd.Parameters.AddWithValue("@date", date);
            cmd.Parameters.AddWithValue("@descripcion", description);
            cmd.Parameters.AddWithValue("@category", category);

            cmd.Parameters.AddWithValue("@id", id);

            retorno = cmd.ExecuteNonQuery();

            conexion0.Close();
            return retorno;
        }

        public static int Update_Product_Seller(int id, string updatedQuantity)
        {
            conexion0.Open();
            int retorno = 0;
            string query = "UPDATE products SET Quantity  =  @updatedQuantity WHERE Id = @id;";

            MySqlCommand cmd = new MySqlCommand(query, conexion0);

            cmd.Parameters.AddWithValue("@updatedQuantity", updatedQuantity);

            cmd.Parameters.AddWithValue("@id", id);

            retorno = cmd.ExecuteNonQuery();

            conexion0.Close();
            return retorno;
        }
        public static int login(string username, string password)
        {
            conexion0.Open();
            int retorno = 1;
            string hashedPassword = Hash_SHA256(password);

            // Comando para la tabla usuarios
            string cmd = String.Format("SELECT Id_Usuario FROM usuarios WHERE Nombre_Usuario = '{0}' AND Password = '{1}';", username, hashedPassword);
            // Comando para la tabla seller
            string cmd2 = String.Format("SELECT id_Seller FROM seller WHERE nombre = '{0}' AND Contraseña = '{1}';", username, hashedPassword);

            MySqlCommand comando = new MySqlCommand(cmd, conexion0);
            MySqlCommand comando2 = new MySqlCommand(cmd2, conexion0);

            // Verificación en la tabla usuarios
            object result1 = comando.ExecuteScalar();
            if (result1 != null)
            {
                retorno = (int)result1;
            }
            else
            {
                // Verificación en la tabla seller si no se encontró en usuarios
                object result2 = comando2.ExecuteScalar();
                if (result2 != null)
                {
                    retorno = (int)result2;
                }
            }

            conexion0.Close();
            return retorno;
        }
        public static int Check_Admin(string username)
        {
            conexion0.Open();
            int userType = 1;
            MySqlCommand cmd = new MySqlCommand(String.Format("SELECT ID_ROL FROM usuarios WHERE Nombre_Usuario = '{0}';", username), conexion0); //Realizamos una selecion de la tabla usuarios.

            if (cmd.ExecuteScalar() == null)
            {
                userType = 1;
            }
            else
                userType = Convert.ToInt32(cmd.ExecuteScalar());

            conexion0.Close();
            return userType;
        }

        public static int CheckSeller(string username)
        {
            conexion0.Open();
            int userType = 1;

            // Comando para la tabla usuarios
            MySqlCommand cmd = new MySqlCommand(String.Format("SELECT ID_ROL FROM usuarios WHERE Nombre_Usuario = '{0}';", username), conexion0);

            // Verificación en la tabla usuarios
            object result1 = cmd.ExecuteScalar();
            if (result1 != null)
            {
                userType = Convert.ToInt32(result1);
            }
            else
            {
                // Comando para la tabla seller si no se encontró en usuarios
                MySqlCommand cmd2 = new MySqlCommand(String.Format("SELECT ID_ROL FROM seller WHERE nombre = '{0}';", username), conexion0);

                // Verificación en la tabla seller
                object result2 = cmd2.ExecuteScalar();
                if (result2 != null)
                {
                    userType = Convert.ToInt32(result2);
                }
            }

            conexion0.Close();
            return userType;
        }

        public static int SellerRepetidos(string nombre, string contra, string tienda, string descripcion, string correo, string telefono, string rol)
        {
            int valor = 0;
            MySqlConnection conexion_usuario = conexion.ObtenerConexion();
            MySqlCommand cmd = new MySqlCommand("SELECT id_Seller FROM seller WHERE nombre ='" + nombre + "'", conexion_usuario);
            valor = Convert.ToInt32(cmd.ExecuteScalar());
            if (valor != 0)
            {

            }
            else
            {
                metodos.AgregarSeller(nombre, contra, tienda, descripcion, correo, telefono, rol);

            }
            conexion_usuario.Close();
            return valor;
        }
        public static int AgregarSeller(string nombre, string contra, string tienda, string descripcion, string correo, string telefono, string rol)
        {
            int retorno = 0;
            MySqlCommand comando = new MySqlCommand(string.Format("Insert into seller (nombre, Contraseña, Tienda, Descripcion, Correo, Telefono, ID_ROL) values ('{0}','{1}','{2}','{3}','{4}','{5}','{6}')", nombre, contra, tienda, descripcion, correo, telefono, rol), conexion.ObtenerConexion());
            retorno = comando.ExecuteNonQuery();

            return retorno;
        }
        //**************************** Método para verificar si se repiten los correos****************************
        public static int CorreosRepetidosS(string nombre, string contra, string tienda, string descripcion, string correo, string telefono, string rol)
        {
            int valor = 0;
            MySqlConnection conexion_usuario = conexion.ObtenerConexion();
            MySqlCommand cmd = new MySqlCommand("SELECT Id_Usuario FROM usuarios WHERE correo='" + correo + "'", conexion_usuario);
            valor = Convert.ToInt32(cmd.ExecuteScalar());
            if (valor != 0)
            {

            }
            else
            {
                metodos.AgregarSeller(nombre, contra, tienda, descripcion, correo, telefono, rol);

            }
            conexion_usuario.Close();
            return valor;
        }
    }
}