using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace ShoppingSite.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtloginid.Focus();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string LoginID = WebConfigurationManager.AppSettings["AdminLogin"];
            string Pass = WebConfigurationManager.AppSettings["AdminPassword"];
            if(txtloginid.Text==LoginID && txtpass.Text == Pass)
            {
                Session["ShoppingMartAdmin"] = "ShoppingMartAdmin";
                Response.Redirect("AddNewProduct.aspx");
            }
            else
            {
                lblAlert.Text = "Invalid Login ID/Password";
            }
        }
    }
}