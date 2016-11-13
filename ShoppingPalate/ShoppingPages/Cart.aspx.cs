using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShoppingPalate_ShoppingPages_Cart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Check whether the shopping cart is empty.  If not, display its contents in a Gridview
        try
        {
            if (Session["ShoppingCart"] == null)
            {
                lblMessage.Text = "Your shopping cart is empty";
                ImageButton btnCheckoutWithPaypal = (ImageButton)LoginView1.FindControl("btnCheckoutWithPaypal");
                btnCheckoutWithPaypal.Visible = false;
            }
            else
            {
                ShoppingDB cart = (ShoppingDB)Session["ShoppingCart"];
                //GridView1.DataSource = c.Products;
                grdvwCart.DataSource = cart.Products;

                if (!IsPostBack)
                {

                    grdvwCart.DataBind();
                }
            }
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message;
        }
        
       
    }
    protected void grdvwCart_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //Use the RowCommand event of the Gridview to handle removing items from the cart.  The CommandArgument property of the remove button supplies the product ID to remove
        try
        {
            if (e.CommandName == "Remove")
            {
                ShoppingDB c = (ShoppingDB)Session["ShoppingCart"];
                c.RemoveProduct(Convert.ToInt16(e.CommandArgument));
                grdvwCart.DataBind();

                if (grdvwCart.Rows.Count == 0)
                {
                    lblMessage.Text = "Your shopping cart is empty";
                    ImageButton btnCheckoutWithPaypal = (ImageButton)LoginView1.FindControl("btnCheckoutWithPaypal");
                    btnCheckoutWithPaypal.Visible = false;
                    lblTotal.Text = "";
                    lblTotal.Visible = false;
                    Label1.Visible = false;

                }
            }
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message;
        }




    }

    //Use the RowEditing event of the Gridview to update item quantities
    protected void grdvwCart_RowEditing(object sender, GridViewEditEventArgs e)
    {

        try
        {
            ShoppingDB c = (ShoppingDB)Session["ShoppingCart"];
            int prodid = Convert.ToInt16(grdvwCart.DataKeys[e.NewEditIndex].Value.ToString());
            int quantity = Convert.ToInt16(((TextBox)grdvwCart.Rows[e.NewEditIndex].FindControl("txtQuantity")).Text);
            c.UpdateQuantity(quantity, prodid);
            grdvwCart.EditIndex = -1;
            grdvwCart.DataBind();
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message;
        }

    }



    //When the gridview has been bound to the data, calculate the order total and display in the Gridview footer
    protected void grdvwCart_DataBound(object sender, EventArgs e)
    {
        try
        {
            ShoppingDB c = (ShoppingDB)Session["ShoppingCart"];

            //Only do the calculation if the Gridview has something in it
            if (grdvwCart.Rows.Count > 0)
            {
             
                lblTotal.Text = c.GetTotal().ToString();
                lblTotal.Visible = true;
                Label1.Visible = true;
            }
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message;
        }
    }
    protected void btnChkOut_Click(object sender, EventArgs e)
    {
        //When  user  add the cart to the database as an order and transfer  for payment processing
        ShoppingDB db = new ShoppingDB();
        Product product = null;
        List<Product> Products = new List<Product>();

        foreach (GridViewRow item in grdvwCart.Rows)
        {
            product = new Product();
            product.ProductId = (int)grdvwCart.DataKeys[item.DataItemIndex].Value; 
            TextBox id = (TextBox)item.Cells[1].FindControl("txtQuantity");
            product.Quantity = Convert.ToInt16(id.Text);
            Products.Add(product);
        }
        try
        {
            bool flag = db.Order(User.Identity.Name, Convert.ToDecimal(lblTotal.Text));
            bool itemsSold = db.ItemsSold(Products);
            if (flag && itemsSold)
            {
                Response.Redirect("PayPal.aspx");
            }
            else
            {
                lblMessage.Text = "Cannot be redirected to Paypal.";
            }


        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message;
        }
    }
    //Where user  can continue shopping
    protected void btnContShpng_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("Category.aspx");
        }
        catch (Exception)
        {

            lblMessage.Text = "Cannot be redirected to Categories";
        }
    }

}