# CustomizeArt

Tienda en línea donde los clientes pueden personalizar y comprar productos como tazas, ropa, accesorios y artículos de tecnología, eligiendo color, tamaño e imagen antes de agregarlos al carrito.

## Descripción

CustomizeArt nació para resolver un problema simple: la mayoría de tiendas en línea solo venden productos prediseñados. Aquí el cliente arma su propio producto desde cero y lo compra con PayPal o mediante un token enviado por correo.

## Características

* Registro e inicio de sesión de clientes
* Personalización de productos: color, tamaño e imagen
* Carrito de compras y checkout con **PayPal** o **token por correo**
* Recuperación de contraseña vía correo
* Tres roles: cliente, gerente de producto y administrador
* Panel de administrador con CRUD de productos y carrusel de imágenes
* Registro de ventas e historial de compras por cliente

## Tecnologías

* C# / ASP.NET Framework
* MySQL + phpMyAdmin
* HTML, CSS
* Visual Studio 2022

## Instalación

1. Clonar el repositorio y abrir `CustomizeArt.sln` en Visual Studio.
2. Restaurar los paquetes NuGet del proyecto.
3. Crear la base de datos `customizeart` en MySQL (phpMyAdmin) e importar el esquema.
4. En `conexion.cs` y `metodos.cs`, reemplazar `TU\_PASSWORD\_DE\_BASE\_DE\_DATOS` por tu contraseña local de MySQL.
5. En `10\_forgotpassword.aspx.cs` y `33\_CheckOut.aspx.cs`, reemplazar `TU\_APP\_PASSWORD\_DE\_GMAIL` por una contraseña de aplicación de Gmail propia (solo si quieres probar el envío de correos).
6. Ejecutar el proyecto desde Visual Studio (IIS Express).

## Base de datos

MySQL, base de datos `customizeart`, administrada con phpMyAdmin.

## Autores

* Diego Leonardo Alemán Granados
* Rafael Mauricio Escobar Marroquín
* Rodrigo Andrés Guerra Romero
* Gerardo Daniel Orellana Campos

Proyecto Técnico Científico 2024 — Colegio Salesiano Santa Cecilia.

