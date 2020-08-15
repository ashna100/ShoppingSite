<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="ShoppingSite.Admin.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div align="center">
        <asp:Label ID="lblTitle" runat="server" Style="font-weight:700">All Products</asp:Label>
        <hr />
    </div>
    <table align="center" cellspacing="1" style="width:100%; background-color:#FFFFFF">
        <tr>
            <td align="center">
                <asp:GridView ID="gvAvailableProducts" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="Gainsboro" />
                    <Columns>
                        <asp:BoundField HeaderText="Product Name" DataField="Name" />
                        <asp:BoundField HeaderText="Product Category" DataField="CategoryName" />
                        <asp:BoundField HeaderText="Available Stock"  DataField="AvailableStock"/>
                        <asp:BoundField HeaderText="Price"  DataField="Price"/>
                        <asp:ImageField DataImageUrlField="ImageUrl" ControlStyle-width="150"></asp:ImageField>
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
            </td>
        </tr>
    </table>
        
   
</asp:Content>
