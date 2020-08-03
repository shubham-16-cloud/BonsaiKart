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


public partial class Admin_edit_fertilizer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Page.IsPostBack == false)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");
            fillfertilizer();
        }
    }
    protected void fillfertilizer()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr = null;

        try
        {
            con.Open();
            cmd = new SqlCommand("select * from fertilizer_details where fe_ID ='"+Session["fe_ID"].ToString()+"'", con);
            dr = cmd.ExecuteReader();
            dr.Read();

            txtid.Text = dr["fe_ID"].ToString();
            txtname.Text = dr["fe_name"].ToString();
            txtqty.Text = dr["fe_qty"].ToString();
            txtprice.Text = dr["fe_price"].ToString();
            txtweight.Text = dr["fe_weight"].ToString();
            txtcontaint.Text = dr["fe_containt"].ToString();
            txtuse.Text = dr["fe_use"].ToString();
            txtfeature.Text = dr["fe_feature"].ToString();
            txtdetail.Text = dr["fe_details"].ToString();
            if (dr["fe_returen"].ToString() == "1")
            {
                cbreturen.Checked = true;
            }
            else
            {
                cbreturen.Checked = false;
            }
            string url = dr["img_url"].ToString();
            imgfertilizer.ImageUrl = url;

            if (url == "No Image")
            {
                fuimg.Visible = true;
                lblimg.Visible = true;
                lblfertilizer.Visible = false;
                imgfertilizer.Visible = false;
                lbdelete.Visible = false;
            }
            else
            {
                fuimg.Visible = false;
                lblimg.Visible = false;
                lblfertilizer.Visible = true;
                imgfertilizer.Visible = true;
                lbdelete.Visible = true;
            }
            
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


    protected void lbdelete_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr = null;

        try
        {
            con.Open();
            cmd = new SqlCommand("select img_url from fertilizer_details where fe_ID = '" + Session["fe_ID"].ToString() + "'", con);
            dr = cmd.ExecuteReader();
            dr.Read();
            string imgurl = dr["img_url"].ToString();

            string path = Server.MapPath(imgurl);
            FileInfo file = new FileInfo(path);
            dr.Close();
            if (file.Exists)
            {
                SqlCommand cmd1 = new SqlCommand("update fertilizer_details set img_url = 'No Image' where fe_ID ='" + Session["fe_ID"].ToString() + "'", con);
                cmd1.ExecuteNonQuery();
                file.Delete();
                cmd1.Dispose();
            }
            fillfertilizer();
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


    protected void btnedit_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        string path1 = "~/Admin/plantImg/";
        string[] extaion1 = { ".jpg", ".jpeg", ".png", ".bmp", ".svg", ".gif" };
        string fullpath = commanFunction.imgupload(fuimg, path1, extaion1);
        int c;
        if (cbreturen.Checked == true)
        {
            c = 1;
        }
        else
        {
            c = 0;
        }

        try
        {
            con.Open();
            cmd = new SqlCommand("update fertilizer_details set fe_ID ='" + txtid.Text + "' ,fe_name ='" + txtname.Text + "' ,fe_qty =" + txtqty.Text + " ,fe_price ='" + txtprice.Text + "' ,fe_weight ='" + txtweight.Text + "' ,fe_containt =" + txtcontaint.Text + " ,fe_use ='" + txtuse.Text + "' ,fe_feature ='" + txtfeature.Text + "' ,fe_details ='" + txtdetail.Text + "' ,fe_returen =" + c + " ,img_url ='" + fullpath + "'  where fe_ID ='" + Session["fe_ID"].ToString() + "'", con);
            cmd.ExecuteNonQuery();

            Response.Redirect("fertilizer_viwe.aspx", true);
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
}