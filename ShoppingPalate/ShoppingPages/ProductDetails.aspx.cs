using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShoppingPalate_ShoppingPages_ProductDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                ShoppingDB data = new ShoppingDB();
                int id = 0;
                //This condition is to check if the query string is empty.
                //This may happen when user is navigating from Cart to Product Details.
                //As we are taking the value from query string the id must be maintined 
                //for navigation.We are maintaing it in Session variable.
                if (string.IsNullOrEmpty(Request.QueryString["productId"]))
                {
                    id = Convert.ToInt16(Session["prodid"].ToString());
                }
                else
                {
                    id = int.Parse(this.Request.QueryString["productId"].ToString());
                    Session["prodid"] = id;
                }
                Product dataquery = data.GetProductsDetailsByProductId(id);
                frmvwProductImage.DataSource = new List<Product> { dataquery };
                frmvwProductImage.DataBind();
                frmvwProductDetails.DataSource = new List<Product> { dataquery };
                frmvwProductDetails.DataBind();
                Session["inStock"] = dataquery.InStock;
                if (dataquery.InStock == 0)
                {
                    btnCart.Visible = false;
                    lblMessage.Text = "Item Out Of Stock.";
                }
            }
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message;
        }
    }
   
    protected void btnCart_Click(object sender, EventArgs e)
    {
        try
        {
            int id = Convert.ToInt16(Session["prodid"].ToString());
            string name = ((Label)frmvwProductDetails.FindControl("titleLabel")).Text;

            TextBox txtQuantity = (TextBox)frmvwProductDetails.FindControl("txtQty");
            int quantity = int.Parse(txtQuantity.Text);
            Label lblPrice = (Label)frmvwProductDetails.FindControl("priceLabel");
            decimal price = Decimal.Parse(lblPrice.Text, NumberStyles.Currency);


            int inStock = Convert.ToInt16(Session["inStock"].ToString());
            //if the cart doesn't exist, create it.  Otherwise, retrieve it from the session and add the product to it.
            if (inStock >= quantity)
            {
                if (Session["ShoppingCart"] == null)
                {
                    ShoppingDB add = new ShoppingDB();
                    add.AddProduct(id, name, price, quantity);
                    Session["ShoppingCart"] = add;
                }
                else
                {
                    ShoppingDB add = (ShoppingDB)Session["ShoppingCart"];
                    add.AddProduct(id, name, price, quantity);
                    Session["ShoppingCart"] = add;
                }

                Response.Redirect("Cart.aspx");
            }

            else
            {
                lblMessage.Text = "Please enter lesser quantity.Only " + inStock + " left in stock";
            }
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Some error occured.";
        }
    }
}