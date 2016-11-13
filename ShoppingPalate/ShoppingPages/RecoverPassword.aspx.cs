using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShoppingPalate_ShoppingPages_RecoverPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void PasswordRecovery1_SendingMail(object sender, MailMessageEventArgs e)
    {
        //Cancel the sending of the mail
        e.Cancel = true;

        PasswordRecovery1.SuccessText = e.Message.Body;

    }
}