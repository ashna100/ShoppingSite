using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoppingSite.BusinessLayer;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text;



namespace ShoppingSite.Admin
{
    public partial class AddNewProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetCategories();
                AddSubmitEvent();
                if (Request.QueryString["alert"] == "success")
                {
                    Response.Write("<script>alert('Product saved successfully');</script>");
                }
            }
        }
        private void AddSubmitEvent()
        {
            UpdatePanel updatePanel = Page.Master.FindControl("AdminUpdatePanel1") as UpdatePanel;
            UpdatePanelControlTrigger trigger = new PostBackTrigger();
            trigger.ControlID = btn2.UniqueID;
            updatePanel.Triggers.Add(trigger);
        }
        private void GetCategories()
        {
            ShoppingCart k = new ShoppingCart();
            DataTable dt = k.GetCategories();
            if (dt.Rows.Count > 0)
            {
                dropdown1.DataTextField = "CategoryName";
                dropdown1.DataValueField="CategoryID";
                dropdown1.DataSource =dt;
                dropdown1.DataBind();
                dropdown1.Items.Insert(0, "Select Category");
            }

           
            
        }


        protected void btnSubmit_Click(object sender, EventArgs e)//submit
        {
            if (fileupload1.PostedFile != null)
            {
                SaveProductPhoto();

                ShoppingCart k = new ShoppingCart()
                {
                    ProductName = textProdName.Text,
                    ProductDescription = txtDescription.Text,
                    ProductImage = "~/Images/" + fileupload1.FileName,
                    ProductPrice = txtprice.Text,
                    CategoryID = Convert.ToInt32(dropdown1.SelectedValue),
                    TotalProducts = Convert.ToInt32(txtQuantity.Text)

                };
                //lblAlert.Text = "Product Saved Successfully";
                //lblAlert.ForeColor = System.Drawing.Color.Green;
                k.AddNewProduct();
                ClearText();
                Response.Redirect("~/Admin/AddNewProduct.aspx?alert=succcess");
            }

            else
            {
                Response.Write("<script>alert('Please upload photo')</script>");
            }
        }

        private void SaveProductPhoto()
        {
            if (fileupload1.PostedFile != null)
            {
                string filename = fileupload1.PostedFile.FileName.ToString();
                string FileExt = System.IO.Path.GetExtension(fileupload1.FileName);

                //Check file name length
                if (filename.Length > 96)
                {
                   lblAlert.Text="Image name should not exceed 96 characters.";
                }
                //check file type
                else if(FileExt!=".jpeg" && FileExt!=".jpg" && FileExt!=".png" && FileExt != ".bmp")
                {
                    lblAlert.Text="Only jpeg, jpg, png and bmp file type is allowed";
                }
                //check file size
                else if (fileupload1.PostedFile.ContentLength > 40000000)
                {
                    lblAlert.Text="Image size should not exceed 4 MB!";
                }
                else
                {
                    fileupload1.SaveAs(Server.MapPath("Images//" + filename));
                    
                }
            }
        }

        private void ClearText()
        {
            txtDescription.Text = textProdName.Text = txtprice.Text = "";
        }
    }
}