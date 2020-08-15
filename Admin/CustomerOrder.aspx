<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="CustomerOrder.aspx.cs" Inherits="ShoppingSite.Admin.CustomerOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
    <asp:label ID="lblTitle" runat="server" align="center"  style="font-weight:700" Text="Cusomer Details"></asp:label><hr />
        </div>
    <table align="center" cellspacing="1" style="width:100%; background-color:#FFFFFF">
        <tr>
            <td>
                
        <asp:GridView ID="gvCustomerOrders" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AutoGenerateColumns="False" >
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id">
                <ItemStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="CustomerName" HeaderText="Name">
                <ItemStyle Width="150px" />
                </asp:BoundField>
                <asp:BoundField DataField="CustomerPhoneNo" HeaderText="Phone No">
                <ItemStyle Width="20px" />
                </asp:BoundField>
                <asp:BoundField DataField="TotalProducts" HeaderText="Products">
                <ItemStyle Width="150px" />
                </asp:BoundField>
                <asp:BoundField DataField="TotalPrice" HeaderText="Price">
                <ItemStyle Width="150px" />
                </asp:BoundField>
                <asp:TemplateField>
                   
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" Text="View Details" Target="_blank" 
                            NavigateUrl='<%# Eval("Id","~/Admin/OrderDetails.aspx?Id={0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                   
                </asp:TemplateField>
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
