using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_master_page : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
         if (Session["login"].ToString() == "")
        {
            pannormal.Visible = true;
           // ScriptManager.RegisterStartupScript(this, this.GetType(), "Javascript", "javascript:ToggleDiv2()", true);
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Javascript", "javascript:ToggleDiv1()", true);
            ////lblusername.Text = Session["UserName"].ToString().ToUpper();
        }
        else
        {
            panlog.Visible = true;
            lblusername.Text = Session["UserName"].ToString().ToUpper();
        }
        if (!Page.IsPostBack)
        {
            Page.ClientScript.RegisterOnSubmitStatement(this.GetType(), "val", "fnOnUpdateValidators();");
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("signUp_page.aspx");
    }
    protected void btnlogout_Click(object sender, EventArgs e)
    {
        Session["login"] = "";
        Session["userid"] = "";
        Session["username"] = "";
        Session["orderid"] = "";
        Response.Redirect("userpage_main1.aspx", true);
    }
       
}
