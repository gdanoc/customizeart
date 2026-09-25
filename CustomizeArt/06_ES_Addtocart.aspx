<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="06_ES_Addtocart.aspx.cs" Inherits="CustomizeArt._06_ES_Addtocart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<script src="SweetAlert/sweetalert2.all.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <asp:Literal ID="alerta" runat="server" Text=""></asp:Literal>
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        </div>
    </form>
</body>
</html>