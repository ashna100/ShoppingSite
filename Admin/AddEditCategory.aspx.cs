using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoppingSite.BusinessLayer;


namespace ShoppingSite.Admin
{
    public partial class AddEditCategory : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn1_Click(object sender, EventArgs e)//submit button
        {
            ShoppingCart k = new ShoppingCart()
            {
                CategoryName = txtcategory.Text

        };
            k.AddNewCategory();
            txtcategory.Text = string.Empty;
            Response.Redirect("AddNewProduct.aspx");

        }
    }
}