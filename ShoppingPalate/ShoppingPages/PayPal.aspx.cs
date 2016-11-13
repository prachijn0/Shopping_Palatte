using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShoppingPalate_ShoppingPages_PayPal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Here, we simply bind the list of products in the cart to the repeater control to generate the necessary form fields.
        //Then, reset the cart by setting the session variable to null.

        if (!IsPostBack)
        {

            if (Session["ShoppingCart"] != null)
            {
                ShoppingDB db = (ShoppingDB)Session["ShoppingCart"];

                rptItems.DataSource = db.Products;
                rptItems.DataBind();

                Session["ShoppingCart"] = null;

            }
        }

    }
}