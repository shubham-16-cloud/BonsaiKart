using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.DataVisualization.Charting;

public partial class Admin_adminhome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            charttype();
            fillchart();
            fillcount();
        }
    }

    private void charttype()
    {
        foreach (int charttype in Enum.GetValues(typeof(SeriesChartType)))
        {
            ListItem li = new ListItem(Enum.GetName(typeof(SeriesChartType), charttype), charttype.ToString());
            ddlcharttype.Items.Add(li); 
        }
    }
    protected void fillchart()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr = null;
        Series sr = chart1.Series["Series1"];
        try
        {
            con.Open();
            //cmd = new SqlCommand("select orderID,orderdate from order_master", con);
            cmd = new SqlCommand("select count(*) as TotalOrder ,convert(char(3),OrderDate, 0) as month, case  SUBSTRING(product_id,1,2) when 'PL' THEN 'PLANT' WHEN 'PO' THEN 'POT' WHEN 'SE' THEN 'SEED' END as ProductType   from order_details, order_master where order_master.orderID = order_details.orderID group by convert(char(3),OrderDate, 0),SUBSTRING(product_id,1,2) order by  convert(char(3),OrderDate, 0)", con);
            dr = cmd.ExecuteReader();
            chart1.Series["Series1"].XValueMember = "ProductType";
            chart1.Series["Series1"].YValueMembers = "TotalOrder";
            
            chart1.DataSource = dr;
            chart1.DataBind();
            //while (dr.Read())
            //{
            //    sr.Points.AddXY(dr["orderID"].ToString(), dr["orderdate"]);
            //}
            
            //sr.Points.AddXY("any",10);
            //sr.Points.AddXY("any", 20);
            //sr.Points.AddXY("any", 30);
            //sr.Points.AddXY("any", 40);
            //sr.Points.AddXY("any", 50);
            //sr.Points.AddXY("any", 60);
            //sr.Points.AddXY("any", 70);
            //sr.Points.AddXY("any", 80);
            //sr.Points.AddXY("any", 90);
            //sr.Points.AddXY("any", 100);
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

    protected void ddlcharttype_SelectedIndexChanged(object sender, EventArgs e)
    {
        chart1.Series["Series1"].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), ddlcharttype.SelectedValue);
        fillchart();
    }

    protected void fillcount()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlCommand cmd1 = new SqlCommand();
        SqlCommand cmd2 = new SqlCommand();

        try
        {
            con.Open();
            cmd = new SqlCommand("select COUNT(*) from order_master where order_status = 0", con);
            object order = cmd.ExecuteScalar();
            lblordercount.Text = order.ToString();

            cmd1 = new SqlCommand("select COUNT(*) from user_details", con);
            object user = cmd1.ExecuteScalar();
            lblusercoint.Text = user.ToString();

            cmd2 = new SqlCommand("select COUNT(*) from advertisement_details where Ad_stusts = 0", con);
            object add = cmd2.ExecuteScalar();
            lbladdvetisementcount.Text = add.ToString();
        }
        catch (Exception ex )
        {
            Response.Write(ex.Message);
        }
        finally
        {

        }
    }
}