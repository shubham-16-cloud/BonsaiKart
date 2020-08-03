using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_admin_master_page : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Page.ClientScript.RegisterOnSubmitStatement(this.GetType(), "val", "fnOnUpdateValidators();");


            if (Session["UserName"] == null)
            {
                Response.Redirect("../login_page.aspx");
            }
            lblname.Text = Session["UserName"].ToString().ToUpper();

            //lbSave.Attributes.Add("onmouseover", "this.className = 'LinkButtonStyle1'");
            //lbSave.Attributes.Add("onmouseout", "this.className = 'LinkButtonStyle'");
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx", true);
    }
    protected void btnlogout_Click(object sender, EventArgs e)
    {
        Session["login"] = "";
        Session["userid"] = "";
        Session["username"] = "";
        Response.Redirect("../userpage_main1.aspx", true);
    }
}
