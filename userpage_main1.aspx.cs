using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;



public partial class userpage_main1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"].ToString() != "")
        {
            loginuser1.Visible = true;
            lblusername.Text = Session["UserName"].ToString().ToUpper();
        }
        else
        {
            normaluser1.Visible = true;
        }

        if (Page.IsPostBack == false)
        {
          
            showdata();
            showslider();
        }
    }
    protected void showdata()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        try
        {
            con.Open();
            //cmd = new SqlCommand("select * from imgtable", con);
            cmd = new SqlCommand("select top 6  plant_details.id,plant_details.plantid,SUBSTRING(pl_name,1,22)+ '...' as pl_name, convert(varchar(10),pl_price )as pl_price,pl_qty,imgurl from plant_details,plant_image where plant_details.plantID = plant_image.plantID and plant_image.imgUrl=(select top 1 imgUrl from plant_image where plant_details.plantID=plant_image.plantID )   union  select top 5 id,seedID,SUBSTRING(se_name,1,22)+ '...' ,  convert(varchar(10),se_price),se_qty,se_imgURL from seed_details  union select  top 6  id,potid,SUBSTRING(po_name,1,22)+ '...' , convert(varchar(10),po_price),po_qty,po_imgURL from pot_details  order by 1 desc", con);
            da.SelectCommand = cmd;
            da.Fill(ds);
            ListView1.DataSource = ds;
            ListView1.DataBind();
        }
        catch (Exception e)
        {
            Response.Write("showdatra() :- " + e.Message);
        }
        finally
        {
            con.Close();
            cmd.Dispose();
            da.Dispose();
        }
    }
    protected void showslider()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        try
        {
            con.Open();
            cmd = new SqlCommand("select top 5 * from img_slider", con);
            da.SelectCommand = cmd;
            da.Fill(ds);
            reslider.DataSource = ds;
            reslider.DataBind();
        }
        catch (Exception e)
        {
            Response.Write("showslider() :- " + e.Message);
        }
        finally
        {
            con.Close();
            cmd.Dispose();
            da.Dispose();
        }

    }

    protected void lbsingup_Click(object sender, EventArgs e)
    {
        Response.Redirect("signUp_page.aspx");
    }
    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        string[] dd = new string[2];
        int x = 0;
        if ((e.Item.ItemType == ListViewItemType.DataItem))
        {
            //  Display the e-mail address in italics.
            Label qtylable = ((Label)(e.Item.FindControl("lblqty")));

            int qty = Convert.ToInt32(qtylable.Text);
            if (qty == 0)
            {
                ((Label)(e.Item.FindControl("lblstock"))).Visible = true;
            }
            // discount code here
            Label price = ((Label)(e.Item.FindControl("pl_priceLabel")));
            Label id = ((Label)(e.Item.FindControl("lblplantid")));
            Label dprice = ((Label)(e.Item.FindControl("lblDiscountedPrice")));
            Label drate = ((Label)(e.Item.FindControl("lblDiscountRate")));

            x = Convert.ToInt32(price.Text);
            dd = cheakdiscountdate(id.Text, x);
            dprice.Text = dd[1].ToString() + "₹";

            drate.Text = dd[0].ToString() + "%";
            price.CssClass = "fontstyle";
            if (drate.Text == "0%")
            {
                dprice.Visible = false;
                drate.Visible = false;
                price.CssClass = "";
            }
        }
    }

    private string[] cheakdiscountdate(string pid, int oPrice)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr = null;
        //string[] itype = new string[5];
        //float[] drate = new float[5];
        //int[] pricerange = new int[5];
        // double drate;
        string[] discountedpriceAndDiscountRate = new string[2];
        string itype1 = pid.Substring(0, 2);

        try
        {
            con.Open();
            cmd = new SqlCommand("select discount_rate from discount_master where GETDATE() between date_from and date_to and itemtype = '" + itype1 + "' ", con);
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                discountedpriceAndDiscountRate[0] = dr["discount_rate"].ToString();
                discountedpriceAndDiscountRate[1] = (oPrice - ((oPrice * Convert.ToInt32(discountedpriceAndDiscountRate[0])) / 100)).ToString();

            }
            else
            {
                discountedpriceAndDiscountRate[0] = "0";
                discountedpriceAndDiscountRate[1] = "0";
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
    protected void btnlogout_Click(object sender, EventArgs e)
    {
        Session["login"] = "";
        Session["userid"] = "";
        Session["username"] = "";
        Session["orderid"] = "";
        Response.Redirect("userpage_main1.aspx", true);
    }

    protected void btnsearch_Click(object sender, EventArgs e)
    {
        Session["searchtext"] = txtsearch.Text;
        Response.Redirect("newsearch.aspx");
       
    }
}