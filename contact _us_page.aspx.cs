using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

public partial class contact__us_page : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btunsend_Click(object sender, EventArgs e)
    {
        sendmail();
    }
    protected void sendmail()
    {
        try
        {
            MailMessage mail = new MailMessage();
            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);

            mail.From = new MailAddress("bonsaikart123@gmail.com");//enter your email address
            mail.To.Add("bonsaikart123@gmail.com");
            mail.Subject = "Countect Us";
            mail.IsBodyHtml = true;
            //string s;
            //s = "Dear '"+username.ToUpper()+"' ,<br/> your password has been reset to : <br/>" + "<span style='font-family: verdana; font-size: 30px;color:green ;font-weight: bold'>" + pin + "</span>" + "<br/> <a href='https://www.fintimeinvestment.com/login.aspx' target='_blank'>Click Here to Login with New Password</a>";
            mail.Body = "Hii I am " + txtname.Text + "<br/>" + "<b>Sender Email </b> :-" + txtemail.Text + "<br/>" + "<b>Message</b> :-" + txtmessage.Text;

            smtp.Port = 587;
            smtp.Host = "smtp.gmail.com";
            smtp.UseDefaultCredentials = true;

            smtp.Credentials = new System.Net.NetworkCredential("bonsaikart123@gmail.com", "JAYBAROT4494");
            smtp.EnableSsl = true;

            smtp.Send(mail);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Javascript", "javascript:ToggleDiv1()", true);

        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }



    }


}