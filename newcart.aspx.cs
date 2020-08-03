using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class newcart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            fillcartproduct();
            priceboxvalue();
            cartcount();
         
        }
    }
    protected void Page_PreRenderComplete(object sender, EventArgs e)
    {
       ScriptManager.RegisterStartupScript(this, this.GetType(), "alertScript", "sumCalc()", true);
    }
    protected void cartcount()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        int count;
        try
        {
            con.Open();
            cmd = new SqlCommand("select COUNT(id) from cart_details where userID ='" + Session["userid"] + "'", con);
            count =Convert.ToInt32(cmd.ExecuteScalar());
            lblcount.Text = "Your Cart (" + count + ")";
            Session["count"] = count;
        }
        catch (Exception)
        {
   
        }
        finally
        {
            con.Close();
            cmd.Dispose();
        }
    }
    protected void fillcartproduct()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        try
        {
            con.Open();
            //cmd = new SqlCommand("select * from imgtable", con);
            cmd = new SqlCommand("select  userid,productID,product_name,product_price,sum(product_qty)as product_qty,product_img_url from cart_details where userID = '" + Session["userid"] + "' group by userid,productID,product_name,product_price,product_img_url", con);
            da.SelectCommand = cmd;
             da.Fill(ds);
            lvcart.DataSource = ds;
            lvcart.DataBind();
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
    protected void lvcart_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "medit")
        {
            string i = e.CommandArgument.ToString();
            ltid.Text = i;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr = null;
            try
            {
                con.Open();
                cmd = new SqlCommand("select * from cart_details where productID ='" + i + "'", con);
                dr = cmd.ExecuteReader();
                dr.Read();
                modalname.Text = dr["product_name"].ToString();
                modalprice.Text = dr["product_price"].ToString();
                commanFunction.GenerateQueryForQutantityinEditCart(i);
                commanFunction.FillQtyInEditCartDropDown(modalqty);
                imgmodal.ImageUrl = dr["product_img_url"].ToString();
                
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
        "<script>$('#mymodal').modal('show');</script>", false);

            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
            }
            finally
            {
                con.Close();
                cmd.Dispose();
                dr.Close();
            }
        }
        if (e.CommandName == "mdelete")
        {
            string i = e.CommandArgument.ToString();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            try
            {
                con.Open();
                cmd = new SqlCommand("delete from cart_details where productID='"+ i +"'", con);
                cmd.ExecuteNonQuery();
                fillcartproduct();
                cartcount();
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
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        try
        {
            con.Open();
            cmd = new SqlCommand("UPDATE cart_details SET product_qty ='"+ modalqty.SelectedValue +"' WHERE productid = '"+ ltid.Text +"' ;", con);
            cmd.ExecuteNonQuery();
            priceboxvalue();
            fillcartproduct();

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

    protected void priceboxvalue()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        try
        {
            con.Open();
            cmd = new SqlCommand("select coalesce(sum(product_price*product_qty),0) from cart_details where userID = '" + Session["userid"] + "'", con);
            string i = cmd.ExecuteScalar().ToString();
            lblsubtotal.Text = i;
           
        }
        catch (Exception ex)
        {
            Console.Write( ex.Message);
        }
        finally
        {
            con.Close();
            cmd.Dispose();
        }
    }

    protected void lbFoo_Click(object sender, EventArgs e)
    {
        Session["total"] = lbltotal.Text;
        Response.Redirect("user_oder_details.aspx", true);
    }
}