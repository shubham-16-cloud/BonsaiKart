using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class resetpassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnresetpassword_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr;
        string mail = Session["email"].ToString();
      //  string mail = "preet.rao1999@gmail.com";
        try
        {
            con.Open();
            cmd = new SqlCommand("select * from  user_details where email = '"+mail+"'", con);
            dr = cmd.ExecuteReader();
            dr.Read();
            if(dr.HasRows == true)
            { 
            string pin = dr["pin"].ToString();

            if (txtotp.Text == pin)
            {
                if(deletepin(mail) == 1)
                {
                Response.Redirect("newpassword.aspx", true);
                }
                else
                {
                    lblmsg.Text = "try again";
                }
            }
            else
            {
                lblmsg.Text = "Plese enter valid OTP";
            }
            }
        }
        catch(Exception ex)
        {
            lblmsg.Text = ex.Message;
        }
        finally
        {
            con.Close();
            cmd.Dispose();
        }
    }

    int deletepin(string email)
    { 
        int succ = 0;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();

        try{
            con.Open();
            cmd = new SqlCommand("update user_details set Pin = NULL where email = '"+ email +"' ",con);
            cmd.ExecuteNonQuery();
            succ= 1;
        }
        catch(Exception ex)
        {
            succ= 0;
        }
        finally{
            con.Close();
            cmd.Dispose();
        }
        return succ;
    }
}