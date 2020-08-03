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
using System.Collections;
using System.Net;
using System.Net.Mail;

public partial class Admin_new_orderview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Page.IsPostBack == false)
        {
            Session["SortDirection"] = "Desc";
            Session["SortExpression"] = "orderdate";
            txtFromDate.Text = commanFunction.FromDate.ToString("dd/MM/yyyy");
            txtToDate.Text = DateTime.Today.Date.ToString("dd/MM/yyyy");
            string d1 = commanFunction.ConvertToJapanDate(txtFromDate.Text);
            string d2 = commanFunction.ConvertToJapanDate(txtToDate.Text);

            Session["oc"] = Getordercount();
            Session["scount"] = 0;
            filllistviw();
        }
    }

    protected void filllistviw()
    {
        string d1 = commanFunction.ConvertToJapanDate(txtFromDate.Text);
        string d2 = commanFunction.ConvertToJapanDate(txtToDate.Text);
        // System.Globalization.CultureInfo ci = System.Globalization.CultureInfo.InvariantCulture;
        //DateTime d1 = Convert.ToDateTime("2018/03/22");
        //DateTime d2 = Convert.ToDateTime("2018/03/29");
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlConnection con2 = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlCommand cmd2 = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        SqlDataReader dr = null;
        SqlDataReader dr2 = null;
        string StrSql2 = "";
        string vorderid = "";
        string orderid1 = "";
        string date = "";
        string id = "";
        int count = 1;
        string[] vorderdetailcolumns = new string[4];
        try
        {
            DataTable Table1 = new DataTable();
            Table1 = new DataTable("OrderMasterDetail");

            DataColumn RowId = new DataColumn("RowId");
            RowId.DataType = System.Type.GetType("System.Int32");
            Table1.Columns.Add(RowId);

            DataColumn userId = new DataColumn("userId");
            userId.DataType = System.Type.GetType("System.String");
            Table1.Columns.Add(userId);

            DataColumn orderID = new DataColumn("orderID");
            orderID.DataType = System.Type.GetType("System.String");
            Table1.Columns.Add(orderID);

            DataColumn orderID12 = new DataColumn("orderID12");
            orderID12.DataType = System.Type.GetType("System.String");
            Table1.Columns.Add(orderID12);

            DataColumn product_name = new DataColumn("product_name");
            product_name.DataType = System.Type.GetType("System.String");
            Table1.Columns.Add(product_name);

            DataColumn product_qty = new DataColumn("product_qty");
            product_qty.DataType = System.Type.GetType("System.String");
            Table1.Columns.Add(product_qty);

            DataColumn product_price = new DataColumn("product_price");
            product_price.DataType = System.Type.GetType("System.String");
            Table1.Columns.Add(product_price);

            DataColumn prodtuct_total = new DataColumn("prodtuct_total");
            prodtuct_total.DataType = System.Type.GetType("System.String");
            Table1.Columns.Add(prodtuct_total);

            DataColumn orderdate = new DataColumn("orderdate");
            orderdate.DataType = System.Type.GetType("System.String");
            Table1.Columns.Add(orderdate);


            int rowcount = 0;
            DataRow r1;
            string StrSql = "select userid, orderid,orderdate from   order_master where  order_status= 0 and CONVERT(varchar(10),orderdate,111) between '" + d1 + "' and '" + d2 + "' ";
            // string StrSql = "select userid, orderid,orderdate from   order_master where CONVERT(varchar(10),orderdate,111) between '2018/03/20' and '2018/03/27'  ";
            con.Open();

            cmd = new SqlCommand(StrSql, con);
            dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {

                    vorderid = dr["orderid"].ToString();
                    orderid1 = vorderid;

                    date = dr["orderdate"].ToString();
                    id = dr["userId"].ToString();

                    StrSql2 = "select product_name,product_price,product_qty,prodtuct_total from order_details   where orderid = '" + vorderid + "' ";
                    con2.Open();
                    cmd2 = new SqlCommand(StrSql2, con2);
                    dr2 = cmd2.ExecuteReader();
                    if (dr2.HasRows)
                    {
                        while (dr2.Read())
                        {

                            r1 = Table1.NewRow();
                            rowcount += 2;
                            if (count > 1)
                            {
                                // r1 = Table1.NewRow();
                                r1["orderid"] = "";

                                r1["orderdate"] = null;
                                r1["userId"] = null;


                            }
                            else
                            {
                                //r1 = Table1.NewRow();
                                r1["orderid"] = orderid1;
                                r1["orderdate"] = Convert.ToDateTime(date).ToString("dd/MM/yyyy");
                                r1["userID"] = id;


                            }

                            r1["orderid12"] = orderid1;
                            r1["product_name"] = dr2["product_name"].ToString(); ;
                            r1["product_price"] = dr2["product_price"].ToString();
                            r1["product_qty"] = dr2["product_qty"].ToString();
                            r1["prodtuct_total"] = dr2["prodtuct_total"].ToString();
                            r1["RowId"] = rowcount;
                            Table1.Rows.Add(r1);
                            count++;


                        }

                        count = 1;
                       
                    }
                    con2.Close();
                }
                //DataView dv = new DataView(Table1);
                //dv.Sort = Session["SortExpression"].ToString() + " " + Session["SortDirection"].ToString();
                //Table1 = dv.Table.Clone();
                lvorderviwe.DataSource = Table1;
                //lvorderviwe.PageSize = ddlPageSize.SelectedValue;
                //lvorderviwe.EmptyDataText = "No Record Found";

                lvorderviwe.DataBind();
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
            // dr.Close();
        }
    }

    private int[] Getordercount()
    {
        int[] ordercount = new Int32[10000000];
        List<int> lsint = new List<int>();
        string d1 = commanFunction.ConvertToJapanDate(txtFromDate.Text);
        string d2 = commanFunction.ConvertToJapanDate(txtToDate.Text);
        //DateTime d1 = Convert.ToDateTime("2018/03/22");
        //DateTime d2 = Convert.ToDateTime("2018/03/29");
        string[] orderdetailcolumns = new string[4];
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlDataReader dr = null;
        int count = 0;
        con.Open();

        string StrSql = "select count(*) as OCount from order_details,order_master where order_master.orderid = order_details.orderid and CONVERT(varchar(10),orderdate,111) between '" + d1 + "' and '" + d2 + "' and order_status= 0 group by order_details.orderID";
        SqlCommand cmd = new SqlCommand(StrSql, con);
        dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                if (count == 0)
                {
                    ordercount[count] = (Convert.ToInt32(dr["OCount"]) * 2);
                    //lsint.Add(Convert.ToInt32(dr["OCount"]) * 2 - 1);
                }
                else
                {
                    ordercount[count] = ordercount[count - 1] + (Convert.ToInt32(dr["OCount"]) * 2);
                }

                count++;
            }
        }



        cmd.Dispose();
        dr.Close();
        con.Close();
        return ordercount;
    }


    protected void lvorderviwe_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        // ArrayList idList = (ArrayList) Session["oc"];
        int[] idList = (int[])Session["oc"];
        //int[] vcount = Getordercount(); 
        //int[] vcount = (int[])Session["oc"];
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            // orderidLabel

            //Label orderidLBL = e.Item.FindControl("orderidLabel") as Label;

            Label rid = e.Item.FindControl("lblRowCount") as Label;
            LinkButton lb1 = e.Item.FindControl("LinkButton1") as LinkButton;
            LinkButton lb2 = e.Item.FindControl("LinkButton2") as LinkButton;
            int z = Convert.ToInt32(Session["scount"]);
            if (Convert.ToInt32((rid.Text)) == idList[Convert.ToInt32(Session["scount"])])
            {
                lb1.Visible = true;
                lb2.Visible = true;
                // rid.CssClass ="ridpadding";
                // rid.ForeColor = System.Drawing.Color.Red;
                rid.Font.Size = 10;
                Session["scount"] = Convert.ToInt32(Session["scount"]) + 1;
            }

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string d1 = commanFunction.ConvertToJapanDate(txtFromDate.Text);
        string d2 = commanFunction.ConvertToJapanDate(txtToDate.Text);
        Session["oc"] = Getordercount();
        Session["scount"] = 0;
        filllistviw();
    }
    protected void lvorderviwe_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "mconfirm")
        {
            string s = e.CommandArgument.ToString();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            try
            {
                con.Open();
                cmd = new SqlCommand("update order_master set order_status = 1 where orderID ='" + s + "'", con);
                cmd.ExecuteNonQuery();
                //mail code
                string[] useremail = getuseremail(s);
                
                MailMessage mail = new MailMessage();
                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);

                mail.From = new MailAddress("bonsaikart123@gmail.com");//enter your email address
                mail.To.Add(useremail[0]);
                mail.Subject = "Order Details or Order Progress";
                mail.IsBodyHtml = true;
                //string s1;
                //s1 = "Dear'"+ useremail[1]+"'  your orderID '"+ s +"' will be confrim Thank you for your Order ";
                mail.Body = emailbodytemplete(useremail[1],s);


                smtp.Port = 587;
                smtp.Host = "smtp.gmail.com";
                smtp.UseDefaultCredentials = true;

                smtp.Credentials = new System.Net.NetworkCredential("bonsaikart123@gmail.com", "JAYBAROT4494");
                smtp.EnableSsl = true;

                smtp.Send(mail);

                //mail code and
               
                Session["oc"] = Getordercount();
                Session["scount"] = 0;

                int[] idList = (int[])Session["oc"];
                if (e.Item.ItemType == ListViewItemType.DataItem)
                {
                    // orderidLabel

                    //Label orderidLBL = e.Item.FindControl("orderidLabel") as Label;

                    Label rid = e.Item.FindControl("lblRowCount") as Label;
                    LinkButton lb1 = e.Item.FindControl("LinkButton1") as LinkButton;
                    LinkButton lb2 = e.Item.FindControl("LinkButton2") as LinkButton;
                    int z = Convert.ToInt32(Session["scount"]);
                    if (Convert.ToInt32((rid.Text)) == idList[Convert.ToInt32(Session["scount"])])
                    {
                        lb1.Visible = true;
                        lb2.Visible = true;
                        // rid.CssClass ="ridpadding";
                        // rid.ForeColor = System.Drawing.Color.Red;
                        rid.Font.Size = 10;
                        Session["scount"] = Convert.ToInt32(Session["scount"]) + 1;
                    }

                }
                filllistviw();
                
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
        if (e.CommandName == "mdelete")
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            try
            {
                string s = e.CommandArgument.ToString();
                con.Open();
                cmd = new SqlCommand("update order_master set order_status = 2 where orderID ='" + s + "'", con);
                cmd.ExecuteNonQuery();
                // Response.Redirect("new_orderview.aspx",true);

                Session["oc"] = Getordercount();
                Session["scount"] = 0;

                int[] idList = (int[])Session["oc"];
                if (e.Item.ItemType == ListViewItemType.DataItem)
                {
                    // orderidLabel

                    //Label orderidLBL = e.Item.FindControl("orderidLabel") as Label;

                    Label rid = e.Item.FindControl("lblRowCount") as Label;
                    LinkButton lb1 = e.Item.FindControl("LinkButton1") as LinkButton;
                    LinkButton lb2 = e.Item.FindControl("LinkButton2") as LinkButton;
                    int z = Convert.ToInt32(Session["scount"]);
                    if (Convert.ToInt32((rid.Text)) == idList[Convert.ToInt32(Session["scount"])])
                    {
                        lb1.Visible = true;
                        lb2.Visible = true;
                        // rid.CssClass ="ridpadding";
                        // rid.ForeColor = System.Drawing.Color.Red;
                        rid.Font.Size = 10;
                        Session["scount"] = Convert.ToInt32(Session["scount"]) + 1;
                    }

                }
                filllistviw();


//delete method baki che 

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

    protected string[] getuseremail(string oid)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr = null;
        string[] email = new string[10];
        
        try
        {
            con.Open();
            cmd = new SqlCommand("select email,usrname from user_details where user_id = (select user_id from order_details where orderID ='"+ oid +"' group by user_id)", con);
            dr = cmd.ExecuteReader();
            dr.Read();
            email[0] = dr["email"].ToString();
            email[1] = dr["usrname"].ToString();
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
        return email;
    }

    private string emailbodytemplete( string username ,string orderid)
    {
        string body = string.Empty;
        

        using(StreamReader reader = new StreamReader(Server.MapPath("~/emailbody.html")))
        {
            body = reader.ReadToEnd();
        }
        body = body.Replace("{name}", username);
        body = body.Replace("{orderid}", orderid);

        return body;
    }

}