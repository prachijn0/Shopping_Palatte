using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShoppingPalate_ShoppingPages_UserInformation : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
       if (!IsPostBack)
        {
            TextBox1.Text = Profile.FirstName;
            TextBox2.Text = Profile.LastName;
            TextBox7.Text = Profile.BirthDate.ToShortDateString();
            TextBox8.Text = Profile.Address.Street;
            TextBox3.Text = Profile.Address.City;
            TextBox9.Text = Profile.Address.State;
            TextBox5.Text = Profile.Address.Country;
            TextBox4.Text = Profile.Address.Zip;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Profile.FirstName = TextBox1.Text;
        Profile.LastName = TextBox2.Text;
        Profile.BirthDate = DateTime.Parse(TextBox7.Text);
        Profile.Address.Street = TextBox8.Text;
        Profile.Address.City = TextBox3.Text;
        Profile.Address.State = TextBox9.Text;
        Profile.Address.Zip = TextBox4.Text;
        Profile.Address.Country = TextBox5.Text;
    }
}