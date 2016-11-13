using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShoppingPalate_ShoppingPages_BestSellers : System.Web.UI.Page
{
    //Method which Bind data for the sold out item  and provide best sold out item from the database
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            ShoppingDB data = new ShoppingDB();
            lstvwProducts.DataSource = data.GetBestSellingProduct();
            lstvwProducts.DataBind();
        }
        catch (Exception ex)
        {
            lblMessage.Visible = true;
            lblMessage.Text = "There was some error.Please try after some time.";
        }
    }
}