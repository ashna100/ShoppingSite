 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ShoppingSite.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1 {
            width: 900px;
        }

        .style2 {
            width: 633px;
            text-align: left;
        }

        .style3 {
            width: 257px;
            text-align: center;
        }

        .style4 {
            width: 185px;
            text-align: center;
        }

        .style6 {
            text-align: left;
            width: 260px;
        }

        .style7 {
            width: 427px;
            text-align: center;
        }

        .style8 {
            width: 108px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table align="center" class="style1" runat="server">
                    <tr>
                        <td>
                            <table runat="server" align="center" class="style1" style="border-bottom-style: ridge; border-width: medium; border-color: #9933FF" runat="server">
                                <tr>
                                    <td class="style8" align="center" colspan="2">
                                        <asp:Image ID="image1" runat="server" Height="53px" Width="72px" ImageUrl="~/Images/ShopLogo1.jpg" />
                                        &nbsp;

                                    </td>
                                    <td class="style6" rowspan="2">
                                        <asp:LinkButton ID="lblLogo" runat="server" Text="Ashtra" Font-Names="Eras Demi ITC" Font-Size="20pt"
                                            ForeColor="#6600CC" OnClick="lblLogo_Click"></asp:LinkButton>
                                        <br />
                                        <b>For Those Who Love Shopping!!</b>
                                    </td>
                                    <td class="style7" rowspan="2">
                                        <asp:Image ID="image2" runat="server" Height="67px" Width="282px" ImageUrl="~/Images/OIP.jpg" />
                                    </td>
                                    <td align="right" rowspan="2">
                                        <asp:Image ID="imag3" runat="server" Height="53px" Width="70px" ImageUrl="~/Images/ShopLogo.jpg" />
                                    </td>
                                    <td align="left">

                                        <asp:LinkButton ID="lnkbtn2" runat="server" Font-Underline="false" Font-Size="20pt" ForeColor="Red" OnClick="lnkbtn2_Click"
                                            >0</asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table align="center" class="stye1" style="border: thin ridge #9900FF" runat="server">
                                <tr>
                                    <td class="style2">&nbsp;
                                        <asp:Label ID="lblCategoryName" runat="server" Font-Size="15pt" ForeColor="#6600CC"></asp:Label>
                                    </td>
                                    <td class="style3" style="border-left-style: ridge; border-width: thin; border-color: #9900FF">&nbsp;
                                        <asp:Label ID="lblProducts" runat="server" Text="Products" Font-Size="15pt" ForeColor="#6600CC"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table align="center" class="style1" runat="server">
                                <tr>
                                    <td class="style2" valign="top">
                                        <asp:Panel ID="pnlProducts" runat="server" ScrollBars="Auto" Height="500px" BorderColor="Black" BorderStyle="Inset" BorderWidth="1px">
                                            <asp:DataList ID="dlProducts" runat="server" RepeatColumns="3" Width="600px" Font-Bold="false" Font-Italic="false" Font-Overline="false"
                                                Font-Strikeout="false" Font-Underline="false">
                                                <ItemTemplate>
                                                    <div align="left">
                                                        <table cellspacing="1" class="style4" style="border: 1px ridge #9900FF" runat="server">
                                                            <tr>
                                                                <td style="border-bottom-style: ridge; border-width: 1px; border-color: #000000">
                                                                    <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("Name") %>' Style="font-weight: 700px"></asp:Label>
                                                                    
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <img alt="" src='<%# Eval("ImageUrl") %>' runat="server" id="imgProductPhoto" style="border: 1px ridge black; 
                                                                      width: 173px; height: 160px" />
                                                                </td>
                                                            </tr>
                                                           <%-- <tr>
                                                                <td>
                                                                    <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("Description") %>' Font-Size="Large"
                                                                        font-bold="true" Font-Names="elas"></asp:Label>
                                                                </td>
                                                            </tr>
                                                           --%> <tr>
                                                                <td>Price:<asp:Label ID="lblPrice" runat="server" Text="<%# Bind('Price') %>"></asp:Label>
                                                                    <asp:Image ID="imgstar" runat="server" Visible="false" ImageUrl="~/Images/greenStar.png" Height="19px" Width="17px" />
                                                                    Stock:&nbsp;
                                                                    <asp:Label ID="lblAvailableStock" runat="server" Text='<%# Eval("AvailableStock") %>' ToolTip="Available stock"
                                                                        ForeColor="Red" Font-Bold="true"></asp:Label>
                                                                    <asp:HiddenField ID="hfProductID" runat="server" Value='<%# Eval("ProductID") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Button ID="btnAddToCart" runat="server" Text="Add To Cart" CommandArgument="<%# Bind('ProductID') %>" Width="100%"
                                                                        BorderStyle="Inset" BorderWidth="1px" OnClick="btnAddToCart_Click" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </ItemTemplate>
                                                <ItemStyle Width="33%" />
                                            </asp:DataList>
                                        </asp:Panel>

                                        <asp:Panel ID="pnlMyCart" runat="server" ScrollBars="Auto" Height="500px" BorderColor="Black" BorderStyle="Inset"
                                            BorderWidth="1px" Visible="false">
                                            <table align="center" cellspacing="1" runat="server">
                                                <tr>
                                                    <td align="center">
                                                        <asp:Label ID="lblAvailableStockAlert" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
                                                        <asp:DataList ID="dlCartProducts" runat="server" RepeatColumns="3" Font-Bold="false" Font-Italic="false"
                                                            Font-Overline="false" Font-Strikeout="false" Font-Underline="false" Width="551px">
                                                            <ItemTemplate>
                                                                <div align="left">
                                                                    <table cellspacing="1" style="border: 1px ridge #9900FF; text-align: center; width: 172px">
                                                                        <tr>
                                                                            <td style="border-bottom-style: ridge; border-width: 1px; border-color: #000000">

                                                                                <asp:Label ID="lblProductName" Style="font-weight: 700" runat="server" Text='<%# Eval("Name") %>'></asp:Label>

                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <img alt="" src='<%# Eval("ImageUrl") %>' runat="server" id="imageProductPhoto" style="border: ridge 1px black; width: 157px; height: 130px;" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>Available Stock &nbsp;
                                                                                <asp:Label ID="lblAvailableStock" runat="server" Text="<%# Bind('AvailableStock') %>" ToolTip="Available Stock" ForeColor="Red" Font-Bold="true"></asp:Label>
                                                                                <br />
                                                                                Price:
                                                                                <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                                                                &nbsp;x &nbsp;
                                                                                <asp:TextBox ID="txtProductQuantity" runat="server" Width="10px" Height="10px" MaxLength="2" AutoPostBack="true"
                                                                                    Text='<%# Eval("ProductQuantity") %>' OnTextChanged="txtProductQuantity_TextChanged"></asp:TextBox>
                                                                                <asp:HiddenField ID="hfProductID" runat="server" Value='<%# Eval("ProductID") %>' />
                                                                            </td>
                                                                        </tr>
                                                                      <tr>
                                                                            <td>
                                                                                <hr />
                                                                                <asp:Button ID="btnRemoveFromCart" runat="server" CommandArgument='<%# Eval("ProductID") %>' Text="Remove From Cart" BackColor="white"
                                                                                    Width="100%" BorderStyle="Inset" BorderWidth="1px" CausesValidation="false" OnClick="btnRemoveFromCart_Click" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </div>
                                                            </ItemTemplate>
                                                            <ItemStyle Width="33%" />
                                                        </asp:DataList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center">&nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center">&nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                    <td class="style3" valign="top" align="center">
                                        <asp:Panel ID="pnlCategories" runat="server" ScrollBars="Auto" Height="500px" BorderColor="black" BorderStyle="Inset" BorderWidth="1px">
                                            <asp:DataList ID="dlCategories" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderWidth="1px" BorderStyle="None"
                                                CellPadding="4" ForeColor="Black" GridLines="Horizontal" Width="252px">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtnCategory" runat="server" Text="<%# Bind('CategoryName') %>"  
                                                        OnClick="lbtnCategory_Click" CommandArgument="<%# Bind('CategoryID') %>"></asp:LinkButton>
                                                </ItemTemplate>
                                                <SelectedItemStyle BackColor="#33CCCC" Font-Bold="true" ForeColor="Wheat" />
                                            </asp:DataList>

                                        </asp:Panel>
                                        <asp:Panel ID="pnlCheckout" runat="server" Height="500px" BorderColor="Black" BorderStyle="Inset" BorderWidth="1px">
                                            <table style="width: 258px" runat="server">
                                                <tr>
                                                    <td align="left">Name:
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtCustomerName" runat="server" Width="231px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ErrorMessage="*"
                                                            ControlToValidate="txtCustomerName"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">Phone Number:
   
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtCustomerPhone" runat="server" Width="231px" MaxLength="10"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ErrorMessage="*"
                                                            ControlToValidate="txtCustomerPhone"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">Email: &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtCustomerEmail" runat="server" Width="231px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" ErrorMessage="*"
                                                            ControlToValidate="txtCustomerEmail"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">Address
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtAddress" runat="server" Width="231px" Height="81px" TextMode="MultiLine"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="Red" ErrorMessage="*"
                                                            ControlToValidate="txtAddress"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">Total Products:
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtTotalProducts" runat="server" Width="231px" ReadOnly="true"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="Red" ErrorMessage="*"
                                                            ControlToValidate="txtTotalProducts"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">Total Price:
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtTotalPrice" runat="server" Width="231px" Height="81px" ReadOnly="true"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ForeColor="Red" ErrorMessage="*"
                                                            ControlToValidate="txtTotalPrice"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">Payment Mode
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:RadioButtonList ID="rb1PaymentMethod" runat="server">
                                                            <asp:ListItem Value="1" Selected="True">Cash On Delivery</asp:ListItem>
                                                            <asp:ListItem Value="2">Payment Gateway</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                </tr>
                                                
                                                <tr>
                                                    <td>
                                                        <asp:Button ID="btnPlaceOrder" runat="server" Style="font-weight: 700" Width="90px"
                                                            Text="Place Order" OnClick="btnPlaceOrder_Click" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:RegularExpressionValidator ID="Rgularexpressionvalidator1" runat="server" ControlToValidate="txtCustomerEmail" ForeColor="Red"
                                                            ErrorMessage="Please Enter valid Email ID" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Panel ID="pnlEmptyCart" runat="server" Visible="false">
                                            <div style="text-align: center">
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                                <asp:Image ID="image4" runat="server" Width="500px" ImageUrl="~/Images/EmptyShoppingCart.jpeg" />
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                            </div>
                                        </asp:Panel>
                                        <asp:Panel ID="pnlOrderPlacedSuccessfully" runat="server" Visible="false">
                                            <div style="text-align: center">
                                                <asp:Image ID="image5" runat="server" ImageUrl="~/Images/successorder.png" Width="175px" Height="119px" />
                                                <br />
                                                <asp:Label ID="lbl1" runat="server">Order Placed Successfully!</asp:Label><br />
                                                <br />
                                                Transaction Details are sent to your Email id.<br />
                                                <br />
                                                <asp:Label ID="lblTransactionNo" runat="server" Style="font-weight: 700"></asp:Label>
                                                <br />
                                                <br />
                                                <br />
                                                <a href="TrackYourOrder.aspx" target="_blank">Track Your Order here</a>
                                                <br />
                                                <br />
                                                <br />

                                            </div>
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center" style="border: thin ridge #9900FF">&copy;<a href="#">Ashna Khanna</a> || 
                                        <a href="Admin/Login.aspx">Admin Panel</a> || <a href="TrackYourOrder.aspx">Track your Order</a>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>

            </ContentTemplate>
        </asp:UpdatePanel>

    </form>
</body>
</html>
