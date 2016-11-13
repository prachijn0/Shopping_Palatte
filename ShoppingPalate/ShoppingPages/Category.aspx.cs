using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShoppingPalate_ShoppingPages_Category : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Bind datasource for category
        try
        {
            ShoppingDB data = new ShoppingDB();
            lstvwCategory.DataSource = data.GetCategories();
            lstvwCategory.DataBind();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
}