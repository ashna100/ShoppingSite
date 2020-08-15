using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ShoppingSite.BusinessLayer;

namespace ShoppingSite.Admin
{
    public partial class IncomeReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetIncomeReport();
                
            }
        }

        protected void rb1IncomeFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetIncomeReport();
        }

        private void GetIncomeReport()
        {
            ShoppingCart k = new ShoppingCart()
            {
                Flag = Convert.ToInt32(rb1IncomeFilter.SelectedValue)
            };
            DataTable dt = k.GetIncomeReport();
            if (dt.Rows.Count > 0)
            {
                gvIncomeReport.Visible = true;
                gvIncomeReport.DataSource = dt;
                gvIncomeReport.DataBind();

                object ProductSold;
                ProductSold = dt.Compute("Sum(TotalProducts)","");

                object TotalIncome;
                TotalIncome = dt.Compute("Sum(TotalPrice)","");
                lblIncome.Text = "Total Products Sold:" + ProductSold + "Total Income:" + TotalIncome;
            }
            else
            {
                gvIncomeReport.Visible = false;
                lblIncome.Text = "No Records Found";
            }
        }
    }
}