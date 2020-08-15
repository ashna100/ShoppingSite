<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddNewProduct.aspx.cs" Inherits="ShoppingSite.Admin.AddNewProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center" >
        <h1> Add New Products</h1>
                    <hr />
        <table align="center" cellspacing="1" style="width:100%; background-color:#FFFFFF;">
            <tr>
                <td style="width:50%; padding-left:100px;" align="left">
                    <h3>Product Name:</h3>
                </td>
                <td style="width:50%;" align="left">
                    <asp:TextBox ID="textProdName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width:50%; padding-left:100px;" align="left">
                    <h3>Product Category:</h3>
                </td>
                <td style="width:50%;" align="left">
                    <asp:DropDownList ID="dropdown1" runat="server"></asp:DropDownList>
                </td>
                
            </tr>
            <tr>
                <td style="width:50%; padding-left:100px;" align="left">
                    <h3>Product Description:</h3>
                </td>
                <td style="width:50%;" align="left">
                    <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width:50%; padding-left:100px;" align="left">
                    <h3>Product Image:</h3>
                </td>
                <td style="width:50%;" align="left">
                  <asp:FileUpload ID="fileupload1" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="width:50%; padding-left:100px;" align="left">
                    <h3> Product Price:</h3>
                </td>
                <td style="width:50%;" align="left">
                    <asp:TextBox ID="txtprice" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width:50%; padding-left:100px;" align="left">
                    <h3>Product Quantity:</h3>
                </td>
                <td style="width:50%;" align="left">
                    <asp:TextBox ID="txtQuantity" runat="server" Width="212px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <asp:Button ID="btn2" Text="Submit" runat="server" OnClick="btnSubmit_Click" /><hr />
                </td>
            </tr>
            
            <asp:Label ID="lblAlert" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
        </table>
    </div>
</asp:Content>
