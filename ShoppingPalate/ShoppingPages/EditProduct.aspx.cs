using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

public partial class ShoppingPalate_ShoppingPages_EditProduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {

                int id = int.Parse(Request.QueryString["Id"]);
                ShoppingDB db = new ShoppingDB();
                Product product = new Product();

                product = db.GetProductsDetailsByProductId(id);
                lblId.Text = id.ToString();
                txtDescription.Text = product.ProductDesc;
                txtPrice.Text = product.ProductPrice.ToString();
                txtProductName.Text = product.ProductName;
                Image1.ImageUrl = product.ProductImage;
                txtInStock.Text = product.InStock.ToString();
                int catid = Convert.ToInt16(Session["CatId"]);
                if (catid == 0)
                {
                    catid = 1;
                }
                ddlSelectCategory.SelectedValue = db.GetCategoryByCategoryId(catid).CategoryId.ToString();
            }
        }
        catch (Exception ex)
        {
            lblMessage.Visible = true;
            lblMessage.Text = ex.Message;
        }
    }

    //Calls the method for edit product
    protected void btnEditProduct_Click(object sender, EventArgs e)
    {

        bool flag = false;
        try
        {

            if ((FileUpload1.PostedFile != null &&
                FileUpload1.PostedFile.FileName != "") || Image1.ImageUrl != null)
            {
                byte[] imageSize = new byte
                              [FileUpload1.PostedFile.ContentLength];
                byte[] data = null;
                HttpPostedFile uploadedImage = FileUpload1.PostedFile;
                uploadedImage.InputStream.Read
                   (imageSize, 0, (int)FileUpload1.PostedFile.ContentLength);
                ShoppingDB db = new ShoppingDB();
                if (FileUpload1.PostedFile != null &&
                FileUpload1.PostedFile.FileName != "")
                {
                    data = FileUpload1.FileBytes;
                }
                else
                {
                    data = db.GetProductsImage(Convert.ToInt16(lblId.Text));
                }

                int catid = int.Parse(ddlSelectCategory.SelectedItem.Value);

                flag = db.UpdateProduct(Convert.ToInt16(lblId.Text), catid, txtProductName.Text, txtDescription.Text, data, Decimal.Parse(txtPrice.Text), Convert.ToInt16(txtInStock.Text));
                if (flag == true)
                {
                    lblMessage.Visible = true;
                    lblMessage.Text = "Product updated successfully";
                    txtProductName.Text = "";
                    txtDescription.Text = "";
                    txtPrice.Text = "";
                    txtInStock.Text = "";
                    Image1.Visible = false;
                    lblMsg.Visible = false;
                    ddlSelectCategory.SelectedIndex = 0;
                }
                else
                {
                    lblMessage.Visible = true;
                    lblMessage.Text = "Product cannot updated.";

                }
            }
        }
        catch (Exception ex)
        {
            lblMessage.Visible = true;
            lblMessage.Text = ex.Message;
        }

    }

    //Cacels and redirects the user
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("ViewProduct.aspx");
        }
        catch (Exception ex)
        {
            lblMessage.Visible = true;
            lblMessage.Text = ex.Message;
        }
    }

    //clears the text
    protected void btnClear_Click(object sender, EventArgs e)
    {
        try
        {
            txtProductName.Text = "";
            txtDescription.Text = "";
            txtPrice.Text = "";
            txtInStock.Text = "";
            Image1.Visible = false;
            lblMsg.Visible = false;
            ddlSelectCategory.SelectedIndex = 0;
        }
        catch (Exception ex)
        {
            lblMessage.Visible = true;
            lblMessage.Text = ex.Message;
        }

    }

    //Delete a product
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        ShoppingDB db = new ShoppingDB();
        bool flag = false;
        try
        {
            MessageBoxButtons buttons = MessageBoxButtons.YesNo;
            DialogResult result;

            // Displays the MessageBox.

            result = MessageBox.Show("Are you sure you want to delete", "Product will be deleted", buttons);

            if (result == DialogResult.Yes)
            {

                flag = db.DeleteProduct(Convert.ToInt16(lblId.Text));
                if (flag == true)
                {
                    Response.Redirect("ViewProduct.aspx");
                }
                else
                {
                    lblMessage.Text = "Product cannot be deleted.";
                }
            }
            else
            {

            }
        }

        catch (Exception ex)
        {
            lblMessage.Visible = true;
            lblMessage.Text = ex.Message;
        }
    }

    //Takes to the admin home
    protected void btnHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminDefault.aspx");
    }
}