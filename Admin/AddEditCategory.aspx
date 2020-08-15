<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddEditCategory.aspx.cs" Inherits="ShoppingSite.Admin.AddEditCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 253px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div  class="auto-style1" >
        <table align="center" cellspacing="1" style="width:100%; background-color:#FFFFFF;" >
            <%--<h2>Add New Category</h2>--%>
            <h2 />
            <asp:Label ID="lblTitle" runat="server" Text="Add New Category" Font-Bold="true" font-size="XX-Large">
            </asp:Label>
            <hr />

            <tr>
                <td align="left"  style="padding-left:100px; width:50% ">
                    <h3>Enter Category</h3>
                    
                </td>
                <td style="width:50%; align=left">
                    <asp:TextBox ID="txtcategory" runat="server"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td></td>
            </tr>

            <tr>
                <td style="width:50%;" align="center" colspan="2">
                    <asp:Button ID="btn1" runat="server" Text="Submit" Height="30px" Width="100px" OnClick="btn1_Click" />
                </td>
            </tr>
            <asp:Label ID="lbl1" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>

        </table> 
    </div>
</asp:Content>
