using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class summary : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            fiilreviwe();
            filladdress();
            total();
            fillpayment();
            fillordeno();
        }
    }
    protected void fiilreviwe()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        try
        {
            con.Open();
            //select product_name ,product_price,product_qty ,prodtuct_total from order_details where orderID =Session["orderid"]
            cmd = new SqlCommand("select product_name ,product_price,product_qty ,prodtuct_total from order_details where orderID = '"+Session["orderid"]+"'", con);
            da.SelectCommand = cmd;
            da.Fill(dt);
            if (dt != null)
            {
                reproduct.DataSource = dt;
                reproduct.DataBind();

            }
            else
            {
                Response.Write("hiv a ");
            }
            

        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        finally
        {
            con.Close();
            cmd.Dispose();
            da.Dispose();
            dt.Dispose();
        }

    }

    protected void fillordeno()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr = null;

        try
        {
            con.Open();
            cmd = new SqlCommand("select * from order_master where userID = '" + Session["userID"] + "'", con);
            dr = cmd.ExecuteReader();
            dr.Read();
            lblorderid.Text = dr["orderID"].ToString();
            DateTime dt = Convert.ToDateTime(dr["orderdate"].ToString());
            lbldate.Text = dt.ToString("dd/MM/yyyy");
            int i = Convert.ToInt32(dr["order_status"].ToString());
            if (i == 2)
            {
                string alertScript = "javascript: document.getElementById(\'ErrorMessage\').style.display = \'Block\';document.getElementById(\'" + "SuccessMessage\').style.display = \'none\'; document.getElementById(\'" + "penddingorder\').style.display = \'none\';";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertScript", alertScript, true);

            }
            else if (i == 1)
            {
                string alertScript = "javascript: document.getElementById(\'SuccessMessage\').style.display = \'Block\';document.getElementById" + "(\'ErrorMessage\').style.display =\'none\'; document.getElementById(\'" + "penddingorder\').style.display = \'none\';";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertScript", alertScript, true);
            }
            else
            {
                string alertScript = "javascript: document.getElementById(\'SuccessMessage\').style.display = \'none\';document.getElementById" + "(\'ErrorMessage\').style.display =\'none\'; document.getElementById(\'" + "penddingorder\').style.display = \'Block\';";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertScript", alertScript, true);
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        finally
        {
            con.Close();
            cmd.Dispose();
            dr.Close();
        }
    }

    protected void filladdress()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr = null;
        try
        {
            con.Open();
            cmd = new SqlCommand("select * from user_address where user_ID = '" + Session["userID"] + "'", con);
            dr = cmd.ExecuteReader();
            dr.Read();
            string user_name = dr["user_name"].ToString() + "<br/>" + dr["house_no"] + " , " + dr["street"] + "<br/>" + dr["city"] + " - " + dr["pincode"] + " <br> " + dr["state"] + "<br/>" + dr["country"] + "<br/> Phone No." + dr["phone_number"];
            lbladdress.Text = user_name;


        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        finally
        {
            con.Close();
            cmd.Dispose();
            dr.Close();
        }
    }

    protected void fillpayment()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr = null;

        try
        {
            con.Open();
            cmd = new SqlCommand("select * from payment_table where userid = '" + Session["userID"] + "'", con);
            dr = cmd.ExecuteReader();
            dr.Read();
            lblpayment.Text = dr["payment_type"].ToString();
            lbldil.Text = dr["delivery_time"].ToString();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        finally
        {
            con.Close();
            cmd.Dispose();
            dr.Close();
        }

    }

    protected void total()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        try
        {
            con.Open();
            cmd = new SqlCommand("select nchar(8377)+'   ' + CONVERT(varchar(30), SUM( CONVERT(int, prodtuct_total))) as total from order_details where user_id ='" + Session["userID"] + "'", con);
            object total = cmd.ExecuteScalar();
            lbltotal.Text = total.ToString();
            lblheadtotal.Text = total.ToString();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        finally
        {
            con.Close();
            cmd.Dispose();
        }
    }

}