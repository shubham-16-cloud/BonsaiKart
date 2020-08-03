using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Diagnostics;
using System.IO;


public partial class Admin_Add_seeds : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void addseed(string pin)
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        
        try
        {
            con.Open();
            cmd = new SqlCommand("addseed", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@seedID", pin);
            cmd.Parameters.AddWithValue("@se_name", txtsename.Text);
            cmd.Parameters.AddWithValue("@se_common_name",txtsecname.Text);
            cmd.Parameters.AddWithValue("@se_price",txtseprice.Text);
            cmd.Parameters.AddWithValue("@se_qty",txtseqty.Text);
            cmd.Parameters.AddWithValue("@se_color",txtsecolor.Text);
            cmd.Parameters.AddWithValue("@se_category",ddlcategory.SelectedValue);
            cmd.Parameters.AddWithValue("@se_descreption", txtsedescription.Text);
            cmd.Parameters.AddWithValue("@se_contains",txtsecontain.Text);
            cmd.Parameters.AddWithValue("@se_height",txtseheight.Text);
            cmd.Parameters.AddWithValue("@se_time",txtsetime.Text);
            cmd.Parameters.AddWithValue("@se_diffculty",ddldiffculty.SelectedValue);
             string path = "~/Admin/plantImg/";
             string[] extaion = { ".jpg", ".jpeg", ".png", ".bmp", ".svg" };
            string fullpath = commanFunction.imgupload(fuimg, path,extaion);
         
            cmd.Parameters.AddWithValue("@se_imgURL",fullpath);

            if(cbfree.Checked == true)
            {
                cmd.Parameters.AddWithValue("@se_free", 1.ToString());
            }
            else
            {
                cmd.Parameters.AddWithValue("@se_free", 0.ToString());
            }


            cmd.ExecuteNonQuery();
        }   
        catch(Exception e)
        {
            Response.Redirect("addseed :- " + e.Message);
        }
        finally
        {
            con.Close();
            cmd.Dispose();
        }
    }
    protected void btnAddseed_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {


            int found;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            commanFunction cf = new commanFunction();
            string vpin = "SE" + commanFunction.finalcode();

            con.Open();
            do
            {
                string str = "select seedID from seed_details where seedID = '" + vpin + "' ";
                cmd = new SqlCommand(str, con);
                dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    found = 1;
                    dr.Close();
                }
                else
                {
                    found = 0;
                    cmd.Dispose();
                    dr.Close();
                    con.Close();
                    addseed(vpin);
                   
                }

            } while (found == 1);

        }
        Response.Redirect("seedlist_viwe.aspx");

    }
}