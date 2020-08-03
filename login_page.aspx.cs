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
        
    }
    protected void lbsignup_Click(object sender, EventArgs e)
    {
        Response.Redirect("signUp_page.aspx");
    }
    protected void login()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr;

        try
        {
            con.Open();
            string str = "select email from user_details where email = '"+txtemail.Text+"'  collate latin1_general_cs_ai";
            cmd = new SqlCommand(str, con);
            dr = cmd.ExecuteReader();
            if (dr.HasRows == true)
            {
                cheakpassword();
                //password
            }
            else
            {
                lblmsg.Text = "Invalid UserName :";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }
        catch (Exception ex)
        {
            lblmsg.Text = "username() :- " + ex.Message;
        }
        finally
        {
            con.Dispose();
            cmd.Dispose();
        }
    }

    protected void cheakpassword()
    {
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;

            try
            {
                con.Open();
                string str = "select user_id ,email ,password,roll,usrname from user_details where email = '" + txtemail.Text + "' and password='" + txtpassword.Text + "'  collate latin1_general_cs_ai";
                cmd = new SqlCommand(str, con);
                dr = cmd.ExecuteReader();
                dr.Read();
                if (dr.HasRows == true)
                {
                    Session["login"] = "true";
                    Session["userid"] = dr["user_id"].ToString(); ;
                    Session["UserName"] = dr["usrname"].ToString();

                    if (dr["roll"].ToString() == "Admin")
                    {
                        Response.Redirect("Admin/adminhome.aspx", true);

                    }
                    else
                    {
                        Response.Redirect("userpage_main1.aspx", true);
                    }
                }
                else
                {
                    lblmsg.Text = "Invalid UserName and password :";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
                lblmsg.Text = "cheackpassword() :- " + ex.Message;
            }
            finally
            {
                con.Dispose();
                cmd.Dispose();
            }
        }
    }
    protected void lblogin_Click(object sender, EventArgs e)
    {
        login();
    }
    protected void lbforgotpassword_Click(object sender, EventArgs e)
    {
        Response.Redirect("forgotpassword.aspx", true);
    }
}
