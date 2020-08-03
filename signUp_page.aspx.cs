using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      //if(Page.IsPostBack == false)
      //{
      //    if(Page.IsValid == false)
      //    {
      //        rfvBirthdate.ErrorMessage = "";
      //    }
      //}
    }
    protected void lbsingup_Click(object sender, EventArgs e)
    {
        Response.Redirect("login_page.aspx");
    }
    protected void insert_singup_data(string upin)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();

        try
        {
            con.Open();
            cmd = new SqlCommand("userdata", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("user_id",upin);
            cmd.Parameters.AddWithValue("usrname",txtusername.Text);
            cmd.Parameters.AddWithValue("email", txtemail.Text);
            cmd.Parameters.AddWithValue("birthdate", txtbirthdate.Text);
            cmd.Parameters.AddWithValue("password", txtpassword.Text);
            cmd.Parameters.AddWithValue("roll", "User");
           
            cmd.ExecuteNonQuery();
            

        }
        catch(Exception e)
        {
            Response.Write("insertdata singup() :-" + e.Message);
        }
        finally {
            con.Close();
            cmd.Dispose();
        
        }
    }

    protected void checkpin() 
    {
      if (Page.IsValid)
      {

      
        int found;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr;
        string mypin;
        
        con.Open();
        do
        {
            commanFunction cf = new commanFunction();

            mypin = commanFunction.finalcode();
             string str = "select user_id from user_details where user_id = '" + mypin + "' ";
            cmd = new SqlCommand(str, con);
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                found = 1;
                dr.Close();
            }
            else
            {
                found = 0;
                cmd.Dispose();
                dr.Close();
                con.Close();
                insert_singup_data(mypin);
            }

        } while (found == 1);
    }
    }
    protected void btnsingup_Click(object sender, EventArgs e)
    {
      
               checkpin();
               Response.Redirect("login_page.aspx");
           
       
        
    }
    protected void cvbirthdate_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if(txtbirthdate.Text== null )
        {
            args.IsValid = false;
        }
    }
}
