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

public partial class Admin_edit_seed : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");
            fillseedtextbox();
        }
    }

    protected void fillseedtextbox()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr = null;
        try
        {
            con.Open();
            cmd = new SqlCommand("select * from seed_details where seedID = '" + Session["seedID"].ToString() + "'", con);
            dr = cmd.ExecuteReader();
            dr.Read();

            txtid.Text = dr["seedID"].ToString();
            txtsecname.Text = dr["se_common_name"].ToString();
            txtsename.Text = dr["se_name"].ToString();
            txtseprice.Text = dr["se_price"].ToString();
            txtseqty.Text = dr["se_qty"].ToString();
            txtsecolor.Text = dr["se_color"].ToString();
            txtsedescription.Text = dr["se_description"].ToString();
            ddlcategory.SelectedValue = dr["se_category"].ToString();
            txtsecontain.Text = dr["se_contains"].ToString();
            txtsetime.Text = dr["se_time"].ToString();
            txtseheight.Text = dr["se_height"].ToString();
            ddldiffculty.SelectedValue = dr["se_diffculty"].ToString();
            if (dr["se_free"].ToString() == "1")
            {
                cbfree.Checked = true;
            }
            else
            {
                cbfree.Checked = false;
            }
            string url = dr["se_imgURL"].ToString();


            if (url == "No Image")
            {
                imgseed.Visible = false;
                lblimg1.Visible = false;
                fuimg.Visible = true;
                rfvfuimg.Visible = true;
                lblimg.Visible = true;
                lbdelete.Visible = false;
            }
            else
            {
                imgseed.ImageUrl = url;
                imgseed.Visible = true;
                lblimg1.Visible = true;
                fuimg.Visible = false;
                lblimg.Visible = false;
                lbdelete.Visible = true;
                rfvfuimg.Visible = false;
            }


        }
        catch (Exception ex)
        {
            lblimg.Text = ex.Message;
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
        SqlDataReader dr;
        try
        {
            con.Open();

            SqlCommand cmd1 = new SqlCommand("select se_imgURL from seed_details where seedID ='" + Session["seedID"].ToString() + "'", con);
            dr = cmd1.ExecuteReader();
            dr.Read();
            string imgurl = dr["se_imgURL"].ToString();
            Session["imgurl"] = imgurl;
            dr.Close();
            //delete physical image
            string path = Server.MapPath(Session["imgurl"].ToString());
            //System.IO.File.Delete(path); 
            FileInfo file = new FileInfo(path);
            if (file.Exists)
            {
                cmd = new SqlCommand("update seed_details set se_imgURL ='No Image' where seedID ='" + Session["seedID"].ToString() + "'", con);
                cmd.ExecuteNonQuery();

                file.Delete();

                //delete record in database
            }
           
           
            fillseedtextbox();


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


    protected void btnupdateseed_Click(object sender, EventArgs e)
    {
        //have fileupload nu function banava nu che ane tema fullpath return karava no che 
        string path1 = "~/Admin/plantImg/";
        string[] extaion1 = { ".jpg", ".jpeg", ".png", ".bmp", ".svg", ".gif" };
       string fullpath = commanFunction.imgupload(fuimg, path1, extaion1);

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        int c;
        try
        {

            if (cbfree.Checked == true)
            {
                c = 1;
            }
            else
            {
                c = 0;
            }

            con.Open();
            cmd = new SqlCommand("update seed_details set se_name ='" + txtsename.Text + "',se_common_name ='" + txtsecname.Text + "',se_price ='" + txtseprice.Text + "',se_qty =" + txtseqty.Text + ",se_color ='" + txtsecolor.Text + "',se_category ='" + ddlcategory.SelectedItem.Text + "',se_description ='" + txtsedescription.Text + "',  se_contains =" + txtsecontain.Text + " ,se_time ='" + txtsetime.Text + "' ,se_height ='" + txtseheight.Text + "',se_diffculty ='" + ddldiffculty.SelectedItem.Text + "' ,se_free =" + c + ", se_imgURL ='" + fullpath + "' where seedID ='" + Session["seedID"].ToString() + "'", con);
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
        Response.Redirect("seedlist_viwe.aspx", true);
    }
}