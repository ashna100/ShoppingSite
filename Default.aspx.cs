using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoppingSite.BusinessLayer;

namespace ShoppingSite
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblCategoryName.Text = "Popular products at Ashtra";
                GetCategory();
                pnlCheckout.Visible = false;
                GetProducts(0); //get all products
            }
            lblAvailableStockAlert.Text = string.Empty;

        }

        private void GetCategory()
        {
            ShoppingCart k = new ShoppingCart();
            dlCategories.DataSource = null;
            dlCategories.DataSource = k.GetCategories();
            dlCategories.DataBind();
        }

        private void GetProducts(int CategoryID)
        {
            ShoppingCart k = new ShoppingCart()
            {
                CategoryID = CategoryID
            };
            dlProducts.DataSource = null;
            dlProducts.DataSource = k.GetAllProducts();
            dlProducts.DataBind();
        }


        protected void lbtnCategory_Click(object sender, EventArgs e)//category click on screen
        {
            pnlMyCart.Visible = false;
            pnlProducts.Visible = true;
            int CategoryID = Convert.ToInt16((((LinkButton)sender).CommandArgument));
            GetProducts(CategoryID);
            HightlightCartProducts();
        }

        protected void lblLogo_Click(object sender, EventArgs e)//Form Logo link button
        {
            lblProducts.Text = "Categories";
            lblCategoryName.Text = "Popular products at Ashtra";
            pnlCategories.Visible = true;
            pnlProducts.Visible = true;
            pnlMyCart.Visible = false;
            pnlCheckout.Visible = false;
            pnlEmptyCart.Visible = false;
            pnlOrderPlacedSuccessfully.Visible = false;
            GetProducts(0);
            HightlightCartProducts();
        }

        
        protected void btnAddToCart_Click(object sender, EventArgs e)//Add to cart
        {
            string ProductID = Convert.ToInt16((((Button)sender).CommandArgument)).ToString();
            string ProductQuantity = "1";

            DataListItem CurrentItem = (sender as Button).NamingContainer as DataListItem;
            Label lblAvailableStock = CurrentItem.FindControl("lblAvailableStock") as Label;
            if (Session["MyCart"] != null)
            {
                DataTable dt= (DataTable) Session["MyCart"];
                var CheckProduct = dt.AsEnumerable().Where(r => r.Field<string>("ProductID") == ProductID);
                if (CheckProduct.Count() == 0)
                {
                    string query = "Select * from Products where ProductID=" + ProductID + "";
                    DataTable dtProducts = GetData(query);

                    DataRow dr = dt.NewRow();
                    dr["ProductID"] = ProductID;
                    dr["Name"] = Convert.ToString(dtProducts.Rows[0]["Name"]);
                    dr["Description"] = Convert.ToString(dtProducts.Rows[0]["Description"]);
                    dr["Price"] = Convert.ToString(dtProducts.Rows[0]["Price"]);
                    dr["ImageUrl"] = Convert.ToString(dtProducts.Rows[0]["ImageUrl"]);
                    dr["ProductQuantity"] = ProductQuantity;
                    dr["AvailableStock"] = lblAvailableStock.Text;
                    dt.Rows.Add(dr);

                    Session["MyCart"] = dt;
                    lnkbtn2.Text = dt.Rows.Count.ToString();
                }
            }
            else
            {
                string query = "select * from Products where ProductID=" + ProductID + "";
                DataTable dtProducts = GetData(query);

                DataTable dt = new DataTable();
                dt.Columns.Add("ProductID", typeof(string));
                dt.Columns.Add("Name", typeof(string));
                dt.Columns.Add("Description", typeof(string));
                dt.Columns.Add("Price", typeof(string));
                dt.Columns.Add("ImageUrl", typeof(string));
                dt.Columns.Add("ProductQuantity", typeof(string));
                dt.Columns.Add("AvailableStock", typeof(string));

                DataRow dr = dt.NewRow();
                dr["ProductID"] = ProductID;
                dr["Name"] = Convert.ToString(dtProducts.Rows[0]["Name"]);
                dr["Description"] = Convert.ToString(dtProducts.Rows[0]["Description"]);
                dr["Price"] = Convert.ToString(dtProducts.Rows[0]["Price"]);
                dr["ImageUrl"] = Convert.ToString(dtProducts.Rows[0]["ImageUrl"]);
                dr["ProductQuantity"] = ProductQuantity;
                dr["AvailableStock"] = lblAvailableStock.Text;
                dt.Rows.Add(dr);

                Session["MyCart"] = dt;
                
                lnkbtn2.Text = dt.Rows.Count.ToString();
            }
           HightlightCartProducts();
        }

        private void HightlightCartProducts()
        {
            if (Session["MyCart"] != null)
            {
                DataTable dtProductsAddedToCart = (DataTable)Session["MyCart"];
                if (dtProductsAddedToCart.Rows.Count > 0)
                {
                    foreach (DataListItem item in dlProducts.Items)
                    {
                        HiddenField hfProductID = item.FindControl("hfProductID") as HiddenField;
                        if(dtProductsAddedToCart.AsEnumerable().Any(row=>hfProductID.Value==row.Field<string>("ProductID")))
                        {
                            Button btnAddToCart = item.FindControl("btnAddToCart") as Button;
                            btnAddToCart.BackColor = System.Drawing.Color.Yellow;
                            btnAddToCart.Text = "Added To Cart";

                            Image Greenstar = item.FindControl("imgstar") as Image;
                            Greenstar.Visible = true;
                        }
                    }
                }
            }
        }

        public DataTable GetData(string query) //establishing connection
        {
            DataTable dt = new DataTable();
            string constr = ConfigurationManager.ConnectionStrings["shopping"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            sda.Fill(dt);
            con.Close();
            return dt;
        }

        protected void lnkbtn2_Click(object sender, EventArgs e)//My Cart button
        {
            GetMyCart();
            lblCategoryName.Text = "Products in your shopping Cart";
            lblProducts.Text = "Customer Details";
        }

        private void GetMyCart()
        {
            DataTable dtProducts;
            if (Session["MyCart"] != null)
            {
                dtProducts = (DataTable)Session["MyCart"];
            }
            else
            {
                dtProducts = new DataTable();
            }
            if (dtProducts.Rows.Count > 0)
            {
                txtTotalProducts.Text = dtProducts.Rows.Count.ToString();
                lnkbtn2.Text = dtProducts.Rows.Count.ToString();
                dlCartProducts.DataSource = dtProducts;
                dlCartProducts.DataBind();
                UpdateTotalBill();

                pnlMyCart.Visible = true;
                pnlCheckout.Visible = true;
                pnlEmptyCart.Visible = false;
                pnlProducts.Visible = false;
                pnlCategories.Visible = false;
                pnlOrderPlacedSuccessfully.Visible = false;
            }
            else
            {
                pnlEmptyCart.Visible = true;
                pnlMyCart.Visible = false;
                pnlCheckout.Visible = false;
                pnlCategories.Visible = false;
                pnlProducts.Visible = false;
                pnlOrderPlacedSuccessfully.Visible = false;

                dlCartProducts.DataSource = null;
                dlCartProducts.DataBind();
                txtTotalPrice.Text = "0";
                txtTotalProducts.Text = "0";
                lnkbtn2.Text = "0";
            }
        }

        private void UpdateTotalBill()
        {
            long TotalPrice = 0;
            long TotalProducts = 0;
            foreach (DataListItem item in dlCartProducts.Items)
            {
                Label PriceLabel = item.FindControl("lblPrice") as Label;
                TextBox ProductQuantity = item.FindControl("txtProductQuantity") as TextBox;
                long ProductPrice = Convert.ToInt64(PriceLabel.Text) * Convert.ToInt64(ProductQuantity.Text);
                TotalPrice = TotalPrice + ProductPrice; 
                TotalProducts = TotalProducts + Convert.ToInt64(ProductQuantity.Text);
            }
            txtTotalPrice.Text = Convert.ToString(TotalPrice);
            txtTotalProducts.Text = Convert.ToString(TotalProducts);
        }

        protected void txtProductQuantity_TextChanged(object sender, EventArgs e)//product quantity textbox event
        {
            TextBox txtQuantity = (sender as TextBox);
            DataListItem CurrentItem = (sender as TextBox).NamingContainer as DataListItem;
            HiddenField ProductID = CurrentItem.FindControl("hfProductID") as HiddenField;
            Label lblAvailableStock = CurrentItem.FindControl("lblAvailableStock") as Label;

            if(txtQuantity.Text == string.Empty || txtQuantity.Text=="0"|| txtQuantity.Text == "1")
            {
                txtQuantity.Text = "1";
            }
            else
            {
                if (Session["MyCart"] != null)
                {
                    if (Convert.ToInt32(txtQuantity.Text) <= Convert.ToInt32(lblAvailableStock.Text))
                    {
                        DataTable dt = (DataTable)Session["MyCart"];
                        DataRow[] rows = dt.Select("ProductID =" + ProductID.Value + "");
                        int index = dt.Rows.IndexOf(rows[0]);
                        dt.Rows[index]["ProductQuantity"] = txtQuantity.Text;
                        Session["MyCart"] = dt;
                    }
                    else
                    {
                        lblAvailableStockAlert.Text = "Alert: Product Buyout Cannot be more than Available Stock";
                        txtQuantity.Text = "1";
                    }
                }
            }
            UpdateTotalBill();
        }

        protected void btnRemoveFromCart_Click(object sender, EventArgs e)//Remove from cart button
        {
            string ProductID = Convert.ToInt16((((Button)sender).CommandArgument)).ToString();
            if (Session["MyCart"] != null)
            {
                DataTable dt = (DataTable)Session["MyCart"];
                DataRow drr = dt.Select("ProductID =" + ProductID + "").FirstOrDefault();
                if (drr != null)
                {
                    dt.Rows.Remove(drr);
                    Session["MyCart"] = dt;
                }
                GetMyCart();
            }
        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)//place order button
        {
            string productid = string.Empty;
            DataTable dt;
            if (Session["MyCart"] != null)
            {
                dt = (DataTable)Session["MyCart"];

                ShoppingCart k = new ShoppingCart()
                {
                    CustomerName = txtCustomerName.Text,
                    CustomerAddress = txtAddress.Text,
                    CustomerEmailID = txtCustomerEmail.Text,
                    CustomerPhoneNo = txtCustomerPhone.Text,
                    TotalPrice = Convert.ToInt32(txtTotalPrice.Text),
                    TotalProducts = Convert.ToInt32(txtTotalProducts.Text),
                    ProductList = productid,
                    PaymentMethod = rb1PaymentMethod.SelectedItem.Text
                };

                DataTable dtResult = k.SaveCustomerDetails();

                for(int i = 0; i < dt.Rows.Count; i++)
                {
                    ShoppingCart SaveProducts = new ShoppingCart()
                    {
                        CustomerID = Convert.ToInt32(dtResult.Rows[0][0]).ToString(),
                        ProductID = Convert.ToInt32(dt.Rows[i]["ProductID"]),
                        TotalProducts = Convert.ToInt32(dt.Rows[i]["ProductQuantity"])
                    };
                    SaveProducts.SaveCustomerProducts();
                }
                Session.Clear();
                GetMyCart();

                lblTransactionNo.Text = "Your Transaction Number is :" + dtResult.Rows[0][0];
                pnlOrderPlacedSuccessfully.Visible = true;
                pnlProducts.Visible = false;
                pnlMyCart.Visible = false;
                pnlEmptyCart.Visible = false;
                pnlCheckout.Visible = false;
                pnlCategories.Visible = false;

                SendOrderPlacedAlert(txtCustomerName.Text, txtCustomerEmail.Text, Convert.ToString(dtResult.Rows[0][0]));

                txtAddress.Text = "";
                txtCustomerEmail.Text = "";
                txtCustomerName.Text = "";
                txtCustomerPhone.Text = "";
                txtTotalPrice.Text = "0";
                txtTotalProducts.Text = "0";
            }
        }

        private void SendOrderPlacedAlert(string CustomerName, string CustomerEmailID, string TransactionNo)
        {
            string body = this.PopulateOrderEmailBody(CustomerName, TransactionNo);
            EmailEngine.SendEmail(CustomerEmailID, "Ashtra--Your Shopping Details", body);
        }

        private string PopulateOrderEmailBody(string customername, string transactionNo)
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(Server.MapPath("~/OrderTemplate.html")))
            {
                body=reader.ReadToEnd();
            }
            body = body.Replace("{CustomerName}", customername);
            body = body.Replace("{OrderNo}", transactionNo);
            body = body.Replace("{TransactionURL}","http://www.localhost:56086/TrackYourOrder.aspx?Id=" + transactionNo);
            return body;
        }
    }
}