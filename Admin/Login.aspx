<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ShoppingSite.Admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body{
            background: url('Images/shoppingMart.jpg');
            background-size:cover;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="border-color: #0000FF">
        <div style="margin: 200px;">
            &nbsp;&nbsp;&nbsp;
            <table align="center" style="width: 550px; height: 270px; border: 1px ridge #000000; background-color: #64e4f1">
                <tr>
                    <td align="center" colspan="2">
                        <asp:Label ID="lbl1" runat="server" Font-Bold="true" Font-Size="X-Large" Text="Shopping Mart--Admin Panel" Style="font-weight: 700">
                        </asp:Label>
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td align="center" width="50%">
                        <b>Login ID:</b>
                    </td>
                    <td width="50%">
                        <asp:TextBox ID="txtloginid" placeholder="Enter Login Id" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="center" width="50%">
                        <b>Password</b>
                    </td>
                    <td style="width: 50%">
                        <asp:TextBox ID="txtpass" runat="server" TextMode="Password" placeholder="Enter Password"></asp:TextBox>

                    </td>
                </tr>

                <tr>
                    <td align="center" colspan="2">
                        <asp:Button ID="Button1" Width="150px" Height="30px" runat="server" Text="Login" Font-Bold="true" BorderColor="#0066FF" BorderStyle="Solid" OnClick="Button1_Click" />

                    </td>
                </tr>
                <td align="center" colspan="2">
                    <hr />
                    <asp:Label ID="lblAlert" runat="server" ForeColor="Red"></asp:Label>
                </td>
                </tr>
               
            </table>
        </div>
    </form>
</body>
</html>
