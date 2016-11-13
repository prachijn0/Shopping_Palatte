using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShoppingPalate_ShoppingPages_AdminUpdate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


    }
   
    protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        Session["CatId"] = DropDownList1.SelectedItem.Value;
    }
}