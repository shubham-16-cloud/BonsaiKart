using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class newpassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnnewpassword_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();

        string mail = Session["email"].ToString();
        con.Open();
        cmd = new SqlCommand("update user_details set password = '"+txtnewpassword.Text+"' where email = '"+mail+"'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        cmd.Dispose();
        Response.Redirect("login_page.aspx", true);
    }
}