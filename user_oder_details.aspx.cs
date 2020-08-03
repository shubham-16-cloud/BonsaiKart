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

public partial class user_oder_details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            productload();
            filladdress();
        }
    }

    protected void productload()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        try
        {
            con.Open();
            cmd = new SqlCommand("select * from cart_details where userID = '" + Session["userid"] + "'", con);
            da.SelectCommand = cmd;
            da.Fill(ds);
            reproductload.DataSource = ds;
            reproductload.DataBind();


        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }
        finally
        {
            con.Close();
            cmd.Dispose();

        }
    }

    protected void Wizard1_NextButtonClick(object sender, WizardNavigationEventArgs e)
    {
        if (e.NextStepIndex == 2)
        {
            string w =Session["addressNE"].ToString();
            if (w == "New")
            {
                lblbaddress.Text = txtusername.Text + "<br/>" + txthouseno.Text + "<br/>" + txtstreet.Text + "," + txtlandmark.Text + "<br/>" + txtcity.Text + " , " + txtpincode.Text + "<br/>" + txtstate.Text + "<br/>" + txtcountry.Text + "<br/> Ph No." + txtphonenumber.Text;
            }
           
            
            lblqty.Text = Session["count"].ToString();
            lbltotal1.Text = Session["total"].ToString();
        }
    }
    protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        con.Open();
        SqlCommand cmd1;
        SqlCommand cmd2;
        SqlCommand cmd3;
        SqlCommand cmd4;
        SqlCommand cmd5;
        SqlDataReader dr;

        string[] productID = new string[1000];
        string orderID = commanFunction.cheakIDonlynumber("OI", "orderID", "order_details", 8);
        int count = 0;
        string orderid1 = orderID;
        
        SqlTransaction transcation = con.BeginTransaction();
        try
        {
            SqlCommand cmd = new SqlCommand("insert into order_master values('" + orderID + "' ,'" + Session["userID"] + "' , GETDATE(),0)", con, transcation);
            cmd.ExecuteNonQuery();
            cmd1 = new SqlCommand("INSERT INTO order_details SELECT [userID],[productID],[product_name],[product_price],[product_qty],[product_price] * [product_qty],[product_img_url],'" + orderid1 + "' FROM cart_details where userID='" + Session["userid"] + "'", con, transcation);
            cmd1.ExecuteNonQuery();
            cmd5 = new SqlCommand("insert into payment_table values ('" + Session["userID"] + "','" + orderID + "','" + rblpayment.SelectedValue + "','" + rbltime.SelectedValue + "')", con, transcation);
            cmd5.ExecuteNonQuery();
            string n = Session["addressNE"].ToString();
            if ( n == "New" )
            {
                cmd2 = new SqlCommand("insert into user_address values('" + Session["userid"] + "', '" + txtusername.Text + "', '" + txtphonenumber.Text + "','" + txthouseno.Text + "' ,'" + txtstreet.Text + "' ,'" + txtlandmark.Text + "' ,'" + txtcity.Text + "' ,'" + txtpincode.Text + "','" + txtstate.Text + "','" + txtcountry.Text + "')", con, transcation);
                cmd2.ExecuteNonQuery();
            
            }
            //------------------------

            cmd3 = new SqlCommand("select productID from cart_details where userID ='" + Session["userID"] + "'", con, transcation);
            dr = cmd3.ExecuteReader();
            while (dr.Read())
            {
                productID[count] = dr["productID"].ToString();
                count++;
            }
            dr.Close();
            for (int i = 0; i < count; i++)
            {

                //rowupdate1 = updartesubqty(dr["productID"].ToString());
                if (productID[i].Substring(0, 2) == "PL")
                {
                    cmd4 = new SqlCommand("update plant_details  set pl_qty= pl_qty-(select product_qty from cart_details where  cart_details.productid='" + productID[i] + "' and userid= '" + Session["userID"] + "' )  where plantID='" + productID[i] + "'", con, transcation);

                    cmd4.ExecuteNonQuery();
                    cmd4.Dispose();
                }
                else if (productID[i].Substring(0, 2) == "PO")
                {
                    cmd4 = new SqlCommand("update pot_details  set po_qty= po_qty-(select product_qty from cart_details where  cart_details.productid='" + productID[i] + "' and userid= '" + Session["userID"] + "' )  where potID='" + productID[i] + "'", con, transcation);
                    cmd4.ExecuteNonQuery();
                    cmd4.Dispose();
                }
                else if (productID[i].Substring(0, 2) == "SE")
                {
                    cmd4 = new SqlCommand("update seed_details  set se_qty= se_qty-(select product_qty from cart_details where  cart_details.productid='" + productID[i] + "' and userid= '" + Session["userID"] + "' )  where seedID='" + productID[i] + "'", con, transcation);

                    cmd4.ExecuteNonQuery();
                    cmd4.Dispose();
                }
            }

            transcation.Commit();
            Session["orderid"] = orderID;
            deletecartproduct();
           // Response.Redirect("summary.aspx", true);
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
            transcation.Rollback();
        }
        finally
        {
            con.Close();
            if(lblmsg.Text == "")
            {
                Response.Redirect("summary.aspx", true);
            }
        }

    }

    //protected int insertcartdetails( SqlTransaction tran)
    //{
    //    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
    //    SqlCommand cmd = new SqlCommand();
    //    int rowupdate = 0;
    //    try
    //    {
    //        con.Open();
    //        cmd = new SqlCommand("INSERT INTO order_details SELECT [userID],[productID],[product_name],[product_price],[product_qty],[product_price] * [product_qty],[product_img_url],GETDATE() FROM cart_details where userID='" + Session["userid"] + "'", con,tran);
    //        rowupdate = cmd.ExecuteNonQuery();
    //    }
    //    catch (Exception)
    //    {

    //    }
    //    finally
    //    {
    //        con.Close();
    //        cmd.Dispose();
    //    }

    //    return rowupdate;
    //}
    //protected int insertaddress(SqlTransaction tran)
    //{
    //    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
    //    SqlCommand cmd = new SqlCommand();
    //    int rowupdate = 0;
    //    try
    //    {
    //        con.Open();
    //        cmd = new SqlCommand("insert into user_address values('" + Session["userid"] + "', '" + txtusername.Text + "', " + txtphonenumber.Text + ",'" + txthouseno.Text + "' ,'" + txtstreet.Text + "' ,'" + txtlandmark.Text + "' ,'" + txtcity.Text + "' ," + txtpincode.Text + ",'" + txtstate.Text + "','" + txtcountry.Text + "')", con,tran);
    //        rowupdate = cmd.ExecuteNonQuery();
    //    }

    //    catch (Exception)
    //    {

    //    }
    //    finally
    //    {
    //        con.Close();
    //        cmd.Dispose();
    //    }
    //        return rowupdate;
    //}

    //protected int updateqty(SqlTransaction tran)
    //{
    //    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
    //    SqlCommand cmd = new SqlCommand();
    //    SqlDataReader dr = null;
    //    int rowupdate1 = 0;
    //    try
    //    {
    //        con.Open();
    //        cmd = new SqlCommand("select productID from cart_details where userID ='"+ Session["userID"] +"'",con,tran);
    //        dr = cmd.ExecuteReader();
    //        while (dr.Read())
    //        {
    //           rowupdate1 = updartesubqty(dr["productID"].ToString());
    //        }


    //    }
    //    catch ( Exception ex)
    //    {

    //    }
    //    finally
    //    {
    //        con.Close();
    //        cmd.Dispose();
    //    }
    //    return rowupdate1;
    //}

    //protected int updartesubqty(string productID)
    //{
    //    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
    //    SqlCommand cmd = new SqlCommand();
    //    int rowupdate = 0;
    //    try
    //    {
    //        con.Open();
    //        if (productID.Substring(0, 2) == "PL")
    //        {
    //            cmd = new SqlCommand("update plant_details  set pl_qty= pl_qty-(select product_qty from cart_details where  cart_details.productid='" + productID + "' and userid= '" + Session["userID"] + "' )  where plantID='" + productID + "'", con);
    //            rowupdate=cmd.ExecuteNonQuery();
    //        }
    //        else if(productID.Substring(0, 2) == "PO")
    //        {
    //            cmd = new SqlCommand("update pot_details  set po_qty= po_qty-(select product_qty from cart_details where  cart_details.productid='" + productID + "' and userid= '" + Session["userID"] + "' )  where potID='" + productID + "'", con);
    //           rowupdate= cmd.ExecuteNonQuery();
    //        }
    //        else if (productID.Substring(0, 2) == "SE")
    //        {
    //            cmd = new SqlCommand("update seed_details  set se_qty= se_qty-(select product_qty from cart_details where  cart_details.productid='" + productID + "' and userid= '" + Session["userID"] + "' )  where seedID='" + productID + "'", con);
    //           rowupdate= cmd.ExecuteNonQuery();
    //        }

    //    }
    //    catch (Exception ex)
    //    {
    //        lblmsg.Text = ex.Message;
    //    }
    //    finally
    //    {
    //        con.Close();
    //        cmd.Dispose();
    //    }
    //    return rowupdate;
    //}

    protected void deletecartproduct()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        try
        {
            con.Open();
            cmd = new SqlCommand("delete from cart_details where userID = '" + Session["userID"] + "' ", con);
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
        }
        finally
        {
            con.Close();
            cmd.Dispose();
        }
    }

   
    protected void btnnewaddress_Click(object sender, EventArgs e)
    {
        Session["addressNE"] = "New";
        panaddress.Visible = true;
        panrepert.Visible = false;
    }

    protected void filladdress(){
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        try
        {
            con.Open();
            cmd = new SqlCommand("select *from user_address where user_ID = '" + Session["userid"] + "'", con);
            da.SelectCommand = cmd;
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count == 0)
            {
                panaddress.Visible = true;
                panrepert.Visible = false;
                Session["addressNE"] = "New";
            }
            else
            {
                Repeater1.DataSource = ds;
                Repeater1.DataBind();
                panaddress.Visible = false;
                panrepert.Visible = true;

            }
                    }
        catch (Exception e)
        {
            lblmsg.Text = e.Message;
        }
        finally
        {
            con.Close();
            cmd.Dispose();
            da.Dispose();
        }
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "mdit")
        {
            Session["addressNE"] = "Existing";
            Session["addressID"] = e.CommandArgument.ToString();
            Label lbl1 = e.Item.FindControl("lblname") as Label;
            Label lbl2 = e.Item.FindControl("lblhouseno") as Label;
            Label lbl3 = e.Item.FindControl("lblstreet") as Label;
            Label lbl4 = e.Item.FindControl("lbllandmark") as Label;
            Label lbl5 = e.Item.FindControl("lblcity") as Label;
            Label lbl6 = e.Item.FindControl("lblpincode") as Label;
            Label lbl7 = e.Item.FindControl("lblstate") as Label;
            Label lbl8 = e.Item.FindControl("lblcountry") as Label;
            Label lbl9 = e.Item.FindControl("lblphoneno") as Label;

            lblbaddress.Text = lbl1.Text + lbl2.Text + "<br/>" + lbl3.Text + "," + lbl4.Text + "<br/>" + lbl5.Text + " , " + lbl6.Text + "<br/>" + lbl7.Text + "<br>" + lbl8.Text + "<br/> Ph No." + lbl9.Text;

        }
        

    }
}