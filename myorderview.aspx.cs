using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class myorderview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            filllistviwe();
        }
    }

    //protected void loadordertable()
    //{
    //    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
    //    SqlCommand cmd = new SqlCommand();
    //    SqlDataReader dr;

    //    try
    //    {
    //        con.Open();
    //        cmd = new SqlCommand("select order_master.orderID,Product_name,product_price,product_qty,prodtuct_total,product_image_url,orderdate from order_master,order_details where  order_master.orderID = order_details.orderID and userid = '35FM'", con);
    //        dr = cmd.ExecuteReader();

    //        while (dr.Read())
    //        {
    //            TableRow row = new TableRow();
    //            TableRow row1 = new TableRow();

    //            TableCell cell = new TableCell();
    //            TableCell cell1 = new TableCell();
    //            TableCell cell2 = new TableCell();
    //            TableCell cell3 = new TableCell();
    //            TableCell cell4 = new TableCell();
    //            TableCell cell5 = new TableCell();
    //            TableCell cell6 = new TableCell();

    //            cell6.Text = dr["orderID"].ToString();
    //            row1.Cells.Add(cell6);
    //            cell6.ColumnSpan = 6;

    //            Image img;
    //            img.ImageUrl = dr["product_image_url"].ToString();



    //            cell.Text = dr["Product_name"].ToString();
    //            row.Cells.Add(cell);


    //            cell1.Text = dr["product_price"].ToString();
    //            row.Cells.Add(cell1);


    //            cell2.Text = dr["product_qty"].ToString();
    //            row.Cells.Add(cell2);


    //            cell3.Text = dr["prodtuct_total"].ToString();
    //            row.Cells.Add(cell3);


    //            cell4.Text = img;
    //            row.Cells.Add(cell4);


    //            cell5.Text = dr["orderdate"].ToString();
    //            row.Cells.Add(cell5);


    //            cell6.Text = dr["orderID"].ToString();
    //            row1.Cells.Add(cell6);


    //            tsorder.Rows.Add(row1);

    //            tsorder.Rows.Add(row);


    //        }

    //    }
    //    catch (Exception ex)
    //    {
    //        Response.Write(ex.Message);
    //    }
    //    finally
    //    {
    //        con.Close();
    //        cmd.Dispose();

    //    }
    //}

    protected void filllistviwe()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();

        try
        {
            con.Open();
            cmd = new SqlCommand("select * from order_master where userID='" + Session["userid"] + "'", con);
            da.SelectCommand = cmd;
            da.Fill(ds);
            lvviweorder.DataSource = ds;
            lvviweorder.DataBind();


        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }

    //protected void fillrep()
    //{
    //    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
    //    SqlCommand cmd = new SqlCommand();
    //    SqlDataAdapter da = new SqlDataAdapter();
    //    DataSet ds = new DataSet();

    //    try
    //    {
    //        con.Open();
    //        cmd = new SqlCommand("", con);
    //        da.SelectCommand = cmd;
    //        da.Fill(ds);
    //        Repeater1.DataSource = ds;
    //        Repeater1.DataBind();


    //    }
    //    catch (Exception ex)
    //    {
    //        Response.Write(ex.Message);
    //    }
    //}


    protected void lvviweorder_ItemDataBound(object sender, ListViewItemEventArgs e)
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        if ((e.Item.ItemType == ListViewItemType.DataItem))
        {

            Repeater re = ((Repeater)(e.Item.FindControl("reiteam")));
            Label orderid = ((Label)(e.Item.FindControl("lblorderid")));

            string id = orderid.Text;



            try
            {
                con.Open();
                cmd = new SqlCommand("select * from order_details where orderID ='" + id + "'", con);
                da.SelectCommand = cmd;
                da.Fill(ds);
                re.DataSource = ds;
                re.DataBind();


            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        } 

    }
}