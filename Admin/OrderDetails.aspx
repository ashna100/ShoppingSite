<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="ShoppingSite.Admin.OrderDetails" %>

<%@ Register Src="../ucCustomerOrder.ascx" TagName="ucCustomerOrder" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div align="center">
                <asp:Button ID="btnClear" runat="server" Text="Clear and search other Transaction" OnClick="btnClear_Click" Height="38px" />
            </div><br />
        </div>
        <uc1:ucCustomerOrder ID="ucCustomerOrder1" runat="server" />
    </form>
</body>
</html>
