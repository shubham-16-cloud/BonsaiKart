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


public partial class Admin_Add_Product : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {

          if (Page.IsValid)
        {


            int found;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            commanFunction cf = new commanFunction();
            string vpin = "PL" + commanFunction.finalcode();

            con.Open();
            do
            {
                string str = "select plantID from plant_details where plantID = '" + vpin + "' ";
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
                    addplant(vpin);
                    addimg(vpin);
                   
                }

            } while (found == 1);

          }
          Response.Redirect("plant_viwe.aspx");

    }

    protected void addplant(string pin)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();

        try
        {
            con.Open();
            cmd = new SqlCommand("Addplant", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@plantID", pin);
            cmd.Parameters.AddWithValue("@pl_name", txtplname.Text);
            cmd.Parameters.AddWithValue("@pl_price", txtplprice.Text);
            cmd.Parameters.AddWithValue("@pl_brand", txtbrand.Text);
            cmd.Parameters.AddWithValue("@pl_qty", txtqty.Text);
            cmd.Parameters.AddWithValue("@pl_category", ddlcategory.SelectedValue);
            cmd.Parameters.AddWithValue("@pl_description", txtdescription.Text);
            cmd.Parameters.AddWithValue("@pl_details", txtdetails.Text);
            if (cbfree.Checked == true)
            {
                cmd.Parameters.AddWithValue("@pl_free", 1.ToString());
            }
            else
            {
                cmd.Parameters.AddWithValue("@pl_free", 0.ToString());
            }

            if (cbreturen.Checked == true)
            {
                cmd.Parameters.AddWithValue("@pl_10dayretun", 1.ToString());
            }
            else
            {
                cmd.Parameters.AddWithValue("@pl_10dayretun", 0.ToString());
            }

            cmd.ExecuteNonQuery();
        }
        //add image
        catch (Exception e)
        {
            Response.Redirect("addplant :- " + e.Message);
        }
       finally
       {
           con.Close();
           cmd.Dispose();
       }

    }
    protected void addimg(string pin)
    {
        string path = "~/Admin/plantImg/";
        string[] extaion = { ".jpg", ".jpeg", ".png", ".bmp", ".svg" };
        string tablename = "plant_image";

        commanFunction.all(Fuimg, path, pin, "imgID", "IM", extaion, tablename);
        commanFunction.all(fupimg1, path, pin, "imgID", "IM", extaion, tablename);
        commanFunction.all(fupimg2, path, pin, "imgID", "IM", extaion, tablename);
    }
  

    

    

   
    
}