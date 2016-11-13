using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShoppingPalate_ShoppingPages_Charity : System.Web.UI.Page
{
    string connectionString = WebConfigurationManager.ConnectionStrings["ShoppingPalateDb"].ConnectionString;


    protected void Page_Load(object sender, EventArgs e)
    {

    }
   
    protected void btnPayment_Click(object sender, EventArgs e)
    {
        //This method uses a paramaterized sql statement to insert data into the  charitydatabase

        if (txtFoundationID.SelectedIndex == 0)
        {
            lblMessage.Visible = true;
            lblMessage.Text = "Please select a Foundation to donate money";
        }
        else
        {
            // Define ADO.NET objects.
            string insertRecord;
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("sp_InsertCharity", con);
            cmd.CommandType = CommandType.StoredProcedure;


            cmd.Parameters.AddWithValue("@names", txtName.Text);
            cmd.Parameters.AddWithValue("@phone", Convert.ToInt64(txtPhoneNo.Text));
            cmd.Parameters.AddWithValue("@address", txtAddress.Text);
            cmd.Parameters.AddWithValue("@amount", Convert.ToInt16(txtAmount.Text));

            cmd.Parameters.AddWithValue("@foundationId", txtFoundationID.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@Calendar", Convert.ToDateTime(txtCalendar.Text));


            int added = 0;
            try
            {
                con.Open();
                added = cmd.ExecuteNonQuery();
                if (added > 0)
                {
                    Label1.Text = "Thankyou for Your Contribution.Donate and make other life liveable";
                    this.Label1.ForeColor = Color.Red;
                    txtName.Text = "";
                    txtPhoneNo.Text = "";
                    txtAddress.Text = "";
                    txtAmount.Text = "";
                    Response.Redirect("PayPal.aspx");

                }

            }
            catch (Exception err)
            {
                lblMessage.Text = "Error inserting record. ";
                lblMessage.Text += err.Message;
            }
            finally
            {

                con.Close();

            }
        }
    }
    protected void txtFoundationID_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtFoundationID.ForeColor = System.Drawing.Color.Purple;
    }
}