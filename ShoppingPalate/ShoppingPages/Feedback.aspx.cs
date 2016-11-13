using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShoppingPalate_ShoppingPages_Feedback : System.Web.UI.Page
{
     string connectionString = WebConfigurationManager.ConnectionStrings["ShoppingPalateDb"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        // /Define AdO dot net objects and inserting record to the database.
        string insertRecord;
        insertRecord = "INSERT INTO Feedback (ProductID, Comment,CategoryID)";
        insertRecord += "VALUES (@ProductID, @Comment,@CategoryID)";
        SqlConnection con = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand(insertRecord, con);

       
        cmd.Parameters.AddWithValue("@ProductID", Product.SelectedValue);
        cmd.Parameters.AddWithValue("@CategoryID", Product.SelectedValue);
        cmd.Parameters.AddWithValue("@Comment", TextBox1.Text);


        
        int added = 0;
        try
        {
            con.Open();
            added = cmd.ExecuteNonQuery();
           
        }
       
        
        finally
        {
            con.Close();
        }
       
        if (added > 0)
        {
            
            Label1.Text = "Thankyou for your feedback";
            this.Label1.ForeColor = Color.Red;



  
            TextBox1.Text = "";
           

        }
    }
   

    
   
    protected void ChangeDropdownlist(object sender, EventArgs e)
    {

    }
}