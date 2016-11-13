using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShoppingPalate_ShoppingPages_AdminInsert : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //Method to add product and  uploads an image file to the server and sets the parameter for the SQLDataSource to the name of the image
    protected void btnAddProduct_Click(object sender, EventArgs e)
    {
        bool flag = false;
        try
        {

            if (FileUpload1.PostedFile != null &&
                FileUpload1.PostedFile.FileName != "")
            {
                byte[] imageSize = new byte
                              [FileUpload1.PostedFile.ContentLength];
                HttpPostedFile uploadedImage = FileUpload1.PostedFile;
                uploadedImage.InputStream.Read
                   (imageSize, 0, (int)FileUpload1.PostedFile.ContentLength);
                ShoppingDB db = new ShoppingDB();
                var data = FileUpload1.FileBytes;
                int id = int.Parse(ddlSelectCategory.SelectedItem.Value);
                if (db.IsProductPresent(txtProductName.Text, id))
                {
                    lblMessage.Visible = true;
                    lblMessage.Text = "Product already present.Add another Product name";
                }
                else
                {
                    flag = db.AddNewProduct(id, txtProductName.Text, txtDescription.Text, data, Decimal.Parse(txtPrice.Text), 0);
                    if (flag == true)
                    {
                        lblMessage.Visible = true;
                        lblMessage.Text = "Product added successfully";
                        txtProductName.Text = "";
                        txtDescription.Text = "";
                        txtPrice.Text = "";
                        txtInStock.Text = "";
                        lblMsg.Visible = false;
                        ddlSelectCategory.SelectedIndex = 0;
                    }
                    else
                    {
                        lblMessage.Visible = true;
                        lblMessage.Text = "Product cannot added.";
                        txtProductName.Text = "";
                    }

                }

            }
        }
        catch (Exception ex)
        {
            lblMessage.Visible = true;
            lblMessage.Text = ex.Message;
        }

    }
    //This  clears all the text 
    protected void btnClear_Click(object sender, EventArgs e)
    {
        txtProductName.Text = "";
        txtDescription.Text = "";
        txtPrice.Text = "";
        txtInStock.Text = "";
        lblMsg.Visible = false;
        ddlSelectCategory.SelectedIndex = 0;
    }
    //Redirects to the home page
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("AdminDefault.aspx");
        }
        catch (Exception ex)
        {

            lblMessage.Text = ex.Message;
        }
    }
}