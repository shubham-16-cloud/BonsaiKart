using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class Admin_edit_discount : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            filldiscount();
        }
    }
    protected void filldiscount()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr = null;

        try
        {
            con.Open();
            cmd = new SqlCommand("select * from discount_master where id ='" + Session["id"].ToString() + "'", con);
            dr = cmd.ExecuteReader();
            dr.Read();
            ddliteamtype.SelectedValue = dr["itemtype"].ToString();
            txtdrate.Text = dr["discount_rate"].ToString();
            txtdprice.Text = dr["price_range"].ToString();
            txtfromdate.Text = dr["date_from"].ToString();
            txttodate.Text =dr["date_to"].ToString();

           

        }
        catch (Exception ex)
        {
            Response.Redirect(ex.Message);
        }
        finally
        {
            con.Close();
            dr.Close();
            cmd.Dispose();

        }
    }
    protected void bteditdiscount_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
      
        try
        {
            con.Open();
            cmd = new SqlCommand("update discount_master set itemtype ='"+ ddliteamtype.SelectedValue+"' ,discount_rate = '"+ txtdrate.Text+"',price_range='"+txtdprice.Text+"',date_from = '"+txtfromdate.Text+"',date_to ='"+txttodate.Text+"' where id ='" + Session["id"].ToString() + "'", con);
            cmd.ExecuteNonQuery();
            Response.Redirect("viwe_discount.aspx", true);
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