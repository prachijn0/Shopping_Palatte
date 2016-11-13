using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShoppingPalate_ShoppingPages_AddCategory : System.Web.UI.Page
{
    protected void OnInit(object sender, EventArgs e)
    {
        
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rdbtncategory.SelectedValue == "1")
        {
            Panel1.Visible = true;
            Panel2.Visible = false;
        }
        else if (rdbtncategory.SelectedValue == "2")
        {
            Panel2.Visible = true;
            Panel1.Visible = false;
            GridView1.DataBind();
        }
    }

    // Method which on using submit click button on category  to  Add category  and inform Message regarding  category
    protected void btnSubmitCategory_Click(object sender, EventArgs e)
    {
        try
        {
            ShoppingDB db = new ShoppingDB();
            bool flag = false;
            if (db.IsCategoryPresent(txtAddCategory.Text))
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Category already present.Add another category";
            }
            else
            {
                flag = db.AddNewCategory(txtAddCategory.Text);
                if (flag == true)
                {
                    lblMessage.Visible = true;
                    lblMessage.Text = "Category added successfully";
                    txtAddCategory.Text = "";
                }
                else
                {
                    lblMessage.Visible = true;
                    lblMessage.Text = "Category cannot added.";
                    txtAddCategory.Text = "";
                }

            }
        }
        catch (Exception ex)
        {
            lblMessage.Visible = true;
            lblMessage.Text = ex.Message;
        }
    }

    // Method which clear category on click on categorybutton
    protected void btnClearCategory_Click(object sender, EventArgs e)
    {
        try
        {
            txtAddCategory.Text = "";
            lblMessage.Text = "";
            lblMessage.Visible = false; txtAddCategory.Text = "";
            lblMessage.Text = "";
            lblMessage.Visible = false;
        }
        catch (Exception ex)
        {
            lblMessage.Visible = true;
            lblMessage.Text = ex.Message;
        }

    }

    //Method to cancel click
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("Home.aspx");
        }
        catch (Exception ex)
        {

            lblMessage.Text = ex.Message;
        }
    }
   
}