<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="IncomeReport.aspx.cs" Inherits="ShoppingSite.Admin.IncomeReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center" style="font-weight: 1000">
        <asp:Label ID="lblTitle" runat="server" Text="Income Report"></asp:Label><hr />
    </div>

    <table align="center" cellspacing="1" style="width: 100%; background-color: #FFFFFF;">
        <tr>
            <td align="center">
                <asp:RadioButtonList ID="rb1IncomeFilter" runat="server" RepeatDirection="Horizontal"  AutoPostBack="true"
                    OnSelectedIndexChanged="rb1IncomeFilter_SelectedIndexChanged">
                    <asp:ListItem Selected="True" Value="1">Today</asp:ListItem>
                    <asp:ListItem Value="2">This Month</asp:ListItem>
                    <asp:ListItem Value="3">This Year</asp:ListItem>
                </asp:RadioButtonList><hr />
            </td>
        </tr>

        <tr>
            <td align="center">
                <asp:Label ID="lblIncome" runat="server" ForeColor="Red" style="font-weight:700"></asp:Label>
            </td>
        </tr>

        <tr>
            <td>
                <asp:GridView ID="gvIncomeReport" runat="server" Width="100%" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id">
                        <ItemStyle Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CustomerName" HeaderText="Name">
                        <ItemStyle Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CustomerPhoneNO" HeaderText="PhoneNo">
                        <ItemStyle Width="20px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TotalProducts" HeaderText="Products">
                        <ItemStyle Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TotalPrice" HeaderText="Price">
                        <ItemStyle Width="150px" />
                        </asp:BoundField>
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
