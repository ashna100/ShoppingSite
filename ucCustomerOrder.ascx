<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucCustomerOrder.ascx.cs" Inherits="ShoppingSite.ucCustomerOrder" %>
<style type="text/css">
    .styleOrderDetails {
        width: 600px;
        border: 1px ridge red;
    }
</style>

<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <div align="center">
            <asp:Label ID="lblTransactionNo" runat="server" Text="Transaction No"></asp:Label>&nbsp
            <asp:TextBox ID="txtTransactionNo" runat="server" Width="90px"></asp:TextBox>&nbsp
            <asp:Button ID="btnGo" runat="server" Style="font-weight: 700" Width="36px" Text="GO" OnClick="btnGo_Click" />
        </div>
        <table cellspacing="1" style="width: 100%" align="center">
            <tr>
                <td align="center">
                    <hr />
                    <asp:RadioButtonList ID="rbOderDetails" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rbOderDetails_SelectedIndexChanged">
                        <asp:ListItem Value="1" Selected="True">Order Details</asp:ListItem>
                        <asp:ListItem Value="2">Product Details</asp:ListItem>
                        <asp:ListItem Value="3">Delivery Status</asp:ListItem>
                    </asp:RadioButtonList><hr />
                </td>
            </tr>

            <tr>
                <td align="center">
                    <asp:Panel ID="Panel1" runat="server">
                        <table class="styleOrderDetails">
                            <tr>
                                <td align="center" colspan="2">
                                    <asp:Image ID="Image1" runat="server" ImageUrl="Images/Customer.jpeg" Height="150px" />
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 50%; padding-right: 30px">Name:
                                </td>
                                <td align="left" style="width: 50%">
                                    <asp:Label ID="lblCustomerName" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 50%; padding-right: 30px">Email:
                                </td>
                                <td align="left" style="width: 50%">
                                    <asp:Label ID="lblCustomerEmailId" runat="server"></asp:Label>
                            </tr>
                            <tr>
                                <td align="right" style="width: 50%; padding-right: 30px">Contact:
                                </td>

                                <td align="left" style="width: 50%">
                                    <asp:Label ID="lblCustomerPhone" runat="server"></asp:Label>
                                </td>

                            </tr>
                            <tr>
                                <td align="right" style="width: 50%; padding-right: 30px">Total Products:
                                </td>

                                <td align="left" style="width: 50%">
                                    <asp:Label ID="lblTotalProducts" runat="server"></asp:Label>
                                </td>

                            </tr>
                            <tr>
                                <td align="right" style="width: 50%; padding-right: 30px">Total Price:
                                </td>

                                <td align="left" style="width: 50%">
                                    <asp:Label ID="lblTotalPrice" runat="server"></asp:Label>
                                </td>

                            </tr>
                            <tr>
                                <td align="right" style="width: 50%; padding-right: 30px">Address:
                                </td>

                                <td align="left" style="width: 50%">
                                    <asp:TextBox ID="txtCustomerAddress" ReadOnly="true" runat="server" Width="260px" Height="73px"
                                        TextMode="MultiLine"></asp:TextBox>
                                </td>

                            </tr>
                            <tr>
                                <td align="right" style="width: 50%; padding-right: 30px">Payment Method:
                                </td>

                                <td align="left" style="width: 50%">
                                    <asp:Label ID="lblPaymentMethod" runat="server"></asp:Label>
                                </td>

                            </tr>
                        </table>
                    </asp:Panel>

                    <asp:Panel ID="Panel2" runat="server">
                        <table class="styleOrderDetails">
                            <tr>
                                <td align="center">
                                    <asp:Image ID="Image2" runat="server" ImageUrl="Images/CustomerIconn.jpeg" Height="150px" /><hr />
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:DataList ID="dlProducts" runat="server" Width="500px" RepeatColumns="3">
                                        <ItemTemplate>
                                            <div align="center">
                                                <table>
                                                    <tr>
                                                        <td colspan="2">
                                                            <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <img alt="" src='<%# Eval("ImageUrl") %>' runat="server" id="imgProductPhoto" style="width: 173px; height: 160px;" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Price:
                                                            <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                                        </td>
                                                        <td>Quantity:<asp:Label ID="lblQuantity" runat="server" Text='<%#Eval("ProductQuantity") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>

                    <asp:Panel ID="Panel3" runat="server">
                        <table class="styleOrderDetails">
                            <tr>
                                <td align="center">
                                    <asp:Image ID="Image3" runat="server" ImageUrl="Images/DeliveryStatus.png" Height="150px" /><hr />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="width:100%" colspan="2">
                                    <asp:GridView ID="gvOrderStatus" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                                        <AlternatingRowStyle BackColor="#DCDCDC" />
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
                            <tr>
                                <td align="center">
                                    <asp:TextBox ID="txtStatus" runat="server" Width="300px"></asp:TextBox>&nbsp
                                    <asp:Button ID="btnAdd" runat="server" Text="Add" Height=" 36px" OnClick="btnAdd_Click" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>

                    <asp:Panel ID="Panel4" runat="server">
                        <table class="styleOrderDetails">
                            <tr>
                                <td align="center">
                                    <asp:Image ID="Image4" runat="server" ImageUrl="Images/Noresultsfound.png" Height="150px" /><hr />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>
