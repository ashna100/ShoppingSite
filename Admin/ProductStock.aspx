<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ProductStock.aspx.cs" Inherits="ShoppingSite.Admin.ProductStock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center" Style="font-weight: 700">
        <asp:Label ID="lblTitle" runat="server" Style="font-weight: 700">Product Stock</asp:Label><hr />

        <asp:DropDownList ID="ddlCategory" AutoPostBack="true" Width="300px" runat="server" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged"></asp:DropDownList><hr />

        <asp:Panel ID="pnlProductStockReport" runat="server">
            <hr />
            <asp:RadioButtonList ID="rblProductStock" runat="server" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblProductStock_SelectedIndexChanged" >
                <asp:ListItem Selected="True" Value="0">Out of stock</asp:ListItem>
                <asp:ListItem Value="1">Limited Stock</asp:ListItem>
                <asp:ListItem Value="2">Enough Stock</asp:ListItem>
            </asp:RadioButtonList>
            
        </asp:Panel>

        <div align="center" id="NoRecordsToDisplay" runat="server">
            <asp:Label ID="lbl2" runat="server" Text="No Records Available" ForeColor="Red" Font-Bold="true"></asp:Label><hr />
        </div>
      
       
    </div>
    <table align="center" cellspacing="1" style="width:100%; background-color:#FFFFFF;">
        <tr>
            <td>
                <asp:GridView ID="gvAvailableStock" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" 
                    BorderWidth="1px" CellPadding="3" GridLines="Vertical" Width="100%" AutoGenerateColumns="False">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Product Name">
                        <ItemStyle Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CategoryName" HeaderText="Product Category">
                        <ItemStyle Width="50px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="AvailableStock" HeaderText="Available Stock">
                        <ItemStyle Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Price" HeaderText="Price">
                        <ItemStyle Width="150px" />
                        </asp:BoundField>
                        <asp:ImageField DataImageUrlField="ImageUrl">
                            <ItemStyle Width="150px" />
                        </asp:ImageField>
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
