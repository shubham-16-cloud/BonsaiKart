using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Add_pebbles : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
          string path = "~/Admin/plantImg/";
             string[] extaion = { ".jpg", ".jpeg", ".png", ".bmp", ".svg" };
        
        try
        {
            string pin = commanFunction.cheakID("PE","pe_ID","pebbles_details");
            string fullpath = commanFunction.imgupload(fuimg,path,extaion);
            con.Open();
            cmd = new SqlCommand("add_pebbles", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@pe_ID",pin);
            cmd.Parameters.AddWithValue("@pe_name",txtname.Text);
            cmd.Parameters.AddWithValue("@pe_type" ,txttype.Text);
            cmd.Parameters.AddWithValue("@pe_price",txtprice.Text);
            cmd.Parameters.AddWithValue("@pe_qty",txtqty.Text);
            cmd.Parameters.AddWithValue("@pe_feature" , txtfeature.Text);
            cmd.Parameters.AddWithValue("@pe_use",txtuse.Text);
            cmd.Parameters.AddWithValue("@pe_weight",txtweight.Text);
            cmd.Parameters.AddWithValue("@img_url",fullpath);
            if(cbreturen.Checked == true)
            {
                cmd.Parameters.AddWithValue("@returen",1);
            }
            else{
                cmd.Parameters.AddWithValue("@returen",0);
            }
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
}