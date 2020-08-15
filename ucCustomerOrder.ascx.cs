using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoppingSite.BusinessLayer;
using System.Data;

namespace ShoppingSite
{
    public partial class ucCustomerOrder : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (txtTransactionNo.Text != string.Empty)
                {
                    ShowOrderDetails(rbOderDetails.SelectedValue, Convert.ToInt32(txtTransactionNo.Text));
                }
                else
                {
                    rbOderDetails.Visible = false;
                    Panel1.Visible = false;
                    Panel2.Visible = false;
                    Panel3.Visible = false;
                    Panel4.Visible = false;
                }
            }
        }

        public bool CanIUpdateStatus;
        public string TransactionNoText
        {
            get{ return txtTransactionNo.Text; }
            set{ txtTransactionNo.Text = value; }
        }
        public bool IsAuthorizedToAddStatus
        {
            set { CanIUpdateStatus = value; }
        }

        private void ShowOrderDetails(string PanelID, int OrderNo)//code for different listItem in radioButton
        {
            rbOderDetails.Visible = false;
            Panel1.Visible = false;
            Panel2.Visible = false;
            Panel3.Visible = false;
            Panel4.Visible = false;

            if (IsOrderNoValid(OrderNo))
            {
                rbOderDetails.Visible = true;
                if (PanelID == "1")
                {
                    ShoppingCart k = new ShoppingCart
                    {
                        Flag = OrderNo
                    };
                    DataTable dtCustomerDetails = k.GetOrdersList();
                    if (dtCustomerDetails.Rows.Count > 0)
                    {
                        Panel1.Visible = true;
                        lblCustomerName.Text = Convert.ToString(dtCustomerDetails.Rows[0]["CustomerName"]);
                        lblCustomerPhone.Text = Convert.ToString(dtCustomerDetails.Rows[0]["CustomerPhoneNO"]);
                        lblCustomerEmailId.Text = Convert.ToString(dtCustomerDetails.Rows[0]["CustomerEmailID"]);
                        lblTotalPrice.Text = Convert.ToString(dtCustomerDetails.Rows[0]["TotalPrice"]);
                        lblTotalProducts.Text = Convert.ToString(dtCustomerDetails.Rows[0]["TotalProducts"]);
                        txtCustomerAddress.Text = Convert.ToString(dtCustomerDetails.Rows[0]["CustomerAddress"]);
                        lblPaymentMethod.Text = Convert.ToString(dtCustomerDetails.Rows[0]["PaymentMethod"]);
                    }
                }
                if (PanelID == "2")
                {
                    Panel2.Visible = true;
                    ShoppingCart k = new ShoppingCart()
                    {
                        Flag = OrderNo
                    };
                    dlProducts.DataSource = k.GetTransactionDetails();
                    dlProducts.DataBind();
                }
                if (PanelID == "3")
                {
                    Panel3.Visible = true;
                    txtStatus.Visible = CanIUpdateStatus;
                    btnAdd.Visible = CanIUpdateStatus;
                    GetSetOrderStatus(0);
                }
                
            }
            else
                Panel4.Visible = true;

        }

        private bool IsOrderNoValid(int OrderNo)
        {
            ShoppingCart k = new ShoppingCart
            {
                Flag = OrderNo
            };
            DataTable dtCustomerDetails = k.GetOrdersList();
            if (dtCustomerDetails.Rows.Count > 0)
            
               return true;
            
            else
                return false;

        }

        private void GetSetOrderStatus(int Flag)
        {
            ShoppingCart k = new ShoppingCart
            {
                OrderStatus = txtStatus.Text,
                OrderNo = txtTransactionNo.Text,
                Flag = Flag
            };
            DataTable dt = k.GetSetOrderStatus();
            gvOrderStatus.DataSource = dt;
            gvOrderStatus.DataBind();
            txtStatus.Text = string.Empty;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            GetSetOrderStatus(1); 
        }

        protected void rbOderDetails_SelectedIndexChanged(object sender, EventArgs e)//radioButton List selection change
        {
            if (txtTransactionNo.Text != "")
            {
                ShowOrderDetails(rbOderDetails.SelectedValue, Convert.ToInt32(txtTransactionNo.Text));
            }
        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            if (txtTransactionNo.Text != "")
            {
                ShowOrderDetails(rbOderDetails.SelectedValue, Convert.ToInt32(txtTransactionNo.Text));
            }
            else
            {
                rbOderDetails.Visible = false;
                Panel1.Visible = false;
                Panel2.Visible = false;
                Panel3.Visible = false;
                Panel4.Visible = true;
            }
        }
    }
}