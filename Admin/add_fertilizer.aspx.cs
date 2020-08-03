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

public partial class Admin_add_fertilizer : System.Web.UI.Page
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
            string pin = commanFunction.cheakID("FE", "fe_ID", "fertilizer_details");
            string fullpath = commanFunction.imgupload(fuimg,path,extaion);
            con.Open();
            cmd = new SqlCommand("add_fertilizer", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue ("@fe_ID",pin);
            cmd.Parameters.AddWithValue ("@fe_name",txtname.Text);
            cmd.Parameters.AddWithValue ("@fe_qty",txtqty.Text);
            cmd.Parameters.AddWithValue ("@fe_price",txtprice.Text);
            cmd.Parameters.AddWithValue ("@fe_weight",txtweight.Text);
            cmd.Parameters.AddWithValue ("@fe_containt",txtcontaint.Text);
            cmd.Parameters.AddWithValue ("@fe_use",txtuse.Text);
            cmd.Parameters.AddWithValue ("@fe_feature",txtfeature.Text);
            cmd.Parameters.AddWithValue ("@fe_details",txtdetail.Text);
            cmd.Parameters.AddWithValue ("@img_url",fullpath);
          
            if(cbreturen.Checked ==true)
            {
                    cmd.Parameters.AddWithValue ("@fe_returen",1);
            }
            else{
                    cmd.Parameters.AddWithValue ("@fe_returen",0);
            }

            cmd.ExecuteNonQuery();
            Response.Redirect("fertilizer_viwe.aspx",true);
            

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