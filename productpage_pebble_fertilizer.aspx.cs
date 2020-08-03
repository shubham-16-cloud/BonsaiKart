using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class productpage_pebble_fertilizer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {

            if (Session["login"].ToString() == "")
            {
                btncart.Enabled = false;
                btnbuy.Enabled = false;
                
            }
            exam();
        }
    }


    protected void exam()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        string[] discount = new string[2];
        SqlDataReader dr = null;

        con.Open();
        string key = Request.QueryString[0];
       

        if (key.Substring(0, 2) == "PE")
        {
            imgsingle.Visible = true;
            panpebbles.Visible = true;
            Panfertilizer.Visible = false;
            cmd = new SqlCommand("select pe_ID,pe_name,pe_qty,pe_type,pe_feature,pe_use, CONVERT(int, pe_price) as pe_price,pe_Weight,returen,img_url from pebbles_details where pe_ID ='" + key + "' ", con);
            dr = cmd.ExecuteReader();
            dr.Read();
            lblpename.Text = dr["pe_name"].ToString();
            string productprice = dr["pe_price"].ToString();
            lblpeprice.Text = productprice.ToString() + " ₹";
            lblpetype.Text = dr["pe_type"].ToString();
            lblpeweight.Text = dr["pe_Weight"].ToString();
            lblpeuse.Text = dr["pe_use"].ToString();
            lblheadname.Text = dr["pe_name"].ToString();
            lblheadetails.Text = "Pebbles type  is" + dr["pe_type"].ToString() + "and per paket Weight is" + dr["pe_Weight"].ToString();
          //  lblheadprice.Text = productprice.ToString();
            lblprice.Text = "Price :- " + productprice.ToString() + " ₹";
            lblqty.Text = dr["pe_qty"].ToString();

            if (dr["returen"].ToString() == "1")
            {
                imgsefree.Visible = true;
                imgsenotfree.Visible = false;
            }
            else
            {
                imgsefree.Visible = false;
                imgsenotfree.Visible = true;
            }

            lblheadimage.Text = dr["img_url"].ToString();
            imgsingle.ImageUrl = dr["img_url"].ToString();

            //discount method
            discount = discountprice(key, productprice);
            lbldrate.Text = discount[0].ToString() + " %";
            string discounvalueprice = discount[1].ToString();
            lbldprice.Text = "Price :-" + discounvalueprice + " ₹";

            if (lbldrate.Text == "0 %")
            {
                lblheadprice.Text = productprice;
                lblpeprice.Text = productprice + " ₹";
                lblprice.CssClass = "whitoutdiscount";

            }
            else
            {
                lblheadprice.Text = discounvalueprice;
               
                lblpeprice.Text = discounvalueprice;
                lblprice.CssClass = "discountstyle";
            }

        }
        else if (key.Substring(0, 2) == "FE")
        {
            imgsingle.Visible = true;
            panpebbles.Visible = false;
            Panfertilizer.Visible = true;

            cmd = new SqlCommand("select fe_ID,fe_name,CONVERT(int,fe_price) as fe_price,fe_qty,fe_weight,fe_containt,fe_use,fe_feature,fe_details,fe_returen,img_url from fertilizer_details where fe_ID = '" + key + "' ", con);
            dr = cmd.ExecuteReader();
            dr.Read();
            lblfename.Text = dr["fe_name"].ToString();
            string productprice = dr["fe_price"].ToString();
            lblfeprice.Text = productprice + " ₹";
            lblfedetails.Text = dr["fe_details"].ToString();
            lblfedecription.Text = dr["fe_feature"].ToString();
            lblfecontaint.Text = dr["fe_containt"].ToString();
            lblfeweight.Text = dr["fe_weight"].ToString();
            lblheadname.Text = dr["fe_name"].ToString();
            lblheadetails.Text = "Fertilizer Packet Weight is " + dr["fe_weight"].ToString() + "and per packet containt is " + dr["fe_containt"].ToString();
            lblprice.Text = "Price :- " + productprice + " ₹";
          //  lblheadprice.Text = productprice;

            lblqty.Text = dr["fe_qty"].ToString();
            if (dr["fe_returen"].ToString() == "1")
            {
                imgpofree.Visible = true;
                imgponotfree.Visible = false;
            }
            else
            {
                imgpofree.Visible = false;
                imgponotfree.Visible = true;
            }

            lblheadimage.Text = dr["img_url"].ToString();
            imgsingle.ImageUrl = dr["img_url"].ToString();


            //discount method
            discount = discountprice(key, productprice);
            lbldrate.Text = discount[0].ToString() + " %";
            string discounvalueprice = discount[1].ToString();
            lbldprice.Text = "Price :-" + discounvalueprice + " ₹";

            if (lbldrate.Text == "0 %")
            {
                lblheadprice.Text = productprice;
                lblfeprice.Text = productprice + " ₹";
                lblprice.CssClass = "whitoutdiscount";

            }
            else
            {
                lblheadprice.Text = discounvalueprice;

                lblfeprice.Text = discounvalueprice;
                lblprice.CssClass = "discountstyle";
            }


        }
        con.Close();
        cmd.Dispose();
    }


    protected void cart()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        string userid = Session["userid"].ToString();
        string ProductID = Request.QueryString[0];
        
        string strsql;
        int qty = Convert.ToInt32(quantity.Text);
        //  string cartid = commanFunction.cheakID("CR", "cartID", "cart_details");
        try
        {
            con.Open();
            //cmd = new SqlCommand("insert into cart_details values('"+ userid +"' , '"+ ProductID +"' , '"+ lblheadname.Text +"' , '"+ lblheadprice.Text +"' , '"+ quantity.Text +"' , '"+ lblheadimage.Text +"')", con);
            if (checkcartitem() == 0)
            {
                strsql = "insert into cart_details values('" + userid + "' , '" + ProductID + "' , '" + lblheadname.Text + "' , '" + lblheadprice.Text + "' , '" + quantity.Text + "' , '" + lblheadimage.Text + "')";
                cmd = new SqlCommand(strsql, con);
                cmd.ExecuteNonQuery();
               // Response.Redirect("newcart.aspx", true);
            }
            else
            {
                if (checkmaxqty() == true)
                {
                    strsql = "update cart_details set product_qty=product_qty + " + qty.ToString() + "   where productID =  '" + ProductID + "' and userID='" + userid + "'";
                    cmd = new SqlCommand(strsql, con);
                    cmd.ExecuteNonQuery();
                    //Response.Redirect("newcart.aspx", true);
                }
                

            }

            // Response.Redirect("productdetail_page.aspx?ProductID=" + ProductID, true);
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        finally
        {
            con.Close();
            cmd.Dispose();
            Response.Redirect("newcart.aspx", true);
        }


    }
    private bool checkmaxqty()
    {

        int itemaddedqty = 0;
        int totalqty = 0;
        bool addtocartqtyok = false;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        string userid = Session["userid"].ToString();
        
        string ProductID = Request.QueryString[0];
        
        //  string cartid = commanFunction.cheakID("CR", "cartID", "cart_details");
        try
        {
            con.Open();
            cmd = new SqlCommand("select product_qty from cart_details where productID =  '" + ProductID + "' and userID='" + userid + "'", con);
            object obj = cmd.ExecuteScalar();
            itemaddedqty = Convert.ToInt32(obj);
            totalqty = itemaddedqty + Convert.ToInt32(quantity.Text);
            if (totalqty < (Convert.ToInt32(lblqty.Text)))
            {
                addtocartqtyok = true;
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
        }


        return addtocartqtyok;

    }
    private int checkcartitem()
    {
        int itemfound = 0;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        string userid = Session["userid"].ToString();
       
        string ProductID = Request.QueryString[0];
    
        //  string cartid = commanFunction.cheakID("CR", "cartID", "cart_details");
        try
        {
            con.Open();
            cmd = new SqlCommand("select count(*) from cart_details where productID =  '" + ProductID + "' and userID='" + userid + "'", con);
            object obj = cmd.ExecuteScalar();
            itemfound = Convert.ToInt32(obj);


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


        return itemfound;

    }


    protected void btncart_Click(object sender, EventArgs e)
    {
        int qty = Convert.ToInt32(lblqty.Text);
        int txtvalue = Convert.ToInt32(quantity.Text);

        if (txtvalue > qty || txtvalue == 0)
        {
            string message = "Message from 23 server side";
            ScriptManager.RegisterStartupScript((sender as Control), this.GetType(), "Popup", "ShowPopup('" + message + "');", true);

        }
        else
        {
            if (checkmaxqty() == true)
            {
                cart();
            }
            else
            {
                string message = "This product Qty id alredy added in your cart plz chaek your cart";
                ScriptManager.RegisterStartupScript((sender as Control), this.GetType(), "Popup", "ShowPopup('" + message + "');", true);
            }
        }
    }

    private string[] discountprice(string oid, string price)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr = null;
        string[] discountedpriceAndDiscountRate = new string[2];
        string itype1 = oid.Substring(0, 2);
        try
        {
            con.Open();
            cmd = new SqlCommand("select discount_rate from discount_master where GETDATE() between date_from and date_to and itemtype = '" + itype1 + "' ", con);
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                discountedpriceAndDiscountRate[0] = dr["discount_rate"].ToString();
                discountedpriceAndDiscountRate[1] = (Convert.ToInt32(price) - ((Convert.ToInt32(price) * Convert.ToInt32(discountedpriceAndDiscountRate[0])) / 100)).ToString();
            }
            else
            {
                discountedpriceAndDiscountRate[0] = "0";
                discountedpriceAndDiscountRate[1] = "0";
                lbldrate.Visible = false;
                lbldprice.Visible = false;
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
        return discountedpriceAndDiscountRate;
    }
}