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

public partial class Admin_edit_pebbles : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");
            fillpebbles();
        }
    }

    protected void fillpebbles()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr = null;

        try
        {
            con.Open();
            cmd = new SqlCommand("select * from pebbles_details where pe_ID ='" + Session["pe_ID"].ToString() + "'", con);
            dr = cmd.ExecuteReader();
            dr.Read();

            txtid.Text = dr["pe_ID"].ToString();
            txtname.Text = dr["pe_name"].ToString();
            txtqty.Text = dr["pe_qty"].ToString();
            txtprice.Text = dr["pe_price"].ToString();
            txttype.Text = dr["pe_type"].ToString();
            txtfeature.Text = dr["pe_feature"].ToString();
            txtuse.Text = dr["pe_use"].ToString();
            txtweight.Text = dr["pe_Weight"].ToString();
            string url= dr["img_url"].ToString();
            imgpebbles.ImageUrl = url;
            if( url == "No Image")
            {
                lblimgpebbles.Visible = false;
                imgpebbles.Visible = false;
                lbdelete.Visible = false;
                lblimg.Visible = true;
                fuimg.Visible = true;
            }
            else
            {
                lblimg.Visible = false;
                fuimg.Visible = false;
                lblimgpebbles.Visible = true;
                imgpebbles.Visible = true;
                lbdelete.Visible = true;
            }

            if (dr["returen"].ToString() == "1")
            {
                cbreturen.Checked = true;
            }
            else
            {
                cbreturen.Checked = false;
            }
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
        }
        finally
        {
            con.Close();
            dr.Close();
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
            cmd = new SqlCommand("select img_url from pebbles_details where pe_ID = '" + Session["pe_ID"] .ToString()+ "'", con);
            dr = cmd.ExecuteReader();
            dr.Read();
            string imgurl = dr["img_url"].ToString();

            string path = Server.MapPath(imgurl);
            FileInfo file = new FileInfo(path);
            dr.Close();
            if (file.Exists)
            {
                SqlCommand cmd1 = new SqlCommand("update pebbles_details set img_url = 'No Image' where pe_ID ='" + Session["pe_ID"].ToString() + "'", con);
                cmd1.ExecuteNonQuery();
                file.Delete();
                cmd1.Dispose();
            }
            fillpebbles();
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

    protected void updatepebbles()
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
            cmd = new SqlCommand("update pebbles_details set pe_name ='" + txtname.Text + "' ,pe_qty= " + txtqty.Text + " , pe_price ='" + txtprice.Text + "' ,pe_type='" + txttype.Text + "' ,pe_use='" + txtuse.Text + "' ,pe_Weight ='" + txtweight.Text + "' ,pe_feature ='" + txtfeature.Text + "' ,returen ='" + c + "' , img_url ='" + fullpath + "'  where pe_ID ='" + Session["pe_ID"].ToString() + "'", con);
            cmd.ExecuteNonQuery();

            Response.Redirect("pebbles_viwe.aspx", true);
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
        updatepebbles();
    }
}