using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_add_discount : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {

        }
    }
    protected void btnadddiscount_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        string from = txtfromdate.Text;
        string to = txttodate.Text;
        string fromdate =Convert.ToDateTime(from).ToString("MM/dd/yyyy");
        string todate =Convert.ToDateTime(to).ToString("MM/dd/yyyy");
        try
        {
            con.Open();
            cmd = new SqlCommand("insert into discount_master values('" + ddliteamtype.SelectedValue + "','" + txtdrate.Text + "','" + txtdprice.Text + "','" + fromdate + "','" + todate + "')", con);
            cmd.ExecuteNonQuery();
            Response.Redirect("viwe_discount.aspx",true);
        }
        catch (Exception ex)
        {
           
        }
        finally
        {
            con.Close();
            cmd.Dispose();
        }
    }
}