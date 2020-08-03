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


public partial class Admin_Add_pots : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnAddpot_Click(object sender, EventArgs e)
    {
      if (Page.IsValid)
        {


            int found;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            commanFunction cf = new commanFunction();
            string vpin = "PO" + commanFunction.finalcode();

            con.Open();
            do
            {
                string str = "select potID from pot_details where potID = '" + vpin + "' ";
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
                    addpots(vpin);
                   
                }

            } while (found == 1);

        }
        Response.Redirect("pot_viwe.aspx");

    }

     protected void addpots(string pin)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
         string fullpath = "";
       
        try
        {
            con.Open();
            cmd = new SqlCommand("addpots", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@potID", pin);
            cmd.Parameters.AddWithValue("@po_name",txtponame.Text);
            cmd.Parameters.AddWithValue("@po_dimension",txtpodimension.Text);
            cmd.Parameters.AddWithValue("@po_price",txtpoprice.Text);
            cmd.Parameters.AddWithValue("@po_qty",txtpoqty.Text);
            cmd.Parameters.AddWithValue("@po_category",ddlcategory.SelectedValue);
            cmd.Parameters.AddWithValue("@po_description", txtpodescreption.Text);
            cmd.Parameters.AddWithValue("@po_placement",txtplacement.Text);
            cmd.Parameters.AddWithValue("@po_material",txtpomaterial.Text);

            if (fuimg.HasFile)
            {
                string path = "~/Admin/plantImg/";
                string[] extaion = { ".jpg", ".jpeg", ".png", ".bmp", ".svg" };
                bool fileformet = false;

                for (int i = 0; i <= extaion.Length - 1; i++)
                {
                    if (Path.GetExtension(fuimg.FileName) == extaion[i])
                    {
                        fileformet = true;
                        break;
                    }
                }

                if (fileformet)
                {
                    string directry = path + pin;
                    fullpath = directry + fuimg.FileName;
                    fuimg.SaveAs(Server.MapPath(fullpath));
                    if (File.Exists(Server.MapPath(fullpath)))
                    {
                        Response.Write(@"<script language='javascript'>alert('image upload succesfully ..')</script>");
                    }
                    else
                    {
                        Response.Write(@"<script language='javascript'>alert('image not uplodaed ..')</script>");
                    }
                }
                else
                {
                    Response.Write(@"<script language='javascript'>alert('plese add valid image ..')</script>");
                }


            }
            else
            {
                Response.Write(@"<script language='javascript'>alert('plese add valid image ..')</script>");
            }

            cmd.Parameters.AddWithValue("@po_imgURL",fullpath);
          
                  if (cbfree.Checked == true)
            {
                cmd.Parameters.AddWithValue("@po_free", 1.ToString());
            }
            else
            {
                cmd.Parameters.AddWithValue("@po_free", 0.ToString());
            }
            cmd.ExecuteNonQuery();
        }
        catch (Exception e)
        {
            Response.Redirect("addpots :- " + e.Message);
        }
        finally
        {
            con.Close();
            cmd.Dispose();
        }
    }
}


    
   