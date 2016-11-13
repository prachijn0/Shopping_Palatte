using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShoppingPalate_ShoppingPages_CreateUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        try
        {
            Roles.AddUserToRole(CreateUserWizard1.UserName, "user");
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
}