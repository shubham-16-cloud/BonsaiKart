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

public partial class Admin_Add_sliderimg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
        viweimg();
        }
    }
    protected void addimg()
    {
        string fullpath = "";
        if (fuimg.HasFile)
        {
           
            string path = "../image/slider_img/";
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
                string directry = path;
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

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();

        try
        {
            con.Open();
            string str = "insert into img_slider values('" + txttitle.Text + "','" + txtdescreption.Text + "','"+fullpath+"')";
            cmd = new SqlCommand(str, con);
            cmd.ExecuteNonQuery();

        }
        catch(Exception e)
        {
            Response.Write("addimge"+ e.Message);
        }
        finally
        {
            con.Close();
            cmd.Dispose();
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        addimg();
        viweimg();
    }

    protected void viweimg()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        try
        {
            con.Open();
            string str = "select * from img_slider";
            cmd = new SqlCommand(str, con);
            da.SelectCommand = cmd;
            da.Fill(ds);
            gvimg.DataSource = ds;
            gvimg.DataBind();

            gvimg.HeaderRow.Cells[0].Attributes["data-class"] = "expand";

            //Attribute to hide column in Phone.
            gvimg.HeaderRow.Cells[2].Attributes["data-hide"] = "phone";
            gvimg.HeaderRow.Cells[3].Attributes["data-hide"] = "phone";
            
            //Adds THEAD and TBODY to GridView.
            gvimg.HeaderRow.TableSection = TableRowSection.TableHeader;



        }
        catch (Exception e)
        {
            Response.Write("viwe plant" + e.Message);
        }
        finally
        {
            con.Close();
            cmd.Dispose();
            da.Dispose();
        }
    }
    protected void gvimg_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {
            string id = e.CommandArgument.ToString();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Bonsai_databaseConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            try
            {
                con.Open();
                cmd = new SqlCommand("delete from img_slider where id ='"+ id +"'", con);
                cmd.ExecuteNonQuery();
                viweimg();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                con.Close();
                cmd.Dispose();
            }
        
        }
    }
}