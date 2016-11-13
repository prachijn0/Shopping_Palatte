using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShoppingPalate_ShoppingPages_SubCategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            ShoppingDB data = new ShoppingDB();
            lstvwCategory.DataSource = data.GetCategories();
            lstvwCategory.DataBind();
            int id = 0;
            //This condition is to check if the query string is empty.
            //This may happen when user is navigating from Product Details,Cart to this page
            //As we are taking the value from query string the id must be maintined 
            //for navigation.We are maintaing it in Session variable.
            if (string.IsNullOrEmpty(Request.QueryString["categoryId"]))
            {
                id = Convert.ToInt16(Session["idcat"].ToString());
            }
            else
            {
                id = int.Parse(this.Request.QueryString["categoryId"].ToString());
                Session["idcat"] = id;
            }

            lstvwProducts.DataSource = data.GetProductsByCategoryId(id);
            lstvwProducts.DataBind();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
}