using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Configuration;
using System.Net.Mail;

public partial class forgotpassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsendemail_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr;

        commanFunction cf = new commanFunction();
        string mypin = commanFunction.getcode1(4);
        
        try { 
        con.Open();
        cmd = new SqlCommand("select * from user_details where email ='"+ txtemail.Text +"' ", con);
        dr = cmd.ExecuteReader();
        dr.Read();
            if(dr.HasRows == true)
            {
                Session["email"] = txtemail.Text;
                string username = dr["usrname"].ToString();
                if(insertkey(mypin) == 1)
                {
                    
                   // string pin1 = dr["pin"].ToString();
                    if(sendemail(mypin, username) == 1)
                    {
                        Response.Redirect("resetpassword.aspx");
                    }
                    else
                    {
                        lblmsg.Text = "try again";
                    }

                }
                
                            }
            else
            {
                lblmsg.Text = "InValid Email ID Plese enter valid email ID";
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

     int  insertkey (string pin){
      int success=0;
         SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
         con.Open();
         SqlCommand cmd1= new SqlCommand();
        try
        {
            cmd1 = new SqlCommand("update user_details set Pin = '"+ pin +"' where email ='" + txtemail.Text + "' ", con);
            cmd1.ExecuteNonQuery();
            success=1;
        }
        catch(Exception ex)
        {
            success=0;
        }
        finally
        {
            con.Close();
            cmd1.Dispose();
        }
     return success ; 
     }

    int sendemail( string pin , string username)
     {
           int success=0;
         try
         {
             MailMessage mail = new MailMessage();
             SmtpClient smtp = new SmtpClient("smtp.gmail.com",587);

             mail.From = new MailAddress("bonsaikart123@gmail.com");//enter your email address
             mail.To.Add(txtemail.Text);
             mail.Subject = "Reset your password";
             mail.IsBodyHtml = true;
             //string s;
             //s = "Dear '"+username.ToUpper()+"' ,<br/> your password has been reset to : <br/>" + "<span style='font-family: verdana; font-size: 30px;color:green ;font-weight: bold'>" + pin + "</span>" + "<br/> <a href='https://www.fintimeinvestment.com/login.aspx' target='_blank'>Click Here to Login with New Password</a>";
             mail.Body = emailbodytemplete(username,pin);


             smtp.Port = 587;
             smtp.Host = "smtp.gmail.com";
             smtp.UseDefaultCredentials = true;

             smtp.Credentials = new System.Net.NetworkCredential("bonsaikart123@gmail.com", "SKBAROT1612");
             smtp.EnableSsl = true;

             smtp.Send(mail);
             success = 1;
         }
        catch(Exception ex)
         {
             success = 0;
             lblmsg.Text = ex.Message;
         }
         
         return success;
     }

    private string emailbodytemplete( string username1,string pin1)
    {
        string body = string.Empty;



        using (StreamReader reader = new StreamReader(Server.MapPath("~/forgotpasswordmail.html")))
        {
            body = reader.ReadToEnd();
        }
        body = body.Replace("{name}", username1);
        body = body.Replace("{orderid}", pin1);

        return body;
    }
}