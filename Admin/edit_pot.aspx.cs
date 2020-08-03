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

public partial class Admin_edit_pot : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");
            fillpottextbox();
        }
    }

    protected void fillpottextbox()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr = null;

        try
        {
            con.Open();
            cmd = new SqlCommand("select * from pot_details where potID='" + Session["potID"].ToString() + "'", con);
            dr = cmd.ExecuteReader();
            dr.Read();

            txtid.Text = dr["potID"].ToString();
            txtponame.Text = dr["po_name"].ToString();
            txtpoprice.Text = dr["po_price"].ToString();
            txtpoqty.Text = dr["po_qty"].ToString();
            txtpodimension.Text = dr["po_dimension"].ToString();
            txtpomaterial.Text = dr["po_material"].ToString();
            ddlcategory.SelectedValue = dr["po_category"].ToString();
            txtpodescreption.Text = dr["po_description"].ToString();
            txtplacement.Text = dr["po_placement"].ToString();

            if (dr["po_free"].ToString() == "1")
            {
                cbfree.Checked = true;
            }
            else
            {
                cbfree.Checked = false;
            }
            string url = dr["po_imgURL"].ToString();
            imgpot.ImageUrl = url;
            if (url == "No image")
            {
                lblimg.Visible = true;
                fuimg.Visible = true;
                rfvfuimg.Visible = true;
                lblimg1.Visible = false;
                imgpot.Visible = false;
                lbdelete.Visible = false;
            }
            else
            {
                lblimg.Visible = false;
                fuimg.Visible = false;
                rfvfuimg.Visible = false;
                lblimg1.Visible = true;
                imgpot.Visible = true;
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
            cmd = new SqlCommand("select po_imgURL from pot_details where potID='" + Session["potID"].ToString() + "'", con);
            dr = cmd.ExecuteReader();
            dr.Read();
            string imgurl = dr["po_imgURL"].ToString();
            Session["imgurl"] = imgurl;
            dr.Close();

            string path = Server.MapPath(Session["imgurl"].ToString());
            FileInfo file = new FileInfo(path);
            if (file.Exists)
            {
                SqlCommand cmd1 = new SqlCommand("update pot_details set po_imgURL ='No image' where potID ='" + Session["potID"].ToString() + "'", con);
                cmd1.ExecuteNonQuery();

                file.Delete();
                cmd1.Dispose();
            }

            fillpottextbox();
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
    protected void btnupdatepot_Click(object sender, EventArgs e)
    {
        string path1 = "~/Admin/plantImg/";
        string[] extaion1 = { ".jpg", ".jpeg", ".png", ".bmp", ".svg", ".gif" };
        string fullpath = commanFunction.imgupload(fuimg, path1, extaion1);


        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        int c;
        if (cbfree.Checked == true)
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
            cmd = new SqlCommand("update pot_details set po_name ='" + txtponame.Text + "' ,po_price ='" + txtpoprice.Text + "' ,po_qty =" + txtpoqty.Text + " ,po_dimension ='" + txtpodimension.Text + "' ,po_material ='" + txtpomaterial.Text + "'  ,po_category ='" + ddlcategory.SelectedItem.Text + "' ,po_description ='" + txtpodescreption.Text + "' ,po_placement ='" + txtplacement.Text + "' ,po_free =" + c + " ,po_imgURL ='" + fullpath + "'  where potID ='" + Session["potID"].ToString() + "'", con);
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
        Response.Redirect("pot_viwe.aspx", true);

    }
}