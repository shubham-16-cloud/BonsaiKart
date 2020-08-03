using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class productdetail_page : System.Web.UI.Page
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

    protected void showdatalist(string key1)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        //    SqlDataReader dr = null;
        
        try
        {
            con.Open();
            cmd = new SqlCommand("select imgurl from plant_image where plantID = '"+ key1 +"'", con);
            da.SelectCommand = cmd;
            da.Fill(ds);
            rptrImages.DataSource = ds;
            rptrImages.DataBind();

        }
        catch (Exception ex)
        {
            lblname.Text = ex.Message;
        }
    }

    protected void exam()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        SqlDataReader dr = null;
        string[] discount = new string[2];
        con.Open();
        string key = Request.QueryString[0];
        if (key.Substring(0, 2) == "PL")
        {
            imgsingle.Visible = false;
            plslider.Visible = true;
            panplant.Visible = true;
            Panpot.Visible = false;
            panseed.Visible = false;
            SqlCommand cmd1 = new SqlCommand("select top 1 (imgUrl) from plant_image where plantID='" + key + "'", con);
            dr = cmd1.ExecuteReader();
            dr.Read();
            string headimgurl = dr["imgUrl"].ToString();
            dr.Close();

            cmd = new SqlCommand("select * from plant_details where plantID ='" + key + "' ", con);
            dr = cmd.ExecuteReader();
            dr.Read();
            lblheadimage.Text = headimgurl;
            lblheadname.Text = dr["pl_name"].ToString();
            lblqty.Text = dr["pl_qty"].ToString();
            lblheadetails.Text = dr["pl_details"].ToString();
            lblname.Text = dr["pl_name"].ToString();
            lbldetails.Text = dr["pl_details"].ToString();
            string productprice = dr["pl_price"].ToString();
            lblprice.Text = "Price :-" + productprice + " ₹";
            lblbrand.Text = dr["pl_brand"].ToString();
           
            lblplantctaegory.Text = dr["pl_category"].ToString();
            if( dr["pl_free"].ToString() == "1")
            {
                imgfree.Visible = true;
                imgnotfree.Visible = false;
            }
            else
            {
                imgfree.Visible = false;
                imgnotfree.Visible = true;
            }
            if (dr["pl_10dayretun"].ToString() == "1")
            {
                
                lbl10day.Visible = true;
            }
            else
            {
                lbl10daynot.Visible = true;

            }
            lblplantdescription.Text = dr["pl_description"].ToString();
            showdatalist(key);

            //discount method
            discount = discountprice(key,productprice);
            lbldrate.Text = discount[0].ToString() + " %";
            string discounvalueprice = discount[1].ToString();
            lbldprice.Text = "Price :-" + discounvalueprice + " ₹";
            
            if (lbldrate.Text == "0 %")
            {
                lblheadprice.Text = productprice;
                lblprice1.Text = productprice + " ₹";
                lblprice.CssClass = "whitoutdiscount";
                
            }
            else
            {
                lblheadprice.Text = discounvalueprice;
                lblprice1.Text = discounvalueprice;
                lblprice.CssClass = "discountstyle";
            }
            

        }
        else if (key.Substring(0, 2) == "SE")
        {
            imgsingle.Visible = true;
            // ScriptManager.RegisterStartupScript(GetType(), "Javascript", "javascript:ToggleDiv(); ", true);
            //string alertScript = "javascript: document.getElementById('myslider').style.visibility = 'hidden')";
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Javascript", "javascript:ToggleDiv()", true);
            //Page.ClientScript.RegisterStartupScript(this, this.GetType(), "Javascript", "javascript:ToggleDiv()", true);
            plslider.Visible = false;
            panplant.Visible = false;
            Panpot.Visible = false;
            panseed.Visible = true;

            cmd = new SqlCommand("select * from seed_details where seedID ='" + key + "' ", con);
            dr = cmd.ExecuteReader();
            dr.Read();
            lblheadname.Text = dr["se_name"].ToString();
            lblsename.Text = dr["se_name"].ToString();
            lblheadetails.Text = "Seed category  is" + dr["se_category"].ToString() + "and per paket containt is" + dr["se_contains"].ToString();
            string seprice = dr["se_price"].ToString();
            lblseprice.Text = seprice + " ₹";
            lblprice.Text = "Price :- " + seprice + " ₹";
            lblsecommanname.Text = dr["se_common_name"].ToString();
            lblsecolor.Text = dr["se_color"].ToString();
            lblsecategory.Text = dr["se_category"].ToString();
            lblsecontaint.Text = dr["se_contains"].ToString();
            lblsetime.Text = dr["se_time"].ToString();
            lblseheight.Text =dr["se_height"].ToString();
            lblqty.Text = dr["se_qty"].ToString();
            lblsedfficult.Text = dr["se_diffculty"].ToString();
            if (dr["se_free"].ToString() == "1")
            {
                imgsefree.Visible = true;
                imgsenotfree.Visible = false;
            }
            else
            {
                imgsefree.Visible = false;
                imgsenotfree.Visible = true;
            }
            lblsedecription.Text = dr["se_description"].ToString();
            lblheadimage.Text = dr["se_imgURL"].ToString();
            imgsingle.ImageUrl = dr["se_imgURL"].ToString();

            //discount method
            discount = discountprice(key, seprice);
            lbldrate.Text = discount[0].ToString() + " %";
            string discounvalueprice = discount[1].ToString();
            lbldprice.Text = "Price :-" + discounvalueprice + " ₹";
            lblprice.CssClass = "discountstyle";
            if (lbldrate.Text == "0 %")
            {
                lblheadprice.Text = seprice;
                lblseprice.Text = seprice + " ₹";
                lblprice.CssClass = "whitoutdiscount";

            }
            else
            {
                lblheadprice.Text = discounvalueprice;
                lblseprice.Text = discounvalueprice;
                lblprice.CssClass = "discountstyle";
            }

           
            
        }
        else if (key.Substring(0, 2) == "PO")
        {
            imgsingle.Visible = true;
          //  ScriptManager.RegisterStartupScript(this, this.GetType(), "Javascript", "javascript:ToggleDiv()", true);
            panplant.Visible = false;
            plslider.Visible = false;
            Panpot.Visible = true;
            panseed.Visible = false;

            cmd = new SqlCommand("select * from pot_details where potID ='" + key + "' ", con);
            dr = cmd.ExecuteReader();
            dr.Read();
            lblheadname.Text =  dr["po_name"].ToString();
            lblheadetails.Text = "pot Dimension is " + dr["po_dimension"].ToString() + "and pot matirial is " + dr["po_material"].ToString();
            lblponame.Text = dr["po_name"].ToString();
            string potprice = dr["po_price"].ToString();
            lblpoprice.Text = potprice + " ₹";
            lblprice.Text = "Price :- " + potprice + " ₹";
            lblpomatirial.Text = dr["po_material"].ToString();
            lbldimenson.Text = dr["po_dimension"].ToString();
            lblplacement.Text = dr["po_placement"].ToString();
            lblpocategory.Text = dr["po_category"].ToString();
            lblqty.Text = dr["po_qty"].ToString();
            if (dr["po_free"].ToString() == "1")
            {
                imgpofree.Visible = true;
                imgponotfree.Visible = false;
            }
            else
            {
                imgpofree.Visible = false;
                imgponotfree.Visible = true;
            }
            lblpodecription.Text = dr["po_description"].ToString();
            lblheadimage.Text = dr["po_imgURL"].ToString();
            imgsingle.ImageUrl = dr["po_imgURL"].ToString();

            //discount method
            discount = discountprice(key, potprice);
            lbldrate.Text = discount[0].ToString() + " %";
            string discounvalueprice = discount[1].ToString();
            lbldprice.Text = "Price :-" + discounvalueprice + " ₹";
            
            if (lbldrate.Text == "0 %")
            {
                lblheadprice.Text = potprice;
                lblpoprice.Text = potprice + " ₹";
                lblprice.CssClass = "whitoutdiscount";

            }
            else
            {
                lblheadprice.Text = discounvalueprice;
                lblpoprice.Text = discounvalueprice + " ₹";
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
            if(checkcartitem() ==0)
            {
                strsql = "insert into cart_details values('" + userid + "' , '" + ProductID + "' , '" + lblheadname.Text + "' , '" + lblheadprice.Text + "' , '" + quantity.Text + "' , '" + lblheadimage.Text + "')";
                cmd = new SqlCommand(strsql, con);
                cmd.ExecuteNonQuery();
                Response.Redirect("newcart.aspx", true);
            }
            else
            {
                if(checkmaxqty()==true)
                {
                    strsql = "update cart_details set product_qty=product_qty + " + qty.ToString() + "   where productID =  '" + ProductID + "' and userID='" + userid + "'";
                    cmd = new SqlCommand(strsql, con);
                    cmd.ExecuteNonQuery();
                    Response.Redirect("newcart.aspx", true);
                }
                //else
                //{
                //    string message = "cart Qty exceeds avilable qty";
                //    ScriptManager.RegisterStartupScript((sender as Control), this.GetType(), "Popup", "ShowPopup('" + message + "');", true);
                //}
                
            }
           
           // Response.Redirect("productdetail_page.aspx?ProductID=" + ProductID, true);
        }
        catch (Exception ex)
        {
            lblname.Text = ex.Message;
        }
        finally
        {
            con.Close();
            cmd.Dispose();
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
            if(totalqty<(Convert.ToInt32(lblqty.Text)))
            {
                addtocartqtyok = true;
            }
        }
        catch (Exception ex)
        {
            lblname.Text = ex.Message;
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
        int itemfound=0;
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
            lblname.Text = ex.Message;
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
        int txtvalue =Convert.ToInt32(quantity.Text);

        if (txtvalue > qty || txtvalue == 0 )
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
            cmd =new SqlCommand("select discount_rate from discount_master where GETDATE() between date_from and date_to and itemtype = '"+ itype1 +"' ",con);
            dr= cmd.ExecuteReader();
            if(dr.HasRows){
                dr.Read();
                 discountedpriceAndDiscountRate[0] = dr["discount_rate"].ToString();
                discountedpriceAndDiscountRate[1] = (Convert.ToInt32(price) -(( Convert.ToInt32(price) * Convert.ToInt32(discountedpriceAndDiscountRate[0])) / 100)).ToString();
            }
            else{
                 discountedpriceAndDiscountRate[0] = "0";
                discountedpriceAndDiscountRate[1] ="0";
                lbldrate.Visible=false;
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