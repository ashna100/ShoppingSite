using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoppingSite.BusinessLayer;
using System.Data;

namespace ShoppingSite.Admin
{
    public partial class ProductStock : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetCategories();
                GetAailableStock();
            }
        }
        private void GetCategories()
        {
            ShoppingCart k = new ShoppingCart();
            DataTable dt = k.GetCategories();
            if (dt.Rows.Count > 0)
            {

                ddlCategory.DataValueField = "CategoryID";
                ddlCategory.DataTextField = "CategoryName";
                ddlCategory.DataSource = dt;
                ddlCategory.DataBind();
                ddlCategory.Items.Add(new ListItem("All Products", "0", true));
                ddlCategory.SelectedValue = "0";
            }
        }

        private void GetAailableStock()
        {
            ShoppingCart k = new ShoppingCart()
            {
                CategoryID = Convert.ToInt32(ddlCategory.SelectedValue),
                StockType = Convert.ToInt32(rblProductStock.SelectedValue)
            };
            DataTable dt = k.GetAailableStock();
            if (dt.Rows.Count > 0)
            {
                gvAvailableStock.DataSource = dt;
                gvAvailableStock.DataBind();
                gvAvailableStock.Visible = true;
                lbl2.Visible = false;
            }
            else
            {
                gvAvailableStock.Visible = false;
                lbl2.Visible = true;
            }
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetAailableStock();
        }

        protected void rblProductStock_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetAailableStock();
        }
    }
}